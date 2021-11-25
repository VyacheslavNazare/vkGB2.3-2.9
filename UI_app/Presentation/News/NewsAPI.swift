//
//  NewsAPI.swift
//  UI_app
//
//  Created by Вячеслав on 06.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


final class NewsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = MySession.shared.token
    let userId = MySession.shared.userId
    let version = "5.81"
    
    func getNews(completion: @escaping([NewsDB])->()) {
        let method = "/newsfeed.get"
        
        let parameters: Parameters = [
            "owner_id": userId,
            "filters": "post",
            "return_banned": 0,
            "count": 100,
            "access_token": token,
            "v": version
        ]

        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            debugPrint(response.data?.prettyJSON)
            guard let data = response.data else { return }

            
            do {
                let items = try JSON(data)["response"]["groups"].rawData()
                let newsJSON = try? JSONDecoder().decode([NewsDB].self, from: items)
                completion(newsJSON ?? [])
            }
            catch {
                debugPrint(error)
            }
        }
    }
    
}
