//
//  LocalState.swift
//  Bankey
//
//  Created by Mithun M R on 19/11/24.
//

import Foundation

public class LocalState {

    private enum Keys: String {
        case isloggedin
        case hasOnboarded
    }

    public static var isLoggedin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isloggedin.rawValue)
        }

        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.isloggedin.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }

        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
