//
//  GroupSearchAPI.swift
//  UI_app
//
//  Created by Вячеслав on 21.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class GroupsSearchAPI  {
    
    let baseUrl = "https://api.vk.com/method"
    
    let token = MySession.shared.token
    let userId = MySession.shared.userId
    let version = "5.81"
    
    func groupsSearch(query: String, completion: @escaping([GroupSearchDB])->()) {
        
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "q": query,
            "type": "group",
            "count": 5,
            "access_token": token,
            "v": version,
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
            debugPrint(response.data?.prettyJSON)
//            print("Поиск групп:\n", response.value)
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                let searchData = try JSON(data)["response"]["items"].rawData()
                let searchResults = try JSONDecoder().decode([GroupSearchDB].self, from: searchData)
                completion(searchResults)
            } catch {
                debugPrint(error)
            }
            
            
        })
    }
}
