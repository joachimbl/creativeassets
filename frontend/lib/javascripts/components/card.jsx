React = require('react')

class Card extends React.Component {
  render () {
    return (
      <div className="card">
        <img className="card-img-top img-fluid" src={this.props.link.thumbnail_url} alt="Card image cap" />
        <div className="card-block">
          <h4 className="card-title">{this.props.link.title}</h4>
          <p className="card-text">{this.props.link.description}</p>
        </div>
        <ul className="list-group list-group-flush">
          <li className="list-group-item">{this.props.link.author.username}</li>
        </ul>
        <div className="card-block">
          <a href={this.props.link.path} className="card-link">Link details</a>
        </div>
      </div>
    )
  }
}

Card.defaultProps = {
  link: {}
};

module.exports = Card
