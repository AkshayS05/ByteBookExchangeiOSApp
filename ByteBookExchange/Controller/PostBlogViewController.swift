//
//  PostBlogController.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-11.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class PostBlogViewController: PostBlogView {
    
    let db = Firestore.firestore()
   
     override func submitButtonTapped(_ sender: UIButton) {
        let selectedRow = categoryPicker.selectedRow(inComponent: 0)
        
        let selectedCategory = categories[selectedRow]
        
        if let title = titleTextField.text, let blogBody = blogEntryTextView.text,
           let blogSender = Auth.auth().currentUser?.email {
            db.collection(selectedCategory).addDocument(data: [
                "title": title,
                "body": blogBody,
                "sender": blogSender
                // Add other fields as needed
            ]) { [self] error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added successfully!")
                    // Show a success alert
                let alertController = UIAlertController(title: "Success", message: "Document added successfully!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    self.blogEntryTextView.text = ""
                    titleTextField.text = ""
                }
            }
        }
    }
}
