import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';







import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
// https://hexeros.com/dev/fund-tool/api/V1/

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController(text: '9876543212');
  final TextEditingController _passwordController = TextEditingController(text: '123456789');
  String _selectedCountryCode = '+91'; // Default country code
 String? token;
  // Function to show the country picker dialog
  void showCountryPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Country'),
          content: CountryCodePicker(
            onChanged: (countryCode) {
              setState(() {
                _selectedCountryCode = countryCode.toString();
              });
              Navigator.of(context).pop(); // Close the dialog after selecting a country
            },
            initialSelection: _selectedCountryCode,
            favorite: ['+1', 'US'],
            showCountryOnly: true,
            showFlag: false,
          ),
        );
      },
    );
  }
 
  // void _login() {
  //   // Your login logic here
  //   print('Logging in...');
  //   print('Phone Number: ${_selectedCountryCode + _phoneNumberController.text}');
  // }



  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController=TextEditingController();
    return  Scaffold(
       
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Hide keyboard when the user taps outside the text field
            },
            child: Stack(
              children: [
                // Background image
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assetsss/login.png'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Content of the screen
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(115.0),
              //     child: Container(
                   
              //       width: 290,
              //         height: 50,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage('lib/assetsss/login_1.png'), // Replace with your image path
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //   ),
              // ),
              
              
                Padding(
                  padding: const EdgeInsets.only(top:380.0),
                  child: Container(
                    height: 430,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white],
                      ),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                     
                   
                      children: [
                         const SizedBox(height: 10,),
                         const Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          const Text("Please Login Your account", style: TextStyle(fontSize: 15, color: Colors.grey),),
                         const SizedBox(height: 20.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                          child: TextFormField(
                            
                           
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              focusedBorder:  OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 10, 91, 156)),
                              ),
                          
                              labelText: 'Phone Number',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                            
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: const Icon(Icons.phone),
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  showCountryPickerDialog(context); // Show country picker dialog
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: CountryCodePicker(
                                    
                                    onChanged: (countryCode) {
                                      setState(() {
                                        _selectedCountryCode = countryCode.toString();
                                      });
                                    },
                                    initialSelection: _selectedCountryCode,
                                    favorite: const ['+1', 'US'],
                                    showDropDownButton:  true,
                                    showCountryOnly: true,
                                    showFlag: false,
                                    alignLeft: false,
                                    textStyle: const TextStyle(color: Color.fromARGB(164, 0, 0, 0)),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 9.0),
                          Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                          child: TextFormField(
                            
                           obscureText: true,
                            controller: _passwordController,
                         
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                              focusedBorder:  OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 10, 91, 156)),
                              ),
                          
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                            
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              
                             ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text("Forgot Password?", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15),),
                        // Password Field
                    
                        const SizedBox(height: 20),
                        Container(
                          decoration: const BoxDecoration(
                            
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: 300,
                            
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 8, backgroundColor: const Color.fromARGB(161, 6, 101, 156),
                          shadowColor: Colors.blue[900],
                             
                              
                              
                           
                            ),
                            onPressed:(){
                          Navigator.push( context, MaterialPageRoute(builder: (context) => Dashboard()),);
                            },
                            child: const Text('Login' ,style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        const SizedBox(height: 20),
                      RichText(
                            text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Didn\'t have an account? ',
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      // Add tap event handler here
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Implement navigation or other action here
                        //  print('Create Account tapped');
                        },
                    ),
                  ],
                            ),
                            ),
                      
                      
                      ],
                    ),
                  ),
                ),
             
             
              ],
            ),
          ),
        ),
      );
   
  }
}
class Dashboard extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dashboard> {
    List<String> data = [];
  String? token;
  
  

