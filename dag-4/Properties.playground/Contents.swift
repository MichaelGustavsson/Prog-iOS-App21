import Foundation

// Composition - Skapa en klass / objekt ifrån olika typer(Struct eller Class)

struct User{
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var address: Address
}

struct Address{
    var streetAddress: String
    var postalCode: String
    var city: String
    var country: String
}

var michael = User(firstName: "Michael", lastName: "Gustavsson", email: "email@email.com", phone: "12345678", address: Address(streetAddress: "Gatan 1", postalCode: "33221", city: "Stenungsund", country: "Sverige"))


class BankAccount {
    // Deklarationen har både getters och setters automatiskt.
    // Objektets tillstånd/data lagras i nedanstående variabler/egenskaper
    private var _accountNumber: String
    private var _balance: Double
    private var _owner: User?
    
//    var accountNumber: String
//    var balance: Double
    
    // Egenskaper med setters och getters manuellt implementerade
    // Egenskaper är till för att läsa och eventuellt skriva till objekts tillstånd/data...
    var accountNumber: String {
        get{
            return _accountNumber
        }
    }
    
    var balance : Double{
        get{
            return self._balance
        }
    }
    
    var owner: User {
        get{
            return self._owner!
        }
    }
    
    // Computed Property
    var accountInfo: String{
        get{
            return "Konto ägare \(self._owner!) kontonummer är \(self.accountNumber)"
        }
//        set(value) {
//            // Logik för att bekräfta att information är korrekt
//            self.owner = value
//        }
    }
    
    // Metoder är till för att manipulera tillståndet i objektet...
    func withdraw(amount: Double) -> String{
        // Kontroll om det finns tillräckligt med pengar på kontot.
        if(self._balance > amount){
            self._balance -= amount
            return "Det gick bra att ta ut \(amount)"
        }
        
        return "Det gick inte att ta ut \(amount), du har bara \(self.balance) på kontot. BÖRJA SPARA, SLUTA SLÖSA"
    }
    
    func deposit(amount: Double){
        self._balance += amount
    }
    
    func login(identity: String, password: String){
        // Se om användaren finns i systemet och se så att rätt lösenord är medskickat
        // Om så är fallet sätt upp objektet korrekt.
        // Detta kommer tillbaka ifrån Backend...
        let user = User(firstName: "Michael", lastName: "Gustavsson", email: "email@email.com", phone: "email@email.com", address: Address(streetAddress: "Gatan 1", postalCode: "33221", city: "Stenungsund", country: "Sverige"))
        
        self._owner = user
    }
    
    init(){
        self._accountNumber = ""
        // Någon typ av logik behövs för att hämta korrekt balans...
        self._balance = 0
    }
}

var myAccount = BankAccount()

//print(myAccount.owner)

myAccount.login(identity: "Kalle", password: "Password")

print(myAccount.owner)

//print(myAccount.owner)
//print(myAccount.accountNumber)

//myAccount.owner = "Annika"
//print(myAccount.owner)

//print(myAccount.accountInfo)

//myAccount.accountInfo = "Michael"
//print(myAccount.accountInfo)
//
//print("Jag har \(myAccount.balance) kronor på mitt konto")
//
//myAccount.withdraw(amount: 200.0)
//print("Jag har \(myAccount.balance) kronor på mitt konto")
//
//myAccount.deposit(amount: 800.0)
//print("Jag har \(myAccount.balance) kronor på mitt konto")
//
//var response = myAccount.withdraw(amount: 500)
//print(response)
