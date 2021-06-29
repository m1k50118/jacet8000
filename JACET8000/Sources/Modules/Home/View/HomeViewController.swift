//
//  HomeHomeViewController.swift
//  JACET8000
//
//  Created by t2020060 on 27/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    var output: HomeViewOutput!
    var homeCollectionView: HomeCollectionView!

    let spacing: CGFloat = 16.0

    let levels = [
        ["Level1", "Level2"],
        ["Level3", "Level4"],
        ["Level5", "Level6"],
        ["Level7", "Level8"],
    ]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing,
                                           left: spacing,
                                           bottom: spacing,
                                           right: spacing)
        homeCollectionView = HomeCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self

        view.addSubview(homeCollectionView)

        output.viewIsReady()
    }

    // MARK: HomeViewInput

    func setupInitialState() {}
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.presentLearningView(level: levels[indexPath.section][indexPath.item])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        2
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setUpContents(text: levels[indexPath.section][indexPath.item])

        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let numberOfItemPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 16

        let totalSpacing = (2 * spacing) + ((numberOfItemPerRow - 1) * spacingBetweenCells)

        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemPerRow

        return .init(width: width, height: width)
    }
}

class HomeCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
        register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeCollectionViewCell: UICollectionViewCell {
    let levelText: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: 0, height: 0)
        layer.masksToBounds = false

        contentView.addSubview(levelText)
        levelText.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setUpContents(text: String) {
        levelText.text = text
    }
}
