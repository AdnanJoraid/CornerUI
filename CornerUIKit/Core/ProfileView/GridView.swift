//
//  GridView.swift
//  CornerUIKit
//
//  Created by Adnan Joraid on 2024-06-27.
//

import SwiftUI

struct PhotosCollection {
    let name: String
    let imageName: String
}

struct GridItemView: View {
    let item: PhotosCollection
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 170, height: 170)
                .cornerRadius(20)
            
            Text(item.name)
                .font(.custom("Phonk Regular DEMO", size: 12))
                .fontWeight(.semibold)
        }
    }
}

struct GridView: View {
    let mockData = [
        PhotosCollection(name: "summer in italy", imageName: "italy"),
        PhotosCollection(name: "date vibes", imageName: "date"),
        PhotosCollection(name: "disco night", imageName: "disco"),
        PhotosCollection(name: "valentines day", imageName: "flower"),
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 20) {
                ForEach(mockData, id: \.imageName) { item in
                    GridItemView(item: item)
                }
            }
        }
    }
}

#Preview {
    GridView()
}
