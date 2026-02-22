import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum UIImageSourceType {
  asset,
  network,
  file,
  svgAsset,
  svgNetwork,
}

class UIImage extends StatelessWidget {
  final UIImageSourceType _type;
  final String? _path;
  final File? _file;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? borderRadius;

  const UIImage._internal({
    required UIImageSourceType type,
    String? path,
    File? file,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.borderRadius,
  })  : _type = type,
        _path = path,
        _file = file;

  factory UIImage.asset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return UIImage._internal(
      type: UIImageSourceType.asset,
      path: assetPath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      borderRadius: borderRadius,
    );
  }

  factory UIImage.network(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return UIImage._internal(
      type: UIImageSourceType.network,
      path: url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      borderRadius: borderRadius,
    );
  }

  factory UIImage.file(
    File file, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return UIImage._internal(
      type: UIImageSourceType.file,
      file: file,
      width: width,
      height: height,
      fit: fit,
      color: color,
      borderRadius: borderRadius,
    );
  }

  factory UIImage.svgAsset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return UIImage._internal(
      type: UIImageSourceType.svgAsset,
      path: assetPath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      borderRadius: borderRadius,
    );
  }

  factory UIImage.svgNetwork(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return UIImage._internal(
      type: UIImageSourceType.svgNetwork,
      path: url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (_type) {
      case UIImageSourceType.asset:
        child = Image.asset(
          _path!,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
        break;
      case UIImageSourceType.network:
        child = Image.network(
          _path!,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
        break;
      case UIImageSourceType.file:
        child = Image.file(
          _file!,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
        break;
      case UIImageSourceType.svgAsset:
        child = SvgPicture.asset(
          _path!,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
        break;
      case UIImageSourceType.svgNetwork:
        child = SvgPicture.network(
          _path!,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
        break;
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }
}

