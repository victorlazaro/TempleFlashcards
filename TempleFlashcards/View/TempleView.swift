//
//  TempleView.swift
//  TempleFlashcards
//
//  Created by Victor Lazaro on 10/11/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class TempleView: UIView {

    
    // MARK: - Constants
    
    struct Storyboard {
        static let borderWidth = CGFloat(5)
        static let borderColor = UIColor.white.cgColor
    }
    
    // MARK: - Properties
    @IBInspectable var templeName: String = ""
    @IBInspectable var dedicationDate: String = ""
    var temple: Temple?


    override func draw(_ rect: CGRect) {
        
        drawBorder()
        drawTemple()
        if !TempleViewController.isMatching {
            drawStudyTemple()
        }
        
        
    }
    
    private func drawBorder() {
        layer.borderWidth = Storyboard.borderWidth
        layer.borderColor = Storyboard.borderColor
    }
    
    private func drawStudyTemple() {
        // draw rectangle with alpha 0.5
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.darkGray.cgColor)
        context?.setStrokeColor(UIColor.darkGray.cgColor)
        context?.setAlpha(0.7)
        let rectangle = CGRect(x: 0, y: bounds.height * 0.7, width: bounds.width, height: bounds.height * 0.3)
        context?.addRect(rectangle)
        context?.drawPath(using: .fillStroke)
        // write name of temple
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let titleRectangle = CGRect(x: 0, y: bounds.height * 0.7, width: bounds.width, height: bounds.height * 0.15)
        let attrs = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 10)!, NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.foregroundColor: UIColor.white]
        
        temple?.templeName.draw(with: titleRectangle, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        let subtitleRectangle = CGRect(x: 0, y: bounds.height * 0.85, width: bounds.width, height: bounds.height * 0.15)
        
        temple?.dedicatedDate.draw(with: subtitleRectangle, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
    }
    
    
    func drawTemple() {

        guard let templeImage = UIImage(named: (temple?.templeImageURL)!) else {
            return
        }
        
        let templeBounds = CGRect(x: Storyboard.borderWidth, y: Storyboard.borderWidth, width: bounds.width - 2 * Storyboard.borderWidth, height: bounds.height - 2 * Storyboard.borderWidth)
        
        templeImage.draw(in: templeBounds)
    }
}
