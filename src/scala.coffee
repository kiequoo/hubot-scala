# Description:
#   scala - run a scala expression
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot scala <scala> - Execute the scala code
#
# Author
#   rustedgrail

http = require 'https'
# http = require 'http'

module.exports = (robot) ->
  robot.respond /scala (.*)/i, (msg) ->
    options =
      hostname: "desolate-cliffs-6834.herokuapp.com"
      method: "POST"
      # hostname: "localhost"
      # port: "9000"

    req = http.request options, (res) ->
      res.data = ""

      res.on 'data', (chunk) ->
        res.data += chunk.toString()

      res.on 'end', ->
        msg.send '`' + res.data '`'

    req.setHeader "Content-Type", "text/plain;charset=UTF-8"

    req.on 'error', console.log
    req.end msg.match[1]
