import FirebaseAuth

protocol FirebaseAuthServiceProtocol: AnyObject {
    func createFirebaseUser(
        email: String,
        password: String,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    )
}
