class SubscriptionsController < ApplicationController
  
  def new
    @stripe_btn_hash = {
      script: "src='https://checkout.stripe.com/checkout.js' class='stripe-button' data-key='#{ Rails.configuration.stripe[:publishable_key]}'",
      plan: {
        writer: "writer",
        writer_info: "data-description='Writer - $19.99 (Monthly)' data-panel-label='Subscribe' data-label='Subscribe'",
        collaborator: 'collaborator',
        collaborator_info: "data-description='Collaborator - $9.99 (Monthly)' data-panel-label='Subscribe' data-label='Subscribe'",
        reader: "reader",
        reader_info: "data-description='Reader - Free' data-panel-label='Subscribe' data-label='Subscribe'"
      }
    }
  end

  def create
    @plan = params[:plan]

    if current_user.stripe_id.nil?
      customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken],
      plan: @plan
      )
      #keep customer id and subscription id for user model
      current_user.update_attributes(stripe_id: customer.id, stripe_plan_id: customer.subscriptions.first.id, subscription_type: params[:plan])
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      subscription = customer.subscriptions.retrieve(current_user.stripe_plan_id)
      subscription.plan = params[:plan]
      subscription.save
    end

    if params[:plan] == "writer"
      current_user.update_attributes(role: "writer")
    elsif params[:plan] == "collaborator"
      current_user.update_attributes(role: "collaborator")
    else
      current_user.update_attributes(role: "reader")
    end
    flash[:notice] = "Your subscription was proccessed successfully. Thanks, #{current_user.name}!"
    redirect_to edit_user_registration_path    
  end

  def edit
    @customer = Stripe::Customer.retrieve("#{current_user.stripe_id}")
  end

  def update
    customer = Stripe::Customer.retrieve("#{current_user.stripe_id}")
    subscription = customer.subscriptions.retrieve("#{current_user.stripe_plan_id}")
    subscription.plan = params[:plan]
    subscription.save

    if @subscription.update_attributes(subscription_params)
      flash[:notice] = "Subscription updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Subscription update unsuccessful"
      redirect_to :edit
    end
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path

end