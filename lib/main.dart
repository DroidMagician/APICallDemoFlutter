import 'dart:io';

import 'package:apicalldemo/bloc/CartBloc.dart';
import 'package:apicalldemo/bloc/CartCubit.dart';
import 'package:apicalldemo/bloc/login_bloc.dart';
import 'package:apicalldemo/navigationDrawer/NavigationDrawer.dart';
import 'package:apicalldemo/network/UserDetails.dart';
import 'package:apicalldemo/productList.dart';
import 'package:apicalldemo/tictoctoe/TicTocToe.dart';
import 'package:apicalldemo/translation/TranslationsDelegate.dart';
import 'package:apicalldemo/widgets/MyTextFields.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Product.dart';
import 'bloc/LoginCubit.dart';
import 'bloc/SimpleBlocObserver.dart';
import 'bottomNavigation/MyBottomNavigation.dart';
import 'network/DioClient.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyGameApp());
}

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyAppDemo());
  }
}

class AppModel extends Model {
  Locale _appLocale = Locale('ar');

  Locale get appLocal => _appLocale ?? Locale("ar");

  void changeDirection() {
    if (_appLocale == Locale("ar")) {
      _appLocale = Locale("en");
    } else {
      _appLocale = Locale("ar");
    }
    notifyListeners();
  }
}

class MyAppDemo extends StatelessWidget {
  const MyAppDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // Arabic
              const Locale('en', ''), // English
            ],
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: MyBottomNavigation()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        //create: (context) => CartCubit()..initialLoad(),
        // create: (context) => LoginBloc(),
        create: (context) => LoginCubit(),
        child: MyHomePage(title: "Testtt"),
      ),
    );
  }
}

class MyGameApp extends StatelessWidget {
  const MyGameApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TicTocToe()
    );
  }
}


