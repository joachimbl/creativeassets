React = require('react')
Card = require('../components/card')

@Loader = React.createClass
  render: ->
    <div className="loader">Loading ...</div>

@Frontpage = React.createClass
  getInitialState: ->
    {
      links: []
    }

  links: ->
    @props.links.map (link, index) ->
      <Card key={link.id} link={link || {}} index={index} />

  loadMore: (page) ->
    $.ajax
      type: "GET"
      url: "/api/links?page=" + page
      dataType: "json"
      headers:
        "Content-Type": "application/json"
      success: (data, status) ->
        console.log(data)
        @setState({ links: @state.links.concat(data.links) })
      error: (data, status) ->
        errorCallback(data)

  render: ->
    <div className="card-columns">
      {@links()}
    </div>

module.exports = @Frontpage


