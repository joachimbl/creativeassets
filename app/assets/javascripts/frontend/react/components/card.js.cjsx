React = require('react')

@Card = React.createClass
  propTypes: ->
    link: React.PropTypes.object

  getDefaultProps: ->
    link: {}

  componentDidMount: ->
    console.log(@props)

  render: ->
    <div className="card">
      <img className="card-img-top img-fluid" src={@props.link.thumbnail_url} alt="Card image cap" />
      <div className="card-block">
        <h4 className="card-title">{@props.link.title}</h4>
        <p className="card-text">{@props.link.description}</p>
      </div>
      <ul className="list-group list-group-flush">
        <li className="list-group-item">Cras justo odio</li>
        <li className="list-group-item">Dapibus ac facilisis in</li>
        <li className="list-group-item">Vestibulum at eros</li>
      </ul>
      <div className="card-block">
        <a href="#" className="card-link">Card link</a>
        <a href="#" className="card-link">Another link</a>
      </div>
    </div>

module.exports = @Card
