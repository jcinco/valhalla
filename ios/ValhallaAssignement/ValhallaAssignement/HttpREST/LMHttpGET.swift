//
//  LMHttpGETRequest.swift
//  LMHttpRESTRequest_CoreLib_iOS
//
//  Created by John Freidrich Cinco on 7/26/18.

//

import Foundation

open class LMHttpGET : LMHttpRESTRequest {
    
    private let METHOD:String = "GET"
    
    
    public init(url:URL)
    {
        super.init(withHTTPMethod:METHOD, forUrl:url)
    }
    
}
