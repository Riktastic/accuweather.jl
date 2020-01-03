use HTTP

function make_API_call(url)
    try
        response = HTTP.request("GET", url)
        return String(response.body)
    catch e
        return "Error occured: $e"
    end
end
