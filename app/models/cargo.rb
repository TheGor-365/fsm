class Cargo < ApplicationRecord
  include AASM

  aasm column: 'delivery_state', no_direct_assignment: true, whiny_transitions: false do
    state :at_store, initial: true
    state :on_the_way
    state :at_customs
    state :delivered

    event :send_on do
      transitions from: :at_store, to: :on_the_way
    end

    event :araived_to_customs do
      transitions from: :on_the_way, to: :at_customs
    end

    event :deliver do
      transitions from: %w(on_the_way at_customs), to: :delivered
    end
  end
end
