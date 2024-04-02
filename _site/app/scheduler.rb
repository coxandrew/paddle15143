# frozen_string_literal: true

require "pry"
require_relative "schedule"

class Match
  attr_reader :home_team, :away_team, :date

  def initialize(home_team, away_team, date)
    @home_team = home_team
    @away_team = away_team
    @date = date
  end
end

class Scheduler
  attr_reader :schedule, :locations

  def initialize(teams, match_weeks = 7)
    @teams = teams
    @locations = get_locations
    @match_weeks = match_weeks
  end

  def generate
    @schedule = Schedule.new

    @match_weeks.times do |week|
      puts "\n\nWeek: #{week + 1}\n______________________\n\n"
      week_schedule = []
      week_home_teams = []
      week_scheduled_teams = []

      @locations.each do |location|
        puts "Location: #{location}"

        # Select a team from @teams that matches the location that has hosted the least at this location
        host_team = @teams.min_by { |team| team.times_hosted.count { |location| location == location } }

        # Find a team that is not yet in @scheduled_opponents
        available_teams = @teams.reject { |team| host_team.scheduled_opponents.include?(team) } ||
                          # If no available teams, select a team that hasn't been scheduled yet this week
                          @teams.reject { |team| week_home_teams.include?(team) } if available_teams.empty?

        binding.pry

        # away_team = available_teams.sample ||
        #             @teams.reject { |team| team == host_team }.sample

        # week_home_teams << host_team
        # week_schedule << match
      end
    end
  end

  def opponents_for(team)
    team.scheduled_opponents
  end

  def display
    @schedule.each_with_index do |week_matches, index|
      puts "Week #{index + 1}:"
      week_matches.each do |match|
        puts "#{match[1]} (#{@locations[match[1]]}) @ #{match[0]} (#{@locations[match[0]]})"
      end
      puts "\n"
    end
  end

  private

  def get_locations
    @locations = []

    @teams.each do |team|
      @locations << team.home_court
    end
    @locations.uniq!
  end
end
