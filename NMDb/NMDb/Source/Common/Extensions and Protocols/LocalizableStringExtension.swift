//
//  LocalizableStringExtension.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Get localized string without comment
     
     - returns: localized string
     */
    func localize(isAccessibilty: Bool = false) -> String {
        return NSLocalizedString(self,
                                 tableName: isAccessibilty ? "LocalizableAccessibility" : "Localizable",
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }

}
