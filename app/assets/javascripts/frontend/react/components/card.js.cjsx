React = require('react')

@Card = React.createClass
  propTypes: ->
    link: React.PropTypes.object.isRequired

  getDefaultProps: ->
    link: {}

  render: ->
    <div className="card">
      <img className="card-img-top img-fluid" src={@props.link.thumbnail_url} alt="Card image cap" />
      <div className="card-block">
        <h4 className="card-title">{@props.link.title}</h4>
        <p className="card-text">{@props.link.description}</p>
      </div>
      <ul className="list-group list-group-flush">
        <li className="list-group-item">{@props.link.author.username}</li>
      </ul>
      <div className="card-block">
        <a href={@props.link.path} className="card-link">Link details</a>
      </div>
    </div>

module.exports = @Card
