class User < ApplicationRecord

    has_secure_password

    # has_many :user_events
    # accepts_nested_attributes_for :user_events

    # has_many :events
    has_many :user_events
    accepts_nested_attributes_for :user_events
    # has_many :attended_events, through: :user_events, source: :event


    # has_many :events, through: :user_events



end
