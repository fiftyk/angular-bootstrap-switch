module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      build: ['dest']
    uglify:
      options:
        banner: '/**\n' +
        ' * <%= pkg.name %>\n' +
        ' * @version v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %>\n' +
        ' * @author <%= pkg.author.name %> (<%= pkg.author.email %>)\n' +
        ' * @link <%= pkg.homepage %>\n' +
        ' * @license <%= _.pluck(pkg.licenses, "type").join(", ") %>\n' +
        '**/\n\n'
        compress:
          drop_console: true
      build:
        files: [{
          expand: true
          cwd: 'src'
          src: '**/*.js'
          dest: 'dest'
        }]
   
  grunt.registerTask 'default', ['clean', 'uglify']