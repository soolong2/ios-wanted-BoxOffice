//
//  MovieApi.swift
//  BoxOffice
//
//  Created by so on 2022/10/17.
//

import Foundation

class MovieApi {
   class func getData(todays: String, completion: @escaping (movieCodable) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        guard let url = URL(string: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=\(todays)") else {
            print("URL is nil")
            return
        }
        let request = URLRequest(url: url)
        let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(movieCodable.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                    print(result)
                }
            } catch {
                print(error)
            }
        }
        
        dataTask.resume()
    }
}


