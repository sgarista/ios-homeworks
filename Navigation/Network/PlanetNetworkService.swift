import Foundation


enum PlanetConfiguration: String {
    case planet = "https://swapi.dev/api/planets/1"

    var url: URL? {
        URL(string: self.rawValue)
    }
}


struct PlanetNetworkService {

    static func request(for configuration: PlanetConfiguration) {

        guard let url = configuration.url else {
            print("Invalid URL")
            return
        }

        let planet = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")

            }  else if let data = data {

                    let decoder = JSONDecoder()
                do {
                    let planet = try decoder.decode(Planet.self, from: data)

                    DispatchQueue.main.async {
                        InfoViewController.planetLabel.text = "Задание 2:\nПериод вращения Татуина \(planet.orbitalPeriod) дней"
                    }
                } catch {
                    print("Error decoding planet data: \(error.localizedDescription)")
                }
            }
        }
        planet.resume()

    }
}
