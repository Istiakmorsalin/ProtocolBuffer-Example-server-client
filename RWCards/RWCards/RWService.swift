

import Foundation
import Alamofire

class RWService {
  static let shared = RWService() // 1
  let url = "http://192.168.1.23:8081"
  
  private init() { }
  
  func getCurrentUser(_ completion: @escaping (Contact?) -> ()) { // 2
    let path = "/currentUser"
    Alamofire.request("\(url)\(path)").responseData { response in
      if let data = response.result.value { // 3
        let contact = try? Contact(protobuf: data) // 4
        completion(contact)
      }
      completion(nil)
    }
  }
  
  func getSpeakers(_ completion: @escaping (Speakers?) -> ()) { // 1
    let path = "/speakers"
    Alamofire.request("\(url)\(path)").responseData { response in
      if let data = response.result.value { // 2
        let speakers = try? Speakers(protobuf: data) // 3
        completion(speakers)
      }
    }
    completion(nil)
  }
}
