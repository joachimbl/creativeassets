//= require self
//= require react
//= require react-server
//= require frontend/react/pages/frontpage

console.log("here")

root = exports ? this
root.app = {}
root.app.PageT = window.Frontpage

window.app = global.app = exports.app = root.app
