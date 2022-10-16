import Foundation

public final class RestService: RestServiceProtocol {
    public init() {}

    func createPostgresUser(
        id: String,
        email: String,
        firstName: String,
        lastName: String,
        idToken: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        debugPrint("Debug: create postgres user processing")

        guard let url = URL(string: "http://localhost:3000/users") else {
            return
        }

        let body: [String: Any] = [
            "id": id,
            "email": email,
            "firstName": firstName,
            "lastName": lastName
        ]

        let data = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(idToken, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(result))
                } else {
                    completion(.failure(error!))
                }
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
