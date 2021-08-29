class Residence < ApplicationRecord
  belongs_to :purchase, optional: true
end
