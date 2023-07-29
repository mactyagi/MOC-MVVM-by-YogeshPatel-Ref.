//
//  UIImageView+Extension.swift
//  MOC MVVM
//
//  Created by Manu on 29/07/23.
//

import UIKit
import Kingfisher
extension UIImageView{
    func setImage(with urlString: String){
        guard let url = URL(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
