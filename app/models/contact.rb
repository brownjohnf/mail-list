class Contact < ActiveRecord::Base
  STATES = %w{ WA OR ID }.sort

  SALUTATIONS = [
    'Mr. & Mrs.',
    'Mr.',
    'Ms.',
    'Mrs.',
    'Mr. & Mr.',
    'Mrs. & Mrs.',
    'Ms. & Ms.',
  ].sort

  has_and_belongs_to_many :events

  def name
    [ salutation, first_name, last_name ].join(' ')
  end
end
