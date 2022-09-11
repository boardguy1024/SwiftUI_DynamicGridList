//
//  PostCardView.swift
//  SwiftUI_DynamicGridList
//
//  Created by park kyung seok on 2022/09/11.
//

import SwiftUI

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
