class UpdateStateOperation
  # STATES = [Cargo::STATE_AtStore, Cargo::STATE_OnTheWay, Cargo::STATE_AtCustoms, Cargo::STATE_Delivered]

  def call(cargo:, key:)
    # return false unless key.in?(STATES)

    case key
    when Cargo::STATE_AT_STORE   then cargo.send_on!
    when Cargo::STATE_ON_THE_WAY then cargo.araived_to_customs!
    when Cargo::STATE_AT_CUSTOMS then cargo.deliver!
    when Cargo::STATE_DELIVERED  then false
    end
  end
end
