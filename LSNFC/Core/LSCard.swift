////
////  LSCard.swift
////  LSNFC
////
////  Created by lhs7248 on 2020/5/29.
////  Copyright © 2020 lhs7248. All rights reserved.
////
//
import Foundation
//
//import Foundation
//import CoreNFC
//
//

public protocol LSNFCReaderDelegate {
    var reader: LSNFCReader? { get }
    
    func readerDidBecomeActive(_ reader: LSNFCReader) -> Void
    func ISO7816Reader(_ reader: LSNFCReader, withError error: Error) -> Void
    func ISO7816Reader(_ reader: LSNFCReader, didRead cardInfo: LSCardInfo) -> Void
}

//enum PaymentType: UInt, CaseIterable {
//    case normal = 0x00
//    case creditCard = 0x0c
//    case pasmo = 0x0d
//    case nimoca = 0x13
//    case mobileApp = 0x3f
//}
//
public struct LSCardInfo {
    var cardPublistInfo:LSPublishCarInfo?
    var balance: String?
    var entryExitHistory: [LSCardCustomRecord] = [LSCardCustomRecord]()
}


/// 卡的信息目前读取的只有发卡日期和过期日期是正确的，
public struct LSPublishCarInfo {
    
    let carNum:String
    let cardPulishDate: String
    let cardExpireDate:String
    
//    data[0:7] 8475310000000000:发卡方标识
//    data[8] 00 :应用标识（表示保留）
//    data[9] 00 ：发卡方应用版本
//    data[10:19] 31003100000020915087：卡片序列号(与卡片上的编号一致)
//    data[20:23] 20151010 : 起始日期
//    data[24:27] 20651010 : 有效日期
//    data[28:29] 0000 ： 发卡方自定义的FCI数据

    public init( _ data: Data) {
        
        let dataBuff = Array(data)
        print(data.map{String(format: "%02X", $0) }.joined())

        let cardM = Data(dataBuff[0...7]).map{String(format: "%02X", $0) }.joined()
        


        let carNum = Data(dataBuff[10...19]).map{String(format: "%02X", $0) }.joined()
        self.carNum = carNum



        let IDCardStartBuffer = dataBuff[20...23]
        let IDCardStartDate:String = IDCardStartBuffer.map{String(format: "%02X", $0) }.joined()
        self.cardPulishDate = IDCardStartDate
        
        let IDCardEndDateBuffer = dataBuff[24...27]
        let IDCardEndDate:String = IDCardEndDateBuffer.map{String(format: "%02X", $0) }.joined()
        self.cardExpireDate = IDCardEndDate

        print("发卡机构码:\(cardM) 卡号:\(carNum) 起始日期:\(IDCardStartDate)结束日期:\(IDCardEndDate)")
    }
}


/// 公交卡的消费记录，目前只支持读取最近的10条记录
public struct LSCardCustomRecord {
    let customDate:String
    let customAmout: String
    let indexStr:String
    let isOver:String

    public init( _ data: Data) {
        let dataBuff = Array(data)
        let indexStr = Data(dataBuff[0...1]).map{String(format: "%02X", $0) }.joined()
         self.indexStr = indexStr

        let isOver = Data(dataBuff[2...4]).map{String(format: "%02X", $0) }.joined()
        self.isOver = isOver
        
        let tradeValue = Data(dataBuff[5...8])
        let customAmout = tradeValue.toIntReversed(0, 3)/100
        
        self.customAmout = String(customAmout)

        let customDateBuffer = dataBuff[16...22]

        let customDate:String = customDateBuffer.map{String(format: "%02X", $0) }.joined()
       
        self.customDate = customDate
    }
}
