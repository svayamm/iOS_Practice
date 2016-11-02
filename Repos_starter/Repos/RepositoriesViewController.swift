import UIKit

class RepositoriesViewController: UIViewController         {
    
  let viewModel = RepositoriesViewModel()

  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // your code here
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRowAtIndexPath(selectedRow, animated: true)
    }
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // your code here
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // your code here
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // your code here
  }

}

