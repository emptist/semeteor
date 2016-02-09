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

{MongoClient} = require('mongodb')
url = 'mongodb://localhost:3001/meteor'
MongoClient.dbconnected = (callback)->
  MongoClient.connect url , callback

module.exports = MongoClient.dbconnected
