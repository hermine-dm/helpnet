# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # after_create :event_confirmation_send

  	def event_confirmation_send
	    @event = Event.find(event_id)
	    @user = User.find(user_id)
	    @organization = Organization.find(@event.organization_id)
	    UserMailer.event_confirmation_email(@user, @event, @organization).deliver_now
	end
end
