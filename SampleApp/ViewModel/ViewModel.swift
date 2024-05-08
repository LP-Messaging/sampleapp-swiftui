import Combine
import LPMessagingSDK

public class ViewModel: ObservableObject {
    var brandId: String?
    @Published var alertPresented = false
    @Published var errorString: String?
    @Published var conversationScreenPresented = false

    @Published var fileSharingEnabled = LPConfig.defaultConfiguration.fileSharingFromConsumer {
        didSet {
            LPConfig.defaultConfiguration.fileSharingFromConsumer = fileSharingEnabled
        }
    }

    @Published var externalInputIsVisible = true

    @Published var isViewOnlyMode = true {
        didSet {
            do {
                try LPMessaging.instance.setIsViewOnly(mode: isViewOnlyMode)
                externalInputIsVisible = isViewOnlyMode
            } catch let error {
                alertPresented = true
                errorString = (error as NSError).description
            }
        }
    }

    func dismissScreen() {
        if let brandId {
            let conversationQuery = LPMessaging.instance.getConversationBrandQuery(brandId)
            LPMessaging.instance.removeConversation(conversationQuery)
        }
        conversationScreenPresented = false
    }
}
