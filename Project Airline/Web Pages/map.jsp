<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Airports Map</title>
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
    <h2>Indian Airports</h2>
    <div id="map"></div>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([20.5937, 78.9629], 5); // Centered on India
        
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);
        
        var airports = [
            { name: "Guwahati (GAU)", coords: [26.1063, 91.5859] },
            { name: "Kochi (COK)", coords: [9.9391, 76.2596] },
            { name: "Nagpur (NAG)", coords: [21.0922, 79.0472] },
            { name: "Tirupati (TIR)", coords: [13.6288, 79.4192] },
            { name: "Tuticorin (TCR)", coords: [8.7642, 78.1348] },
            { name: "Agra (AGR)", coords: [27.1783, 78.0070] },
            { name: "Ahmedabad (AMD)", coords: [23.0736, 72.6266] },
            { name: "Ayodhya (AYJ)", coords: [26.7924, 82.1992] },
            { name: "Bengaluru (BLR)", coords: [12.9716, 77.5946] },
            { name: "Bhopal (BHO)", coords: [23.2599, 77.4126] },
            { name: "Chandigarh (IXC)", coords: [30.7333, 76.7794] },
            { name: "Chennai (MAA)", coords: [13.0827, 80.2707] },
            { name: "Delhi (DEL)", coords: [28.6139, 77.2090] },
            { name: "Dharamshala (DHM)", coords: [32.2190, 76.3234] },
            { name: "Gorakhpur (GOP)", coords: [26.7606, 83.3732] },
            { name: "Hyderabad (HYD)", coords: [17.3850, 78.4867] },
            { name: "Indore (IDR)", coords: [22.7196, 75.8577] },
            { name: "Jabalpur (JLR)", coords: [23.1667, 79.9339] },
            { name: "Jaipur (JAI)", coords: [26.9124, 75.7873] },
            { name: "Jammu (IXJ)", coords: [32.7338, 74.8643] },
            { name: "Jodhpur (JDH)", coords: [26.2639, 73.0086] },
            { name: "Kolkata (CCU)", coords: [22.5726, 88.3639] },
            { name: "Leh (IXL)", coords: [34.1526, 77.5770] },
            { name: "Lucknow (LKO)", coords: [26.8467, 80.9462] },
            { name: "Madurai (IXM)", coords: [9.9252, 78.1198] },
            { name: "Mumbai (BOM)", coords: [19.0760, 72.8777] },
            { name: "Mysuru (MYQ)", coords: [12.3052, 76.6552] },
            { name: "North Goa (GOX)", coords: [15.3809, 73.8336] },
            { name: "Patna (PAT)", coords: [25.5941, 85.1376] },
            { name: "Port Blair (IXZ)", coords: [11.6234, 92.7265] },
            { name: "Pune (PNQ)", coords: [18.5204, 73.8567] },
            { name: "Salem (SXV)", coords: [11.6643, 78.1460] },
            { name: "Srinagar (SXR)", coords: [34.0837, 74.7973] },
            { name: "Surat (STV)", coords: [21.1702, 72.8311] },
            { name: "Thiruvananthapuram (TRV)", coords: [8.5241, 76.9366] }
        ];
        
        airports.forEach(function(airport) {
            L.marker(airport.coords).addTo(map)
                .bindPopup(`<b>${airport.name}</b>`)
                .on('click', function(e) {
                    this.openPopup(); // Opens the popup when the marker is clicked
                    map.setView(e.latlng, 10); // Centers the map on the clicked marker
                });
        });
    </script>
     <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
