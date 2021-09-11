//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by 佐藤真 on 2021/09/11.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(collectionView)
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else {
            return .init()
        }
        cell.setUpContents(text: "レベル\(indexPath[0] + 1)")
        return cell
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        8
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
//        guard let navBarHeight = navigationController?.navigationBar.frame.size.height else {
//            return .init()
//        }
//        return .init(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.size.height - navBarHeight) / 9)
//    }
}
