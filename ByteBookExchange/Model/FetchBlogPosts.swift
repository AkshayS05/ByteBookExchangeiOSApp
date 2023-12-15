import Foundation
import FirebaseCore
import FirebaseFirestore

class FetchBlogPosts {
    let db = Firestore.firestore()
    var body = ""
    var tableViewData: [String] = []
    
    // Add a closure property for updating UI
    var updateUI: (() -> Void)?

    func fetchPosts(title: String) {
        db.collection("Problem Solving").document(title).getDocument { [weak self] (document, error) in
            if let error = error {
                print("Error fetching post details: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                if let body = document["body"] as? String {
                    self?.body = body
                    self?.updateUI?()
                }
            }
        }
    }
}
