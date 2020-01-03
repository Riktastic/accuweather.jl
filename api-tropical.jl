#################################
# Tropical API                  #
#################################
# Get current position, past positions, and forecasts for tropical cyclones worldwide.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_storms_active_by_governmentid(apikey::String, basinID::String, governmentID::String)
    # Returns basic information about tropical cyclones that are currently active in the specified basin.

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/active/"

    # Add required parameters to the URL
    url = url * basinID * "/"
    url = url * governmentID
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_storms_active_all(apikey::String)
    # Returns basic information about tropical cyclones that are currently active in the specified basin.

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/active"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_storms_by_basinid_and_year(apikey::String, year::Int64, basinID::String)
    # Returns basic information about tropical cyclones for a specific year and basin.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/"

    # Add required parameters to the URL
    url = url * year * "/"
    url = url * basinID
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_storms_active_by_basinid(apikey::String, basinID::String)
    # Returns basic information about tropical cyclones that are currently active in the specified basin.

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/active/"

    # Add required parameters to the URL
    url = url * basinID
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_storms_by_basinid_govenmentid_and_year(apikey::String, year::Int64, basinID::String, governmentID::String)
    # Returns basic information about tropical cyclones for a specific year and basin.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/"

    # Add required parameters to the URL
    url = url * year * "/"
    url = url * basinID * "/"
    url = url * governmentID
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_storms_active_by_basinid(apikey::String, basinID::String)
    # Returns basic information about tropical cyclones for a specific basin.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/active/"

    # Add required parameters to the URL
    url = url * basinID
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

# Category: Position
function get_storm_location(apikey::String, year::Int64, basinID::String, governmentID::String, details::Bool, radiigeometry::Bool, includeLandmarks::Bool)
    # Returns all position information for a specific tropical cyclone or list of tropical cyclones.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/"

    # Add required parameters to the URL
    url = url * year * "/"
    url = url * basinID * "/"
    url = url * governmentID * "/positions"
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if details == true url = url * "&details=true" end
    if radiigeometry == true url = url * "&radiigeometry=true" end
    if includeLandmarks == true url = url * "&includeLandmarks=true" end

    return make_API_call(url)
end

function get_storm_location_currently(apikey::String, year::Int64, basinID::String, governmentID::String, details::Bool, radiigeometry::Bool, includeLandmarks::Bool)
    # Returns all position information for a specific tropical cyclone or list of tropical cyclones.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/"

    # Add required parameters to the URL
    url = url * year * "/"
    url = url * basinID * "/"
    url = url * governmentID * "/positions/current"
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if details == true url = url * "&details=true" end
    if radiigeometry == true url = url * "&radiigeometry=true" end
    if includeLandmarks == true url = url * "&includeLandmarks=true" end

    return make_API_call(url)
end

# Category: Forecast
function get_storm_forecast(apikey::String, year::Int64, basinID::String, details::Bool, radiigeometry::Bool, windowgeometry::Bool)
    # Returns all recorded forecast information for a specific government-issued tropical cyclone.
    # Year: 4-digit year. Example: '2017'

    url = "http://dataservice.accuweather.com/tropical/v1/gov/storms/"

    # Add required parameters to the URL
    url = url * year * "/"
    url = url * basinID * "/"
    url = url * governmentID * "/forecasts"
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if details == true url = url * "&details=true" end
    if radiigeometry == true url = url * "&radiigeometry=true" end
    if windowgeometry == true url = url * "&includeLandmarks=true" end

    return make_API_call(url)
end
