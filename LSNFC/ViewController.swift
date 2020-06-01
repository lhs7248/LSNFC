//
//  ViewController.swift
//  LSNFC
//
//  Created by lhs7248 on 2020/5/21.
//  Copyright © 2020 lhs7248. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LSNFCReaderDelegate {
    
    
    
    var reader:LSNFCReader?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ISO7816Tag"
    }


    @IBAction func startScanNFC(_ sender: Any) {
        self.reader = LSNFCReader(delegate: self)
           
        self.reader?.startReaderSession()
           
    }
       
    
    func readerDidBecomeActive(_ reader: LSNFCReader) {
        
    }
    
    func ISO7816Reader(_ reader: LSNFCReader, withError error: Error) {
        guard let error = error as? LSISO7816TagError else {
            return
        }
        
        switch error {
        case .cannotConnect:
            reader.session?.invalidate(errorMessage: "无法与ISO7816 tag连接")
        case .countExceed:
            reader.session?.invalidate(errorMessage: "同时检测出超过两张卡片，请移除后再试")
        case .typeMismatch:
            reader.session?.invalidate(errorMessage: "卡片非 IOS7816 类型")
        case .userCancel: break
        case .becomeInvalidate: break
        }
    }
    
    func ISO7816Reader(_ reader: LSNFCReader, didRead cardInfo: LSCardInfo) {
        reader.finish(errorMessage: "")
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LSTabelViewContoller") as! LSTabelViewContoller
            vc.cardInfo = cardInfo
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
   
    

   
    
}

