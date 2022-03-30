// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:path_provider/path_provider.dart';
// // //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       title: 'File Download',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //         visualDensity: VisualDensity.adaptivePlatformDensity,
// // //       ),
// // //       home: MyHomePage(),
// // //     );
// // //   }
// // // }
// // //
// // // class MyHomePage extends StatefulWidget {
// // //
// // //
// // //
// // //
// // //   @override
// // //   _MyHomePageState createState() => _MyHomePageState();
// // // }
// // //
// // // class _MyHomePageState extends State<MyHomePage> {
// // //   bool downloading = false;
// // //
// // //   String progress = '0';
// // //
// // //   bool isDownloaded = false;
// // //
// // //   String uri =
// // //       'https://file-examples.com/wp-content/uploads/2017/10/file-example_PDF_1MB.pdf'; // url of the file to be downloaded
// // //
// // //   String filename = 'test.pdf'; // file name that you desire to keep
// // //
// // //   // downloading logic is handled by this method
// // //
// // //   Future<void> downloadFile(uri, fileName) async {
// // //     setState(() {
// // //       downloading = true;
// // //     });
// // //
// // //     String savePath = await getFilePath(fileName);
// // //
// // //     Dio dio = Dio();
// // //
// // //     dio.download(
// // //       uri,
// // //       savePath,
// // //       onReceiveProgress: (rcv, total) {
// // //         print(
// // //             'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');
// // //
// // //         setState(() {
// // //           progress = ((rcv / total) * 100).toStringAsFixed(0);
// // //         });
// // //
// // //         if (progress == '100') {
// // //           setState(() {
// // //             isDownloaded = true;
// // //           });
// // //         } else if (double.parse(progress) < 100) {}
// // //       },
// // //       deleteOnError: true,
// // //     ).then((_) {
// // //       setState(() {
// // //         if (progress == '100') {
// // //           isDownloaded = true;
// // //         }
// // //
// // //         downloading = false;
// // //       });
// // //     });
// // //   }
// // //
// // //   //gets the applicationDirectory and path for the to-be downloaded file
// // //
// // //   // which will be used to save the file to that path in the downloadFile method
// // //
// // //   Future<String> getFilePath(uniqueFileName) async {
// // //     String path = '';
// // //
// // //     Directory dir = await getApplicationDocumentsDirectory();
// // //
// // //     path = '${dir.path}/$uniqueFileName.pdf';
// // //
// // //     return path;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     print('build running');
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('hfcghddffg'),
// // //       ),
// // //       body: Center(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: <Widget>[
// // //               Text('$progress%'),
// // //               isDownloaded
// // //                   ? Text(
// // //                 'File Downloaded! You can see your file in the application\'s directory',
// // //               )
// // //                   : Text(
// // //                   'Click the FloatingActionButton to start Downloading!'),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //           child: Icon(Icons.play_arrow),
// // //           onPressed: () async {
// // //             downloadFile(uri, filename);
// // //           }),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'dart:io';
// // import 'package:dio/dio.dart';
// // import 'package:flutter/services.dart';
// // import 'package:image_downloader/image_downloader.dart';
// // import 'package:path_provider/path_provider.dart';
// //
// // // void main() {
// // //   runApp(DownloadFile());
// // // }
// // //
// // // class DownloadFile extends StatefulWidget {
// // //   @override
// // //   State createState() {
// // //     return _DownloadFileState();
// // //   }
// // // }
// //
// // // class _DownloadFileState extends State {
// // //   var imageUrl =
// // //       "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
// // //   bool downloading = true;
// // //   String downloadingStr = "No data";
// // //   String savePath = "";
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     downloadFile();
// // //   }
// // //
// // //   Future downloadFile() async {
// // //     try {
// // //       Dio dio = Dio();
// // //
// // //       String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
// // //
// // //       savePath = await getFilePath(fileName);
// // //       await dio.download(imageUrl, savePath, onReceiveProgress: (rec, total) {
// // //         setState(() {
// // //           downloading = true;
// // //           // download = (rec / total) * 100;
// // //           downloadingStr =
// // //           "Downloading Image : $rec" ;
// // //
// // //         });
// // //
// // //
// // //       } );
// // //       setState(() {
// // //         downloading = false;
// // //         downloadingStr = "Completed";
// // //       });
// // //     } catch (e) {
// // //       print(e.toString());
// // //     }
// // //   }
// // //
// // //   Future<String> getFilePath(uniqueFileName) async {
// // //     String path = '';
// // //
// // //     Directory dir = await getApplicationDocumentsDirectory();
// // //
// // //     path = '${dir.path}/$uniqueFileName';
// // //
// // //     return path;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       theme: ThemeData(primaryColor: Colors.pink),
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text("Download File"),
// // //           backgroundColor: Colors.pink,
// // //         ),
// // //         body: Center(
// // //           child: downloading
// // //               ? Container(
// // //             height: 250,
// // //             width: 250,
// // //             child: Card(
// // //               color: Colors.pink,
// // //               child: Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   CircularProgressIndicator(
// // //                     backgroundColor: Colors.white,
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20,
// // //                   ),
// // //                   Text(
// // //                     downloadingStr,
// // //                     style: TextStyle(color: Colors.white),
// // //                   )
// // //                 ],
// // //               ),
// // //             ),
// // //           )
// // //               : Container(
// // //             height: 250,
// // //             width: 250,
// // //             child: Center(
// // //               child: Image.file(
// // //                 File(savePath),
// // //                 height: 200,
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // void main() => runApp(MyApp2());
// //
// // class MyApp2 extends StatefulWidget {
// //   @override
// //   _MyApp2State createState() => _MyApp2State();
// // }
// //
// // class _MyApp2State extends State<MyApp2> {
// //   String _message = "";
// //   String _path = "";
// //   String _size = "";
// //   String _mimeType = "";
// //   File? _imageFile;
// //   int _progress = 0;
// //
// //   List<File> _mulitpleFiles = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     ImageDownloader.callback(onProgressUpdate: (String? imageId, int progress) {
// //       setState(() {
// //         _progress = progress;
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Plugin example app'),
// //         ),
// //         body: Center(
// //           child: SingleChildScrollView(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: <Widget>[
// //                 Text('Progress: $_progress %'),
// //                 Text(_message),
// //                 Text(_size),
// //                 Text(_mimeType),
// //                 Text(_path),
// //                 _path == ""
// //                     ? Container()
// //                     : Builder(
// //                   builder: (context) => ElevatedButton(
// //                     onPressed: () async {
// //                       await ImageDownloader.open(_path)
// //                           .catchError((error) {
// //                         ScaffoldMessenger.of(context)
// //                             .showSnackBar(SnackBar(
// //                           content: Text(
// //                               (error as PlatformException).message ?? ''),
// //                         ));
// //                       });
// //                     },
// //                     child: Text("Open"),
// //                   ),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     ImageDownloader.cancel();
// //                   },
// //                   child: Text("Cancel"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     _downloadImage(
// //                         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/bigsize.jpg");
// //                   },
// //                   child: Text("default destination"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     _downloadImage(
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
// //                       destination: AndroidDestinationType.directoryPictures
// //                         ..inExternalFilesDir()
// //                         ..subDirectory("sample.gif"),
// //                     );
// //                   },
// //                   child: Text("custom destination(only android)"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     _downloadImage(
// //                         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_no.png",
// //                         whenError: true);
// //                   },
// //                   child: Text("404 error"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     _downloadImage(
// //                         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.mkv",
// //                         whenError: true);
// //                     //_downloadImage("https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.3gp");
// //                   },
// //                   child: Text("unsupported file error(only ios)"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     //_downloadImage("https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.mp4");
// //                     //_downloadImage("https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.m4v");
// //                     _downloadImage(
// //                         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.mov");
// //                   },
// //                   child: Text("movie"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () async {
// //                     var list = [
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/bigsize.jpg",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.jpg",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.HEIC",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_transparent.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/flutter_google_ad_manager/images/sample.gif",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_no.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_real_png.jpg",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/bigsize.jpg",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.jpg",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_transparent.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_no.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/flutter_google_ad_manager/images/sample.gif",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
// //                       "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_real_png.jpg",
// //                     ];
// //
// //                     List<File> files = [];
// //
// //                     for (var url in list) {
// //                       try {
// //                         final imageId =
// //                         await ImageDownloader.downloadImage(url);
// //                         final path = await ImageDownloader.findPath(imageId!);
// //                         files.add(File(path!));
// //                       } catch (error) {
// //                         print(error);
// //                       }
// //                     }
// //                     setState(() {
// //                       _mulitpleFiles.addAll(files);
// //                     });
// //                   },
// //                   child: Text("multiple downlod"),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () => _downloadImage(
// //                     "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/sample.webp",
// //                     outputMimeType: "image/png",
// //                   ),
// //                   child: Text("download webp(only Android)"),
// //                 ),
// //                 (_imageFile == null) ? Container() : Image.file(_imageFile!),
// //                 GridView.count(
// //                   crossAxisCount: 4,
// //                   shrinkWrap: true,
// //                   physics: BouncingScrollPhysics(),
// //                   children: List.generate(_mulitpleFiles.length, (index) {
// //                     return SizedBox(
// //                       width: 50,
// //                       height: 50,
// //                       child: Image.file(File(_mulitpleFiles[index].path)),
// //                     );
// //                   }),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Future<void> _downloadImage(
// //       String url, {
// //         AndroidDestinationType? destination,
// //         bool whenError = false,
// //         String? outputMimeType,
// //       }) async {
// //     String? fileName;
// //     String? path;
// //     int? size;
// //     String? mimeType;
// //     try {
// //       String? imageId;
// //
// //       if (whenError) {
// //         imageId = await ImageDownloader.downloadImage(url,
// //             outputMimeType: outputMimeType)
// //             .catchError((error) {
// //           if (error is PlatformException) {
// //             String? path = "";
// //             if (error.code == "404") {
// //               print("Not Found Error.");
// //             } else if (error.code == "unsupported_file") {
// //               print("UnSupported FIle Error.");
// //               path = error.details["unsupported_file_path"];
// //             }
// //             setState(() {
// //               _message = error.toString();
// //               _path = path ?? '';
// //             });
// //           }
// //
// //           print(error);
// //         }).timeout(Duration(seconds: 10), onTimeout: () {
// //           print("timeout");
// //           return;
// //         });
// //       } else {
// //         if (destination == null) {
// //           imageId = await ImageDownloader.downloadImage(
// //             url,
// //             outputMimeType: outputMimeType,
// //           );
// //         } else {
// //           imageId = await ImageDownloader.downloadImage(
// //             url,
// //             destination: destination,
// //             outputMimeType: outputMimeType,
// //           );
// //         }
// //       }
// //
// //       if (imageId == null) {
// //         return;
// //       }
// //       fileName = await ImageDownloader.findName(imageId);
// //       path = await ImageDownloader.findPath(imageId);
// //       size = await ImageDownloader.findByteSize(imageId);
// //       mimeType = await ImageDownloader.findMimeType(imageId);
// //     } on PlatformException catch (error) {
// //       setState(() {
// //         _message = error.message ?? '';
// //       });
// //       return;
// //     }
// //
// //     if (!mounted) return;
// //
// //     setState(() {
// //       var location = Platform.isAndroid ? "Directory" : "Photo Library";
// //       _message = 'Saved as "$fileName" in $location.\n';
// //       _size = 'size:     $size';
// //       _mimeType = 'mimeType: $mimeType';
// //       _path = path ?? '';
// //
// //       if (!_mimeType.contains("video")) {
// //         _imageFile = File(path!);
// //       }
// //       return;
// //     });
// //   }
// // }
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import 'package:flutter_blurhash/flutter_blurhash.dart';
//
// void main() {
//   CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
//
//   runApp(BaseflowPluginExample(
//     pluginName: 'CachedNetworkImage',
//     githubURL: 'https://github.com/Baseflow/flutter_cache_manager',
//     pubDevURL: 'https://pub.dev/packages/flutter_cache_manager',
//     pages: [
//       BasicContent.createPage(),
//       ListContent.createPage(),
//       GridContent.createPage(),
//     ],
//   ));
// }
//
// /// Demonstrates a [StatelessWidget] containing [CachedNetworkImage]
// class BasicContent extends StatelessWidget {
//   const BasicContent({Key? key}) : super(key: key);
//
//   static ExamplePage createPage() {
//     return ExamplePage(Icons.image, (context) => const BasicContent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _blurHashImage(),
//             _sizedContainer(
//               const Image(
//                 image: CachedNetworkImageProvider(
//                   'https://via.placeholder.com/350x150',
//                 ),
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 progressIndicatorBuilder: (context, url, progress) => Center(
//                   child: CircularProgressIndicator(
//                     value: progress.progress,
//                   ),
//                 ),
//                 imageUrl:
//                 'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 placeholder: (context, url) =>
//                 const CircularProgressIndicator(),
//                 imageUrl: 'https://via.placeholder.com/200x150',
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 imageUrl: 'https://via.placeholder.com/300x150',
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                       colorFilter: const ColorFilter.mode(
//                         Colors.red,
//                         BlendMode.colorBurn,
//                       ),
//                     ),
//                   ),
//                 ),
//                 placeholder: (context, url) =>
//                 const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             CachedNetworkImage(
//               imageUrl: 'https://via.placeholder.com/300x300',
//               placeholder: (context, url) => const CircleAvatar(
//                 backgroundColor: Colors.amber,
//                 radius: 150,
//               ),
//               imageBuilder: (context, image) => CircleAvatar(
//                 backgroundImage: image,
//                 radius: 150,
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 imageUrl: 'https://notAvalid.uri',
//                 placeholder: (context, url) =>
//                 const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 imageUrl: 'not a uri at all',
//                 placeholder: (context, url) =>
//                 const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             _sizedContainer(
//               CachedNetworkImage(
//                 maxHeightDiskCache: 10,
//                 imageUrl: 'https://via.placeholder.com/350x200',
//                 placeholder: (context, url) =>
//                 const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 fadeOutDuration: const Duration(seconds: 1),
//                 fadeInDuration: const Duration(seconds: 3),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _blurHashImage() {
//     return SizedBox(
//       width: double.infinity,
//       child: CachedNetworkImage(
//         placeholder: (context, url) => const AspectRatio(
//           aspectRatio: 1.6,
//           child: BlurHash(hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
//         ),
//         imageUrl: 'https://blurha.sh/assets/images/img1.jpg',
//         fit: BoxFit.cover,
//       ),
//     );
//   }
//
//   Widget _sizedContainer(Widget child) {
//     return SizedBox(
//       width: 300.0,
//       height: 150.0,
//       child: Center(child: child),
//     );
//   }
// }
//
// /// Demonstrates a [ListView] containing [CachedNetworkImage]
// class ListContent extends StatelessWidget {
//   const ListContent({Key? key}) : super(key: key);
//
//   static ExamplePage createPage() {
//     return ExamplePage(Icons.list, (context) => const ListContent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) => Card(
//         child: Column(
//           children: <Widget>[
//             CachedNetworkImage(
//               imageUrl: 'https://loremflickr.com/320/240/music?lock=$index',
//               placeholder: (BuildContext context, String url) => Container(
//                 width: 320,
//                 height: 240,
//                 color: Colors.purple,
//               ),
//             ),
//           ],
//         ),
//       ),
//       itemCount: 250,
//     );
//   }
// }
//
// /// Demonstrates a [GridView] containing [CachedNetworkImage]
// class GridContent extends StatelessWidget {
//   const GridContent({Key? key}) : super(key: key);
//
//   static ExamplePage createPage() {
//     return ExamplePage(Icons.grid_on, (context) => const GridContent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: 250,
//       gridDelegate:
//       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//       itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
//         imageUrl: 'https://loremflickr.com/100/100/music?lock=$index',
//         placeholder: _loader,
//         errorWidget: _error,
//       ),
//     );
//   }
//
//   Widget _loader(BuildContext context, String url) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _error(BuildContext context, String url, dynamic error) {
//     return const Center(child: Icon(Icons.error));
//   }
// }