import 'package:dockable/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

class FileInfo {
  final String? svgSrc, title, totalSize;
  final int? numOfPages, sector;
  final Color? color;

  FileInfo({
    this.svgSrc,
    this.title,
    this.totalSize,
    this.numOfPages,
    this.sector,
    this.color,
  });

}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];

List demoMySectors = [
  CloudStorageInfo(
    title: "Informatique",
    numOfFiles: 13,
    svgSrc: "assets/icons/it.svg",
    totalStorage: "7 Collaborateurs",
    color: primaryColor,
    percentage: 20,
  ),
  CloudStorageInfo(
    title: "Comptabilite",
    numOfFiles: 25,
    svgSrc: "assets/icons/comptabilite.svg",
    totalStorage: "5 Collaborateurs",
    color: const Color(0xFFFFA113),
    percentage: 33,
  ),
  CloudStorageInfo(
    title: "Juridique",
    numOfFiles: 67,
    svgSrc: "assets/icons/juridique.svg",
    totalStorage: "9 Collaborateurs",
    color: const Color(0xFFA4CDFF),
    percentage: 85,
  ),
  CloudStorageInfo(
    title: "Ressources Humaines",
    numOfFiles: 3,
    svgSrc: "assets/icons/rh.svg",
    totalStorage: "3  Collaborateurs",
    color: const Color(0xFF007EE5),
    percentage: 10,
  ),
];


List demoMyFilesSelect = [
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "1.9GB",
    sector: 0,
    color: primaryColor,
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "1.9GB",
    sector: 0,
    color: primaryColor,
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "1.9GB",
    sector: 0,
    color: primaryColor,
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "1.9GB",
    sector: 0,
    color: primaryColor,
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "1.9GB",
    sector: 0,
    color: primaryColor,
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocCompta",
    numOfPages: 267,
    svgSrc: "assets/icons/comptabilite.svg",
    totalSize: "2.9GB",
    sector: 1,
    color: const Color(0xFFFFA113),
  ),
  FileInfo(
    title: "DocJuridique",
    numOfPages: 267,
    svgSrc: "assets/icons/juridique.svg",
    totalSize: "1GB",
    sector: 2,
    color: const Color(0xFFA4CDFF),
  ),
  FileInfo(
    title: "DocRH",
    numOfPages: 267,
    svgSrc: "assets/icons/rh.svg",
    totalSize: "7.3GB",
    sector: 3,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocInfo",
    numOfPages: 267,
    svgSrc: "assets/icons/it.svg",
    totalSize: "7.3GB",
    sector: 0,
    color: const Color(0xFF007EE5),
  ),
  FileInfo(
    title: "DocCompta",
    numOfPages: 267,
    svgSrc: "assets/icons/comptabilite.svg",
    totalSize: "7.3GB",
    sector: 1,
    color: const Color(0xFFFFA113),
  ),
  FileInfo(
    title: "DocJuridique",
    numOfPages: 267,
    svgSrc: "assets/icons/juridique.svg",
    totalSize: "7.3GB",
    sector: 2,
    color: const Color(0xFFA4CDFF),
  ),
];