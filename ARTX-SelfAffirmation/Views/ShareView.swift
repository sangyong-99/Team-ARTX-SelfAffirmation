//
//  ShareView.swift
//  ARTX-SelfAffirmation
//
//  Created by Harry on 11/8/23.
//

import LinkPresentation

class MyActivityItemSource: NSObject, UIActivityItemSource {
    var title = "Awake"
    var text = ""
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return text
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
