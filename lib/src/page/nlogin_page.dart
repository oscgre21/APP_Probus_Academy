import 'package:flutter/material.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/ResultObjectDataPerson.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/user_login_view_model.dart';

class NLoginPage extends StatefulWidget {
  NLoginPage({Key key}) : super(key: key);

  @override
  _NLoginPageState createState() => _NLoginPageState();
}

class _NLoginPageState extends State<NLoginPage> {
  final UserLoginViewModel userLogin = new UserLoginViewModel();
  bool isLoading = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    userLogin.user = "DN-19-20113";
    userLogin.passw = "Dn-19-20113";
    //userLogin.user = "770001";
    // userLogin.passw = "Pn770001";
    loginProvider.getStream().listen((object) {
      if (object == null) return;
      if (object.valid == Status.SUCCESS) {
        var datax = object.data as ResultObjectDataPerson;

        setState(() {
          isLoading = false;
          Navigator.pushNamed(context, datax.rol);
        });
      }
    });

    return SafeArea(
      child: Scaffold(
        body: _homePage(context),
      ),
    );
  }

  @override
  void dispose() {
    this.dispose();
  }

  Widget _homePage(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF035AA6),
                Color(0xFF035AA6),
              ])),
        ),
        Container(
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    "assets/probus_logo_hor.png",
                    height: 80,
                    fit: BoxFit.fill,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  _inputEmail(),
                  SizedBox(
                    height: 20,
                  ),
                  _inputPassword(),
                  //  _checkRecoveryPassword(),
                  _checkForgotMyPassword(),
                  SizedBox(
                    height: 20,
                  ),
                  _buttomLogin_bk()
                ],
              ),
            ))
      ],
    );
  }

  Widget _inputEmail() {
    TextEditingController textEditingController = new TextEditingController();
    textEditingController.text = userLogin.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Usuario/ Contraseña",
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF6CA8F1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, color: Colors.black26, offset: Offset(0, 2))
              ]),
          child: TextField(
            controller: textEditingController,
            onChanged: (value) {
              userLogin.user = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: "Ingrese su usuario",
                hintStyle: TextStyle(color: Colors.white54, fontSize: 15)),
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _inputPassword() {
    TextEditingController textPwdEditingController =
        new TextEditingController();
    textPwdEditingController.text = userLogin.passw;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: double.infinity,
            child: Text(
              "Contraseña",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF6CA8F1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, offset: Offset(0, 2), color: Colors.black26)
              ]),
          child: TextField(
            controller: textPwdEditingController,
            obscureText: true,
            onChanged: (value) {
              userLogin.passw = value;
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Contraseña",
                hintStyle: TextStyle(color: Colors.white54)),
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        )
      ],
    );
  }

  Widget _checkForgotMyPassword() {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: 20,
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: userLogin.recordarPassword,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  userLogin.recordarPassword = value;
                });
              },
            ),
          ),
          InkWell(
            child: Text(
              "Recordar contraseña",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            onTap: () {
              setState(() {
                userLogin.recordarPassword = !userLogin.recordarPassword;
              });
            },
          ),
          //  Text("Recordar contraseña",style: TextStyle(color: Colors.white,fontSize: 14.0),) ,
        ],
      ),
    );
  }

  Widget _checkRecoveryPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Olvide contraseña?',
          style: kLabelStyle,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buttomLogin_bk() {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: StreamBuilder(
          initialData: StreamResultObject<IResultObject>(),
          stream: loginProvider.getStream(),
          builder: (BuildContext context, AsyncSnapshot datax) {
            var object = datax.data as StreamResultObject<IResultObject>;
            //datax.connectionState
            if (object.valid == Status.LOADING) {
              return Center(child: CircularProgressIndicator());
            }

            return RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                "Acceder",
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                loginProvider.doLogin(userLogin: userLogin);
              },
            );
          }),
    );
  }

  Widget _buttomLogin() {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: isLoading == false
          ? RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                "Acceder",
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                /*
                final req = new HttpRequest<ResultObjectDataPerson>();
                req.post<UserLoginViewModel>(endPointSignUp, userLogin,'',loginProvider).then((data) {
                    print("LLegue aqui");   
                    print((data.resultObject as ResultObjectDataPerson).payload.nombre);     
                   
                    setState(() {
                      isLoading=false;  
                      Navigator.pushNamed(context,"menu"); 
                    });    
                });*/
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
