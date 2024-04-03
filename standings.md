---
layout: page
title: Standings
permalink: /standings/
---

<table>
  <thead>
    <tr>
      <th>Team</th>
      <th>
        <div class="desktop">Wins</div>
        <div class="mobile">Ws</div>
      </th>
      <th>
        <div class="desktop">Losses</div>
        <div class="mobile">Ls</div>
      </th>
      <th>
        <div class="desktop">%&nbsp;Wins</div>
        <div class="mobile">%</div>
      </th>
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
