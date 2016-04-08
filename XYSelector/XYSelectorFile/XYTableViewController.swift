//
//  XYTableViewController.swift
//  XYSelector
//
//  Created by dengyuchao on 16/4/7.
//  Copyright © 2016年 dengyuchao. All rights reserved.
//

import UIKit

private let tableViewCellID = "XYTableViewCellID"
private let tableViewHeaderViewNibName = "XYTableViewHeaderView"
private let tableViewHeaderViewID = "XYTableViewHeaderViewID"

protocol XYTableViewControllerDelegate: NSObjectProtocol {
    func saveActionWithData(newData: [SelectorDataModel])
}

class XYTableViewController: UITableViewController {
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var selectorDataSource: [SelectorDataModel] = []
    var cellDataSource: [[XYCellModel]] = []
    var selectedIndex: [NSIndexPath] = []
    
    weak var delegate: XYTableViewControllerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSelectedData()
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createSelectedData() {
        if selectorDataSource.count == 0 { return }
        for section in 0...selectorDataSource.count - 1 {
            let selectedArray = selectorDataSource[section].isSelectedArray
            if selectedArray.count == 0 { break }
            for row in 0...selectedArray.count - 1 {
                if selectedArray[row] {
                    selectedIndex.append(NSIndexPath(forRow: row, inSection: section))
                }
            }
        }
        checkoutSaveEnabled()
    }
    
    private func updateData() -> [SelectorDataModel] {
        for i in 0...selectorDataSource.count - 1 {
            let textArray = selectorDataSource[i].textArray
            selectorDataSource[i].isSelectedArray.removeAll()
            if textArray.count == 0 { break }
            for j in 0...textArray.count - 1 {
                selectorDataSource[i].isSelectedArray.append(false)
                let idx = NSIndexPath(forRow: j, inSection: i)
                if selectedIndex.contains(idx) {
                    selectorDataSource[i].isSelectedArray[j] = true
                }
            }
        }
        return selectorDataSource
    }
    
    private func setupTableView() {
        tableView.registerNib(UINib(nibName: tableViewHeaderViewNibName, bundle: nil), forHeaderFooterViewReuseIdentifier: tableViewHeaderViewID)
        tableView.rowHeight = 88.0
    }
    
    private func checkoutSaveEnabled() {
        saveButton.enabled = !selectedIndex.isEmpty
    }
    
    @IBAction func saveAction(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
        guard let delegate = delegate else { return }
        delegate.saveActionWithData(updateData())
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return selectorDataSource.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectorDataSource[section].textArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableViewCellID, forIndexPath: indexPath) as! XYTableViewCell
        let data = selectorDataSource[indexPath.section]
        cell.model = XYCellModel(describe: data.textArray[indexPath.row], imageUrl: data.imageUrls[indexPath.row])
        cell.isSelected = selectedIndex.contains(indexPath)
        return cell
    }
    
    
    //  MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(tableViewHeaderViewID) as! XYTableViewHeaderView
        headerView.titleLabel.text = selectorDataSource[section].title
        headerView.typeLabel.text = selectorDataSource[section].isMultipleSelection ? "多选" : "单选"
        return headerView
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! XYTableViewCell
        if selectedIndex.contains(indexPath) {
            cell.deselectedAction()
            selectedIndex.removeAtIndex(selectedIndex.indexOf(indexPath)!)
        } else {
            if !selectorDataSource[indexPath.section].isMultipleSelection {
                for idx in selectedIndex {
                    if idx.section == indexPath.section {
                        selectedIndex.removeAtIndex(selectedIndex.indexOf(idx)!)
                        if let visibleIdx = tableView.indexPathsForVisibleRows {
                            if visibleIdx.contains(idx) {
                                let visibleSelectedCell = tableView.cellForRowAtIndexPath(idx) as! XYTableViewCell
                                visibleSelectedCell.selectedImageView.hidden = true
                            }
                        }
                    }
                }
            }
            cell.selectedAction()
            selectedIndex.append(indexPath)
        }
        checkoutSaveEnabled()
    }
}
