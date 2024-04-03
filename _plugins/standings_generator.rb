# frozen_string_literal: true

require 'csv'

module Jekyll
  class StandingsGenerator < Generator
    def generate(site)
      # schedule = CSV.read("_data/schedule.csv", headers: true)
      # standings = Hash.new { |h, k| h[k] = { "Wins" => 0, "Losses" => 0 } }

      # schedule.each do |game|
      #   home_team = game["Home"]
      #   away_team = game["Away"]
      #   home_sets = game["Home Sets"].to_i
      #   away_sets = game["Away Sets"].to_i

      #   standings[home_team]["Wins"] += home_sets
      #   standings[home_team]["Losses"] += away_sets
      #   standings[away_team]["Wins"] += away_sets
      #   standings[away_team]["Losses"] += home_sets
      # end

      # standings = standings.map do |team, stats|
      #   total = stats["Wins"] + stats["Losses"]
      #   stats["Percentage"] = "#{total.positive? ? format('%.1f', (stats['Wins'].to_f / total) * 100) : '0.0'}%"
      #   { "Team" => team }.merge(stats)
      # end

      # site.data["standings"] = standings.sort_by { |h| -h["Percentage"].to_f }
    end
  end
end
