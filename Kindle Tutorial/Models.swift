//
//  Models.swift
//  Kindle Tutorial
//
//  Created by Dawid Ramone on 21/02/2018.
//  Copyright © 2018 Dawid Czmyr. All rights reserved.
//

import UIKit

struct Book: Codable {
    let id: Int?
    let title: String?
    let author: String?
    let coverImageUrl: String?
    let pages: [Page]?
}

struct Page: Codable {
    let numer: Int?
    let text: String?
}
