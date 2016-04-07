gulp            = require 'gulp'
watchify        = require 'watchify'
sourcemaps      = require 'gulp-sourcemaps'
browserify      = require 'browserify'
browserifyinc   = require 'browserify-incremental'
coffeereactify  = require 'coffee-reactify'
source          = require 'vinyl-source-stream'
replace         = require 'gulp-replace'

gulp.task 'watch', [ 'watch-react' ]

gulp.task 'watch-react', ->
  gulp.watch 'react/lib/**/*.cjsx', [ 'compile-react' ]
  gulp.watch 'react/lib/**/*.js', [ 'compile-react' ]
  gulp.watch 'react/lib/**/*.coffee', [ 'compile-react' ]

gulp.task 'default', [ 'compile-react' ]

gulp.task 'compile-react', ->
  stream = browserifyReact('./react/lib/javascripts/creative-assets.js')
  stream.pipe(source('creative-assets.js.erb'))
        .pipe(replace('<%s>', ''))
        .pipe(gulp.dest('react/dist/javascripts'))

browserifyReact = (file) ->
  browserifyOpts =
    debug: true,
    extensions: ['.coffee', '.cjsx', '.js']
    cacheFile: './tmp/cache/browserify-cache.json'

  browserifyinc(file, browserifyOpts)
    .transform('coffee-reactify')
    .bundle()
    .on 'error', (err) ->
      console.log(err)
      @emit('end')
