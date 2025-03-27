---
layout: page
title: Standings
permalink: /standings/
body_class: standings-page
---

<h2>2025 Week 1 Results</h2>

{% assign matches = "" | split: "" %}
{% assign current_match = "" | split: "" %}

{% for row in site.data.scores-2025-week-1 %}
  {% if row.player2 contains "(AWAY)" %}
    {% if current_match.size > 0 %}
      {% assign matches = matches | push: current_match %}
    {% endif %}
    {% assign current_match = "" | split: "" %}
  {% endif %}

  {% assign current_match = current_match | push: row %}

  {% if forloop.last %}
    {% assign matches = matches | push: current_match %}
  {% endif %}
{% endfor %}

{% for match in matches %}
  {% assign away_team = "" %}
  {% assign home_team = "" %}
  {% assign away_score = 0 %}
  {% assign home_score = 0 %}

  {% for row in match %}
    {% if row.player2 contains "(AWAY)" %}
      {% assign away_team = row.player1 %}
      {% assign away_score = row.score %}
    {% endif %}
    {% if row.player2 contains "(HOME)" %}
      {% assign home_team = row.player1 %}
      {% assign home_score = row.score %}
    {% endif %}
  {% endfor %}

  <h3>
    {% if away_score > home_score %}
      <span class="inline-checkmark"></span> {{ away_team }}
    {% else %}
      {{ away_team }}
    {% endif %}
    @
    {% if home_score > away_score %}
      <span class="inline-checkmark"></span> {{ home_team }}
    {% else %}
      {{ home_team }}
    {% endif %}
    ({{ away_score }} - {{ home_score }})
  </h3>

  <table class="match-scores">
    <thead>
      <tr>
        <th>Line</th>
        <th>{{ away_team }}</th>
        <th>{{ home_team }}</th>
        <th>Score</th>
      </tr>
    </thead>
    <tbody>
      {% for row in match %}
        {% if row.score contains "Line" and row.player1 != "" %}
          {% assign line_num = row.score | remove: "Line " %}
          {% assign away_player1 = row.player1 %}
          {% assign away_player2 = row.player2 %}

          {% assign next_index = forloop.index0 | plus: 1 %}
          {% if next_index < match.size %}
            {% assign next_row = match[next_index] %}
            {% assign home_player1 = next_row.player1 %}
            {% assign home_player2 = next_row.player2 %}

            {% assign set1_away = row.set1 %}
            {% assign set1_home = next_row.set1 %}
            {% assign set1_tb_away = row.set1t %}
            {% assign set1_tb_home = next_row.set1t %}

            {% assign set2_away = row.set2 %}
            {% assign set2_home = next_row.set2 %}
            {% assign set2_tb_away = row.set2t %}
            {% assign set2_tb_home = next_row.set2t %}

            {% assign set3_away = row.set3 %}
            {% assign set3_home = next_row.set3 %}
            {% assign set3_tb_away = row.set3t %}
            {% assign set3_tb_home = next_row.set3t %}

            {% assign score_text = "" %}

            {% if set1_away != "" and set1_home != "" %}
              {% assign score_text = set1_away | append: "-" | append: set1_home %}
              {% assign has_tb1 = false %}
              {% if set1_tb_away and set1_tb_away != "" and set1_tb_away != nil %}
                {% if set1_tb_home and set1_tb_home != "" and set1_tb_home != nil %}
                  {% assign has_tb1 = true %}
                {% endif %}
              {% endif %}

              {% if has_tb1 %}
                {% assign score_text = score_text | append: " (" | append: set1_tb_away | append: "-" | append: set1_tb_home | append: ")" %}
              {% endif %}
            {% endif %}

            {% if set2_away != "" and set2_home != "" %}
              {% if score_text != "" %}
                {% assign score_text = score_text | append: ", " %}
              {% endif %}
              {% assign score_text = score_text | append: set2_away | append: "-" | append: set2_home %}

              {% assign has_tb2 = false %}
              {% if set2_tb_away and set2_tb_away != "" and set2_tb_away != nil %}
                {% if set2_tb_home and set2_tb_home != "" and set2_tb_home != nil %}
                  {% assign has_tb2 = true %}
                {% endif %}
              {% endif %}

              {% if has_tb2 %}
                {% assign score_text = score_text | append: " (" | append: set2_tb_away | append: "-" | append: set2_tb_home | append: ")" %}
              {% endif %}
            {% endif %}

            {% comment %} Only add 3rd set if both away and home scores exist and aren't empty {% endcomment %}
            {% if set3_away and set3_away != "" and set3_away != nil %}
              {% if set3_home and set3_home != "" and set3_home != nil %}
                {% if score_text != "" %}
                  {% assign score_text = score_text | append: ", " %}
                {% endif %}
                {% assign score_text = score_text | append: set3_away | append: "-" | append: set3_home %}

                {% assign has_tb3 = false %}
                {% if set3_tb_away and set3_tb_away != "" and set3_tb_away != nil %}
                  {% if set3_tb_home and set3_tb_home != "" and set3_tb_home != nil %}
                    {% assign has_tb3 = true %}
                  {% endif %}
                {% endif %}

                {% if has_tb3 %}
                  {% assign score_text = score_text | append: " (" | append: set3_tb_away | append: "-" | append: set3_tb_home | append: ")" %}
                {% endif %}
              {% endif %}
            {% endif %}

            {% if away_player1 != nil %}
              <tr>
                <td>{{ line_num }}</td>
                <td>
                  {% assign away_sets_won = 0 %}
                  {% assign home_sets_won = 0 %}

                  {% if set1_away != "" and set1_home != "" %}
                    {% if set1_away > set1_home %}
                      {% assign away_sets_won = away_sets_won | plus: 1 %}
                    {% else %}
                      {% assign home_sets_won = home_sets_won | plus: 1 %}
                    {% endif %}
                  {% endif %}

                  {% if set2_away != "" and set2_home != "" %}
                    {% if set2_away > set2_home %}
                      {% assign away_sets_won = away_sets_won | plus: 1 %}
                    {% else %}
                      {% assign home_sets_won = home_sets_won | plus: 1 %}
                    {% endif %}
                  {% endif %}

                  {% if set3_away != "" and set3_home != "" %}
                    {% if set3_away > set3_home %}
                      {% assign away_sets_won = away_sets_won | plus: 1 %}
                    {% else %}
                      {% assign home_sets_won = home_sets_won | plus: 1 %}
                    {% endif %}
                  {% endif %}

                  {% if away_sets_won > home_sets_won %}
                    <span class="inline-checkmark"></span>
                  {% endif %}
                  {{ away_player1 }} / {{ away_player2 }}
                </td>
                <td>
                  {% if home_sets_won > away_sets_won %}
                    <span class="inline-checkmark"></span>
                  {% endif %}
                  {{ home_player1 }} / {{ home_player2 }}
                </td>
                <td>{{ score_text }}</td>
              </tr>
            {% endif %}
          {% endif %}
        {% endif %}
      {% endfor %}
    </tbody>
  </table>
  <br>
{% endfor %}

<p><a href="/standings-2024">2024 Standings</a></p>
