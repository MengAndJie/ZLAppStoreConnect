//
//  AppStoreConnectAPI.swift
//  ZLAppStoreConnect
//
//  Created by 朱猛 on 2020/11/18.
//

import Foundation
import Alamofire
import SwiftJWT

struct AppStoreConnectAPIClaims : Claims{
    let iss: String
    let exp: Date
    var adu: String = "appstoreconnect-v1"
}



class AppStoreConnectAPI{
    private var keyID : String?
    private var keyContent : Data?
    private var issuerID : String?
    public var JWTToken : String?
    
    init(keyID : String = "Z3Z93W5693", issuerID : String = "4a814e1d-0063-48e2-a29f-142aa10382e0"){
        let string = Bundle.main.path(forResource: "AuthKey_Z3Z93W5693", ofType: "p8")
        do {
            self.keyContent = try Data.init(contentsOf: URL(fileURLWithPath: string!), options: .alwaysMapped)
        } catch {
            
        }
        
        self.keyID = keyID
        self.issuerID = issuerID
    }
    
    
    /**
     * 使用AppStoreConnectAPI需要先生成JWT token
     */
    
    func generateJWTToken() {
        /**
            
         header
         
         {
         "alg": "ES256",
         "kid": "2X9R4HXF34",
         "typ": "JWT"
         }

         */
        
        let jwtHeader = Header(kid:keyID)
        
        let jwtPayload = AppStoreConnectAPIClaims(iss: issuerID!, exp: Date(timeIntervalSinceNow: 3600))
        
        var myJWT = JWT(header:jwtHeader , claims: jwtPayload)
        
    
        let jwtSigner = JWTSigner.es256(privateKey: self.keyContent!)
        
        do {
            self.JWTToken = try myJWT.sign(using: jwtSigner)
        } catch{
            
        }
        
        print(self.JWTToken)
        
    }
    
    
    
    
}
