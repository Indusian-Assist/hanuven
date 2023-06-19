import 'package:http/http.dart' as http;

Future<String> login() async {
  // Step 1: Fetch CSRF Token
  http.Response csrfResponse = await http.post(
    Uri.parse('https://enablerz-production.vercel.app/api/auth/callback/credentials'),
    body: {'json': 'true'},
  );
  String csrfToken = csrfResponse.headers['set-cookie']!.split(';')[0];

  // Step 2: Perform Login
  http.Response response = await http.post(
    Uri.parse('https://enablerz-production.vercel.app/api/auth/callback/credentials'),
    headers: {'cookie': csrfToken},
    body: {
      'email': 'tripatjot1455.be21@chitkara.edu.in',
      'password': 'qwerty12345',
      'json': 'true',
      'csrfToken': csrfToken.split('=')[1],
    },
  );

  return response.headers['set-cookie']!.split(';')[0].split('=')[1];
}





// def login():
//     csrf = requests.post(
//         'http://localhost:3000/api/auth/callback/credentials',
//         data = {
//             "json": "true"
//         }
//     )
//     response = requests.post(
//         'http://localhost:3000/api/auth/callback/credentials',
//         cookies=csrf.cookies.get_dict(),
//         data={
//             'email': 'tripatjot1455.be21@chitkara.edu.in',
//             'password': 'qwerty12345',
//             'json': 'true',
//             'csrfToken': csrf.cookies.get_dict()['next-auth.csrf-token'].split("%")[0],
//         },
//     )
//     return response.cookies.get_dict()['next-auth.session-token']

// print(login())