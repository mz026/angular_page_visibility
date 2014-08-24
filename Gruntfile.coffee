module.exports = (grunt)->
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    coffee:
      compile:
        options:
          sourceMap: true
          watch: true
        files: [
          expand: true
          src: 'src/**/*.coffee'
          dest: 'js/'
          ext: '.js'
        ]

  grunt.registerTask 'default', ->
    console.log('hihihi')
