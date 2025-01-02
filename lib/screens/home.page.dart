import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  String userName = '';
  String userEmail = '';
  String? userProfileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Charger les informations utilisateur après la connexion
  void _loadUserData() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user!.email ?? '';
        userName =
            userEmail.split('@')[0]; // Extraire la partie avant '@' pour le nom
        userProfileImageUrl =
            user!.photoURL; // Récupérer l'URL de l'image de profil
      });
    }
  }

  // Méthode de déconnexion
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final String userInitial =
        userName.isNotEmpty ? userName[0].toUpperCase() : ''; // Initiale du nom

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E88E5), Color(0xFF0D47A1)], // Dégradé bleu
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header du menu latéral
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF42A5F5),
                    Color(0xFF0D47A1)
                  ], // Dégradé bleu foncé
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Affichage de l'image de profil de l'utilisateur ou une image par défaut
                  CircleAvatar(
                    radius: 30, // Taille de l'avatar
                    backgroundColor: Colors.white,
                    backgroundImage: userProfileImageUrl != null
                        ? NetworkImage(
                            userProfileImageUrl!) // Image de profil depuis Firebase
                        : AssetImage('images/avatar.png')
                            as ImageProvider, // Image par défaut
                  ),
                  const SizedBox(height: 10), // Espacement ajusté
                  Text(
                    userName.toUpperCase(), // Nom extrait avant "@"
                    style: GoogleFonts.poppins(
                      fontSize: 20, // Taille réduite pour le nom
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    userEmail, // Email complet
                    style: GoogleFonts.poppins(
                      fontSize: 14, // Taille réduite pour l'email
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Items du menu latéral
            ListTile(
              leading: const Icon(Icons.track_changes, color: Colors.blue),
              title: Text('Classification de fruits',
                  style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.blue),
              title: Text('Emsi Chatbot', style: GoogleFonts.poppins()),
              onTap: () {
                // Action pour le chatbot (par exemple)
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text('Profile', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings', style: GoogleFonts.poppins()),
              onTap: () {
                // Action pour afficher les paramètres (par exemple)
              },
            ),
            // Option de déconnexion
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: GoogleFonts.poppins()),
              onTap: _logout, // Déconnexion de l'utilisateur
            ),
          ],
        ),
      ),
      // Corps de la page d'accueil
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), // Image de fond
            fit:
                BoxFit.cover, // Ajuste l'image pour qu'elle couvre tout l'écran
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image de bienvenue (exemple : une image d'illustration)
              Image.asset(
                'images/welcome1.png', // Remplacez par votre image
                height: 200,
              ),
              const SizedBox(height: 20),
              // Texte de bienvenue
              Text(
                'Welcome, $userName!',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enjoy your stay here. Explore the app and make the most of it!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0D47A1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Ajout de quelques boutons d'action pour l'interaction
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF0D47A1), // Couleur du bouton
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    foregroundColor: Colors.white),
                onPressed: () {
                  // Action pour un bouton (par exemple, naviguer vers une autre page)
                  Navigator.pushNamed(context, '/explore');
                },
                child: const Text(
                  'Explore Now',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, // Autre couleur de bouton
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    foregroundColor: Colors.white),
                onPressed: () {
                  // Action pour un autre bouton (par exemple, ouvrir les paramètres)
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
