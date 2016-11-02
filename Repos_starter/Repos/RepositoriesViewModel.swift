import Foundation

class RepositoriesViewModel {
  var repos = [Repository]()
  
  let client = SearchRepositoriesClient()
  let parser = RepositoriesParser()

  func numberOfRows() -> Int {
    // your code here
  }
  
  func titleForRowAtIndexPath(indexPath: NSIndexPath) -> String {
    // your code here
  }
  
  func detailViewModelForRowAtIndexPath(indexPath: NSIndexPath) -> RepositoryDetailViewModel {
    // your code here
  }
  
}
