//
//  IndicatorButton.swift
//  ButtonWithIndicator
//
//  Created by Akihiko Okubo on 2018/08/20.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

class IndicatorButton: UIButton {
    
    /// オリジナルのタイトルカラーを保持する変数
    var originTitleColor: UIColor?
    /// Indicatorに採番するtag
    let Indicatortag = 9999
    /// trueにするとIndicatorを表示する
    var isLoading = false {
        didSet {
            if isLoading {
                showIndicator()
            } else {
                hideIndicator()
            }
        }
    }
    
    private func showIndicator() {
        isEnabled = false
        originTitleColor = titleColor(for: state)
        
        // タイトル色をClearにして非表示にします
        setTitleColor(.clear, for: state)
        
        // インジケータを作成します
        let indicator = UIActivityIndicatorView()
        indicator.tag = Indicatortag
        indicator.color = originTitleColor
        self.addSubview(indicator)
        
        // Autolayoutを設定します
        applyLayout(indicator: indicator)
        indicator.startAnimating()
    }
    
    private func applyLayout(indicator: UIActivityIndicatorView) {
        // システムが自動で設定するLayoutをOFFにします
        indicator.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(
                item: self,
                attribute: .centerX, //X方向に中央寄せ
                relatedBy: .equal,
                toItem: indicator,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: self,
                attribute: .centerY, //Y方向に中央寄せ
                relatedBy: .equal,
                toItem: indicator,
                attribute: .centerY,
                multiplier: 1.0,
                constant: 0
            ),
            ])
    }
    
    private func hideIndicator() {
        isEnabled = true
        // tagを指定してindicatorのインスタンスを取得します
        if let indicator
            = self.viewWithTag(Indicatortag) as? UIActivityIndicatorView {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
            setTitleColor(originTitleColor, for: state)
        }
    }
    
}
