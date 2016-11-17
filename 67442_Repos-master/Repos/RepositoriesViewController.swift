import UIKit

extension RepositoriesViewController: UISearchResultsUpdating {
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
}

class RepositoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  let viewModel = RepositoriesViewModel()
  let searchController = UISearchController(searchResultsController: nil)

  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSearchBar()
    tableView.registerNib(UINib(nibName: "TableViewCell", bundle:nil), forCellReuseIdentifier: "cell")
    viewModel.refresh { [unowned self] in
      dispatch_async(dispatch_get_main_queue()) {
          self.tableView.reloadData()
      }
    }
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRowAtIndexPath(selectedRow, animated: true)
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
    //cell.textLabel?.text = viewModel.titleForRowAtIndexPath(indexPath)
    cell.title?.text = viewModel.titleForRowAtIndexPath(indexPath)
    cell.summary?.text = viewModel.summaryForRowAtIndexPath(indexPath)
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let detailVC = segue.destinationViewController as? RepositoryDetailViewController,
      cell = sender as? UITableViewCell,
      indexPath = tableView.indexPathForCell(cell) {
        detailVC.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
    }
  }
  
  func setupSearchBar() {
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
    searchController.searchBar.barTintColor = UIColor(red:0.98, green:0.48, blue:0.24, alpha:1.0)
    // searchController.searchBar.becomeFirstResponder()
  }
  
  func filterContentForSearchText(searchText: String, scope: String = "All") {
    viewModel.updateFiltering(searchText)
    tableView.reloadData()
  }

}


