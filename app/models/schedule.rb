class Schedule
  include ActiveModel::Model

  attr_accessor :hours
  attr_accessor :days

  def hours
    puts "getting hours..."
    @hours || (8..20).to_a
  end

  def days
    puts "getting days..."
    @days || %w(monday tuesday wednesday thursday friday saturday sunday)
  end

  def available_hours
    (0..24).to_a - hours
  end

  def available_days
    days
    # more complicated :P
    #(0..24).to_a - hours
  end
end
