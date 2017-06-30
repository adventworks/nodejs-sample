var gulp = require('gulp');
var mocha = require('gulp-mocha');
var minimist = require('minimist');
var fs = require('fs');

gulp.task('test', function () {
    gulp.src('test/**/*.js')
        .pipe(mocha({
            reporter: 'nyan',
            clearRequireCache: true,
            ignoreLeaks: true
        }));
});

gulp.task('default', 