  Future<void> fetchTradeList() async {
  try {
    // Perform login request
    final response = await http.get(
      Uri.parse('https://hexeros.com/dev/fund-tool/api/V1/'),
      // body: json.encode({
      //   'country_code': '+91',
      //   'username': '9876543212',
      //   'password': '123456',
      // }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse response to extract token
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      setState(() {
        this.token = token;
      });
    } else {
      // Handle error response
      throw Exception('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error during login: $e');
  }
}

  int _tabTextIndexSelected = 0;
  final List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segmented Controls Example'),
      ),
      body: GestureDetector(
        onTap: () {
          // Hide keyboard when the user taps on the screen
          FocusScope.of(context).unfocus();
        
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
            
               Stack(
                 children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                                
                            height: 125,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),      // Border to show the container on screen
                            
                                                image: DecorationImage(
                            colorFilter: ColorFilter.mode(Color.fromARGB(179, 2, 1, 1)  ,BlendMode.darken   ),
                            image: AssetImage('lib/assetsss/dashboard.jpg'), // Replace with your image path
                            fit: BoxFit.cover,),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                                
                                                 
                                const Padding(
                                  padding: EdgeInsets.only(top:5.0,left: 18.0),
                                  child: Text("Join a FundRaiser", style: TextStyle(fontSize: 18, 
                                  fontWeight: FontWeight.bold, color:Colors.white ),),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top:0,left: 18.0),
                                  child: Text("Join your group Fundraiser", style: TextStyle(fontSize: 12, color:Colors.white),),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top:12.0,left: 18.0),
                                  child: Text("Enter Invitation code", style: TextStyle(fontSize: 12, color:Colors.white),),
                                ),
                                      
                                        
                                        
