#################################
# Alerts API                    #
#################################
# Get severe weather alerts from official Government Meteorological Agencies and leading global weather alert providers.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_alerts_for_location(apikey::String, locationKey::String, language::String, details::Bool)
    # Returns alert data for a specific location. Alert searches require a location key. Please use the Locations API to obtain the location key for your desired location. By default, a truncated version of the alert data is returned. The full object can be obtained by passing "details=true" into the url string.

    url = "http://dataservice.accuweather.com/alerts/v1/"

    # Add required parameters to the URL
    url = url * locationKey
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end
