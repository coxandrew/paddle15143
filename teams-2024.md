---
layout: page
title: Teams 2024
permalink: /teams-2024/
---

{% assign teams = "Stallard,Coates,Cox,Poluszejko,Duncan,Hay" | split: "," %}

{% for team in teams %}
  <h2>
    {% case team %}
      {% when 'Coates' %}
        Tri-Borough Deuces
      {% when 'Cox' %}
        Cox Slashers
      {% when 'Duncan' %}
        Duncan's Donuts
      {% when 'Hay' %}
        Haymakers
      {% when 'Poluszejko' %}
        Beaver Street Bullies
      {% when 'Stallard' %}
        Party All The Time
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
      {% assign players = site.data.team-rosters-2024 | where: "Spring Team", team | sort: "Name" %}
      {% for player in players %}
        <tr>
          <td>{{ player.Name }}</td>
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
