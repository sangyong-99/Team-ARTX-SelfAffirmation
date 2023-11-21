//
//  ShareView.swift
//  ARTX-SelfAffirmation
//
//  Created by Harry on 11/8/23.
//

import LinkPresentation

class MyActivityItemSource: NSObject, UIActivityItemSource {
    var title = "Awake"
    var text = "긍정 확언을 공유해보세요"
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return image
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if let activityType {
            if activityType.rawValue.contains("Instagram") {
                return image
            } else {
                return [text, image]
            }
        } else {
            return image
        }
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return title
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = title
        metadata.iconProvider = NSItemProvider(object: image)
        metadata.originalURL = URL(fileURLWithPath: text)
        return metadata
    }
    
}
