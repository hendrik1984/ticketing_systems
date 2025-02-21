class Event < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_one_attached :banner_image

    validates :name, presence: true
    validates :description, presence: true
    validates :status, inclusion: { in: %w[active inactive] }
    validates :max_allocation, numericality: { greater_than: 0 }

    # Active events are available for ticket registration
    scope :active, -> { where(status: 'active') }
    scope :inactive, -> { where(status: 'inactive') }

    def active?
        status == 'active'
    end

end
