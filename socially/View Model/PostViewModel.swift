//
//  PostViewModel.swift
//  socially
//
//  Created by Giovanni Maya on 2/28/24.
//

import SwiftUI
import FirebaseFirestore

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    private var databaseReference = Firestore.firestore().collection("Posts")
    
    
    /* === FUNCTION TO POST DATA === */
    
    func addData(description: String, datePublished: Date) async {
        /*
         Why async-await?
            async-await is necessary here for UX, to ensure that a user isn't stuck on a page simply because the data being sent is taking some to upload (code is executed in the background
        */
        
        do {
            _ = try await databaseReference.addDocument(data: ["description": description, "datePublished": datePublished])
        } catch {
            print(error.localizedDescription)
        }
    }
}



