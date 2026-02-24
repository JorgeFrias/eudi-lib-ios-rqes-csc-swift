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

public enum CredentialsAuthorizeError: LocalizedError {
    case missingCredentialID
    case invalidNumSignatures

    public var errorDescription: String? {
        switch self {
        case .missingCredentialID:
            return "Missing 'credentialID' parameter. The 'credentialID' parameter is required."
        case .invalidNumSignatures:
            return "Invalid 'num_signatures' parameter. The 'num_signatures' parameter format must be an integer greater than 0."
        }
    }
}
