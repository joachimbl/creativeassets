$ = require("jquery")

API = {}

API.Links =
  index: (args, successCallback, errorCallback) ->
    $.ajax
      type: "GET"
      url: "/api/links?page=" + args.page
      dataType: "json"
      headers:
        "Content-Type": "application/json"
      success: (data, status) =>
        successCallback(data)
      error: (data, status) ->
        errorCallback(data)

module.exports = API.Links
