////
////  UIButton+Extension.swift
////  ButtonWithIndicator
////
////  Created by Akihiko Okubo on 2018/08/20.
////  Copyright © 2018年 akihiko.com. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension UIButton {
//    
//    var originTitleColor: UIColor? {
//        get {
//            return self.originTitleColor
//        }
//        set(newValue) {
//            self.originTitleColor = newValue
//        }
//    }
//    
//    /// ボタンの中心にインジケータを表示する
//    func indicator(show: Bool) {
//        let tag = 9999
//        
//        if show {
//            isEnabled = false
//            
//            // 元に戻すためにオリジナルのタイトル色を保持します
//            //originTitleColor = titleColor(for: state) ?? UIColor.black
//            // タイトル色をClearにして非表示にします
//            titleLabel?.isHidden = true
//            
//            // MARK: indicatorの作成
//            let indicator = UIActivityIndicatorView()
//            // removeFromSuperviewを行うために必要です
//            indicator.tag = tag
//            indicator.color = titleColor(for: state)
//            self.addSubview(indicator)
//            
//            // ボタンの中心に来るようにConstraintを設定します
//            // システムが自動で設定するLayoutをOFFにします
//            indicator.translatesAutoresizingMaskIntoConstraints = false
//            // centerXとcenterYを設定して中央寄せ状態にします
//            self.addConstraints([
//                NSLayoutConstraint(
//                    item: self,
//                    attribute: .centerX,
//                    relatedBy: .equal,
//                    toItem: indicator,
//                    attribute: .centerX,
//                    multiplier: 1.0,
//                    constant: 0
//                ),
//                NSLayoutConstraint(
//                    item: self,
//                    attribute: .centerY,
//                    relatedBy: .equal,
//                    toItem: indicator,
//                    attribute: .centerY,
//                    multiplier: 1.0,
//                    constant: 0
//                ),
//                ])
//            indicator.startAnimating()
//        } else {
//            isEnabled = true
//            setTitleColor(originTitleColor, for: state)
//            // tagを指定してindicatorのインスタンスを取得します
//            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
//                indicator.stopAnimating()
//                indicator.removeFromSuperview()
//                titleLabel?.alpha = 1
//                setTitleColor(originTitleColor, for: state)
//            }
//        }
//    }
//
//    
//    
//}
