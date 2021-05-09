import Foundation

/**
 After the user has authorized your app and a code has been provided, this type
 is used to request a refresh and access token for the [Authorization Code
 Flow][1].
 
 When creating a type that conforms to `AuthorizationCodeFlowBackend` and which
 communicates with a custom backend server, use this type in the body of the
 network request made in the
 `requestAccessAndRefreshTokens(code:redirectURIWithQuery:)` method.
 
 In contrast with `TokensRequest`, this type does not contain the `redirectURI`
 `clientId`, or `clientSecret` because these values should be securely stored on
 your backend server.

 - Important: Although this type conforms to `Codable`, it should actually be
       encoded in x-www-form-urlencoded format when sent in the body of a
       network request using `self.formURLEncoded`.

 [1]: https://developer.spotify.com/documentation/general/guides/authorization-guide/#authorization-code-flow
 */
public struct ProxyTokensRequest: Hashable {
	
    /// The grant type. Always set to "authorization_code".
    public let grantType = "authorization_code"

    /// The authorization code. Retrieved from the query string of the redirect
    /// URI.
    public let code: String
    
    /**
     
     - Important: Although this type conforms to `Codable`, it should actually
           be encoded in x-www-form-urlencoded format when sent in the body of a
           network request using `self.formURLEncoded`.
     
     - Parameters:
       - code: The authorization code. Retrieved from the query string of the
             redirect URI.
     */
    public init(code: String) {
        self.code = code
    }
    
    /**
     Encodes this instance to data using the x-www-form-urlencoded format.
     
     This method should be used to encode this type to data (as opposed to using
     a `JSONEncoder`) before being sent in a network request.
     */
    public func formURLEncoded() -> Data {
        guard let data = [
            CodingKeys.grantType.rawValue: self.grantType,
            CodingKeys.code.rawValue: self.code
        ].formURLEncoded() else {
            fatalError("could not form-url-encode `ProxyTokensRequest`")
        }
        return data
    }

}

extension ProxyTokensRequest: Codable {
    
    /// :nodoc:
    public enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case code
    }

}
