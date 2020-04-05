//
//  WebServices.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import Alamofire
import JavaScriptCore
class WebServices: NSObject {
    static var shared = WebServices()
    var manager:  Alamofire.SessionManager?
    override init() {
        super.init()
        manager = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 40
            configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
            let manager = Alamofire.SessionManager(configuration: configuration)
            return manager
        }()
    }
    internal func getData(from parameters: [String: Any]) -> Data {
        let obj = AppJsonConversions()
        let string = obj.convertToString(dict: parameters as [String: AnyObject])
        return string.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? Data()
    }
    internal func formURLQuery(from parameters: [String: Any]?) -> [URLQueryItem] {
        guard let parameter = parameters else {
            return []
        }
        return parameter.map {
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
    }
    internal func addQueryParams(url: URL, newParams: [URLQueryItem]) -> URL? {
        let urlComponents = NSURLComponents.init(url: url, resolvingAgainstBaseURL: false)
        guard urlComponents != nil else { return nil; }
        if (urlComponents?.queryItems == nil) {
            urlComponents!.queryItems = [];
        }
        urlComponents!.queryItems!.append(contentsOf: newParams);
        return urlComponents?.url;
    }
    func getData(type: URLs, parameters: [String: Any]?, completion: @escaping (_ response: AnyObject, _ statuscode: Int) -> Void, errorOccured: @escaping (_ error: NSError?) -> Void) {
        var request = APIHelper().request(for: type)
        let httpMethod = APIHelper().HTTPMethod(for: type)
        if httpMethod == .post {  request.httpBody = getData(from: parameters ?? [: ]) }
        else if httpMethod == .get { if parameters != nil { request.url = addQueryParams(url: request.url!, newParams: formURLQuery(from: parameters))  } }
        manager?.request(request)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(response.data as AnyObject? ?? NSData(), response.response?.statusCode as Int? ?? Int())
                case .failure(let error):
                    errorOccured(error as NSError?)
                }
        }
    }
}
