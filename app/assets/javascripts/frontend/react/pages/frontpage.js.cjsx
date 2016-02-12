React = require('react')
Card = require('../components/card')

@Frontpage = React.createClass
  render: ->
    <div className="card-columns">
      <Card />
      <Card />
      <Card />
      <Card />
      <Card />
    </div>

module.exports = @Frontpage
