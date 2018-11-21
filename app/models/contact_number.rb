class ContactNumber < ApplicationRecord
  # Variables
  MIN_RANGE = ('1' * 10).to_i
  MAX_RANGE = ('9' * 10).to_i
  CONTACT_LENGTH = 10

  # Validations
  validates :number, presence: true, uniqueness: true, 
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: ContactNumber::MIN_RANGE,
              less_than_or_equal_to:    ContactNumber::MAX_RANGE
            }, length: { is: ContactNumber::CONTACT_LENGTH }

  def to_dashed
    number.to_s.insert(3, '-').insert(7, '-')
  end
end
