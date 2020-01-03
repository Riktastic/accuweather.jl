#################################
# Current Conditions API        #
#################################
# Get Current Conditions data for a specific location.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_currentcondition(apikey::String, locationKey::String, historical::Int64, language::String, details::Bool)
    # Returns current conditions data for a specific location. Current conditions searches require a location key. Please use the Locations API to obtain the location key for your desired location. By default, a truncated version of the current conditions data is returned. The full object can be obtained by passing "details=true" into the url string.

    url = "http://dataservice.accuweather.com/currentconditions/v1/"

    # Add required parameters to the URL
    url = url * string(locationKey)
    if historical != Nothing url = url * "/historical/" * historical end
    # Accepted values: 6 24
    #   Example: If "timespan" is set to "day" and "time" to 10, it gets the forecast for 15 days.

    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_currentcondition_topcities(apikey::String, group::Int64, language::String)
    # Returns current conditions data for the top 50, 100, or 150 cities worldwide, based on rank.

    url = "http://dataservice.accuweather.com/currentconditions/v1/topcities/"

    # Add required parameters to the URL
    url = url * group
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end
