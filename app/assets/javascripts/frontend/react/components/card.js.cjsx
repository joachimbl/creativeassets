React = require('react')

@Card = React.createClass
  render: ->
    <div className="card">
      <img className="card-img-top img-fluid" src="http://bonnier.imgix.net/mercedes-amg-s65-cabriolet-11_1200-oyPAimvahKc-kcTLNi8inQ.jpg?auto=format&dpr=1.33&ixjsv=1.0.24&w=610" alt="Card image cap" />
      <div className="card-block">
        <h4 className="card-title">Card title</h4>
        <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
