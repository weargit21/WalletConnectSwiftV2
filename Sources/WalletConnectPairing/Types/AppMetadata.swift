import Foundation

/**
 A structure that identifies a peer connected through a WalletConnect session.
 
 You can provide human-readable information about your app so that it can be shared with a connected peer, for example,
 during a session proposal event.
 
 This information should make the identity of your app clear to the end-user and easily verifiable. Therefore, it is a
 suitable place to briefly communicate your brand.
 */
public struct AppMetadata: Codable, Equatable {

    public struct Redirect: Codable, Equatable {
        enum Errors: Error {
            case invalidLinkModeUniversalLink
        }
        /// Native deeplink URL string.
        public let native: String?

        /// Universal link URL string.
        public let universal: String?

        public let linkMode: Bool

        /**
         Creates a new Redirect object with the specified information.

         - parameters:
         - native: Native deeplink URL string.
         - universal: Universal link URL string.
         */
        public init(native: String, universal: String?, linkMode: Bool = false) {
            self.native = native
            self.universal = universal
            self.linkMode = linkMode
        }
    }

    /// The name of the app.
    public let name: String

    /// A brief textual description of the app that can be displayed to peers.
    public let description: String

    /// The URL string that identifies the official domain of the app.
    public let url: String

    /// An array of URL strings pointing to the icon assets on the web.
    public let icons: [String]

    /// Redirect links which could be manually used on wallet side.
    public let redirect: Redirect?

    /**
     Creates a new metadata object with the specified information.
     
     - parameters:
        - name: The name of the app.
        - description: A brief textual description of the app that can be displayed to peers.
        - url: The URL string that identifies the official domain of the app.
        - icons: An array of URL strings pointing to the icon assets on the web.
        - redirect: Redirect links which could be manually used on wallet side.
     */
    public init(
        name: String,
        description: String,
        url: String,
        icons: [String],
        redirect: Redirect
    ) {
        self.name = name
        self.description = description
        self.url = url
        self.icons = icons
        self.redirect = redirect
    }
}

#if DEBUG
public extension AppMetadata {
    static func stub() -> AppMetadata {
        AppMetadata(
            name: "Wallet Connect",
            description: "A protocol to connect blockchain wallets to dapps.",
            url: "https://walletconnect.com/",
            icons: [],
            redirect: AppMetadata.Redirect(native: "", universal: nil)
        )
    }
}
#endif
