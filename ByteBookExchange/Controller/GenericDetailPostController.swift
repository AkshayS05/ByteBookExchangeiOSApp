//
//  GenericDetailPostController.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-12.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class GenericDetailPostController: GenericDetailPostView {
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPostDetails()
    }
    
   func loadPostDetails() {
        guard let selectedTitle = titleText, let selectedScreen = screenTitle else {
            print("Selected title or screen is nil")
            return
        }
        // query to find documents where the 'selectedTitle' field is equal to the provided value
            let query = db.collection(selectedScreen).whereField("title", isEqualTo: selectedTitle)
        // Execute the query
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                // Check if there are matching documents
                if let document = querySnapshot?.documents.first {
                    let data = document.data()
                    
                    // access specific fields from the data dictionary
                    if let body = data["body"] as? String {
                        self.bodyLabel.text = body
                        
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
        
    }
}
    

