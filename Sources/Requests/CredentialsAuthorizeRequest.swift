/*
 * Copyright (c) 2023 European Commission
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation

public struct CredentialsAuthorizeRequest: Codable, Sendable {
    public let credentialID: String
    public let numSignatures: Int
    public let hashes: [String]?
    public let hashAlgorithmOID: HashAlgorithmOID?
    public let signAlgo: SigningAlgorithmOID?
    public let signAlgoParams: String?
    public let description: String?
    public let clientData: String?

    enum CodingKeys: String, CodingKey {
        case credentialID = "credentialID"
        case numSignatures = "num_signatures"
        case hashes
        case hashAlgorithmOID
        case signAlgo
        case signAlgoParams = "sign_algo_params"
        case description
        case clientData = "client_data"
    }

    public init(
        credentialID: String,
        numSignatures: Int,
        hashes: [String]? = nil,
        hashAlgorithmOID: HashAlgorithmOID? = nil,
        signAlgo: SigningAlgorithmOID? = nil,
        signAlgoParams: String? = nil,
        description: String? = nil,
        clientData: String? = nil
    ) {
        self.credentialID = credentialID
        self.numSignatures = numSignatures
        self.hashes = hashes
        self.hashAlgorithmOID = hashAlgorithmOID
        self.signAlgo = signAlgo
        self.signAlgoParams = signAlgoParams
        self.description = description
        self.clientData = clientData
    }
}
