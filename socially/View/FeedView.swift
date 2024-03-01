//
//  FeedView.swift
//  socially
//
//  Created by Giovanni Maya on 2/29/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct FeedView: View {
    @FirestoreQuery(collectionPath: "Posts") var posts: [Post]
    
    var body: some View {
        List(posts) {
            posts in
            VStack(alignment: .leading){
                VStack {
                    AsyncImage(url: URL(string: posts.imageUrl ?? "")){
                        phase in
                        switch phase {
                        case .empty:
                            EmptyView()
                        case .success(let image):
                            image.resizable()
                                .frame(width: 300, height:200)
                        case .failure:
                            Image(systemName: "photo") 
                        @unknown default:
                                EmptyView()
    
                        }
                    }
                    Text(posts.description ?? "").font(.headline).padding(12)
                    Text("Published on the \(posts.datePublished?.formatted() ?? "")").font(.caption)
                }
                
            }
        }
    }
}

#Preview{
    FeedView()
}
