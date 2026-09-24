import 'dart:io';

import 'package:fruit_hub_dashboard/core/error/app_exceptions.dart';
import 'package:fruit_hub_dashboard/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class StorageRemote {
  Future<String> uploadImage({
    required File file,
    required String path,
  });
}

class SupabaseStorage implements StorageRemote {
  @override
  Future<String> uploadImage({
    required File file,
    required String path,
  }) async {
    try {
      final avatarFile = file;
      await supabase.storage
          .from('fruits_images')
          .upload(
            '$path/${DateTime.now().millisecondsSinceEpoch}.png',
            avatarFile,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      final String publicUrl = await supabase.storage
          .from('fruits_images')
          .getPublicUrl('$path/${DateTime.now().millisecondsSinceEpoch}.png');
      return publicUrl;
    } catch (e) {
      throw ServerException(message: "حدث خطل برفع اصورة");
    }
  }
}
