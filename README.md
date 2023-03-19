# Yumz #

This application exhibits my approach towards Usecase Design pattern with SwiftUI with iOS.

<img width="841" alt="Screenshot 2023-03-19 at 5 44 44 PM" src="https://user-images.githubusercontent.com/6280238/226196272-ec38e770-f798-41fa-8fbc-cf7850cd1f70.png">


## Usage: ##


### AppState ###
This is the place where you keep all the state info pertaining to the app

```
.
.
enum AppState {
  case launching(LaunchState)
  case list
  case detail(Meal)
  
  func getID() -> Int {
    switch self {
    case .launching: return 0
    case .list: return 1
    case .detail(_): return 2
    }
  }
}
.
.
```

From any given contentview the routing is as easy as calling 

```
@ObservedObject var yumz: YumzStateStore
.
.
yumz.appState = .detail(meal.wrappedValue)
.
.
```

### MainView ###
This is an initiation point for the view hierarchy

```
.
.
  var body: some Scene {
    WindowGroup {
      MainView(yumz: yumz)
    }
  }
.
.
struct MainView : View {
  // MARK: AppState 
  // MARK: ContentView 
.
.
```

### YumzStateStore ###
This is the class which posses all the state information related to app i.e. launch state and routing

```
.
.
@main
struct Yumz: App {
  let yumz = YumzStateStore()
.
.
final class YumzStateStore: ObservableObject 
  // MARK: AppState
  // MARK: Dependencies
  // MARK: Computed properties
  // MARK: Usecase interaction logic
}
.
.

```

### YumzDependencyContainer ###
This is the factory for initializing used dependencies i.e. long lived dependencies like usecase, datastore and networking

```
.
.
final class YumzStateStore: ObservableObject {
  // MARK: Dependencies
  let yumzDependencyContainer = YumzDependencyContainer()
.
.
final class YumzDependencyContainer {
  // MARK: Subsystems
  // MARK: Factories i.e. Usecase factories
}
.
.

```

### MealListView ###
This is the view responsible for embedding the content view for listing logic i.e. Listing logic screen. The appstate trickles down to this view

```
.
.
struct MainView : View {
 @ObservedObject var yumz: YumzStateStore
.
.
    case .list:
      return AnyView(MealListView(yumz: yumz))
.
.
}
.
.

```

### ListContentView ###
This is the content view responsible getting the data from usecase which it access from the StateStore and populate listing

```
.
.
struct MealListView : View {
  @ObservedObject var yumz: YumzStateStore
  .
  .
    AnyView(ListContentView(yumz: yumz))
  .
  .
}
.
.

```

### MealsRemoteAPIFetcheable ###
This is the protocol used for implementing the networking concretion in shape of MealsRemoteAPI which owing to particular domain in this case MealsRemoteAPI which is "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"

```
.
.
final class YumzDependencyContainer {
   .
   .
  func makeGetMealsUsecase() -> MealsUseCase {

    let remoteAPI = makeMealsRemoteAPI()
    return MealsUseCase(mealsRemoteAPI: remoteAPI)
  }
  .
  .
  func makeMealsRemoteAPI() -> MealsRemoteAPIFetcheable {
    return MealsRemoteAPI()
  }
}
.
.

```

### MealsStorable ###
This is the protocol used for implementing the persistence store concretion in shape of MealsStore you can use UserDefault, Realm, or CoreData as per your requirement for the implementation of it

```
.
.
final class YumzDependencyContainer {
  // MARK: Subsystems
  
  let mealsStore: MealsStorable = MealsStore()
.
.
class MealsStore: MealsStorable {
  func getMealsData() -> Data {
    OfflineStoreUserDefaults().getMealsData()
  }
  
  func saveMeals(_ meals: [Meal]) {
    OfflineStoreUserDefaults().saveMeals(meals)
  }
  
  func getMeals() -> Future<[Meal], CustomError> {
    OfflineStoreUserDefaults().getMeals()
  }
}
.
.

```

### FakeMealsStore ###
Is a concretion of MealsStorable protocol which you can use to stub data which can be used for testing the views in isolation from Mealstore

```

class FakeMealsStore: MealsStorable {
.
.
  func getMeals() -> Future<[Meal], CustomError> {
    Future { promise in
      promise(.success([Meal(id: "1", name: "Chicken", category: "Non Veg", instructions: "(1)Make masala (2)Boil rice (3)Mix the 2 and simmer for 15 mins", thumbnail: "", youtube: "")]))
    }
  }

```
