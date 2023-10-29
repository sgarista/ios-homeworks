import UIKit


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
                            InfoViewController.taskLabel.text = "Задание 1:\n\(task.title)"
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




