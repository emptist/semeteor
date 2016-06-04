### 用法:
dbconnected (err, db) ->
  marketInfo = db.collection 'marketInfo'
  marketInfo.insert {代碼:'159915',名稱:'創業板', 性質: 'ETF'}, (err, result)->
    unless err?
      console.dir result
    else
      console.log err
    db.close()


dbconnected (err, db) ->
  marketInfo = db.collection 'marketInfo'
  console.log marketInfo.find().toArray (err, docs)->
    console.log "All#{docs}"
  db.close
###
{exec} = require 'child_process'
{MongoClient} = require('mongodb')

exec 'ps -ax | grep mongod', (err, res)->
  throw '[error]semeteor>> check if mongod running' if err?
  unless /mongod/.test res
    exec 'mongod --port 3001', (err, data)->
      throw '[error]semeteor>> check if mongod running' if err?
      url = 'mongodb://localhost:3001/meteor'

      # https://miguelmota.com/bytes/open-terminal-tab-programatically/
      # open terminal and run Python before starting app

      MongoClient.dbconnected = (callback)->
        MongoClient.connect url , callback


module.exports = MongoClient.dbconnected
