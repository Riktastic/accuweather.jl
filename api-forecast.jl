#################################
# Forecast API                  #
#################################
# Get forecast information for a specific location.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_forecast(apikey::String, timespan::String, time::Int64, locationKey::String, language::String, details::Bool, metric::Bool)
    # Daily/Hourly forecasts for a specific location. Forecast searches require a location key. Please use the Locations API to obtain the location key for your desired location. By default, a truncated version of the hourly forecast data is returned. The full object can be obtained by passing "details=true" into the url string.

    url = "http://dataservice.accuweather.com/forecasts/v1/"

    # Add required parameters to the URL
    url = url * timespan * "ly"
    # Accepted values: day hour

    url = url * string(time) * timespan * "/"
    # Accepted values:
    # - Days: 1/5/10/15
    # - Hours: 1/12/24/72/120
    #   Example: If "timespan" is set to "day" and "time" to 10, it gets the forecast for 15 days.

    url = url * string(locationKey)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if metric == true url = url * "&metric=true" end

    return make_API_call(url)
end
