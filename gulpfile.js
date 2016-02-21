var gulp, sourcemaps, browserify, coffeeify, source;

gulp = require('gulp');
util = require('gulp-util');
watchify = require('watchify');
sourcemaps = require('gulp-sourcemaps');
browserify = require('browserify');
coffeeify = require('coffeeify');
coffeereactify = require('coffee-reactify');
source = require('vinyl-source-stream');

gulp.task('watch', ['watch-coffee']);

gulp.task('watch-coffee', function() {
   gulp.watch('react/lib/**/*.js.cjsx', ['compile-coffee-and-cjsx']);
   gulp.watch('react/lib/**/*.js.coffee', ['compile-coffee-and-cjsx']);
});

gulp.task('default', ['compile-coffee-and-cjsx']);

gulp.task('compile-coffee-and-cjsx', function() {
  var browserifyOpts = {
    debug: true,
    extensions: ['.js.coffee', '.js.cjsx']
  }

  var stream = browserify(
      './react/lib/javascripts/creative-assets.js',
      browserifyOpts
     ).transform('coffee-reactify')
      .bundle()
      .on('error', function(err){
        console.log(err);
        this.emit('end');
      });

  stream.pipe(source('creative-assets.js'))
    .pipe(gulp.dest('react/dist/javascripts'));
});
