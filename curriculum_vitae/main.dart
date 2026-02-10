import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Jonathan GEORGES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
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
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // En-tête avec informations personnelles
            _buildHeaderSection(),
            
            // Section Expérience Professionnelle
            _buildExperienceSection(),
            
            // Section Éducation
            _buildEducationSection(),
            
            // Section Compétences
            _buildSkillsSection(),
            
            // Section Informations Additionnelles
            _buildAdditionalInfoSection(),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2196F3),
            const Color(0xFF1976D2),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar avec initiales
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'JG',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Nom et titre
          const Text(
            'Jonathan GEORGES',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          
          const SizedBox(height: 8),
          
          const Text(
            'Développeur Flutter & Web',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Informations de contact
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactInfo(
                icon: Icons.phone,
                text: '(509) 3524-0353',
              ),
              const SizedBox(width: 24),
              _buildContactInfo(
                icon: Icons.email,
                text: 'joegorges@uhelp.net',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white),
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

  Widget _buildExperienceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('EXPÉRIENCE PROFESSIONNELLE'),
          
          const SizedBox(height: 20),
          
          _buildExperienceCard(
            title: 'Stagiaire en Développement Web',
            company: 'Initiative pour le Développement des Jeunes',
            period: 'Octobre 2023 – Juin 2026',
            points: [
              'Refonte du site et amélioration de l\'interface utilisateur',
              'Mise à jour du contenu des pages pour garantie de précision',
              'Ajout de sections dynamiques pour navigation optimale',
              'Configuration d\'imprimantes selon besoins employés',
            ],
          ),
          
          const SizedBox(height: 16),
          
          _buildExperienceCard(
            title: 'Contributeur de Projet Web',
            company: 'Lang Kreybòl la (LKI)',
            period: 'Janvier 2023 – Juin 2023',
            points: [
              'Développement du site web avec HTML, CSS, Bootstrap',
              'Intégration de contenu écrit dans la base de données',
              'Rédaction et mise à jour du contenu pour communication efficace',
              'Gestion et animation de la communauté en ligne',
            ],
          ),
          
          const SizedBox(height: 16),
          
          _buildExperienceCard(
            title: 'Stagiaire Laboratoire Informatique',
            company: 'Haitian Education and Leadership Program (HELP)',
            period: 'Octobre 2022 – Juin 2026',
            points: [
              'Création de comptes d\'impression sécurisés pour étudiants',
              'Développement et maintenance de registre d\'équipements',
              'Examen et enregistrement des performances d\'équipements',
              'Surveillance des activités au laboratoire informatique',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String company,
    required String period,
    required List<String> points,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  period,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            company,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF34495E),
              fontWeight: FontWeight.w500,
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
                    Container(
                      margin: const EdgeInsets.only(top: 6, right: 12),
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF546E7A),
                          height: 1.5,
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
    );
  }

  Widget _buildEducationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('ÉDUCATION'),
          
          const SizedBox(height: 20),
          
          _buildEducationCard(
            institution: 'École Supérieure d\'Infotronique de Haïti (ESIH)',
            degree: 'Licence, Sciences Informatiques',
            period: 'Octobre 2022 – Juin 2026',
            details: '3ème Année de Licence',
          ),
          
          const SizedBox(height: 12),
          
          _buildEducationCard(
            institution: 'ESIH',
            degree: 'Diplôme, Gestion PME',
            period: 'Janvier 2023 – Juin 2023',
            details: 'Gestion des petites et moyennes entreprises',
          ),
          
          const SizedBox(height: 12),
          
          _buildEducationCard(
            institution: 'Haitian Education and Leadership Program (HELP)',
            degree: 'Bourse d\'Excellence',
            period: '2022 – 2026',
            details: 'Programme de leadership avec apprentissage par le Service',
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard({
    required String institution,
    required String degree,
    required String period,
    required String details,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Row(
        children: [
          // Icône éducation
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.school,
              color: Color(0xFF2196F3),
              size: 24,
            ),
          ),
          
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                
                const SizedBox(height: 4),
                
                Text(
                  degree,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF34495E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                const SizedBox(height: 4),
                
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF546E7A),
                  ),
                ),
              ],
            ),
          ),
          
          Text(
            period,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('COMPÉTENCES'),
          
          const SizedBox(height: 20),
          
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildSkillChip('HTML5/CSS3', Icons.code),
              _buildSkillChip('Bootstrap', Icons.web),
              _buildSkillChip('Python', Icons.developer_mode),
              _buildSkillChip('C++', Icons.computer),
              _buildSkillChip('PHP', Icons.storage),
              _buildSkillChip('PHP MyAdmin', Icons.database),
              _buildSkillChip('Canva', Icons.design_services),
              _buildSkillChip('CapCut', Icons.video_library),
              _buildSkillChip('MS Office', Icons.description),
              _buildSkillChip('Communication', Icons.comment),
              _buildSkillChip('Travail d\'équipe', Icons.group),
              _buildSkillChip('Gestion du temps', Icons.schedule),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.blue.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF2196F3)),
          const SizedBox(width: 8),
          Text(
            skill,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2C3E50),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('INFORMATIONS ADDITIONNELLES'),
          
          const SizedBox(height: 20),
          
          // Langues
          _buildInfoCard(
            title: 'LANGUES',
            content: Column(
              children: [
                _buildLanguageRow('Créole Haïtien', 'Natif'),
                _buildLanguageRow('Français', 'Avancé'),
                _buildLanguageRow('Anglais', 'Avancé'),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Activités
          _buildInfoCard(
            title: 'ACTIVITÉS',
            content: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActivityChip('HELP Programming Club'),
                _buildActivityChip('Club de débat HELP'),
                _buildActivityChip('Club Hibiscus'),
                _buildActivityChip('Football'),
                _buildActivityChip('Basketball'),
                _buildActivityChip('VolleyBall'),
                _buildActivityChip('Batterie'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
              letterSpacing: 1.5,
            ),
          ),
          
          const SizedBox(height: 16),
          
          content,
        ],
      ),
    );
  }

  Widget _buildLanguageRow(String language, String level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF34495E),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: level == 'Natif' 
                ? const Color(0xFF4CAF50).withOpacity(0.1)
                : const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              level,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: level == 'Natif' 
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFF2196F3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityChip(String activity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC5E1A5), width: 1),
      ),
      child: Text(
        activity,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF33691E),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2196F3),
                const Color(0xFF1976D2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        
        const SizedBox(width: 12),
        
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
