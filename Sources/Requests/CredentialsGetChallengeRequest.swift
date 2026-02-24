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

public struct CredentialsGetChallengeRequest: Codable, Sendable {
    public let credentialID: String
    public let description: String?
    public let numSignatures: Int?

    enum CodingKeys: String, CodingKey {
        case credentialID = "credentialID"
        case description
        case numSignatures = "num_signatures"
    }

    public init(
        credentialID: String,
        description: String? = nil,
        numSignatures: Int? = nil
    ) {
        self.credentialID = credentialID
        self.description = description
        self.numSignatures = numSignatures
    }
}
