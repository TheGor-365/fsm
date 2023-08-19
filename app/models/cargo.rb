class Cargo < ApplicationRecord
  include AASM

  aasm :column => 'delivery_state' do
  end
end
