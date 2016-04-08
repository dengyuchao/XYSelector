//
//  ViewController.swift
//  XYSelector
//
//  Created by dengyuchao on 16/4/7.
//  Copyright © 2016年 dengyuchao. All rights reserved.
//

import UIKit

private let imageSegueID = "showImageSector"
private let withoutImageSegueID = "showWithoutImageSector"

class ViewController: UIViewController {

    var isSelectedWithImageSegue: Bool = false
    var imageDataSource: [SelectorDataModel] = []
    var withoutImageDataSource: [SelectorDataModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createData() {
        imageDataSource = SampleDataSource().imageDataSource
        withoutImageDataSource = SampleDataSource().titleOnlyDataSource
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == imageSegueID {
            let sectorVC = segue.destinationViewController as! XYTableViewController
            sectorVC.selectorDataSource = imageDataSource
            isSelectedWithImageSegue = true
            sectorVC.delegate = self
        }
        if segue.identifier == withoutImageSegueID {
            let sectorVC = segue.destinationViewController as! XYTableViewController
            sectorVC.selectorDataSource = withoutImageDataSource
            isSelectedWithImageSegue = false
            sectorVC.delegate = self
        }
    }
}

extension ViewController: XYTableViewControllerDelegate {
    func saveActionWithData(newData: [SelectorDataModel]) {
        if isSelectedWithImageSegue {
            imageDataSource = newData
        } else {
            withoutImageDataSource = newData
        }
    }
}

