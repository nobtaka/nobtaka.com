module.exports = (grunt) ->
  
  "use strict"

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    
    coffee:
      product:
        options:
          bare: true
        expand: true
        cwd: 'src/assets/javascripts/'
        src: '*.coffee'
        dest: 'dest/assets/javascripts/'
        ext: '.js'

    uglify:
      product:
        files: [
          expand: true
          cwd: 'dest/assets/javascripts/'
          src: ['**/*.js', '!**/*.min.js']
          dest: 'dest/assets/javascripts/'
          ext: '.min.js'
        ]

    sass:
      dist:
        options:
          lineNumbers: true
          style: 'expanded'
          loadPath: 'components/'
        files: [
          expand: true
          cwd: 'src/assets/stylesheets/'
          src: ['**/*.scss']
          dest: 'dest/assets/stylesheets/'
          ext: '.css'
        ]

    cssmin:
      minify:
        expand: true,
        cwd: 'dest/assets/stylesheets/'
        src: ['*.css', '!*.min.css']
        dest: 'dest/assets/stylesheets/'
        ext: '.min.css'

    connect:
      dest:
        options:
          port: 8000
          base: "dest/"

    bower:
      vendors:
        dest: 'dest/assets/javascripts/vendors.js'
        exclude: ['normalize-css', 'bourbon']
        dependencies:
          'modernizr': 'jquery'

    imagemin:
      dest:
        options:
          optimizationLevel: 3
        files:[
          expand: true
          cwd: 'src/assets/images/'
          src: '**/*'
          dest: 'dest/assets/images/'
        ]

    regarde:
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          nocase: true

      javascripts:
        files: ["src/**/*.coffee"]
        tasks: ["coffee:product", "uglify:product", "livereload"]

      markup:
        files: ["src/**/*.jade"]
        tasks: ["jade", "livereload"]

      stylesheets:
        files: ["src/**/*.scss"]
        tasks: ["sass", "cssmin", "livereload"]

      png:
        files: ["src/**/*.png"]
        tasks: ["imagemin", "livereload"]

      jpeg:
        files: ["src/**/*.jpg"]
        tasks: ["imagemin", "livereload"]

    jasmine:
      product:
        src: "test/src/*.js"
        options:
          host: "http://127.0.0.1:8900/"
          specs: "test/spec/*Spec.js"
          helpers: "test/spec/*Helper.js"

    jade:
      compile:
        options:
          data:
            debug: true
        files:
          "dest/index.html": "src/index.jade"

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-regarde"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-livereload"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-notify"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-bower-concat"

  grunt.registerTask "default", ["bower", "livereload-start", "connect", 'regarde']
  grunt.registerTask "ci", ["coffee", "test"]
