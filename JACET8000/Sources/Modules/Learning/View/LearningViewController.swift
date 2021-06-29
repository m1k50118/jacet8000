//
//  LearningLearningViewController.swift
//  JACET8000
//
//  Created by t2020060 on 29/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController, LearningViewInput {

    var output: LearningViewOutput!
    var learningCollectionView: LearningCollectionView!

    let level: String

    init(level: String) {
        self.level = level
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = .init(top: 12, left: 12, bottom: 12, right: 12)
        learningCollectionView = LearningCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        learningCollectionView.delegate = self
        learningCollectionView.dataSource = self
        view.addSubview(learningCollectionView)
        output.viewIsReady()
    }

    // MARK: LearningViewInput
    func setupInitialState() {
    }
}

extension LearningViewController: UICollectionViewDelegate {}

extension LearningViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1000
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LearningCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setUpContents(text: level)
        return cell
    }
}

extension LearningViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemPerRow: CGFloat = 1
        let spacingBetweenCells: CGFloat = 16

        let totalSpacing = (2 * 12) + ((numberOfItemPerRow - 1) * spacingBetweenCells)

        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemPerRow

        return .init(width: width, height: 32)
    }
}

class LearningCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
        register(LearningCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LearningCollectionViewCell: UICollectionViewCell {
    let wordText: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: 0, height: 0)
        layer.masksToBounds = false

        contentView.addSubview(wordText)
        wordText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }

    func setUpContents(text: String) {
        wordText.text = text
    }
}
