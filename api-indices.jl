#################################
# Indices API                   #
#################################
# Get daily index values for a specific location. Index availability varies by location.

# Contains a centralized function to make calls to the API.
include("request.jl")

function get_indexvalues_for_group_of_indices(apikey::String, time::Int64, groupID::String, locationKey::String, language::String, details::Bool)
    # Returns daily index data for a specific group of indices, by location key.

    url = "http://dataservice.accuweather.com/indices/v1/daily/"

    # Add required parameters to the URL
    url = url * string(time) * "day/"
    # Allowed values for 'time': '1', '5', '10' and '15'.

    url = url * locationKey * "/groups/"
    url = url * groupID
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_indexvalues_for_index(apikey::String, time::Int64, indexID::String, locationKey::String, language::String, details::Bool)
    # Returns daily index data for a specific index, by location key.

    url = "http://dataservice.accuweather.com/indices/v1/daily/"

    # Add required parameters to the URL
    url = url * string(time) * "day/"
    # Allowed values for 'time': '1', '5', '10' and '15'.

    url = url * locationKey * "/"
    url = url * indexID
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_indexvalues_all(apikey::String, time::Int64, indexID::String, locationKey::String, language::String, details::Bool)
    # Returns daily index data for all indices, by location key.

    url = "http://dataservice.accuweather.com/indices/v1/daily/"

    # Add required parameters to the URL
    url = url * string(time) * "day/"
    # Allowed values for 'time': '1', '5', '10' and '15'.

    url = url * locationKey
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end
    if details == true url = url * "&details=true" end

    return make_API_call(url)
end

function get_indices(apikey::String, language::String)
    # Returns metadata for all daily indices.

    url = "http://dataservice.accuweather.com/indices/v1/daily"

    # Add required parameters to the UR
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

function get_indexgroups(apikey::String, language::String)
    # Returns metadata for all index groups.

    url = "http://dataservice.accuweather.com/indices/v1/daily/groups"

    # Add required parameters to the UR
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

function get_indices_for_group(apikey::String, groupID::String, language::String)
    # Returns metadata for all indices in a specified group.

    url = "http://dataservice.accuweather.com/indices/v1/daily/groups/"

    # Add required parameters to the URL
    url = url * groupID
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end

function get_index(apikey::String, indexID::String, language::String)
    # Returns metadata for a specific index type.

    url = "http://dataservice.accuweather.com/indices/v1/daily/"

    # Add required parameters to the URL
    url = url * indexID
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end
