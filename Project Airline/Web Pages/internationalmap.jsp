<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>International Airports Map</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <style>
        #map { 
        height: 600px;
         width: 100%;
          }
          footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}
    </style>
</head>
<body>
    <h2>Major International Airports</h2>
    <div id="map"></div>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([20, 0], 2); // Centered globally
        
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);
        
        var airports = [
            { name: "Hartsfield-Jackson Atlanta (ATL)", coords: [33.6407, -84.4277] },
            { name: "Beijing Capital (PEK)", coords: [40.0799, 116.6031] },
            { name: "Dubai International (DXB)", coords: [25.2532, 55.3657] },
            { name: "Los Angeles (LAX)", coords: [33.9416, -118.4085] },
            { name: "Tokyo Haneda (HND)", coords: [35.5494, 139.7798] },
            { name: "London Heathrow (LHR)", coords: [51.4700, -0.4543] },
            { name: "Paris Charles de Gaulle (CDG)", coords: [49.0097, 2.5479] },
            { name: "Hong Kong (HKG)", coords: [22.3080, 113.9185] },
            { name: "Mumbai (BOM)", coords: [19.0760, 72.8777] },
            { name: "Singapore Changi (SIN)", coords: [1.3644, 103.9915] },
            { name: "Frankfurt (FRA)", coords: [50.0379, 8.5622] },
            { name: "Istanbul (IST)", coords: [41.2753, 28.7519] },
            { name: "Sydney Kingsford Smith (SYD)", coords: [-33.9399, 151.1753] },
            { name: "Toronto Pearson (YYZ)", coords: [43.6777, -79.6248] },
            { name: "São Paulo-Guarulhos (GRU)", coords: [-23.4326, -46.4695] },
            { name: "Mexico City (MEX)", coords: [19.4361, -99.0719] }
        ];
        
        airports.forEach(function(airport) {
            L.marker(airport.coords).addTo(map)
                .bindPopup(`<b>${airport.name}</b>`)
                .on('click', function() {
                    map.setView(airport.coords, 10);
                });
        });
    </script>
     <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
