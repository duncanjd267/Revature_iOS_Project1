//
//  FoodViewController.swift
//  Project_1
//
//  Created by admin on 4/29/21.
//

import UIKit

class FoodViewController: UIViewController {

    var qid = "food"
    
    @IBOutlet weak var q1: CosmosView!
    @IBOutlet weak var q2: CosmosView!
    @IBOutlet weak var q3: CosmosView!
    @IBOutlet weak var q4: CosmosView!
    @IBOutlet weak var q5: CosmosView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = DBHelper.inst.current
        let data = DBHelper.inst.getOneData(name: user)
        if(data.q3saved == false){
            let dic = ["qid" : qid, "user" : DBHelper.inst.getCurrentUser()]
            let pas = ["Q1" : 1.0, "Q2" : 1.0, "Q3" : 1.0, "Q4" : 1.0, "Q5" : 1.0]
            DBHelper.inst.addDataQ(object: dic, questions: pas)
            DBHelper.inst.updateDataQs(object: dic, saved: "q3saved")
        }
        else{
            var q = DBHelper.inst.getOneDataQ(name: user, qid : qid)
            if q.submitted == false{
                q1.rating = q.question1
                q2.rating = q.question2
                q3.rating = q.question3
                q4.rating = q.question4
                q5.rating = q.question5
            }
            else {
                var sb = UIStoryboard(name: "Main", bundle: nil)
                var wel = sb.instantiateViewController(withIdentifier: "End") as! UIViewController
                self.present(wel, animated: true, completion: nil)
            }
        }        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
        let dic = ["qid" : qid, "user" : DBHelper.inst.getCurrentUser()]
        let pas = ["Q1" : q1.rating, "Q2" : q2.rating, "Q3" : q3.rating, "Q4" : q4.rating, "Q5" : q5.rating]
        DBHelper.inst.updateDataQ(object: dic, questions: pas)
        print("Added")
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        
        let dic = ["qid" : qid, "user" : DBHelper.inst.getCurrentUser()]
        let pas = ["Q1" : q1.rating, "Q2" : q2.rating, "Q3" : q3.rating, "Q4" : q4.rating, "Q5" : q5.rating]
        DBHelper.inst.updateDataLast(object: dic, questions: pas)
        
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var wel = sb.instantiateViewController(withIdentifier: "End") as! UIViewController
        self.present(wel, animated: true, completion: nil)
        
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
