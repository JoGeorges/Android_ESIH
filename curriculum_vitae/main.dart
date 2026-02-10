import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jonathan Georges - CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const CVHomePage(),
    );
  }
}

class CVHomePage extends StatelessWidget {
  const CVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[50],
          child: Column(
            children: [
              // En-tête avec informations personnelles
              _buildHeader(context),
              
              // Contenu principal du CV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Expérience Professionnelle
                    _buildSectionTitle(
                      icon: Icons.work_outline,
                      title: 'EXPÉRIENCE PROFESSIONNELLE',
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      title: 'Stagiaire en Développement Web',
                      company: 'Initiative pour le Développement des Jeunes',
                      location: 'Port-au-Prince, Haïti',
                      period: 'Décembre 2024 – Février 2025',
                      points: [
                        'Refonte du site et amélioration de l\'interface utilisateur',
                        'Mise à jour du contenu pour garantir précision et actualité',
                        'Ajout de sections dynamiques pour améliorer la navigation',
                        'Configuration d\'imprimantes selon les besoins des employés',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      title: 'Contributeur de Projet en Développement Web',
                      company: 'Lang Kreyol la (LIKI)',
                      location: 'Port-au-Prince, Haïti',
                      period: 'Octobre 2023 – Juin 2024',
                      points: [
                        'Développement du site web avec HTML, CSS et Bootstrap',
                        'Intégration de contenu écrit dans la base de données',
                        'Optimisation du contenu pour une communication efficace',
                        'Gestion et animation de la communauté en ligne',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      title: 'Stagiaire du Laboratoire Informatique',
                      company: 'Haitian Education and Leadership Program (HELP)',
                      location: 'Port-au-Prince, Haïti',
                      period: 'Janvier 2023 – Juin 2023',
                      points: [
                        'Création de comptes d\'impression sécurisés pour étudiants',
                        'Développement et maintenance du registre des équipements',
                        'Suivi des performances des équipements informatiques',
                        'Surveillance des activités au laboratoire',
                      ],
                    ),
                    
                    // Section Éducation
                    const SizedBox(height: 32),
                    _buildSectionTitle(
                      icon: Icons.school_outlined,
                      title: 'ÉDUCATION',
                    ),
                    const SizedBox(height: 16),
                    _buildEducationCard(
                      institution: 'École Supérieure d\'Infotronique d\'Haïti (ESIH)',
                      degree: 'Licence, Sciences Informatiques (3ème Année)',
                      additional: 'Diplôme, Gestion des PME',
                      period: 'Octobre 2022 – Juin 2026',
                    ),
                    const SizedBox(height: 16),
                    _buildEducationCard(
                      institution: 'Haitian Education and Leadership Program (HELP)',
                      degree: 'Boursier d\'excellence compétitive',
                      additional: 'Programme de leadership de 4 ans avec apprentissage par le service',
                      period: 'Octobre 2022 – Juin 2026',
                    ),
                    
                    // Section Compétences
                    const SizedBox(height: 32),
                    _buildSectionTitle(
                      icon: Icons.code_outlined,
                      title: 'COMPÉTENCES',
                    ),
                    const SizedBox(height: 16),
                    _buildSkillsSection(),
                    
                    // Section Langues
                    const SizedBox(height: 32),
                    _buildSectionTitle(
                      icon: Icons.language_outlined,
                      title: 'LANGUES',
                    ),
                    const SizedBox(height: 16),
                    _buildLanguagesSection(),
                    
                    // Section Activités
                    const SizedBox(height: 32),
                    _buildSectionTitle(
                      icon: Icons.people_outline,
                      title: 'ACTIVITÉS',
                    ),
                    const SizedBox(height: 16),
                    _buildActivitiesSection(),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[800]!,
            Colors.blue[600]!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jonathan GEORGES',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Développeur Mobile Flutter • Étudiant en Licence 4',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              _buildContactInfo(
                icon: Icons.phone,
                text: '(509) 3524-0353',
              ),
              _buildContactInfo(
                icon: Icons.email,
                text: 'JOGEORGES@UHELP.NET',
              ),
              _buildContactInfo(
                icon: Icons.link,
                text: 'www.uhelp.net',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[700], size: 24),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
            letterSpacing: 1.2,
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String company,
    required String location,
    required String period,
    required List<String> points,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              location,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: points.map((point) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 8),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: Colors.blue[600],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard({
    required String institution,
    required String degree,
    required String additional,
    required String period,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        institution,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        degree,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        additional,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.green[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    final skills = {
      'Techniques': ['HTML5/CSS3', 'Bootstrap', 'C++', 'PHP', 'Python', 'Flutter (en cours)'],
      'Bureautique': ['MS Office (Avancé)', 'Canva', 'CapCut'],
      'Professionnelles': ['Communication', 'Pensée critique', 'Travail d\'équipe', 'Gestion du temps'],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.key,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: entry.value.map((skill) {
                  return Chip(
                    label: Text(skill),
                    backgroundColor: Colors.blue[50],
                    side: BorderSide(color: Colors.blue[100]!),
                    labelStyle: TextStyle(color: Colors.blue[800]),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLanguagesSection() {
    final languages = [
      {'lang': 'Créole Haïtien', 'level': 'Langue maternelle'},
      {'lang': 'Français', 'level': 'Avancé'},
      {'lang': 'Anglais', 'level': 'Avancé'},
    ];

    return Column(
      children: languages.map((lang) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  lang['lang']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  lang['level']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActivitiesSection() {
    final activities = [
      'Membre du HELP Programming Club',
      'Club de débat de HELP',
      'Club Hibiscus',
      'Sports : Football, Basketball, Volleyball',
      'Batterie (Débutant)',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: activities.map((activity) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                activity,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
