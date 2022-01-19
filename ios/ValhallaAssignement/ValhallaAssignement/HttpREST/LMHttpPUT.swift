//
//  LMHttpPUT.swift
//  LMHttpRESTRequest_CoreLib_iOS
//
//  Created by John Freidrich Cinco on 7/27/18.

//

import Foundation

open class LMHttpPUT : LMHttpRESTRequest
{
    private let METHOD:String = "PUT"
    
    public init(url:URL)
    {
        super.init(withHTTPMethod: METHOD, forUrl: url)
    }
}
