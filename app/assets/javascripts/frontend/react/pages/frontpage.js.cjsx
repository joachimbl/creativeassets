React = require('react')
Card = require('../components/card')
LinksAPI = require('../api/links')

@Frontpage = React.createClass
  getInitialState: ->
    {
      links: [],
      lastPage: 0,
      loading: false
    }

  componentDidMount: ->
    @loadMore()

  links: ->
    @state.links.map (link, index) ->
      <Card key={link.id} link={link || {}} index={index} />

  addLinks: (links) ->
    @setState({
      links: @state.links.concat(links)
      lastPage: @state.lastPage + 1
    })

  loading: (state) ->
    @setState({loading: state})

  loadMore: ->
    @loading(true)
    page = @state.lastPage + 1
    LinksAPI.index {page: page}
    ,(data) =>
      @addLinks(data.links)
    ,(data) =>
      console.log(data)

  render: ->
    <div>
      <div className="card-columns">
        {@links()}
      </div>
      <LoadMoreButton loading={@state.loading} onClick={@loadMore} />
    </div>

LoadMoreButton = React.createClass
  propTypes: ->
    loading: React.PropTypes.bool
    onClick: React.PropTypes.func.isRequired

  getDefaultProps: ->
    leading: false

  render: ->
    <a className="btn btn-primary"
       disabled={@props.loading}
       onClick={@props.onClick}>See more</a>

module.exports = @Frontpage

