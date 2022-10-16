protocol RestServiceProtocol: AnyObject {
    func createPostgresUser(
        id: String,
        email: String,
        firstName: String,
        lastName: String,
        idToken: String,
        completion: @escaping (Result<User, Error>) -> Void
    )
}
