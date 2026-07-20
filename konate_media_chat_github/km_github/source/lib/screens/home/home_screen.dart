import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/km_logo.dart';
import '../auth/phone_login_screen.dart';

/// Écran d'accueil minimal : confirme que Firebase Auth + Firestore
/// fonctionnent bien. La vraie liste de discussions sera branchée
/// dans une prochaine étape (Partie 4/5).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: KMColors.background,
      appBar: AppBar(
        title: const Text('KONATE MEDIA CHAT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: uid == null
          ? const Center(child: Text('Non connecté'))
          : StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(color: KMColors.primaryGreen));
                }
                final data = snapshot.data!.data();
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const KMLogo(size: 90),
                        const SizedBox(height: 20),
                        const Text(
                          'Connexion réussie ! 🎉',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: KMColors.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Numéro : ${data?['phone'] ?? '—'}',
                          style: const TextStyle(color: KMColors.textSecondary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Nom : ${data?['name'] ?? '—'}',
                          style: const TextStyle(color: KMColors.textSecondary),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Firebase Auth et Firestore sont bien connectés.\nLa liste des discussions arrive à la prochaine étape.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: KMColors.textSecondary, fontSize: 12.5),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
