//
//  AppSettingVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
import UIKit
class AppSettingVC: UITableViewController {
    let appSetting = AppSetting.shared
    static let cellIdentifier = "AppSettingCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: AppSettingVC.cellIdentifier)
    }
}

extension AppSettingVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppSettingVC.cellIdentifier, for: indexPath)
        let strategy = QuestionStrategyType.allCases[indexPath.row]
        cell.textLabel?.text = strategy.title
        cell.accessoryType = appSetting.currentStrategyType == strategy ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let strategy = QuestionStrategyType.allCases[indexPath.row]
        appSetting.currentStrategyType = strategy
        tableView.reloadData()
    }
}
