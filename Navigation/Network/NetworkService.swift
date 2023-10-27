import UIKit


enum NetworkError: Int, Error {
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case decodeError = 1000
    case serverError = 500
    case unowned = 2000

}


enum AppConfiguration: String, CaseIterable {
    case first = "https://jsonplaceholder.typicode.com/todos/1"
    case second = "https://jsonplaceholder.typicode.com/todos/2"
    case third = "https://jsonplaceholder.typicode.com/todos/3"

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
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if json is [String: Any] {
                        let task = try JSONDecoder().decode(Task.self, from: data)
                        DispatchQueue.main.async {
                            InfoViewController.jsonLabel.text = task.title
                            print(InfoViewController.jsonLabel.text ?? "пустота")
                        }
                    }
                } catch {
                    print("JSON serialization error: \(error)")
                }
            }
        }
        task.resume()
    }
}




