//
//  LSTabelViewContoller.swift
//  LSNFC
//
//  Created by lhs7248 on 2020/5/29.
//  Copyright © 2020 lhs7248. All rights reserved.
//

import Foundation
import UIKit
class LSTabelViewContoller: UITableViewController {
    
    var cardInfo:LSCardInfo? // 卡信息
      
    
    
    @IBOutlet weak var banlace: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.banlace.text = "金额：\(cardInfo?.balance ?? "0.0")"
        self.title = "公交卡信息"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cardInfo?.entryExitHistory.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? LSCardCell {
                   let history = cardInfo?.entryExitHistory[indexPath.row]
//                   cell.machineType.text = "機器類別：" + history!.machineType.description
//                   cell.paymentType.text = "付款類別：" + history!.paymentType
//                   cell.usageType.text = "使用類別：" + history!.usageType.description
//                   cell.entryExitType.text = "出入場類別：" + history!.entryExitType.description
                   
                   cell.date.text = "日期：\(history?.customDate ?? "0")"
                   cell.amount.text = "金额 ：\(history?.customAmout ?? "0")"
                   
                   return cell
               }

               return tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}


class LSCardCell: UITableViewCell {
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
}
