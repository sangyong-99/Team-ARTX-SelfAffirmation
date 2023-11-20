//
//  InstagramActivity.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/20/23.
//

import SwiftUI
import UIKit

class InstagramActivity: NSObject, UIDocumentInteractionControllerDelegate {
    private var documentInteractionController = UIDocumentInteractionController()
    private var currentImage: UIImage?

    static let shared = InstagramActivity()

    func shareToInstagram(image: UIImage, from viewController: UIViewController) {
        currentImage = image
        
        let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
        do {
            try image.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: jpgPath), options: .atomic)
        } catch {
            print("InstagramActivity: \(error)")
            return
        }

        let fileURL = NSURL.fileURL(withPath: jpgPath)
        
        documentInteractionController = UIDocumentInteractionController(url: fileURL)
        documentInteractionController.delegate = self
        documentInteractionController.uti = "com.instagram.exclusivegram"
        documentInteractionController.presentOpenInMenu(from: viewController.view.bounds, in: viewController.view, animated: true)
    }
}
