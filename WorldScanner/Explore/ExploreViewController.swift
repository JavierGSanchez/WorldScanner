//
//  ExploreViewController.swift
//  WorldScanner
//
//  Created by Javier on 2/13/22.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    let manager = ExploreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       switch segue.identifier! {
       case Segue.showEditor.rawValue:
         //showLocationList(segue: segue)
           print("got a show location segue")
           break
       case Segue.show3DModel.rawValue:
         //show3DModel(segue: segue)
           print("got a show 3D model segue")
           break
       default:
          print("Segue not added")
       }
    }
    
    override func shouldPerformSegue(withIdentifier
    identifier: String, sender: Any?) -> Bool {
       
        /* Do some logic checks
        if identifier == Segue.showEditor.rawValue, foo == nil {
          showLocationRequiredAlert("Some title","Some Message.")
          return false
       }
         */
       return true
    }

}

// MARK: Private Extension
private extension ExploreViewController{
    
    func initialize() {
       manager.fetch()
    }
    
    //passes values and does stuff when calling the Editor view controller
    func showEditor(segue: UIStoryboardSegue) {
       guard let navController = segue.destination as?
       UINavigationController, let viewController =
       navController.topViewController as?
       EditorViewController else {
          return
       }
        //set some property on the view controller
        //viewController.someprop = someprop
    }
    
    //passes values and does stuff when calling the Game view controller
    func show3DModel(segue: UIStoryboardSegue) {
       if
        let viewController = segue.destination as? GameViewController,
        let index = collectionView.indexPathsForSelectedItems?.first?.row {
           viewController.selectedCat = manager.exploreItem(at: index)
       }
    }
    
    func showLocationRequiredAlert(alertTitle:String, alertMessage:String) {
       let alertController = UIAlertController(title: alertTitle , message: alertMessage, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
       alertController.addAction(okAction)
       present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func unwindGameDone(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindEditorCancel(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindEditorDone(segue: UIStoryboardSegue) {
       if let viewController = segue.source as? EditorViewController {
           //do soemthing with the view controller
           
           //someParam = viewController.someParam
          //if let someParam2 = someParam {
             //do something with someParam2 and this view controller
          //}
       }
    }
    
}

// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
    
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        
        return headerView
    }
     */
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("ExploreViewController: collectionView: indexPath.row=" + String(indexPath.row))
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let exploreItem = manager.exploreItem(at: indexPath.row)
        cell.exploreNameLabel.text = exploreItem.name
        let myImage = UIImage(named: exploreItem.image!)
        cell.exploreImageView.image = myImage //UIImage(named: exploreItem.image!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        manager.numberOfExploreItems()
    }

}
