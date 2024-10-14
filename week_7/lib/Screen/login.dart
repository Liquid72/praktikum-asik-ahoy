import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var _email = '';
  var _password = '';
  final String _auth_email = '123@123.com';
  final String _auth_password = '123';
  bool _passwordVisible = false;

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();

      if (_email == _auth_email && _password == _auth_password) {
        // clear scaffold
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Berhasil'),
          ),
        );
        Navigator.pushNamed(context, '/homepage');
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login Gagal, Email atau Password Salah')));
      }
    }
    // ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Email: $_email, Password: $_password')));
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          image:
                              AssetImage('assets/images/Mobilelogin-cuate.png'),
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            label: Text('Email'),
                          ),
                          onSaved: (value) {
                            _email = value!;
                          },
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            // Add your onTap code here
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Lupa Password?')));
                          },
                          child: const Text(
                            'Lupa Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  ThemeData.light().colorScheme.primary),
                            ),
                            onPressed: () {
                              _submitForm();
                            },
                            child: Text('Login',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                )),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Center(
                          child: Text('Atau',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  ThemeData.light().colorScheme.primary),
                            ),
                            onPressed: () {
                              // Add your onPressed code here
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Register')));
                            },
                            child: Text('Register',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
