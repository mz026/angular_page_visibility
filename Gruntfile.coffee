module.exports = (grunt)->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    coffee:
      compile:
        options:
          sourceMap: true
          watch: true
        files: [
          expand: true
          cwd: 'src/'
          src: '**/*.coffee'
          dest: 'js/'
          ext: '.js'
        ]
    watch:
      src:
        files: [ 'src/**/*' ]
        tasks: [ 'coffee' ]


  grunt.registerTask 'default', ['coffee', 'watch']
