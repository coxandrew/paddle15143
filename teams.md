---
layout: page
title: Teams
permalink: /teams/
---

{% assign teams = "Stallard,Coates,Cox,Poluszejko,Jones,Hay" | split: "," %}

{% for team in teams %}
  <h2>
    {% case team %}
      {% when 'Coates' %}
        Tri-Borough Deuces
      {% when 'Cox' %}
        Cox Slashers
      {% when 'Jones' %}
        Duncan's Donuts
      {% when 'Hay' %}
        Haymakers
      {% when 'Poluszejko' %}
        Beaver Street Bullies
      {% when 'Stallard' %}
        Only Trick Shots
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
      {% assign players = site.data.team-rosters-2025 | where: "Team", team %}
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
