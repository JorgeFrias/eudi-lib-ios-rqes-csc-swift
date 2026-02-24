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

final actor CredentialsGetChallengeClient {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType = HTTPService()) {
        self.httpClient = httpClient
    }
    
    func makeRequest(for request: CredentialsGetChallengeRequest, accessToken: String, rsspUrl: String) async throws -> Result<CredentialsGetChallengeResponse, ClientError> {
        guard let url = try? rsspUrl.appendingEndpoint("/v2/credentials/getChallenge").get() else {
            return .failure(ClientError.invalidRequestURL)
        }

        let jsonData: Data
        do {
            jsonData = try JSONEncoder().encode(request)
        } catch {
            return .failure(ClientError.encodingFailed)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) = try await httpClient.upload(for: urlRequest, from: jsonData)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 204 || data.isEmpty {
                return .success(CredentialsGetChallengeResponse(challenge: nil))
            }
            return handleResponse(data, response, ofType: CredentialsGetChallengeResponse.self)
        } catch {
            return .failure(ClientError.noData)
        }
    }
}
