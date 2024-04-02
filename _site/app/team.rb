# frozen_string_literal: true

class Team
  attr_reader :name, :home_court
  attr_accessor :scheduled_opponents, :times_hosted

  def initialize(name, home_court)
    @name = name
    @home_court = home_court
  end
end
