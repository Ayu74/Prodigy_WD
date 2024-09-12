// script.js
document.getElementById('getWeather').addEventListener('click', function() {
    const location = document.getElementById('location').value;
    if (location) {
        const apiKey = 'b3055349e88612313b68d52f9dba70a9'; // Replace with your OpenWeatherMap API key
        const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}`;

        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                if (data.cod === 200) {
                    document.getElementById('temperature').innerText = `Temperature: ${data.main.temp} °C`;
                    document.getElementById('description').innerText = `Description: ${data.weather[0].description}`;
                    document.getElementById('humidity').innerText = `Humidity: ${data.main.humidity}%`;
                } else {
                    alert('Location not found');
                }
            })
            .catch(error => console.error('Error fetching weather data:', error));
    } else {
        alert('Please enter a location');
    }
});
