class StoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.role?(:writer)
  end
end