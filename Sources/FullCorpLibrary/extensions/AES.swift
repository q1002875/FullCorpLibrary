//
//  AES.swift
//  FullSmartLife
//
//  Created by Jeff on 2019/11/18.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation
import CryptoSwift



extension Date{
    
    func aes16Code() -> String{
        let timeInterval:TimeInterval = self.timeIntervalSince1970
              let time:Int = Int(timeInterval*1000)
              let resultTime = time/100000
              let resultTimeMD5 = "\(resultTime)".md5()
              let md5codekey = resultTimeMD5.code(start: 0, end: 16)
          print(md5codekey)
             return md5codekey
        
    }
    
    
}

extension String {
  
    func aesEncrypt(key: String) throws -> String {

        var result = ""
        let iv = "1111111111111111"
        do {
//            let iv: [UInt8] = Array<Any>(000000000.utf8) as [UInt8]
            let key: [UInt8] = Array(key.utf8) as [UInt8]
            let aes = try! AES(key: key, blockMode: CBC(iv: iv.bytes), padding: .pkcs5) // AES128 .CBC pkcs5
            let encrypted = try aes.encrypt(Array(self.utf8))

            result = encrypted.toBase64()!

//            print("AES Encryption Result: \(result)")

        } catch {

            print("Error: \(error)")
        }

        return result
    }

    func aesDecrypt(key: String) throws -> String {

        var result = ""
         let iv = "1111111111111111"
        do {

            let encrypted = self
            let key: [UInt8] = Array(key.utf8) as [UInt8]
            let aes = try! AES(key: key, blockMode: CBC(iv: iv.bytes), padding: .pkcs5)
            let decrypted = try aes.decrypt(Array(base64: encrypted))

            result = String(data: Data(decrypted), encoding: .utf8) ?? ""

//            print("AES Decryption Result: \(result)")

        } catch {

            print("Error: \(error)")
        }

        return result
    }
}
