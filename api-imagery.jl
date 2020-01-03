#################################
# Imagery API                   #
#################################
# Get radar and satellite images.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_radar_and_satellite_imagery(apikey::String, locationKey::String, resolution::String, language::String)
    # Returns 1/5/10/15 day(s) of weather alarms for a specific location.

    url = "http://dataservice.accuweather.com/imagery/v1/maps/radsat/"

    # Add required parameters to the URL
    url = url * resolution * "/"
    # Allowed resolutions: '480x480', '640x480' and '1024x1024'.

    url = url * locationKey
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end
