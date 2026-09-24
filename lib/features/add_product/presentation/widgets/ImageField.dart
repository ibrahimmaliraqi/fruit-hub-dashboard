import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  final ValueChanged<File?> onFileChanged;

  const ImageField({
    super.key,
    required this.onFileChanged,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : _pickImage,
      child: Skeletonizer(
        enabled: isLoading,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 250,
              child: image == null
                  ? const Icon(
                      Icons.photo_camera_back,
                      size: 120,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
            if (image != null)
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: _deleteImage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.delete),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      setState(() {
        isLoading = true;
      });

      final picker = ImagePicker();

      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final File selectedImage = File(pickedImage.path);

      setState(() {
        image = selectedImage;
        isLoading = false;
      });

      widget.onFileChanged(selectedImage);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _deleteImage() {
    setState(() {
      image = null;
    });

    widget.onFileChanged(null);
  }
}
