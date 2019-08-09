//
//  Extensions.swift
//  8-9-19Table
//
//  Created by Nathaniel Mcdowell on 8/9/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

extension UIView {
    
    func DoConstraints(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,
                       trailing:NSLayoutXAxisAnchor?,topPad:CGFloat,leadingPad:CGFloat,bottomPad:CGFloat,
                       trailingPad:CGFloat,width:CGFloat,height:CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: leadingPad).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: bottomPad).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: trailingPad).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
