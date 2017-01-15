gulp            = require 'gulp'
sourcemaps      = require 'gulp-sourcemaps'
browserify      = require 'browserify'
browserifyinc   = require 'browserify-incremental'
coffeereactify  = require 'coffee-reactify'
source          = require 'vinyl-source-stream'
browserifycss   = require 'browserify-css'

watchedFolders = ["frontend"]
watchedExtensions = [".cjsx", ".coffee", ".js", ".es6", ".jsx"]

gulp.task 'watch', ['watch-files']

gulp.task 'watch-files', ->
  for watchedFolder in watchedFolders
    for watchedExtension in watchedExtensions
      console.log("#{watchedFolder}/lib/**/*#{watchedExtension}")
      gulp.watch "#{watchedFolder}/lib/**/*#{watchedExtension}", ['compile']

gulp.task 'default', ['compile']

gulp.task 'compile', ->
  compile("frontend", "frontend.js")

compile = (folder, filename) ->
  stream = browserifyFile("./#{folder}/lib/javascripts/#{filename}")
  outputStream(stream, folder, filename)

outputStream = (stream, destinationFolder, destinationFilename) ->
  stream.pipe(source(destinationFilename))
        .pipe(gulp.dest("#{destinationFolder}/dist/javascripts"))
        .pipe(sourcemaps.write())

browserifyFile = (filepath) ->
  browserifyOpts =
    debug: true,
    extensions: watchedExtensions

  browserifyinc(filepath, browserifyOpts)
    .transform('browserify-css', { global: true })
    .transform("babelify", { presets: ["es2015", "react"] })
    .transform('coffee-reactify', { extensions: [".cjsx", ".coffee"] })
    .bundle()
    .on 'error', (err) ->
      console.log(err)
      @emit('end')
