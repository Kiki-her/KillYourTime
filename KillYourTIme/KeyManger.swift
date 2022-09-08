//
//  KeyManger.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/08.
//

import Foundation

struct KeyManager {
    private let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist")
    func getKeys() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }
    func getValue(key: String) -> AnyObject? {
        guard let keys = getKeys() else {
            return nil
        }
        return keys[key]! as AnyObject
    }
}
