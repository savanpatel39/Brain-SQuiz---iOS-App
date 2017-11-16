//
//  Animations.swift
//  Brain sQUIZ
//
//  Created by Savan Patel on 2015-10-16.
//  Copyright (c) 2015 Savan Patel. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    public func wrongAnswer()
    {
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 20, options: [], animations: ({
            self.bounds = CGRect(x: self.bounds.origin.x - 30, y: self.bounds.origin.y, width: self.bounds.width + 20, height: self.bounds.height);
        }), completion: nil)
    }
}