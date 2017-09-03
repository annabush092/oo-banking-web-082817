class Transfer
  # variable to hold the status (pending, complete, rejected, reversed)
  attr_accessor :status, :sender, :receiver, :amount


  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? #returns true if both accounts are valid, otherwise false
  end

  def execute_transaction
    if self.status != "complete"
      if (self.valid?) && (self.sender.balance > amount)
        self.sender.balance -= amount
        self.receiver.deposit(amount)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      "Transaction was already completed."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(amount)
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
