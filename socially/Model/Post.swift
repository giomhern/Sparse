//
//  Post.swift
//  socially
//
//  Created by Giovanni Maya on 2/28/24.
//

import SwiftUI
import FirebaseFirestoreSwift


/* =========== POST MODEL =============== */
struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageUrl: String?
    @ServerTimestamp var datePublished: Date?
}
