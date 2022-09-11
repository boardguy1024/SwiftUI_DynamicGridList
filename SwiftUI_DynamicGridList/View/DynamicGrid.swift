//
//  DynamicGrid.swift
//  SwiftUI_DynamicGridList
//
//  Created by park kyung seok on 2022/09/11.
//

import SwiftUI

struct DynamicGrid<Content: View, T: Identifiable>: View where T: Hashable {
    
    var content: (T) -> Content
    
    var list: [T]
    
    var columns: Int
    
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.columns = columns
        self.showsIndicators = showsIndicators
        self.spacing = spacing
        self.content = content
        self.list = list
    }
    
    func setupList() -> [[T]] {
        
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex = 0
        
        for object in list {
            
            gridArray[currentIndex].append(object)
            
            // list: 10
            // columns: 1 ->
            //   gridArray[0].append(object0)
            //   gridArray[0].append(object1)
            //   gridArray[0].append(object2) ... gridArray[0].append(object9)
            
            
            // columns: 2 ->
            //   gridArray[0].append(object0) + gridArray[0].append(object1)
            //   gridArray[1].append(object2) + gridArray[1].append(object3)
            //   ...
            
            // columns: 3 ->
            //   gridArray[0].append(object0) + gridArray[0].append(object1) + gridArray[0].append(object2)
            //   gridArray[1].append(object3) + gridArray[1].append(object4) + gridArray[1].append(object5)
            //   ...
            
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            
            // Columns
            HStack(alignment: .top) {
                ForEach(setupList(), id: \.self) { columnsData in
                
                    
                    // Rows
                    LazyVStack(spacing: spacing) {
                        ForEach(columnsData) { object in
                            content(object)
                        }
                    }
                    
                    
                }
            }
            .padding(.vertical)
        }
        
        
    }
}

struct DynamicGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
