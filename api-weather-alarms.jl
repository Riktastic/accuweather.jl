#################################
# Weather Alarms API            #
#################################
# Get Weather Alarms for a specific location. AccuWeather Weather Alarms are determined using the daily forecasts for a location. An alarm exists for a location if the forecast weather meets or exceeds specific thresholds (https://developer.accuweather.com/weather-alarm-thresholds).

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_weatheralarms(apikey::String, locationKey::String, time::Int64, language::String)
    # Returns 1/5/10/15 day(s) of weather alarms for a specific location.

    url = "http://dataservice.accuweather.com/alarms/v1/"

    # Add required parameters to the URL
    url = url * string(time) * "day/"
    url = url * locationKey
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end
