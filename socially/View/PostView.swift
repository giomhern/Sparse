//
//  PostView.swift
//  socially
//
//  Created by Giovanni Maya on 2/28/24.
//

import SwiftUI
import PhotosUI

struct PostView: View {
    @State var data: Data?
    @State var selectedItem: [PhotosPickerItem] = []
    @State private var description: String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    /*
                     Notes:
                        selection: item variable state
                        maxSelectionCount: allow for the selection of one variable at most
                        matching: passing only a series of things (e.g., videos, images, and so forth)
                        preferredItemEncoding: resolution set (automatic lets the system decide which one)
                     */
                    PhotosPicker(selection: $selectedItem, maxSelectionCount: 1, selectionBehavior: .default, matching: .images, preferredItemEncoding: .automatic){
                        if let data = data,
                           let image = UIImage(data: data) {
                            Image(uiImage: image).resizable().scaledToFit().frame(maxHeight: 300)
                        }
                        else {
                            Label("Select a picture", systemImage: "photo.on.rectangle.angled")
                        }
                    }.onChange(of: selectedItem) {
                        newValue in guard let item = selectedItem.first else {
                           return
                        }
                        item.loadTransferable(type: Data.self) {
                            result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                }
                            case .failure(let failure):
                                print("Error: \(failure.localizedDescription)" )
                            }
                        }
                    }
                }
                Section {
                    TextField("Add a description", text: $description, axis:.vertical).lineLimit(6)
                }
                Section {
                    Button("Post") {
                        // TODO: Add post
                        Task{
                            // setting it as task is necessary to use the await keyword
                            await self.viewModel.addData(description: description, datePublished: Date(), data: data!)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }.disabled(data == nil)
                }
            }
        }
    }
}

#Preview {
    PostView()
}
