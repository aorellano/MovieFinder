//
//  SegmentedControl+Extension.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/20/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
extension UISegmentedControl {
    func removeBorders(andBackground:Bool=false) {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    
        _ = self.subviews.compactMap {
            if ($0.frame.width>0) {
                $0.layer.cornerRadius = 8
                $0.layer.borderColor = UIColor.clear.cgColor
                $0.clipsToBounds = true
                $0.layer.borderWidth = andBackground ? 1.0 : 0.0
                $0.layer.borderColor = andBackground ? tintColor?.cgColor : UIColor.clear.cgColor
                    andBackground ? $0.layer.backgroundColor = UIColor.clear.cgColor : nil
            }
        }
    }
    
        // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
            let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context!.setFillColor(color.cgColor);
            context!.fill(rect);
            let image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return image!
        }
}

