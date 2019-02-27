import UIKit

public class HomeViewController: UIViewController {
  var presenter: HomePresenterProtocol!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.red
  }
}
