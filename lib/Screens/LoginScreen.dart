import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{

    bool isLoading=false;

  final emailReExp= RegExp(  r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$');
  final upprChar=RegExp(r'[A-Z]');
  final lowerChar=RegExp(r'[a-z]');
  final numberChar=RegExp(r'[0-9]');
  

  int passLength=8;


   @override
  void dispose() {
      email.dispose();
      pass.dispose();
    super.dispose();
  }
    bool isVisible=true;

  final _formKey= GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(title: Text('Login Screen'),),
         body:  Form(
          key: _formKey,
          child:Center(
          child:  
           Column( 
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              height: 40,
               width: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
               color: Colors.blueAccent),
               alignment: Alignment.center,
                child:Text('Login Page',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic),),
          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),child:   TextFormField(decoration: InputDecoration(
            
            hintText: 'Enter email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
            ),
            labelText: 'Email',
             
          ),
          controller: email,
          validator: (value) {
            if(value == null || value.isEmpty){
              return 'Email Required .. ';

            } else if(!emailReExp.hasMatch(value.trim())){
              return 'Please enter valid email';
            }
            return null;
          },
             
          ),
          
),
SizedBox(height: 20,),
Padding(padding: EdgeInsetsGeometry.fromLTRB(20, 0, 20, 0),
child: TextFormField(
  obscureText:isVisible ,
  controller: pass,
  validator: (value) {
     if(value ==null || value.isEmpty){
          return 'password is incorrect';
     }  
     if(value.length<passLength)
     {
      return'passowrd should be 8';
     } 
     if(!numberChar.hasMatch(value)){
        return 'password must contain a number';
     }
     if(!upprChar.hasMatch(value)){
      return 'password must contain an uppercase letter';
     }if (!lowerChar.hasMatch(value)){
      return 'password must contain lowercase';
     }
     

     return null;
  },
  decoration: InputDecoration(  
    

    suffixIcon:  pass.text.isNotEmpty ? IconButton(onPressed:(){
      setState(() {
        isVisible=!isVisible;
      });
    }, icon: Icon(isVisible ?Icons.visibility : Icons.visibility_off )): null,
    hintText: 'Password',
    labelText: 'password',  
    
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
  ),
  onChanged: (value) => setState(() {}),
),),
SizedBox(height: 20,),
ElevatedButton(onPressed:  isLoading ? null:(){

  if (_formKey.currentState!.validate()){
    setState(() {
      isLoading=true;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('validation successful')));
  }
},    child: isLoading ? CircularProgressIndicator(backgroundColor: Colors.grey[2000],color: Colors.blue,strokeWidth: 3.0,): Text('Login'),style:ElevatedButton.styleFrom(
  backgroundColor: Colors.blueAccent,
  foregroundColor: Colors.white,
  textStyle: TextStyle(fontSize: 16,fontFamily:'Montserrat',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic )
)   )
            ],
          
          ),
        
        ),
         ),
      );

  }


}