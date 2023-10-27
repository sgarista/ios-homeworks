import UIKit


struct Task: Codable {
    
    let userID, id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case userID = "userId"
        case id, title, completed
    }
}

