class Cargo < ApplicationRecord
  include AASM

  aasm column: 'delivery_state', no_direct_assignment: true, whiny_transitions: false do
    state :at_store, initial: true
    state :on_the_way, after_transition: :notify_cargo_on_the_way
    state :at_customs
    state :delivered

    event :send_on do
      transitions from: :at_store, to: :on_the_way, if: :prepared_for_sending?
    end

    event :araived_to_customs do
      transitions from: :on_the_way, to: :at_customs
    end

    event :deliver do
      transitions from: %w(on_the_way at_customs), to: :delivered
    end
  end

  def notify_cargo_on_the_way
    'It is on the way'
  end

  def prepared_for_sending
    true
  end
end
