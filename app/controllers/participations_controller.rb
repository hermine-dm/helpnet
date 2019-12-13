# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :authenticate_user, only: %i[create destroy]
  def create
    @organization = Organization.friendly.find_by_slug(params[:organization_slug])
    @event = Event.friendly.find_by_slug(params[:event_slug])
    @participation = Participation.create(user_id: current_user.id, event_id: @event.id)
    flash[:success] = 'Vous êtes inscrit à cet évènement'
    redirect_back(fallback_location: organization_event_path(@event.slug, @organization.slug))
  end

  def destroy
    @organization = Organization.friendly.find_by_slug(params[:organization_slug])
    @event = Event.friendly.find_by_slug(params[:event_slug])
    @participation = @event.participations.find(params[:id])
    @participation.delete
    flash[:success] = 'Vous êtes désinscrit de cet évènement'
    redirect_back(fallback_location: organization_event_path(@event.slug, @organization.slug))
  end
end
