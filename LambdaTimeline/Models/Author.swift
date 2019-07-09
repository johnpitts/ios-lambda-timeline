//
//  Author.swift
//  LambdaTimeline
//
//  Created by Spencer Curtis on 10/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import FirebaseAuth

struct Author: FirebaseConvertible, Equatable {
    
    let uid: String
    let displayName: String?
    
    private static let uidKey = "uid"
    private static let displayNameKey = "displayName"
    
    var dictionaryRepresentation: [String: Any] {
        return [Author.uidKey: uid,
                Author.displayNameKey: displayName ?? "No display name"]
    }
    
    // takes a dictionary version of Author, like from Firebase, and initializes it with the MAIN init below...
    init?(user: User) {
        self.init(dictionary: user.dictionaryRepresentation)
    }
    
    // This is the MAIN initilizer, it's called by init(User).  Where is User class definied tho??
    init?(dictionary: [String: Any]) {
        
        // user id has to be cast as String bc we defined it as 'Any'
        guard let uid = dictionary[Author.uidKey] as? String,
            let displayName = dictionary[Author.displayNameKey] as? String else { return nil }  //redundant bc "No display name" set above
        
        self.uid = uid
        self.displayName = displayName
    }
}
