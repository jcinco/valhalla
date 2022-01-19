//
//  LMHttpMultipartPOST.swift
//  LMHttpREST
//
//  Created by John Freidrich Cinco on 11/16/18.

//

import Foundation


open class LMHttpMultipartPOST : LMHttpPOST {
    private let TAG:String = "LMHttpMultipartPOST"
    
    private let HTTP_HEADER_VALUE_MULTIPART_WITH_BOUNDARY = "MULTIPART/FORM-DATA; BOUNDARY="
    private let CONTENT_TYPE_MULTIPART_BOUNDARY_VALUE = "--LexmarkMobilePrintBoundary-qwertyuiopasdfghjklzxcvbnm"
    private let LINE_FEED = "\r\n"
    private let TWO_HYPENS = "--"
    private let CONTENT_DISPOSITION_PHRASE = "Content-Disposition: form-data; name=\""
    private let CONTENT_TYPE_PHRASE = "Content-Type: charset=utf-8; "
    private let CONTENT_FILENAME_PHRASE = "\"; filename=\""
    private let DOUBLE_QUOTE = "\""
    
    private var PREFIX_STRING:String!
    private var POSTFIX_STRING:String!
    
    
    
    private let multipartContentType:String = "multipart/form-data; boundary=--LexmarkMobilePrintBoundary-qwertyuiopasdfghjklzxcvbnm"
    private let contentTypeHeaderKey:String = "Content-Type"
    
    private var multipartHeaderContents:Dictionary<String, String?>?
    private var multipartStringContents:Dictionary<String, String?>?
    private var multipartDataContents:Dictionary<String, LMHttpMultipartFileEntity?>?
    
    public override init(url:URL) {
        super.init(url: url)
        
        PREFIX_STRING = "\(self.TWO_HYPENS)\(self.CONTENT_TYPE_MULTIPART_BOUNDARY_VALUE)\(self.LINE_FEED)"
        POSTFIX_STRING = "\(self.LINE_FEED)\(self.TWO_HYPENS)\(self.CONTENT_TYPE_MULTIPART_BOUNDARY_VALUE)\(self.TWO_HYPENS)\(self.LINE_FEED)"
        
        urlRequest!.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        urlRequest!.setValue(multipartContentType, forHTTPHeaderField: contentTypeHeaderKey)
        multipartHeaderContents = Dictionary<String, String?>()
        multipartStringContents = Dictionary<String, String?>()
        multipartDataContents = Dictionary<String, LMHttpMultipartFileEntity?>()
        
        self.addHeader(value: multipartContentType, forHTTPHeaderField: contentTypeHeaderKey)
        
    }
    
    public func addStringValue(forFormField fieldName:String?, value:String?) {
        if fieldName == nil && value == nil  {
            // ErrorLog(tag:TAG, info: "No field name and value specified")
            return
        }
        
        multipartStringContents![fieldName!] = value;
    }
    
    
    public func addFileValue(forFormField fieldName:String?, fileEntity:LMHttpMultipartFileEntity?) {
        multipartDataContents![fieldName!] = fileEntity
    }
    
    
    public func valueForField(fieldName:String) -> LMHttpMultipartFileEntity? {
        return multipartDataContents![fieldName]!
    }
    
    public func valueForField(fieldName:String) -> String? {
        return multipartStringContents![fieldName]!
    }
    
    public override func addHeader(value: String, forHTTPHeaderField field: String) {
        super.addHeader(value: value, forHTTPHeaderField: field)
        
        multipartHeaderContents![field] = value
    }
    
    public override func addHeaders(values: Dictionary<String, String?>?) {
        super.addHeaders(values: values)
        
        multipartHeaderContents = values
    }
    
    
    public override func execute() {
        // Append multi-part data into body before executing.
        var body:Data = Data()
        var stringData:String? = ""
        
        for (key, value) in multipartHeaderContents! {
            stringData = "\(stringData!)\(key): \(value!)\(LINE_FEED)"
        }
        
        // form data
        for (key,value) in multipartStringContents! {
            //stringData = "\(stringData)\(CONTENT_TYPE_MULTIPART_BOUNDARY_VALUE)\(LINE_FEED)"
            stringData = "\(stringData!)\(PREFIX_STRING!)\(CONTENT_DISPOSITION_PHRASE)\(key)\(DOUBLE_QUOTE)\(LINE_FEED)\(LINE_FEED)"
            stringData = "\(stringData!)\(value!)\(LINE_FEED)"
        }
        
        //// DebugLog(tag:TAG, info:stringData!)
        print(stringData!)
        body.append(stringData!.data(using:String.Encoding.utf8)!)

        for (key, value) in multipartDataContents! {
            let fileEntity = value
            var bodyString:String? = "\(PREFIX_STRING!)\(CONTENT_DISPOSITION_PHRASE)\(key)"
            bodyString = "\(bodyString!)\(CONTENT_FILENAME_PHRASE)\(fileEntity!.fileName!)\(DOUBLE_QUOTE)\(LINE_FEED)"
            bodyString = "\(bodyString!)\(CONTENT_TYPE_PHRASE)\(fileEntity!.fileType!)\(LINE_FEED)\(LINE_FEED)"
            
             //// DebugLog(tag:TAG, info:bodyString!)
            //print(bodyString!)
            body.append(bodyString!.data(using:String.Encoding.utf8)!)
            body.append(fileEntity!.data!)
        }
        body.append(POSTFIX_STRING!.data(using: String.Encoding.utf8)!)
        print(POSTFIX_STRING)
        //self.addHeader(value:"\(body.count)", forHTTPHeaderField:"Content-Length")
        urlRequest!.setValue("\(body.count)", forHTTPHeaderField:"Content-Length")
        self.addBody(body: body)
        
        super.execute()
    }
}
