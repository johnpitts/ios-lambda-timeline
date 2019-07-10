//
//  Comment.swift
//  LambdaTimeline
//
//  Created by Spencer Curtis on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import FirebaseAuth

class Comment: FirebaseConvertible, Equatable {
    
    static private let textKey = "text"
    static private let author = "author"
    static private let timestampKey = "timestamp"
    static private let audioURLKey = "audioURL"
    
    let text: String?
    let audioURL: URL?
    let author: Author
    let timestamp: Date
    
    init(text: String, audioURL: URL, author: Author, timestamp: Date = Date()) {
        self.text = text
        self.audioURL = audioURL
        self.author = author
        self.timestamp = timestamp
    }
    
    // Initialize a Comment using Firebase (who demands all dictionaries)...
    init?(dictionary: [String : Any]) {
        guard let text = dictionary[Comment.textKey] as? String?,
            let audioURL = dictionary[Comment.audioURLKey] as? URL?,
            let authorDictionary = dictionary[Comment.author] as? [String: Any],
            let author = Author(dictionary: authorDictionary),
            let timestampTimeInterval = dictionary[Comment.timestampKey] as? TimeInterval else { return nil } //TimeInterval is typealias for Double
        
        self.text = text
        self.audioURL = audioURL
        self.author = author
        self.timestamp = Date(timeIntervalSince1970: timestampTimeInterval)
    }
    
    var dictionaryRepresentation: [String: Any] {
        return [Comment.textKey: text,
                Comment.audioURLKey: audioURL,
                Comment.author: author.dictionaryRepresentation,
                Comment.timestampKey: timestamp.timeIntervalSince1970]
    }
    
    static func ==(lhs: Comment, rhs: Comment) -> Bool {
        return lhs.author == rhs.author &&
            lhs.timestamp == rhs.timestamp
    }
}
