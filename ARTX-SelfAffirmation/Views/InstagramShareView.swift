//
//  InstagramShareView.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/20/23.
//


import UIKit
import SwiftUI

class InstagramShareHandler: NSObject, UIDocumentInteractionControllerDelegate {
    static let shared = InstagramShareHandler()
    private var documentInteractionController = UIDocumentInteractionController()
    
    func shareToInstagram(image: UIImage) {
        let instagramURL = URL(string: "instagram://app")
        if UIApplication.shared.canOpenURL(instagramURL!) {
            let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
            
            do {
                try image.jpegData(compressionQuality: 0.75)?.write(to: URL(fileURLWithPath: jpgPath), options: .atomic)
            } catch {
                print(error)
                return
            }

            let rect = CGRect.zero
            let fileURL = NSURL.fileURL(withPath: jpgPath)
            documentInteractionController.url = fileURL
            documentInteractionController.delegate = self
            documentInteractionController.uti = "com.instagram.exclusivegram"
            
            if let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController {
                documentInteractionController.presentOpenInMenu(from: rect, in: rootViewController.view, animated: true)
            }
        } else {
            print("Instagram app is not installed")
        }
    }
}
