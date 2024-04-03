---
layout: page
title: Standings
permalink: /standings/
---

<table>
  <thead>
    <tr>
      <th>Team</th>
      <th>Wins</th>
      <th>Losses</th>
      <th>Percentage</th>
    </tr>
  </thead>

  <tbody>
    {% for team in site.data.standings %}
      <tr>
        <td class="team">{{ team.Team }}</td>
        <td class="wins-losses">{{ team.Wins }}</td>
        <td class="wins-losses">{{ team.Losses }}</td>
        <td class="percentage">{{ team.Percentage }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>
