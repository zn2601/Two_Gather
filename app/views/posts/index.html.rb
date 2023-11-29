<div class="conteiner">
  <% @posts.each do |post| %>
    <div class="post">
      <h2><%= post.title %></h2>
      <p><%= post.content %></p>
      <div id="map_<%= post.id %>" style="width: 400px; height: 300px;"></div>
      <script>
        var map_<%= post.id %> = L.map('map_<%= post.id %>').setView([<%= post.latitude %>, <%= post.longitude %>], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
          maxZoom: 18,
        }).addTo(map_<%= post.id %>);
        L.marker([<%= post.latitude %>, <%= post.longitude %>]).addTo(map_<%= post.id %>);
      </script>
    </div>
  <% end %>
</div>
