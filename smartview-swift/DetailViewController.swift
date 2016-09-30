import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var modelDetail : ModelDetail!
    
    init( model : ModelDetail )
    {
        super.init( nibName: nil, bundle: nil )
        modelDetail = model
    }
    
    required init(coder:NSCoder) {
        super.init(coder:coder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let descriptionLabel = UILabel( frame : CGRectMake( 10, 100, 300, 200 ) )
        let imageView        = UIImageView( image:modelDetail.detailImage )
        imageView.center     = CGPointMake( self.view.bounds.size.width / 2 , self.view.bounds.size.height / 2);
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        self.view.addSubview( descriptionLabel )
        self.view.addSubview( imageView )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}