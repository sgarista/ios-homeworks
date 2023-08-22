import UIKit


struct MyLoginFactory: LoginFactory {
    
    
    func makeLoginInspector() -> LoginInspector {
        
        return LoginInspector()
    }
}
