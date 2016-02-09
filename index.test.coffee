chai = require "chai"
chai.should()
dbconnected = require('./collection')

describe "dbconnected()", ->
  it "應發現證券品種", (done)->
    dbconnected (err, db)->
      secs = db.collection "securities"
      secs.find().toArray (err,doc)->
        #console.log doc.length
        doc.length.should.equal('n')
        db.close
        done()
  it "應發現證券品種代碼", (done)->
    dbconnected (err, db)->
      secs = db.collection "securities"
      secs.find().toArray (err,doc)->
        codes = (sec.SecurityCode for sec in doc)
        #console.log codes
        (typeof(codes[0])).should.equal('string')
        db.close
        done()
