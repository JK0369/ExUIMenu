//
//  ViewController.swift
//  ExMenu
//
//  Created by 김종권 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {

    lazy var menuItems: [UIAction] = {
        return [
            UIAction(title: "다운로드", image: UIImage(systemName: "arrow.down.circle"), handler: { _ in }),
            UIAction(title: "공유", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in }),
            UIAction(title: "삭제", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { _ in }),
        ]
    }()

    lazy var menu: UIMenu = {
        return UIMenu(title: "", options: [], children: menuItems)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "네비게이션 바"

        if #available(iOS 13.0, *) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
                                                                     menu: menu)
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(showActionSheet))
        }

    }

    @objc func showActionSheet(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: "액션시트", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "다운", style: .default, handler: { _ in })
        let saveAction = UIAlertAction(title: "공유", style: .default, handler: { _ in })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in })

        [deleteAction, saveAction, cancelAction].forEach { alert.addAction($0) }

        present(alert, animated: true, completion: nil)
    }
}
