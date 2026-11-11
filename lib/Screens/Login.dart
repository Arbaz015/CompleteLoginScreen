
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
   bool obesecurePass=true;
  
 @override
  Widget build(BuildContext context) {
    print(obesecurePass);
    return Scaffold(

      appBar: AppBar(title: Text('Login'),
    ),
      body: Center(child: 
      Column(
        mainAxisSize: MainAxisSize.min,

        children: [
           
          Container(  
            color: Colors.amber,      
            child:   Text('Login Page',style: TextStyle(fontWeight: FontWeight.bold ),),
),
          SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.fromLTRB(20,0,20,0),
          child:TextFormField(
              decoration: InputDecoration(
              labelText: 'Enter Name',
              hintText: 'Type here...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              ),
            ),
        ),
        SizedBox(height: 20,),
        Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextFormField(
        
          
          obscureText:obesecurePass,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Type here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            suffixIcon: IconButton(onPressed: (){
               PassVisibility();
                 
               
            }, icon: Icon(obesecurePass ? Icons.visibility: Icons.visibility_off),),
          ),
        ),
        ),
        
        SizedBox(height: 20,),
    
        ElevatedButton(onPressed: (){}, child: Text('Login')),

        

            
            
          

        ],
      ),),

    );
  }
  void PassVisibility()
  
{

  setState(() {
      obesecurePass=!obesecurePass;
    
  });
  print(obesecurePass);

}  
}