#################################
# Translations API              #
#################################
# Get a list of available languages. Get translations for specific groups of phrases.

# Contains a centralized function to make calls to the API.
include("request.jl")


function get_translations(apikey::String)
    # Returns metadata for all languages.

    url = "http://dataservice.accuweather.com/translations/v1/languages"

    # Add required parameters to the URL
    url = url * "?apikey=" * apikey

    return make_API_call(url)
end

function get_translationforgroup(apikey::String, groupID::String)
    # Returns all translated phrases for a specific group, in the desired language.

    url = "http://dataservice.accuweather.com/translations/v1/groups/"

    # Add required parameters to the URL
    url = url * groupID
    url = url * "?apikey=" * apikey

    # Add optional parameters to the URL
    if language != Nothing url = url * "&language=" * language end

    return make_API_call(url)
end
