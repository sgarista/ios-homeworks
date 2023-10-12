import UIKit


    enum AppConfiguration: String, CaseIterable {
        case people = "https://swapi.dev/api/people/8"
        case starships = "https://swapi.dev/api/starships/3"
        case planets = "https://swapi.dev/api/planets/5"

        var url: URL? {
            URL(string: self.rawValue)
        }
}


struct NetworkService {

    static func request(for configuration: AppConfiguration) {

        guard let url = configuration.url else {
            print("Invalid URL")
            return
        }


        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                if let stringData = String(data: data, encoding: .utf8) {
                    print("Data: \(stringData)")
                }
            }

            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
                print("Response Headers: \(response.allHeaderFields)")
            }
        }

        task.resume()
    }
}




