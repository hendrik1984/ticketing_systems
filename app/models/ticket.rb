class Ticket < ApplicationRecord
    belongs_to :event
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :status, inclusion: { in: %w[pending confirmed] }

end
