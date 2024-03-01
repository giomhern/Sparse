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
