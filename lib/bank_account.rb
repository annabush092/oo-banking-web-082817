require 'pry'

class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    (self.balance>0) && (self.status!="closed") #returns true if balance>0 and status==open, otherwise false
  end

  def close_account
    self.status = "closed"
  end

end
