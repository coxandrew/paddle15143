---
layout: page
title: Teams
permalink: /teams/
---

{% assign teams = "Blint,Dundon,Stallard,Scrabis,Coggeshall,Means" | split: "," %}

{% for team in teams %}
  <h2>
    {% case team %}
      {% when 'Blint' %}
        Blints Backscreen Big Lobs
      {% when 'Dundon' %}
        Sewickley Soft Hands
      {% when 'Stallard' %}
        Lemon Pound Cakes
      {% when 'Scrabis' %}
        Breakin' Ballz
      {% when 'Coggeshall' %}
        Steel City Strokers
      {% when 'Means' %}
        Sewickley Slashers
      {% else %}
        Team {{ team }}
    {% endcase %}
  </h2>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Home Club</th>
      </tr>
    </thead>
    <tbody>
      {% assign players = site.data.team-rosters-2026 | where: "Team", team %}
      {% for player in players %}
        <tr>
          {% if player.Captain %}
          <td><strong>{{ player.Name }} (C)</strong></td>
          {% else %}
          <td>{{ player.Name }}</td>
          {% endif %}
          <td>
            {% case player["Home Club"] %}
              {% when 'Y' %}
                Sewickley YMCA
              {% when 'ACC' %}
                Allegheny Country Club
              {% when 'EC' %}
                Edgeworth Club
              {% else %}
                {{ player["Home Club"] }}
            {% endcase %}
          </td>
        </tr>
      {% endfor %}
    </tbody>
  </table>
{% endfor %}
