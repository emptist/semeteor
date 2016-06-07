mongoclient = require('./mongoclient')

mongoclient.connect mongoclient.url, (err, db)->
  db.collections (err,collections)->
    console.log  each.collectionName for each in collections

  #db.collectionNames (err,names)->
  #  console.log names
  secs = db.collection "funds"
  secs.find().toArray (err,doc)->
    console.log doc
    db.close
