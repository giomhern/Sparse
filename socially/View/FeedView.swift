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
            VStack{
                VStack {
                    AsyncImage(url: URL(string: posts.imageURL ?? "")){
                        phase in
                        switch phase {
                        case .empty:
                            Image(systemName: "photo.fill").resizable()
                                .aspectRatio(contentMode: .fit).frame(width: 50).padding(.vertical, 10)
                        case .success(let image):
                            image.resizable().frame(width: 300, height: 200)
                        case .failure:
                            Image(systemName: "photo.fill")
                        @unknown default:                                EmptyView()
    
                        }
                    }
                    
                    Text(posts.description ?? "")
                    Text("Published on the \(posts.datePublished?.formatted() ?? "")")
                }
                
            }
        }
    }
}

#Preview{
    FeedView()
}