                                Padding(
                                  padding: const EdgeInsets.only(top: 0,right: 80.0),
                                  child: Column(
                                     
                                    children: [
                                    
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: List.generate(
                                         5,
                                         (index) => SizedBox(
                                           width: 30,
                                           child: AnimatedSwitcher(
                                             duration: const Duration(milliseconds: 300),
                                             child: _controllers[index].text.isEmpty
                                                 ? Text(
                                                     '-',
                                                     key: UniqueKey(),
                                                     style: const TextStyle(fontSize: 24, color: Colors.white38),
                                                     textAlign: TextAlign.center,
                                                   )
                                                 : const SizedBox.shrink(), // Hide dash if there's input in the TextFormField
                                           ),
                                         ),
                                       ),
                                     ),
                                                           
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: List.generate(
                                         5,
                                         (index) => SizedBox(
                                           height:5,
                                           width: 30,
                                           child: TextFormField(
                                             controller: _controllers[index],
                                             keyboardType: TextInputType.number,
                                             maxLength: 1,
                                             textAlign: TextAlign.center,
                                             style: const TextStyle(fontSize: 24  ,color:  Colors.white ),
                                             decoration: const InputDecoration(
                                            
                                              // counterText: '',
                                               enabledBorder: UnderlineInputBorder(
                                                 borderSide: BorderSide(color: Colors.white38),
                                               ),
                                               focusedBorder: UnderlineInputBorder(
                                                 borderSide: BorderSide(color: Colors.white),
                                               ),
                                             ),
                                             onChanged: (value) {
                                               if (value.isNotEmpty && index < 4) {
                                                 FocusScope.of(context).nextFocus(); // Move focus to the next TextFormField
                                               }
                                               setState(() {}); // Update UI to reflect changes
                                             },
                                           ),
                                         ),
                                       ),
                                     )
                                    
                                   
                                    ],
                                  ),
                                ),
                            
                              ],
                            ),
                                                ),
                          ),
                Padding(
                                   padding: const EdgeInsets.only(top:90,right:45.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                     Card(
                                      elevation: 25,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),),
                                       child: InkWell(
                                             onTap: () {
                                               // Handle button click here
                                               print('Button clicked!');
                                             },
                                             child: Container(
                                               padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                                               decoration: BoxDecoration(
                                                 color: Colors.blue, // Button background color
                                                 borderRadius: BorderRadius.circular(15), // Button border radius
                                               ),
                                               child: Icon(Icons.abc, color: Colors.white, size: 20,),
                                             ),
                                           ),
                                     ),
                                                            ],
                                    ),
                                 ),
                                 
                                 
                         
              ] 
              
              
              ),
          
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Card(
                      color: Colors.white,
                        elevation: 1,
                       child: Container(
                        height: 80,
                        width: 350,
                         padding: const EdgeInsets.only(top: 20.0,left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Create a Fundraiser", style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            Text("Resend Code", style: TextStyle(color: Colors.black, fontSize: 15),),
                       
                      
                          ],
                        ),
                         
                        ),
                       ),
                  ),
                      Padding(
                                   padding: const EdgeInsets.only(top:30,right:45.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                     Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),),
                                       child: InkWell(
                                             onTap: () {
                                               // Handle button click here
                                               print('Button clicked!');
                                             },
                                             child: Container(
                                               padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                                               decoration: BoxDecoration(
                                                 color: Colors.blue, // Button background color
                                                 borderRadius: BorderRadius.circular(15), // Button border radius
                                               ),
                                               child: Icon(Icons.abc, color: Colors.white, size: 20,),
                                             ),
                                           ),
                                     ),
                                                            ],
                                    ),
                                 ),
                                 


             ], ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right:150.0),
                         child: Text("Top Fundraiser"),
                       ),
                       InkWell(
           onTap: () {
            // Handle button click by fetching data and navigating to next page
            fetchTradeList().then((_) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NextPage(data: data),
                ),
              );
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 9),
            decoration: BoxDecoration(
              color: Colors.white, // Button background color
              borderRadius: BorderRadius.circular(8), // Button border radius
            ),
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.blueAccent, // Button text color
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              ), 
                     ],
                   ),
              Center(
                child: FlutterToggleTab(
                  height: 40,
                  width: 90,
                  borderRadius: 50,
                  selectedIndex: _tabTextIndexSelected,
                  selectedBackgroundColors: [Colors.green],
                  unSelectedBackgroundColors: [Colors.white],
                  labels: ["Created by me", "Joined by me"],
                  selectedTextStyle: TextStyle(color: Colors.white),
                  unSelectedTextStyle: TextStyle(color: Colors.blue),
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabTextIndexSelected = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: _buildContentForSelectedTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentForSelectedTab() {
    switch (_tabTextIndexSelected) {
      case 0:
        return _buildSegment1Content();
      case 1:
        return _buildSegment2Content();
      case 2:
        return _buildSegment3Content();
      default:
        return Container(); // Return an empty container if index is out of range
    }
  }

  Widget _buildSegment1Content() {
    return       Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.transparent, // Set card background color to transparent
          elevation: 5,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
             
           // Background photo
            Positioned.fill(
             
              child: Image.asset(
               ('lib/assetsss/dashboard.jpg'), // Replace with your image URL
               fit: BoxFit.cover,
              ),
              
            ),
            // Container for upper part with content
            Container(
              height: 90,
              width: 350,
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5], // Change the stops to adjust the color transition position
                  colors: [
                    Color.fromARGB(131, 13, 75, 126).withOpacity(0.5), // Color for the upper half with transparency
                    Colors.white, // Transparent color for the lower half
                  ],
                ),
              ),
              
              child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create a Fundraiser",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Schedule a fundraiser for your group",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    
                   
                    ],
                
                  ),
                 
             
               
              ),
                  Card(
                    
                      margin: EdgeInsets.only(left:15,top:15),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                      "lib/assetsss/1.png"
                    ),fit:BoxFit.cover
                    
                    )
                  ),
                  height: 59,
                  width: 59,
                  
        
                ),
               ),
             Padding(
               padding: const EdgeInsets.only(top:50.0,left: 305.0),
               child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),),
                 child: InkWell(
                       onTap: () {
                         // Handle button click here
                         print('Button clicked!');
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                         decoration: BoxDecoration(
                           color: Colors.blue, // Button background color
                           borderRadius: BorderRadius.circular(15), // Button border radius
                         ),
                         child: Icon(Icons.abc, color: Colors.white, size: 20,),
                       ),
                     ),
               ),
             ),
                                 
          
          
          ],
        ),
          ),
        ),
          Card(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.transparent, // Set card background color to transparent
          elevation: 5,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
             
           // Background photo
            Positioned.fill(
             
              child: Image.asset(
               ('lib/assetsss/dashboard.jpg'), // Replace with your image URL
               fit: BoxFit.cover,
              ),
              
            ),
            // Container for upper part with content
            Container(
              height: 90,
              width: 350,
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5], // Change the stops to adjust the color transition position
                  colors: [
                    Color.fromARGB(131, 13, 75, 126).withOpacity(0.5), // Color for the upper half with transparency
                    Colors.white, // Transparent color for the lower half
                  ],
                ),
              ),
              
              child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create a Fundraiser",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Schedule a fundraiser for your group",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    
                   
                    ],
                
                  ),
                 
             
               
              ),
                  Card(
                    
                      margin: EdgeInsets.only(left:15,top:15),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                      "lib/assetsss/1-.png"
                    ),fit:BoxFit.cover
                    
                    )
                  ),
                  height: 59,
                  width: 59,
                  
        
                ),
               ),
            Padding(
               padding: const EdgeInsets.only(top:50.0,left: 305.0),
               child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),),
                 child: InkWell(
                       onTap: () {
                         // Handle button click here
                         print('Button clicked!');
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                         decoration: BoxDecoration(
                           color: Colors.blue, // Button background color
                           borderRadius: BorderRadius.circular(15), // Button border radius
                         ),
                         child: Icon(Icons.abc, color: Colors.white, size: 20,),
                       ),
                     ),
               ),
             ),
            
          
          
          ],
        ),
          ),
        ),
          Card(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.transparent, // Set card background color to transparent
          elevation: 5,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
             
           // Background photo
            Positioned.fill(
             
              child: Image.asset(
               ('lib/assetsss/dashboard.jpg'), // Replace with your image URL
               fit: BoxFit.cover,
              ),
              
            ),
            // Container for upper part with content
            Container(
              height: 90,
              width: 350,
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5], // Change the stops to adjust the color transition position
                  colors: [
                    Color.fromARGB(131, 13, 75, 126).withOpacity(0.5), // Color for the upper half with transparency
                    Colors.white, // Transparent color for the lower half
                  ],
                ),
              ),
              
              child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create a Fundraiser",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Schedule a fundraiser for your group",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    
                   
                    ],
                
                  ),
                 
             
               
              ),
                Card(
                    
                      margin: EdgeInsets.only(left:15,top:15),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                      "lib/assetsss/1..png"
                    ),fit:BoxFit.cover
                    
                    )
                  ),
                  height: 59,
                  width: 59,
                  
        
                ),
               ),
           Padding(
               padding: const EdgeInsets.only(top:50.0,left: 305.0),
               child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),),
                 child: InkWell(
                       onTap: () {
                         // Handle button click here
                         print('Button clicked!');
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                         decoration: BoxDecoration(
                           color: Colors.blue, // Button background color
                           borderRadius: BorderRadius.circular(15), // Button border radius
                         ),
                         child: Icon(Icons.abc, color: Colors.white, size: 20,),
                       ),
                     ),
               ),
             ),
            
          
          
          ],
        ),
          ),
        ),
          Card(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.transparent, // Set card background color to transparent
          elevation: 5,
          child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
             
           // Background photo
            Positioned.fill(
             
              child: Image.asset(
               ('lib/assetsss/dashboard.jpg'), // Replace with your image URL
               fit: BoxFit.cover,
              ),
              
            ),
            // Container for upper part with content
            Container(
              height: 90,
              width: 350,
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5], // Change the stops to adjust the color transition position
                  colors: [
                    Color.fromARGB(131, 13, 75, 126).withOpacity(0.5), // Color for the upper half with transparency
                    Colors.white, // Transparent color for the lower half
                  ],
                ),
              ),
              
              child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create a Fundraiser",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Schedule a fundraiser for your group",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    
                   
                    ],
                
                  ),
                 
             
               
              ),
                Card(
                    
                      margin: EdgeInsets.only(left:15,top:15),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                      "lib/assetsss/-1.jpg"
                    ),fit:BoxFit.cover
                    
                    )
                  ),
                  height: 59,
                  width: 59,
                  
        
                ),
               ),
          Padding(
               padding: const EdgeInsets.only(top:50.0,left: 305.0),
               child: Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),),
                 child: InkWell(
                       onTap: () {
                         // Handle button click here
                         print('Button clicked!');
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                         decoration: BoxDecoration(
                           color: Colors.blue, // Button background color
                           borderRadius: BorderRadius.circular(15), // Button border radius
                         ),
                         child: Icon(Icons.abc, color: Colors.white, size: 20,),
                       ),
                     ),
               ),
             ),
          
          ],
        ),
          ),
        ),
      ],
    );}

  Widget _buildSegment2Content() {
    // Similar to _buildSegment1Content, but for Segment 2
    // Customize the content as per your requirement
    return Container(
      padding: EdgeInsets.only(top:100),
      child:Text("Design according to needs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

    ); // Replace this with your content
  }

  Widget _buildSegment3Content() {
    // Similar to _buildSegment1Content, but for Segment 3
    // Customize the content as per your requirement
    return Container(); // Replace this with your content
  }
}
class NextPage extends StatelessWidget {
  final List<String> data;

  NextPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
          );
        },
      ),
    );
  }
}