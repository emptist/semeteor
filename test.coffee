mongoclient = require('./index')

mongoclient.connect mongoclient.url, (err, db)->
  db.collections (err,collections)->
    console.log collections.length

  #db.collectionNames (err,names)->
  #  console.log names
  secs = db.collection "securities"
  secs.find().toArray (err,doc)->
    console.log doc.length
    db.close
