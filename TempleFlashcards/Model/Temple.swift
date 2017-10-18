//
//  Temple.swift
//  TempleFlashcards
//
//  Created by Victor Lazaro on 10/9/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import Foundation

public class Temple {
    
    var templeName: String
    var templeImageURL: String
    var dedicatedDate: String
    
    public init(filename: String, name: String, dedicatedDate: String) {
        self.templeName = name
        self.templeImageURL = filename
        self.dedicatedDate = dedicatedDate
    }
    
}
