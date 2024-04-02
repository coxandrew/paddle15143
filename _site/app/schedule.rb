# frozen_string_literal: true

require "pry"

class Schedule
  attr_reader :matches

  def initialize
    @matches = []
  end

  def times_hosted(team)
    @matches.count { |match| match.home_team == team }
  end

  def scheduled_opponents(team)
    @matches.flat_map { |match| match.home_team == team ? match.away_team : match.home_team if match.home_team == team || match.away_team == team }
            .compact
  end
end
