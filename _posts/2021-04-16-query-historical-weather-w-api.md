---
title: Query Historical Weather Data with API
categories:
  - data science
tags:
  - python
  - weather
  - API
classes: wide
---

It has been a while since I last posted a blog to the site here. This has been due to a combination of factors including:

1. Finishing my dissertation/defense :tada:
2. Starting a new job with the Los Angeles Dodgers :baseball:
3. General lack of motivation to write :pen:

2020 was an abnormal year for many of us, but things have started to become more normal both personally and in the world around as vaccine rollout here in Los Angeles is now open to all adults 16+. With this return to normalcy, I have found a renewed desire to pick up the virtual pen and continue to write new posts.

My post today is on how you can use an API to query historical weather data, given a location and date of interest. The API I have found particularly useful for this is the one provided by [Visual Crossing Weather Data](https://www.visualcrossing.com). Users can sign-up through their website to create a free account which comes with a unique API key. This free tier allows you to run 1,000 requests per day. Their service is particularly helpful in that it allows you to query historical dates, which are not available at the free tier for services like OpenWeather API.

## Example

Below is an example showing how to retrieve the weather for Los Angeles, CA on August 9th, 1991 at 10am local time using Python.

```python
import requests, json

base_url= 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/'
query_key='?key=' + YOUR_API_KEY_HERE
query_params='&include=current&unitGroup=us'
query_loc='Los Angeles, CA'
query_date='1991-08-09T10:00:00'

url=base_url + query_loc + '/' + query_date + query_key + query_params

weather_conditions=response.json()['currentConditions']

print(f"Temp: {weather_conditions['temp']} Humidity: {weather_conditions['humidity']}")
```

Note that above we set the parameter `&include=current` so that we return a single record for the current time requested. By default the request will return records for every hour, which can end up using more requests then you need. We also set `&unitGroup=us` to return values in US units, e.g., will return temperature in degrees Fahrenheit. Above we specified the location as {City, State} but it will also handle other partial address forms such as {Street Address, City, State}, US Zip Codes, or Lat/Lon coordinates.

For more details on the available parameters and query structure see their [documentation](https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/) of the Timeline Weather API, as it is flexible to adapt to many different use cases.

By using this API, you can reliably and consistently query weather information to include as features in a data analytics projects. Or you can use it to query the weather on your birthday from any location.
