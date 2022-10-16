import FirebaseAuth

public final class FirebaseAuthService: FirebaseAuthServiceProtocol {
    public init() {}

    public func createFirebaseUser(
        email: String,
        password: String,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        debugPrint("Debug: creating firebase user process \(email)")

        Auth
            .auth()
            .createUser(
                withEmail: email, password: password
            ) { authDataResult, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(authDataResult!))
                }
            }
    }

    public func getUserUid(completion: @escaping (String) -> Void) {
        if let uid = Auth.auth().currentUser?.uid {
            completion(uid)
        } else {
            completion("")
        }
    }
}
