//
//  LMHttpMultipartFileEntity.swift
//  LMHttpREST
//
//  Created by John Freidrich Cinco on 11/16/18.

//

import Foundation

open class LMHttpMultipartFileEntity {
    
    public var fileName:String? {
        get {
            return _fileName
        }
    }
    public var data:Data? {
        get {
            return _data
        }
    }
    
    public var fileType:String? {
        get {
            return _fileType
        }
    }
    
    
    private var _fileName:String?
    private var _data:Data?
    private var _fileType:String?
    
    public init(fileName:String?, fileType:String?, data:Data?) {
        if (data == nil || fileType == nil || fileName == nil) {
            
            return
        }
        
        _fileName = fileName
        _data = data
        _fileType = fileType
    }
    
    
}
