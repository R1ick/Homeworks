//
//  CacheManager.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 06.03.2022.

import AlamofireImage

class CacheManager {
    private init() {}
    
    static let shared = CacheManager()
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000,
        preferredMemoryUsageAfterPurge: 60_000)
}
