
enum APIRoute{
    case login(email:String, password:String)
    case profiles
    case article(id: Int)
    
    case cacheListByLocation(latitude: Double, longitude: Double, radius: Double)
    case cacheListByPlaceId(id: Double)
}
