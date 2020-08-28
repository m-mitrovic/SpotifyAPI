import Foundation

/**
 A [cursor-based paging object][1].
 
 See [get current user's recently played tracks][2]
 and `recentlyPlayed(_:limit:)` for examples.
 
 [1]: https://developer.spotify.com/documentation/web-api/reference/player/get-recently-played/#cursor-based-paging-object
 [2]: https://developer.spotify.com/documentation/web-api/reference/player/get-recently-played/
 */
public struct CursorPagingObject<
    Object: Codable & Hashable
>: Codable, Hashable {
    
    /// A link to the Web API endpoint returning
    /// the full result of the request.
    public let href: String
    
    /// An array of the requested data in this `CursorPagingObject`.
    public let items: [Object]
     
    /// The maximum number of items in the response
    /// (as set in the query or by default).
    public let limit: Int
    
    /// The url to the next page of items, or `nil` if none.
    public let next: String?
    
    /// Used to find the next and previous items.
    public let cursors: SpotifyCursor
    
    /// The maximum number of items available to return.
    public let total: Int?
    
}
