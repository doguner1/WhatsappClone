//
//  AuthScreenModel.swift
//  WhatsappClone
//
//  Created by qwerty on 9/4/24.
//

import Foundation

final class AuthScreenModel: ObservableObject {
    
    // MARK: Published Properties
    
    @Published var isLoading: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    
    // MARK: Computed Porperties
    var disableSignUpButton: Bool {
        email.isEmpty || password.isEmpty || username.isEmpty || isLoading
    }
    var disableLoginButton: Bool {
        email.isEmpty || password.isEmpty || isLoading
    }
}


/*
 Evet, doğru anladınız! Kodda email, password veya username alanlarından herhangi biri boş olduğunda disableLoginButton true döneceği için buton devre dışı kalacaktır. Şimdi, isLoading durumunun faydasını inceleyelim.

 isLoading Özelliğinin Faydası
 isLoading genellikle bir ağ isteği veya uzun süren bir işlem sırasında kullanıcının butona tekrar basmasını önlemek için eklenir. Örneğin:

 Çift Tıklamayı Önlemek:
 Kullanıcı giriş yapma butonuna bastığında, arka planda bir ağ isteği başlar. Bu istek tamamlanana kadar isLoading true olur ve buton devre dışı kalır. Bu, kullanıcının butona tekrar tekrar basmasını önler, çünkü istek zaten işlenmektedir.
 Kullanıcı Deneyimi:
 isLoading durumunu kullanarak buton üzerinde bir yükleme animasyonu gösterebilirsiniz. Böylece kullanıcı, işlemin gerçekleştiğini ve beklemesi gerektiğini anlayabilir.
 isLoading Olmadan Test Etmek
 Evet, isLoading olmadan da butonun devre dışı kalma ve aktifleşme durumlarını test edebilirsiniz. Ancak, gerçek bir uygulama senaryosunda isLoading gibi bir durum kontrolü faydalıdır. Çünkü ağ istekleri gibi uzun süren işlemler sırasında butonun devre dışı kalması, uygulamanın daha güvenli ve kullanıcı dostu olmasını sağlar.

 Kısacası:
 Eğer isLoading'i kaldırırsanız, buton sadece email ve password alanlarına bağlı olarak devre dışı kalır veya aktif olur.
 Ancak, kullanıcıların butona birden fazla kez basmasını önlemek veya bir yükleme durumu göstermek için isLoading faydalı bir özelliktir. Bu nedenle, çoğu uygulamada bu tür bir yükleme durumu kontrolü eklenir.
 */
