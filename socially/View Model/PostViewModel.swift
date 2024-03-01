//
//  PostViewModel.swift
//  socially
//
//  Created by Giovanni Maya on 2/28/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

class PostViewModel: ObservableObject {
    let storageReference = Storage.storage().reference().child("\(UUID().uuidString)")
    @Published var posts = [Post]()
    private var databaseReference = Firestore.firestore().collection("Posts")
    
    
    /* === FUNCTION TO POST DATA === */
    
    func addData(description: String, datePublished: Date, data: Data) async {
           do {
               _ = try await
               storageReference.putData(data, metadata: nil) { (metadata, error) in
                   guard let metadata = metadata else {
                       return
                   }
                   self.storageReference.downloadURL { (url, error) in
                       guard let downloadURL = url else {
                           // Uh-oh, an error occurred!
                           return
                       }
                       self.databaseReference.addDocument(data: [ "description": description, "datePublished": datePublished, "imageURL": downloadURL.absoluteString])
                   }
               }
           } catch {
               print(error.localizedDescription)
           }
       }
}



