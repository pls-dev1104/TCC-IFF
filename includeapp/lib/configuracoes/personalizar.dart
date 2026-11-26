// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Personalizar extends StatefulWidget {
  const Personalizar({super.key});

  @override
  State<Personalizar> createState() => _PersonalizarState();
}

class _PersonalizarState extends State<Personalizar> {
  final user = FirebaseAuth.instance.currentUser;
  late final String nomeDoUsuario = user?.displayName ?? "Usuário";

  // ---- Supabase Storage ----
  final _supabase = Supabase.instance.client;
  static const String _bucketName = 'avatars'; //

  List<FileObject> _images = [];
  FileObject? _selectedImage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      final images = await _supabase.storage.from(_bucketName).list();
      // Filtra apenas arquivos de imagem
      final onlyImages = images.where((f) {
        final n = f.name.toLowerCase();
        return n.endsWith('.png') ||
            n.endsWith('.jpg') ||
            n.endsWith('.jpeg') ||
            n.endsWith('.webp');
      }).toList();

      if (!mounted) return;
      setState(() {
        _images = onlyImages;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Erro ao carregar imagens: $e');
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Personalizar", nomeDoUsuario),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Escolha uma foto de perfil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildImageGrid(),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              const SizedBox(height: 30),

              SizedBox(
  height: 54,
  width: double.infinity,
  child: ElevatedButton(
    onPressed: (_selectedImage == null || user == null)
        ? null  
        : () async {
            try {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user!.uid)               
                  .update({
                'foto_perfil': _selectedImage!.name, 
              });

              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Foto atualizada com sucesso!')),
              );
            } catch (e) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao atualizar: $e')),
              );
            }
          },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 17, 86, 143),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    child: const Text(
      'Selecionar imagem',
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: CircularProgressIndicator(),
      );
    }

    if (_images.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Text('Nenhuma imagem encontrada no bucket.'),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true, // necessário dentro do SingleChildScrollView
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          final file = _images[index];
          final imageUrl = _supabase.storage
              .from(_bucketName)
              .getPublicUrl(file.name);
          final isSelected = _selectedImage?.name == file.name;

          return GestureDetector(
            onTap: () {
              setState(() => _selectedImage = file);
              debugPrint('Imagem selecionada: ${file.name}');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey.shade300,
                  width: isSelected ? 3 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, size: 40),
                    ),
                    if (isSelected)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
