// Generated by CoffeeScript 1.10.0

/* 用法:
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
 */
var MongoClient, url;

MongoClient = require('mongodb').MongoClient;

url = 'mongodb://localhost:3001/meteor';

MongoClient.dbconnected = function(callback) {
  return MongoClient.connect(url, callback);
};

module.exports = MongoClient.dbconnected;

//# sourceMappingURL=index.js.map
