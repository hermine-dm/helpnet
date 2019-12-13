# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'no-reply-shine@yopmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://helpnet-dev.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_publication_email(follower, organization, article)
    @user = follower
    @organization = organization
    @article = article
    @url_article = "https://helpnet-dev.herokuapp.com/articles/#{@article.slug}"
    @url = 'https://helpnet-dev.herokuapp.com/'
    mail(to: @user.email, subject: "Nouvel article publié par #{@organization.name}")
  end

  def new_event_email(follower, organization, event)
    @user = follower
    @organization = organization
    @event = event
    @url_event = "https://helpnet-dev.herokuapp.com/organizations/#{@organization.slug}/events/#{@event.slug}"
    @url = 'https://helpnet-dev.herokuapp.com/'
    mail(to: @user.email, subject: "Nouvel évènement organisé par #{@organization.name}")
  end

  def event_confirmation_email(user, event, organization)
    @user = user
    @organization = organization
    @event = event
    @url_event = "https://helpnet-dev.herokuapp.com/organizations/#{@organization.slug}/events/#{@event.slug}"
    @url = 'https://helpnet-dev.herokuapp.com/'
    mail(to: @user.email, subject: "Confirmation d'inscription à l'évènement : #{@event.title}")
  end
end
