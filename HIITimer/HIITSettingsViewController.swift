//
//  HIITSettingsViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 6/30/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit


class HIITSettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    @IBOutlet weak var collectionViewThree: UICollectionView!
    
    @IBOutlet weak var letsHIITButton: UIButton!
    
    var setsCell = 0
    var activeCell = 0
    var restCell = 0
    
    
    var arrayOne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    var arrayTwo = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAppearance()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    // for UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewOne {
            return arrayOne.count
        } else if collectionView == collectionViewTwo || collectionView == collectionViewThree {
            return arrayTwo.count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as!
        CollectionViewCell
        
        cell.layer.cornerRadius = 40.0
        cell.layer.borderWidth = 1.2
        cell.layer.opacity = 0.9
        cell.layer.borderColor = UIColor(red: 23/255.0, green: 42/255.0, blue: 56/255.0, alpha: 0.75).CGColor
        
        
        if collectionView == collectionViewOne {
            cell.cellLabel.text = String(arrayOne[indexPath.row])
        } else if collectionView == collectionViewTwo || collectionView == collectionViewThree {
            cell.cellLabel.text = String(arrayTwo[indexPath.row])
        }
        return cell
    }
    
    
    // For UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CollectionViewCell
        
        if collectionView == collectionViewOne {
            setsCell = self.arrayOne[indexPath.row]
            cell?.layer.backgroundColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
            
        }
        
        if collectionView == collectionViewTwo {
            activeCell = self.arrayTwo[indexPath.row]
            cell?.layer.backgroundColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        }
        
        if collectionView == collectionViewThree {
            restCell = self.arrayTwo[indexPath.row]
            cell?.layer.backgroundColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        }
        
        UserRoutine.shared.setUserRoutine(setsCell, activeTime: activeCell, restTime: restCell)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CollectionViewCell
        
        if collectionView == collectionViewOne {
            cell?.layer.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0)
        }
        
        if collectionView == collectionViewTwo {
            cell?.layer.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0)
        }
        
        if collectionView == collectionViewThree {
            cell?.layer.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0).CGColor
            cell?.cellLabel.textColor = UIColor(red: 34/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1.0)
        }
       
    }
    
    private func setupAppearance() {
        
        letsHIITButton.layer.opacity = 0.9
        letsHIITButton.center = self.view.center
        letsHIITButton.titleLabel?.textAlignment = .Center
    }
    
    func wiggle(collectionView: UICollectionView) {
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .BeginFromCurrentState, animations: {
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.25, animations: { 
                collectionView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/45.0))
            })
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: {
                collectionView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/315.0))
            })

            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.75, animations: {
                collectionView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/45.0))
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 1.0, animations: {
                collectionView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/315.0))
            })

            }, completion: nil)
        
    }
    
    @IBAction func letsHIITButtonSelected(sender: UIButton) {
        
        if setsCell > 0 && activeCell > 0 && restCell > 0 {
            let stageVC = self.storyboard?.instantiateViewControllerWithIdentifier("StagingViewController") as? StagingViewController
            
            self.navigationController?.pushViewController(stageVC!, animated: true)
            
        } else {
            let alertController = UIAlertController(title: "☹️ gotta click em all!", message: "select all options to continue 👍", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            if setsCell == 0 {
                wiggle(collectionViewOne)
            }
            if activeCell == 0 {
                wiggle(collectionViewTwo)
            }
            if restCell == 0 {
                wiggle(collectionViewThree)
            }
        }
    }
}


