require 'pg'

conn = PGconn.connect('localhost',3000,'','','servizio_development','postgres','password')

res = conn.exec('SELECT * FROM users')

res.each {


}
