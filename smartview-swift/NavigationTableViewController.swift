import UIKit

protocol NavigationTableDelegate :class {
    func didSelectCell( i : Int )
}


class NavigationTableViewController: UITableViewController {
    
    weak var delegate: NavigationTableDelegate?
    
    var model_list : NSArray!
    
    let cell_identifer = "cell"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.center               = CGPointMake(self.view.frame.origin.x + self.view.frame.size.height / 2, self.view.frame.origin.y + self.view.frame.size.width / 2)
        
        self.tableView.transform       = CGAffineTransformMakeRotation( CGFloat( -M_PI / 2 ) )
        self.tableView.separatorStyle  = UITableViewCellSeparatorStyle.None
        self.tableView.allowsSelection = true
        self.tableView.showsVerticalScrollIndicator = true
        self.tableView.registerClass( UITableViewCell.self, forCellReuseIdentifier: cell_identifer )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model_list.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cell_identifer )
        
        let model : ModelDetail = model_list[ indexPath.row ] as! ModelDetail
        cell.textLabel?.text = model.detailTitle
        cell.transform  = CGAffineTransformMakeRotation( CGFloat( M_PI / 2 ) )
        return cell
    }

    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        self.delegate!.didSelectCell( indexPath.row )
    }
}