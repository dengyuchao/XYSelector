//
//  XYTableViewCell.swift
//  XYSelector
//
//  Created by dengyuchao on 16/4/7.
//  Copyright © 2016年 dengyuchao. All rights reserved.
//

import UIKit

struct XYCellModel {
    var describe: String
    var imageUrl: String?
}

private let placeholderImage = UIImage(named: "PlaceholderImage")
private let cellBoderWidth: CGFloat = 8.0

class XYTableViewCell: UITableViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var describeLabel: UILabel!
    @IBOutlet var selectedImageView: UIImageView!
    @IBOutlet var describelLabelLeadingConstraint: NSLayoutConstraint!
    
    var isSelected: Bool! {
        didSet {
            selectedImageView.hidden = !isSelected
        }
    }
    
    var model: XYCellModel? {
        didSet {
            guard let model = self.model else { return }
            describeLabel.text = model.describe
            if let imageUrl = model.imageUrl {
                photoImageView.hidden = false
                describelLabelLeadingConstraint.constant = photoImageView.bounds.width + cellBoderWidth
                photoImageView.sd_setImageWithURL(NSURL(string: imageUrl), placeholderImage: placeholderImage)
            } else {
                photoImageView.hidden = true
                describelLabelLeadingConstraint.constant = 0.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func selectedAction() {
        setSelectedImageAnimationWithHidden(false)
    }
    
    func deselectedAction() {
        setSelectedImageAnimationWithHidden(true)
    }
    
    private func setSelectedImageAnimationWithHidden(isHidden: Bool) {
        selectedImageView.hidden = isHidden
        let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        sprintAnimation.velocity = NSValue(CGPoint: CGPointMake(8.0, 8.0))
        sprintAnimation.springBounciness = 20.0
        selectedImageView.pop_addAnimation(sprintAnimation, forKey: "selectedAnimation")
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
            scaleAnimation.duration = 0.1
            scaleAnimation.toValue = NSValue(CGPoint: CGPointMake(1, 1))
            describeLabel.pop_addAnimation(scaleAnimation, forKey: "scalingUp")
        } else {
            let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            sprintAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
            sprintAnimation.velocity = NSValue(CGPoint: CGPointMake(2.0, 2.0))
            sprintAnimation.springBounciness = 20.0
            describeLabel.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
        }
    }
}
