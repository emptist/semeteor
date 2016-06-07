### 用法:
解決 Mac上 soft rlimits too low 問題:
# https://gist.github.com/tamitutor/6a1e41eec0ce021a9718


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


MongoClient.url = "'mongodb://localhost:3001/meteor'"
###
MongoClient.dbconnected = (callback)->
  MongoClient.connect url , callback
###

module.exports = MongoClient #.dbconnected
