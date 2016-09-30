import UIKit

class MainViewController: UIViewController, NavigationTableDelegate, MainPageViewDelegate {
    
    var modelList : ModelList   = ModelList()
    var currentPage : Int = 0
    var _nextPage : Int = 0
    let navigationTableViewController = NavigationTableViewController()
    let pageViewController = MainPageViewController( transitionStyle: UIPageViewControllerTransitionStyle.PageCurl, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTableViewController.view.frame = CGRectMake( 0, 20, self.view.frame.size.width, 80)
        navigationTableViewController.model_list = modelList.getList()
        navigationTableViewController.delegate   = self
        
        pageViewController.view.frame           = CGRectMake( 0, 80 , self.view.bounds.size.width, self.view.bounds.size.height - 80 )
        pageViewController.mainPageViewDelegate = self

        self.addChildViewController( navigationTableViewController )
        self.addChildViewController( pageViewController )

        self.view.addSubview( navigationTableViewController.view )
        self.view.addSubview( pageViewController.view )
        
        compleatePage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prevPage()->UIViewController
    {
        _nextPage = modelList.getPrevItemPos( currentPage )
        return DetailViewController( model : modelList.getItem( _nextPage ))
    }
    
    func nextPage()->UIViewController
    {
        _nextPage = modelList.getNextItemPos( currentPage )
        return DetailViewController( model : modelList.getItem( _nextPage ))
    }
    
    
    
    func didSelectCell(i : Int ){
        _nextPage = i
        self.compleatePage()
    }
    
    func compleatePage(){
        let detaiView : DetailViewController = DetailViewController( model : modelList.getItem( _nextPage ) )
        let next  = _nextPage
        let table = navigationTableViewController
        pageViewController.setViewControllers( [ detaiView as UIViewController ], direction: .Forward, animated: false, completion: {
                (BOOL)in
            let index_path = NSIndexPath( forRow:next, inSection:0 )
            NSLog( "62" );
            table.tableView.scrollToRowAtIndexPath( index_path, atScrollPosition: UITableViewScrollPosition.Top, animated:true)
                        NSLog( "64" );
            table.tableView.selectRowAtIndexPath( index_path, animated: true, scrollPosition: UITableViewScrollPosition.Top )
                        NSLog( "66" );
            self.currentPage = next
        })
    }

}