//
//  LSISO7816Reader.swift
//  LSNFC
//
//  Created by lhs7248 on 2020/5/21.
//  Copyright © 2020 lhs7248. All rights reserved.
//

import Foundation
import CoreNFC

public enum LSISO7816TagError: Error {
    case countExceed
    case typeMismatch
    case userCancel
    case becomeInvalidate
    case cannotConnect
}


@available(iOS 13.0, *)
internal typealias LSNFCReaderTag = NFCISO7816Tag


public class LSNFCReader: NSObject,NFCTagReaderSessionDelegate {
    
    internal var session: NFCTagReaderSession?
    internal var delegate: LSNFCReaderDelegate? = nil
    internal var carInfo :LSCardInfo?
    
    private override init() {
           self.delegate = nil
       }
       
       public init(delegate: LSNFCReaderDelegate) {
           self.delegate = delegate
       }
    
    /// 开启NFC 的读卡模式
    public func startReaderSession() {
        self.carInfo = LSCardInfo()
        
        self.session = NFCTagReaderSession(pollingOption:[.iso14443], delegate: self)
        self.session?.begin()
        self.session?.alertMessage = "Hold your iPhone near the item to learn more about it"
    }

    public func isReadingAvailable() -> Bool {
        
        return NFCTagReaderSession.readingAvailable
    }
        
    public func finish(errorMessage: String?) {
            if errorMessage != nil {
                self.session?.invalidate()
            } else {
                self.session?.invalidate(errorMessage: errorMessage!)
            }
        }
    
    public func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        
           print("active")
        
    }
       
    public func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
    
        if let readerError = error as? NFCReaderError {
            if (readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead) && (readerError.code != .readerSessionInvalidationErrorUserCanceled) {
                self.delegate?.ISO7816Reader(self, withError: LSISO7816TagError.becomeInvalidate)
            }
        }
        self.session = nil
       
    }
   

    public func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        if tags.count > 1 {
            self.delegate?.ISO7816Reader(self, withError: LSISO7816TagError.countExceed)
            return
        }
        let tag = tags.first!
        
        session.connect(to: tag) { (error) in
            
            guard tag.isAvailable else{
                       print("tag.UnAvailable")
                       return;
                   }
            print("this is start connect\(String(describing: error))")
            guard error == nil else {
                session.invalidate(errorMessage: "Failed to connect")
                self.delegate?.ISO7816Reader(self, withError: LSISO7816TagError.cannotConnect)
                return
            }

            guard case .iso7816(let ios7816Tag) = tag else {
                self.delegate?.ISO7816Reader(self, withError: LSISO7816TagError.typeMismatch)
                return
            }
            print(ios7816Tag.type)
            print(ios7816Tag.isAvailable)
            print(ios7816Tag.initialSelectedAID)
            
            self.readBinary(tag: ios7816Tag, data: Data()) { (res, sw1, sw2, error) in
                
                guard error == nil && (sw1 == 0x90 && sw2 == 0) else {
                    let msg = self.decodeError(sw1: sw1, sw2: sw2)
                    session.invalidate(errorMessage: msg)
                    return
                }
                let publishCardInfo =  LSPublishCarInfo(res)
                self.carInfo?.cardPublistInfo = publishCardInfo
                
            }
                
        
            self.selectBalance(tag: ios7816Tag, data: Data()) { (respondeData, sw1, sw2, error) in

                guard error == nil && (sw1 == 0x90 && sw2 == 0) else {
                    let msg = self.decodeError(sw1: sw1, sw2: sw2)
                    session.invalidate(errorMessage: msg)
                    return
                }

                self.carInfo?.balance = String((respondeData.toIntReversed(0, 3)/100))
                
                print("读取卡的金额：\(respondeData.toIntReversed(0, 3)/100)")

            }
        }
    }


        let list = [Int](1...10)

        for  i in list {

            let apdu = NFCISO7816APDU(instructionClass: 0x00, instructionCode: 0xB2, p1Parameter: UInt8(i), p2Parameter: 0xC5, data: Data(), expectedResponseLength: 1000)
            ios7816Tag.sendCommand(apdu: apdu) { (res, sw1, sw2, error) in

                let status = String(format:"%02X%02X", sw1, sw2)
                print(status)

                guard error == nil && (sw1 == 0x90 && sw2 == 0) else {
                    let msg = self.decodeError(sw1: sw1, sw2: sw2)
                    session.invalidate(errorMessage: msg)
                    return
                }

                let record = LSCardCustomRecord(res)
                self.carInfo?.entryExitHistory.append(record)
                if self.carInfo?.entryExitHistory.count == 10 {
                    self.delegate?.ISO7816Reader(self, didRead: self.carInfo!)
                }
            }
            
            }
            
            }


        }
            

}
    


            

