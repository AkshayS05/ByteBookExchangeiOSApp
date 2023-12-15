import UIKit

class BlogViewController: BlogView, UserLogout {

    
    lazy var logOutLabelTapGesture: UITapGestureRecognizer = {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logOutLabelTapped))
          tapGesture.numberOfTapsRequired = 1
          return tapGesture
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutLabel.isUserInteractionEnabled = true
        logOutLabel.addGestureRecognizer(logOutLabelTapGesture)
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = tableViewData[indexPath.row]

        // navigation based on the selected item
        switch selectedItem {
        case "Problem Solving":
            navigateToGenericBlogScreen(title: "Problem Solving")
        case "BackEnd Development":
            navigateToGenericBlogScreen(title: "BackEnd Development")
        case "FrontEnd Development":
            navigateToGenericBlogScreen(title: "FrontEnd Development")
        default:
            break
        }
    }

    private func navigateToGenericBlogScreen(title: String) {
        let genericBlogVC = GenericBlogsViewController()
        genericBlogVC.title = title
        navigationController?.pushViewController(genericBlogVC, animated: true)
    }
    @objc func logOutLabelTapped() {
           logOut()
       }

}
