//
//  Post.swift
//  SwiftUI_DynamicGridList
//
//  Created by park kyung seok on 2022/09/11.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
