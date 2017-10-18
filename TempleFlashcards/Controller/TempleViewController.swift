//
//  TempleViewController.swift
//  TempleFlashcards
//
//  Created by Victor Lazaro on 10/11/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit
import Toast_Swift

class TempleViewController: UIViewController, UICollectionViewDelegateFlowLayout  {
    

    // MARK: - Constants
    
    struct Storyboard {
        static let templeNameTableCellIdentifier = "TempleNameTableCell"
        static let templeImageIdentifier = "templeImageIdentifier"
        static let cellHeight = CGFloat(100)
        static let tableViewWidth = CGFloat(240)
        static let studyButtonTitle = "Study"
        static let matchButtonTitle = "Match"
    }
    
    
    // MARK: - Properties
    
    static var isMatching = true
    var shuffledTemples: [Temple]?
    var selectedImage: Temple?
    var selectedName: String?
    var selectedImageIndex: IndexPath?
    var selectedNameIndex: IndexPath?
    var matchCount = 0
    var missCount = 0

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonOutlet: UIBarButtonItem!
    @IBOutlet weak var matchesOutlet: UIBarButtonItem!
    @IBOutlet weak var matchCountOutlet: UIBarButtonItem!
    @IBOutlet weak var missesOutlet: UIBarButtonItem!
    @IBOutlet weak var resetOutlet: UIBarButtonItem!
    @IBOutlet weak var missesCountOutlet: UIBarButtonItem!
    @IBOutlet weak var tableViewWidth: NSLayoutConstraint!
    
    // MARK: - Actions
    
    @IBAction func resetButton(_ sender: Any) {
        resetData()
        collectionView.reloadData()
        tableView.reloadData()
    }
    @IBAction func viewToggleButton(_ sender: Any) {
        TempleViewController.isMatching = !TempleViewController.isMatching
        setButtonTitle()
        toggleSize()
        toggleToolbarItems()
    }
    
    private func toggleSize() {
        tableView.layoutIfNeeded()
        
        if tableViewWidth.constant > 0 {
            tableViewWidth.constant = 0
        }
        else {
            tableViewWidth.constant = Storyboard.tableViewWidth
        }
        resetData()
        self.collectionView.reloadData()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        

    }
    
    private func toggleToolbarItems() {
        if TempleViewController.isMatching {
            matchesOutlet.tintColor = nil
            matchCountOutlet.tintColor = nil
            missesOutlet.tintColor = nil
            missesCountOutlet.tintColor = nil
            resetOutlet.tintColor = nil
        }
        else {
            matchesOutlet.tintColor = UIColor.clear
            matchCountOutlet.tintColor = UIColor.clear
            missesOutlet.tintColor = UIColor.clear
            missesCountOutlet.tintColor = UIColor.clear
            resetOutlet.tintColor = UIColor.clear
        }
        matchesOutlet.isEnabled = !matchesOutlet.isEnabled
        matchCountOutlet.isEnabled = !matchCountOutlet.isEnabled
        missesOutlet.isEnabled = !missesOutlet.isEnabled
        missesCountOutlet.isEnabled = !missesCountOutlet.isEnabled
        resetOutlet.isEnabled = !resetOutlet.isEnabled
    }
    
    private func resetData() {
        shuffledTemples = TempleViewController.isMatching ? TempleData.sharedInstance.shuffle() : TempleData.sharedInstance.temples
        matchCount = 0
        missCount = 0
        updateCounts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
        resetData()
    }


    
    private func setButtonTitle() {
        if TempleViewController.isMatching {
            buttonOutlet.title = Storyboard.studyButtonTitle
        }
        else {
            buttonOutlet.title = Storyboard.matchButtonTitle
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let templeToDisplay = self.shuffledTemples![indexPath.row]
        let image = UIImage(named: templeToDisplay.templeImageURL)
        let width = (image?.size.width)! * Storyboard.cellHeight / ((image?.size.height)!)
        return CGSize(width: width, height: Storyboard.cellHeight)
    }
    
    
    private func matchCheck() {
        if isMatch() {
            matchCount += 1
            self.shuffledTemples?.remove(at: (selectedImageIndex?.row)!)
            self.tableView.deleteRows(at: [selectedNameIndex!], with: UITableViewRowAnimation.fade)
            self.collectionView.deleteItems(at: [selectedImageIndex!])
            self.view.makeToast("Correct")
        }
        else {
            missCount += 1
            self.view.makeToast("Incorrect")
        }
        updateCounts()
        selectedName = nil
        selectedImage = nil
        self.tableView.deselectRow(at: selectedNameIndex!, animated: false)
        self.collectionView.deselectItem(at: selectedImageIndex!, animated: false)
        
    }
    
    private func isMatch() -> Bool {
        return selectedName == selectedImage?.templeName
    }
    
    private func updateCounts() {
        missesCountOutlet.title = "\(missCount)"
        matchCountOutlet.title = "\(matchCount)"
    }
}

extension TempleViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shuffledTemples!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.templeImageIdentifier, for: indexPath)
        
        if let templeCell = cell as? TempleCollectionViewCell {
            
            let templeToDisplay = self.shuffledTemples![indexPath.row]
            
            templeCell.templeView.temple = templeToDisplay
            templeCell.templeView.setNeedsDisplay()
        }
        return cell
    }
        
}

extension TempleViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (selectedImageIndex != nil) {
            let previousCell = collectionView.cellForItem(at: selectedImageIndex!) as? TempleCollectionViewCell
            previousCell?.templeView.layer.borderColor = UIColor.white.cgColor
        }
        let cell = collectionView.cellForItem(at: indexPath) as! TempleCollectionViewCell
        cell.templeView.layer.borderColor = UIColor.gray.cgColor
        
        selectedImage = self.shuffledTemples?[indexPath.row]
        
        selectedImageIndex = indexPath
        if selectedName != nil {
            matchCheck()
        }
    }
}

extension TempleViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shuffledTemples!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.templeNameTableCellIdentifier, for: indexPath) as! TempleTableViewCell
        
        cell.templeName.text = TempleData.sharedInstance.temples[indexPath.row].templeName
        
        return cell
    }
}

extension TempleViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = TempleData.sharedInstance.temples[indexPath.row].templeName
        selectedNameIndex = indexPath
        if selectedImage != nil {
            matchCheck()
        }
    }
}
