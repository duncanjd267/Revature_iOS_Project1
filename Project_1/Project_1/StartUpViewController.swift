//
//  StartUpViewController.swift
//  Project_1
//
//  Created by admin on 5/4/21.
//

import UIKit

class StartUpViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var c1 = label.center.x
        
        let anim = UIViewPropertyAnimator(duration: 1.0, curve: .linear){

        }
        
        anim.startAnimation()
        
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [], animations: {
            self.label.center.y = 100
       }, completion: nil)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false){ timer in
            var sb = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "Login") as! UIViewController
            self.present(wel, animated: true, completion: nil)
            
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
