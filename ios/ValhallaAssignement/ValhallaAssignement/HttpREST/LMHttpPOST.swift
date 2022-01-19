//
//  LMHttpPOSTRequest.swift
//  LMHttpRESTRequest_CoreLib_iOS
//
//  Created by John Freidrich Cinco on 7/26/18.

//

import Foundation


open class LMHttpPOST : LMHttpRESTRequest
{
    private let TAG:String = "LMHttpPOST"
    private let METHOD:String = "POST"
    
    public init(url:URL)
    {
        super.init(withHTTPMethod: METHOD, forUrl: url)
        
    }
    
    /**
     Adds a body to the POST request.
     
     - Parameters:
        - body: the body of the request as a Data stream
     */
    public func addBody(body: Data)
    {
        //// DebugLog(tag: TAG, info: String(format: "Setting body = %@", body as CVarArg))
        urlRequest!.httpBody = body
    }
    
    
}
