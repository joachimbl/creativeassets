gulp            = require 'gulp'
watchify        = require 'watchify'
sourcemaps      = require 'gulp-sourcemaps'
browserify      = require 'browserify'
browserifyinc   = require 'browserify-incremental'
coffeereactify  = require 'coffee-reactify'
source          = require 'vinyl-source-stream'
replace         = require 'gulp-replace'

gulp.task 'watch', [ 'watch-frontend' ]

gulp.task 'watch-frontend', ->
  gulp.watch 'frontend/lib/**/*.cjsx', [ 'compile-frontend' ]
  gulp.watch 'frontend/lib/**/*.js', [ 'compile-frontend' ]
  gulp.watch 'frontend/lib/**/*.coffee', [ 'compile-frontend' ]

gulp.task 'default', [ 'compile-frontend' ]

gulp.task 'compile-frontend', ->
  stream = browserifyReact('./frontend/lib/javascripts/frontend.js')
  stream.pipe(source('frontend.js.erb'))
        .pipe(replace('<%s>', ''))
        .pipe(gulp.dest('frontend/dist/javascripts'))

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
