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
        <th class="winner"></th>
        <th>Team</th>
        <th>1</th>
        <th>2</th>
        <th>3</th>
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

            {% if away_player1 != nil %}
              <tr>
                <td class="line" rowspan="2">{{ line_num }}</td>
                <td>
                  {% if away_sets_won > home_sets_won %}
                    <span class="inline-checkmark"></span>
                  {% endif %}
                </td>
                <td>
                  {{ away_player1 }} / {{ away_player2 }}
                </td>
                <td class="games">{{ set1_away }}{% if set1_tb_away and set1_tb_away != "" %} <sup>{{ set1_tb_away }}</sup>{% endif %}</td>
                <td class="games">{{ set2_away }}{% if set2_tb_away and set2_tb_away != "" %} <sup>{{ set2_tb_away }}</sup>{% endif %}</td>
                <td class="games">{{ set3_away }}{% if set3_tb_away and set3_tb_away != "" %} <sup>{{ set3_tb_away }}</sup>{% endif %}</td>
              </tr>
              <tr class="away">
                <td>
                  {% if home_sets_won > away_sets_won %}
                    <span class="inline-checkmark"></span>
                  {% endif %}
                </td>
                <td>
                  {{ home_player1 }} / {{ home_player2 }}
                </td>
                <td class="games">{{ set1_home }}{% if set1_tb_home and set1_tb_home != "" %} <sup>{{ set1_tb_home }}</sup>{% endif %}</td>
                <td class="games">{{ set2_home }}{% if set2_tb_home and set2_tb_home != "" %} <sup>{{ set2_tb_home }}</sup>{% endif %}</td>
                <td class="games">{{ set3_home }}{% if set3_tb_home and set3_tb_home != "" %} <sup>{{ set3_tb_home }}</sup>{% endif %}</td>
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
