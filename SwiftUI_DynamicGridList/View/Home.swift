//
//  Home.swift
//  SwiftUI_DynamicGridList
//
//  Created by park kyung seok on 2022/09/11.
//

import SwiftUI

struct Home: View {
    
    @State var posts: [Post] = []
    
    @State var columns: Int = 2
    
    @Namespace var animation: Namespace.ID
    
    var body: some View {
        
        NavigationView {
            
            DynamicGrid(columns: columns, list: posts, content: { post in
                
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
            })
                .navigationTitle("Dynamic Grid List")
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button(action: {
                            columns += 1
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button(action: {
                            columns = max(columns - 1, 0)
                        }) {
                            Image(systemName: "minus")
                        }
                    }
                }
                .animation(.easeInOut, value: columns)
               
        }
        .onAppear {
            
            for index in 1...10 {
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
