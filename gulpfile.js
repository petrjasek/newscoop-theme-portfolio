
var gulp = require('gulp'),
    concat = require('gulp-concat-css'),
    cssmin = require('gulp-cssmin'),
    rev = require('gulp-rev');

gulp.task('default', function() {
    gulp.src([
        'static/bootstrap/css/*.min.css',
        'static/style.css'
        ])
        .pipe(concat('build.css'))
        .pipe(cssmin())
        .pipe(rev())
        .pipe(gulp.dest('dist'))
        .pipe(rev.manifest())
        .pipe(gulp.dest('dist'));
});

