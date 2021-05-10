//
//  DBHelper.swift
//  Project_1
//
//  Created by admin on 4/19/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    var current = ""
    static var inst = DBHelper()
    
    static var dataCheck = false
    
    
    let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext
    func addData(object : [String:String]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.username = object["username"]
        user.password = object["password"]
        user.q1saved = false
        user.q2saved = false
        user.q3saved = false
        user.q4saved = false
        user.q5saved = false
        user.score = 0.0
        do{
            try context?.save()
            print("Data Save")
            print("", user.username)
            print("",user.password)
        }
        catch{
            print("data not saved")
        }
        
    }
    
    func addDataQ(object : [String:String], questions : [String:Double]){
        let questioned = NSEntityDescription.insertNewObject(forEntityName: "QList", into: context!) as! QList
        questioned.qid = object["qid"]
        questioned.user = object["user"]
        questioned.question1 = questions["Q1"]!
        questioned.question2 = questions["Q2"]!
        questioned.question3 = questions["Q3"]!
        questioned.question4 = questions["Q4"]!
        questioned.question5 = questions["Q5"]!
        questioned.submitted = false
        do{
            try context?.save()
        } catch {
            print("data not saved")
        }
    }
    
    func getData()-> [User]{
        var stu = [User]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            stu = try context?.fetch(fetchReq) as!
     [User]
        }
        catch{
            print("cannot fetch the data")
        }
        return stu
    }
    
    
    
    func getOneData(name : String) -> User{
        
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        fetchReq.fetchLimit = 1
        
        do{
            let req = try context?.fetch(fetchReq) as! [User]
            if(req.count != 0){
                st = req.first as! User
                DBHelper.dataCheck = true
            }
            else{
                print("Data not found")
                DBHelper.dataCheck = false
                
            }
        }
        catch{
            print("")
        }
        
        return st
    }
    
    func getOneDataQ(name : String, qid : String) -> QList{
        
        var st = QList()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "QList")
        fetchReq.predicate = NSPredicate(format: "user == %@", name)
        fetchReq.predicate = NSPredicate(format: "qid == %@", qid)
        fetchReq.fetchLimit = 1
        
        do{
            let req = try context?.fetch(fetchReq) as! [QList]
            if(req.count != 0){
                st = req.first as! QList
            }
            else{
                print("Data not found")
            }
        }
        catch{
            print("")
        }
        
        return st
    }
    
    func updateData(object : [String:String]){
        
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["username"]!)
        
        do{
            let stu = try context?.fetch(fetchReq)
            
            if(stu?.count != 0){
                st = stu?.first as! User
                st.password = object["password"]
                try context?.save()            }
            
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateDataQs(object : [String:String], saved : String){
        
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["user"]!)
        
        do{
            let stu = try context?.fetch(fetchReq)
            
            if(stu?.count != 0){
                st = stu?.first as! User
                switch saved {
                case "q1saved":
                    st.q1saved = true
                case "q2saved":
                    st.q2saved = true
                case "q3saved":
                    st.q3saved = true
                case "q4saved":
                    st.q4saved = true
                case "q5saved":
                    st.q5saved = true
                default:
                    print("")
                }
            
                try context?.save()
                
            }
            
        }
        catch{
            print("Error")
        }
        
    }
    func updateDataQ(object : [String:String], questions : [String:Double]){
        
        var q = QList()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "QList")
        fetchReq.predicate = NSPredicate(format: "user == %@", object["user"]!)
        fetchReq.predicate = NSPredicate(format: "qid == %@", object["qid"]!)
        
        do{
            let qu = try context?.fetch(fetchReq)
            
            if(qu?.count != 0){
                q = qu?.first as! QList
                q.question1 = questions["Q1"]!
                q.question2 = questions["Q2"]!
                q.question3 = questions["Q3"]!
                q.question4 = questions["Q4"]!
                q.question5 = questions["Q5"]!
                q.submitted = false
                try context?.save()
            }
        } catch{
            print("error")
        }
        
    }
    
    func updateDataLast(object : [String:String], questions : [String:Double]){
        
        var q = QList()
        var st = User()
        var fetchReq2 = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq2.predicate = NSPredicate(format: "username == %@", object["user"]!)
        
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "QList")
        fetchReq.predicate = NSPredicate(format: "user == %@", object["user"]!)
        fetchReq.predicate = NSPredicate(format: "qid == %@", object["qid"]!)
        
        do{
            let qu = try context?.fetch(fetchReq)
            let stu = try context?.fetch(fetchReq2)
            
            if(qu?.count != 0){
                q = qu?.first as! QList
                st = stu?.first as! User
                q.question1 = questions["Q1"]!
                q.question2 = questions["Q2"]!
                q.question3 = questions["Q3"]!
                q.question4 = questions["Q4"]!
                q.question5 = questions["Q5"]!
                q.submitted = true
                st.score = st.score + 100
                try context?.save()
            }
        } catch{
            print("error")
        }
        
    }
    
    func clearData(){
        let rvar = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let del = NSBatchDeleteRequest(fetchRequest: rvar)
        let qvar = NSFetchRequest<NSFetchRequestResult>(entityName: "QList")
        let qdel = NSBatchDeleteRequest(fetchRequest: qvar)

        do{
            print("Data deleted")
            try context?.execute(del)
            try context?.execute(qdel)
        }
        catch{
            print("error")
        }
    }
    
    func holdCurrentUser(name : String){
        current = name
    }
    func getCurrentUser() -> String {
        return current;
    }

}
