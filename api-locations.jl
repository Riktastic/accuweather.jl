#################################
# Locations API                 #
#################################
# Get a location key for your desired location. Use the location key to retrieve weather data from the Forecast or Current Conditions API.

# Contains a centralized function to make calls to the API.
include("request.jl")


# Category: List
function get_adminarealist(apikey::String, regionCode::String, language::String, offset::Int64)
    # Returns basic information about administrative areas in the specified country.

    url = "http://dataservice.accuweather.com/locations/v1/adminareas/"

    # Add required parameters to the URL
    url = url * string(countryCode)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if offset != Nothing url = url * "&offset=" * string(offset) end

    return make_API_call(url)
end

function get_countries(apikey::String, regionCode::String, language::String)
    # Returns basic information about all countries within a specified region.

    url = "http://dataservice.accuweather.com/locations/v1/countries/"

    # Add required parameters to the URL
    url = url * string(regionCode)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

function get_regions(apikey::String, language::String)
    # Returns basic information about all regions.

    url = "http://dataservice.accuweather.com/locations/v1/regions"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

function get_topcities(apikey::String, group::Int64, language::String, details::Bool)
    # Returns information for the top 50, 100, or 150 cities, worldwide.

    url = "http://dataservice.accuweather.com/locations/v1/topcities/"

    # Add required parameters to the URL
    url = url * string(group)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

# Category: AutoComplete
function get_autocompletesearch(apikey::String, q::String, language::String)
    # Returns basic information about locations matching an autocomplete of the search text.

    url = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

# Category: Location Key
function get_cityneighbors_for_location(apikey::String, locationKey::String, language::String, details::Bool)
    # Returns information about neighboring cities, by location key. You must know the location key to perform this query.

    url = "http://dataservice.accuweather.com/locations/v1/cities/neighbors/"

    # Add required parameters to the URL
    url = url * string(locationKey)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_search_for_location(apikey::String, locationKey::String, language::String, details::Bool)
    # Returns information about a specific location, by location key. You must know the location key to perform this query.

    url = "http://dataservice.accuweather.com/locations/v1/"

    # Add required parameters to the URL
    url = url * string(locationKey)
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

# Category: Text Search
function get_citysearch(apikey::String, q::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of cities that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/cities/search"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

function get_citysearch_narrowed_by_countrycode_and_admincode(apikey::String, q::String, countryCode::String, adminCode::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of cities that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/cities/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/"
    url = url * string(adminCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

function get_citysearch_narrowed_by_country_code(apikey::String, q::String, countryCode::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of cities that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/cities/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

function get_poisearch(apikey::String, q::String, type::String, language::String, details::Bool)
    # Returns information for an array of Points of Interest that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/poi/search"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if type != Nothing url = url * "&type=" * language end
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_poisearch_narrowed_by_countrycode_and_admincode(apikey::String, q::String, countryCode::String, adminCode::String, type::String, language::String, details::Bool)
    # Returns information for an array of Points of Interest that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/poi/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/"
    url = url * string(adminCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if type != Nothing url = url * "&type=" * language end
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_poisearch_narrowed_by_countrycode(apikey::String, q::String, countryCode::String, type::String, language::String, details::Bool)
    # Returns information for an array of Points of Interest that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/poi/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if type != Nothing url = url * "&type=" * language end
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_postalcodesearch(apikey::String, q::String, language::String, details::Bool)
    # Returns information for an array of Postal Codes that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/postalcodes/search"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_postalcodesearch_narrowed_by_countrycode(apikey::String, q::String, countryCode::String, language::String, details::Bool)
    # Returns information for an array of Postal Codes that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/postalcodes/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_textsearch(apikey::String, q::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of locations that match the search text.

    url = "http://dataservice.accuweather.com/locations/v1/search"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

function get_textsearch_narrowed_by_countrycode_and_admincode(apikey::String, q::String, countryCode::String, adminCode::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of locations that match the search text. Results are narrowed by entering a countryCode and adminCode in the path.

    url = "http://dataservice.accuweather.com/locations/v1/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/"
    url = url * string(adminCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

function get_textsearch_narrowed_by_countrycode(apikey::String, q::String, countryCode::String, language::String, details::Bool, offset::Int64, alias::String)
    # Returns information for an array of locations that match the search text. Results are narrowed by entering a countryCode in the path.
    url = "http://dataservice.accuweather.com/locations/v1/"

    # Add required parameters to the URL
    url = url * string(countryCode) * "/search"
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if offset != Nothing url = url * "&offset=" * string(offset) end
    if alias != Nothing url = url * "&alias=" * alias end

    return make_API_call(url)
end

# Category: Geoposition
function get_geopositionsearch(apikey::String, q::String, language::String, details::Bool, toplevel::Bool)
    # Returns information about a specific location, by GeoPosition (Latitude and Longitude).

    url = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end
    if toplevel == true url = url * "&toplevel=true" end

    return make_API_call(url)
end

# Category: IP Address
function get_ipaddresssearch(apikey::String, q::String, language::String, details::Bool)
    # Returns information about a specific location, by IP Address.

    url = "http://dataservice.accuweather.com/locations/v1/cities/ipaddress"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey
    url = url * "&q=" * q

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end
