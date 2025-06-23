//
//  AchievementView.swift
//  Success! App
//
//  Created by mac on 22/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class AchievementView: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    
    
    
    var abcd = ["gfggfg","gfgg","fgf","gfg","gfgf","fgfd","dgdfg","bbvb","vbcvb","rtg","tretr","rgr","bbvb","vbcvb","rtg","tretr","rgr"]
    
        
    @IBOutlet weak var myScrollLine: UIView!
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
   
    @IBOutlet weak var myCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myCollection.delegate = self
        myCollection.dataSource = self
        
        myTableView.isHidden = true
//        
//        self.cell_Image.layer.borderWidth = 1
//        cell_Image.layer.masksToBounds = false
//        cell_Image.layer.cornerRadius = cell_Image.frame.height/2
//        cell_Image.clipsToBounds = true
        

        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    @IBAction func calendar(_ sender: Any) {
        
        
        
        let x = self.storyboard?.instantiateViewController(withIdentifier: "CalendarView") as? CalendarView
        self.navigationController?.pushViewController(x!, animated: true)
        
        
        
    }
    
    @IBAction func Achievement(_ sender: Any) {
        
        
        let y = self.storyboard?.instantiateViewController(withIdentifier: "AchievementView") as? AchievementView
        self.navigationController?.pushViewController(y!, animated: true)
        
        
        
        
    }
    
    
    
    @IBAction func home(_ sender: Any) {
        
        
        let z = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardView") as? DashBoardView
        self.navigationController?.pushViewController(z!, animated: true)
        
        
        
        
    }

    
    
    
    // ********************* Medals *********************.---->--.

        
    @IBAction func Medals_Btn(_ sender: Any) {
    
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            self.myScrollLine.frame = CGRect(x: (sender as AnyObject).frame.origin.x, y: 37.5, width: self.myScrollLine.frame.width, height: self.myScrollLine.frame.height)
        },completion: nil)
        
        
        self.myCollection.isHidden = false
        self.myTableView.isHidden = true
        
    }
    
    
    // ******************** Status **********************.---->-->
    
    @IBAction func status(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            self.myScrollLine.frame = CGRect(x: (sender as AnyObject).frame.origin.x-8, y: 37.5, width: (sender as AnyObject).frame.width+16, height: self.myScrollLine.frame.height)
        },completion: nil)
        

        
        self.myCollection.isHidden = true
        self.myTableView.isHidden = false

        
    }
    
    
    
// ****************** Success_Record ************************.---->-->
    
    @IBAction func success_Record(_ sender: Any) {
    
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            self.myScrollLine.frame = CGRect(x: (sender as AnyObject).frame.origin.x-8, y: 37.5, width: (sender as AnyObject).frame.width+16, height: self.myScrollLine.frame.height)
        },completion: nil)

        
        
        
        
    }

    
    // ****************** STATUS TABLE ************************.---->--.>
    
    

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sTatusCell", for: indexPath) as! sTatusCell
        
        cell.cell_Image.layer.cornerRadius = cell.cell_Image.frame.width / 2
        cell.cell_Image.clipsToBounds = true
        
        
        
        return cell
        
    }
    
    
    
    // ****************** CollectionView videos & images ************************.---->-->
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedalsCell", for: indexPath) as! MedalsCell
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedalsCell", for: indexPath) as! MedalsCell
        
        
        cell.medal_Image.layer.cornerRadius = cell.medal_Image.frame.width / 2
        cell.medal_Image.clipsToBounds = true
     
    
   
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: 100, height: 100)
//    }
  
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    
            return CGSize.init(width: collectionView.frame.size.width/3.5, height: collectionView.frame.size.width/3.5)
    
        }
    
}
