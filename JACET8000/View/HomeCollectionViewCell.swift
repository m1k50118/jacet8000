//
//  HomeCollectionViewCell.swift
//  HomeCollectionViewCell
//
//  Created by 佐藤真 on 2021/09/11.
//

import SnapKit
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    private let levelLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(levelLabel)
        levelLabel.snp.makeConstraints { make in
            make.top.leading.width.height.equalToSuperview()
        }
    }

    func setUpContents(text: String) {
        levelLabel.text = text
    }
}
