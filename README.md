##StoryTeller: An app for collaborative story creation

<<<<<<< HEAD
StoryTeller is a Ruby on Rails SaaS application. The application is a social story-telling application that allows writers to share stories with readers and assign collaborators to it. It uses Devise for local and facebook authentication. It uses sendgrid to handle authentication emails. 
=======
StoryTeller is a Ruby on Rails application. It uses Devise for local and facebook authentication. It uses sendgrid to handle authentication emails. 
>>>>>>> e8c8ef1a9ac3bf05eda2f28e325bdc521d359924
StoryTeller is deployed to Heroku [Here](http://devtheory-storyteller.herokuapp.com)

Setup
---

**config/application.yml needs to have the following ENV variables:**

SENDGRID_USERNAME: 'your sendgrid username'

SENDGRID_PASSWORD: 'your sendgrid password'

DEVISE_SECRET_KEY: 'your devise secret key'

FACEBOOK_ID: 'your facebook id'

FACEBOOK_SECRET: 'your facebook secret'

STRIPE_TEST_SECRET_KEY: 'your stripe test secret key' // or live key if in production environment

STRIPE_TEST_PUBLISHABLE_KEY: 'your stripe test publishable key' // or live key if in production environment