class MyHomePageNew extends StatelessWidget {
  const MyHomePageNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Shopping App"),
        actions: [
          Stack(alignment: Alignment.topRight, children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) => previous.items != current.items,
              builder: (context, state) {
                return Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 5, right: 5),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffc32c37),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            state.count.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ));
              },
            )
          ])
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ProductList(
            items: state.items,
            onItemClicked: (int index) {
              // setState(() {
              //   items[index].isAdded = !items[index].isAdded;
              //   items[index].isAdded ? cartCount++ : cartCount--;
              // });
            },
          );
        },
      ),
    ));
  }

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//       child: Scaffold(
//     appBar: AppBar(
//       title: Text("Shopping App"),
//       actions: [
//         Stack(alignment: Alignment.topRight, children: [
//           IconButton(
//             icon: const Icon(
//               Icons.shopping_cart,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // do something
//             },
//           ),
//           Container(
//               width: 30,
//               height: 30,
//               alignment: Alignment.topRight,
//               margin: EdgeInsets.only(top: 5, right: 5),
//               child: Container(
//                 width: 15,
//                 height: 15,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color(0xffc32c37),
//                     border: Border.all(color: Colors.white, width: 1)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Center(
//                     child: Text(
//                       "$cartCount",
//                       style: TextStyle(fontSize: 10),
//                     ),
//                   ),
//                 ),
//               ))
//         ])
//       ],
//     ),
//     body: ProductList(
//       items: items,
//       onItemClicked: (int index) {
//         setState(() {
//           items[index].isAdded = !items[index].isAdded;
//           items[index].isAdded ? cartCount++ : cartCount--;
//         });
//       },
//     ),
//   ));
// }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, this.title});

  final String? title;

  final DioClient client = DioClient();
  final userDetails = UserDetails();

  // TextEditingController urlController = new TextEditingController();
  // TextEditingController userNameController = new TextEditingController();
  // TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          print("Inside main ${state.errorMessage}");
          print("Inside main ${state.userResponseModel?.users?.username}");
          if (state.userResponseModel?.users?.firstname?.isNotEmpty == true) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Success')),
              );
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
          }
        },
        child: Scaffold(
          // appBar: AppBar(
          //   // Here we take the value from the MyHomePage object that was created by
          //   // the App.build method, and use it to set our appbar title.
          //   title: Text(widget.title),
          // ),
          body: SafeArea(
            child: Scaffold(
              body: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Version 1.6"),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/app_logo.png')),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BlocBuilder<LoginCubit, LoginState>(
                                      builder: (context, state) {
                                        return MyTextField(
                                            assetImage:
                                                'assets/images/link.png',
                                            myFunction: (p0) {
                                              userDetails.url = p0.toString();
                                            },
                                            myHintText: 'URL');
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BlocBuilder<LoginCubit, LoginState>(
                                      builder: (context, state) {
                                        return TextField(
                                          onChanged: (text) {
                                            userDetails.username = text;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFFFFFFF),
                                            prefixIcon: Image(
                                                image: AssetImage(
                                                    'assets/images/user.png')),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            hintText: 'UserName',
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BlocBuilder<LoginCubit, LoginState>(
                                      builder: (context, state) {
                                        return TextField(
                                          onChanged: (text) {
                                            userDetails.password = text;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFFFFFFF),
                                            prefixIcon: Image(
                                                image: AssetImage(
                                                    'assets/images/padlock.png')),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            hintText: 'Password',
                                          ),
                                        );
                                      },
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 300,
                                                child: CheckboxListTile(
                                                  title: Text("title text"),
                                                  value: true,
                                                  onChanged: (newValue) {},
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading, //  <-- leading Checkbox
                                                ),
                                              ),
                                              Container(
                                                width: 300,
                                                child: CheckboxListTile(
                                                  title: Text("title text"),
                                                  value: true,
                                                  onChanged: (newValue) {},
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading, //  <-- leading Checkbox
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text("Forgot Password")
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(25),
                                      child:
                                          BlocBuilder<LoginCubit, LoginState>(
                                        builder: (context, state) {
                                          return state.showProgress == false
                                              ? TextButton(
                                                  onPressed: () async {
                                                    dynamic mydeviceInfo = "";
                                                    DeviceInfoPlugin
                                                        deviceInfo =
                                                        DeviceInfoPlugin();
                                                    AndroidDeviceInfo
                                                        androidInfo =
                                                        await deviceInfo
                                                            .androidInfo;
                                                    mydeviceInfo = androidInfo
                                                        .model
                                                        .toString();
                                                    print(
                                                        'Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

                                                    if (Platform.isIOS) {
                                                      IosDeviceInfo iosInfo =
                                                          await deviceInfo
                                                              .iosInfo;
                                                      mydeviceInfo = androidInfo
                                                          .model
                                                          .toString();
                                                      print(
                                                          'Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
                                                    }

                                                    userDetails
                                                            .multipleUserLogin =
                                                        MultipleUserLogin(
                                                            appVersion: "1",
                                                            dedeviceviceModel:
                                                                mydeviceInfo,
                                                            deviceName: "Test",
                                                            deviceToken: "Test",
                                                            deviceType: Platform
                                                                .operatingSystem,
                                                            deviceUid: "test",
                                                            sVersion: "test");
                                                    // context.read<LoginBloc>().add(
                                                    //     DoLoginEvent(userDetails));
                                                    context
                                                        .read<LoginCubit>()
                                                        .doLogin(userDetails);

                                                    // UserDetails userDetails = UserDetails(
                                                    //     username: userNameController.text,
                                                    //     password: passwordController.text,
                                                    //     url: urlController.text,
                                                    //     multipleUserLogin: MultipleUserLogin(
                                                    //         appVersion: "1",
                                                    //         dedeviceviceModel: mydeviceInfo,
                                                    //         deviceName: "Test",
                                                    //         deviceToken: "Test",
                                                    //         deviceType:
                                                    //             Platform.operatingSystem,
                                                    //         deviceUid: "test",
                                                    //         sVersion: "test"));
                                                    // var response = await client.createUser(
                                                    //     userInfo: userDetails);
                                                    // print(
                                                    //     "response == ${response?.users?.firstname}");
                                                  },
                                                  child: Container(
                                                    color: Colors.green,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                    child: const Text(
                                                      'Sign In',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.0),
                                                    ),
                                                  ),
                                                )
                                              : CircularProgressIndicator();
                                        },
                                      ),
                                    ),
                                  ]),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void displaySnackBar(String message) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(message),
    //   ),
    // );
  }
}
