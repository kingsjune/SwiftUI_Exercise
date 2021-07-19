//
//  Post.swift
//  SwiftUIExample
//
//  Created by BHJ on 2021/07/01.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}
