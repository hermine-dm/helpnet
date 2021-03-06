# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :organization
  belongs_to :address
  has_one_attached :illustration
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :title, presence: true
  validates :start_date, presence: true
  validate :start_in_the_future
  validate :end_after_start_date
  after_create :new_event_send
  extend FriendlyId
  friendly_id :title, use: :slugged

  def start_in_the_future
    if start_date.to_date < DateTime.now.to_date
      errors.add(:start_date, "L'évènement ne peut etre dans le passé")
    end
  end

  def end_after_start_date
    unless end_date.nil?
      if end_date.to_date < start_date.to_date
        errors.add(:end_date, "L'évènement ne peut finir avant d'avoir débuté")
      end
    end
  end

  def new_event_send
    @organization = Organization.find(organization_id)
    @organization.followers.each do |follower|
      UserMailer.new_event_email(follower, @organization, self).deliver_now
    end
  end
end
