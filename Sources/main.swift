import Kitura
import HeliumLogger

HeliumLogger.use()

let router = Router()

let myCertPath = "/tmp/Creds/Self-Signed/cert.pem"
let myKeyPath = "/tmp/Creds/Self-Signed/key.pem"

let mySSLConfig =  SSLConfig(withCACertificateDirectory: nil, usingCertificateFile: myCertPath, withKeyFile: myKeyPath, usingSelfSignedCerts: true)


router.get("/") {
    request, response, next in
    response.send("Hello, Orest!")
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router, withSSL: mySSLConfig)
Kitura.run()
