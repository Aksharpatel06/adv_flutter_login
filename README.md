# Sign In & Sign Up with Email & Password with Google Authentication[(Source Code)](https://github.com/Aksharpatel06/adv_flutter_login/tree/master/lib)

Certainly! Here's a concise breakdown of how to implement the login and sign-up app using GetX state management and Google email ID sign-in, without including the full screen code:

### **1. Project Setup**
- **Add Dependencies**:
  In your `pubspec.yaml`, include the necessary dependencies:
  ```yaml
  dependencies:
    flutter:
      sdk: flutter
    firebase_core: latest_version
    firebase_auth: latest_version
    google_sign_in: latest_version
    get: latest_version
  ```

- **Initialize Firebase**:
  In your `main.dart`, initialize Firebase before running the app:
  ```dart
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }
  ```

### **2. Authentication Logic with GetX**

- **Create an Authentication Controller**:
  Manage authentication logic and state using GetX by creating a `auth_controller.dart`:
  ```dart
  class AuthController extends GetxController {
    FirebaseAuth auth = FirebaseAuth.instance;
    var isSignedIn = false.obs;
    Rx<User?> firebaseUser = Rx<User?>(null);

    @override
    void onInit() {
      super.onInit();
      firebaseUser.bindStream(auth.authStateChanges());
      ever(firebaseUser, _setInitialScreen);
    }

    _setInitialScreen(User? user) {
      if (user == null) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => HomeScreen());
      }
    }

    void register(String email, String password) async {
      try {
        await auth.createUserWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }

    void login(String email, String password) async {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }

    void googleSignIn() async {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(credential);
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }

    void signOut() async {
      await auth.signOut();
    }
  }
  ```

### **3. App Routing with GetX**

- **Set Up Routing**:
  Define routes in `main.dart` using GetX’s `GetMaterialApp`:
  ```dart
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/signup', page: () => SignUpScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
        ],
      );
    }
  }
  ```

### **4. Firebase Authentication Integration**

- **Email/Password Sign-Up**:
  Use Firebase's `createUserWithEmailAndPassword` method in the `register` function of the `AuthController`.

- **Email/Password Login**:
  Implement the login functionality using `signInWithEmailAndPassword` in the `login` function.

- **Google Sign-In**:
  Integrate Google Sign-In by using the `google_sign_in` package and handle the sign-in process in the `googleSignIn` function.

### **5. UI Flow (Summary)**
- **Login Screen**:
  - Users can enter their email and password to log in.
  - Option to sign in with Google.

- **Sign-Up Screen**:
  - Users can create an account with email and password.

- **Home Screen**:
  - Displays after a successful login/sign-up.

### **6. Running the App**
- With everything set up, use `flutter run` to start the app, allowing users to register, log in, and authenticate via Google.

This structure outlines the core components and flow without delving into specific UI implementations, focusing instead on the underlying logic and setup. If you need more details on any specific part, let me know!

### ScreenShorts

<p align='center'>
  <img src='https://github.com/user-attachments/assets/8c283c5c-ea77-4807-8aeb-92c1a2639c9d' width=240>
  <img src='https://github.com/user-attachments/assets/978b7f60-0683-43da-93fe-9ed4a3d8758d' width=240>
  <img src='https://github.com/user-attachments/assets/10fbeb6d-b519-40f1-a1c1-66e9825ea857' width=240>
  <img src='https://github.com/user-attachments/assets/8659418a-6c9d-4f9a-a38a-55a3d7b34c14' width=240>
</p>

### Video

https://github.com/user-attachments/assets/8bd86444-61a4-49f6-81e1-521842b1cb62

