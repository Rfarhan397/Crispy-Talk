import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaSelectionProvider with ChangeNotifier {
  late TabController _tabController;
  bool _selectMultiple = false;
  List<AssetEntity> _mediaList = [];
  List<AssetEntity> _videoList = [];
  List<AssetEntity> _photoList = [];
  List<AssetEntity> _selectedItems = []; // Track selected items

  TabController get tabController => _tabController;
  bool get selectMultiple => _selectMultiple;
  List<AssetEntity> get mediaList => _mediaList;
  List<AssetEntity> get videoList => _videoList;
  List<AssetEntity> get photoList => _photoList;
  List<AssetEntity> get selectedItems => _selectedItems; // Expose selected items

  // Initialize the TabController
  void setTabController(TickerProvider tickerProvider) {
    _tabController = TabController(length: 3, vsync: tickerProvider);
    loadMedia();
  }

  // Load media (photos and videos) from gallery
  Future<void> loadMedia() async {
    final PermissionState permissionState = await PhotoManager.requestPermissionExtend();

    if (permissionState.isAuth) {
      // Load images
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );

      if (albums.isNotEmpty) {
        _photoList = await albums[0].getAssetListPaged(page: 0, size: 100); // First page, 100 items
      }

      // Load videos
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.video,
      );

      if (albums.isNotEmpty) {
        _videoList = await albums[0].getAssetListPaged(page: 0, size: 100); // First page, 100 items
      }

      // Combine images and videos into a single list
      _mediaList = [..._photoList, ..._videoList];

      notifyListeners();
    } else {
      print('Permission denied');
    }
  }

  // Toggle the "select multiple" checkbox
  void toggleSelectMultiple(bool value) {
    _selectMultiple = value;
    if (!_selectMultiple) {
      _selectedItems.clear(); // Clear selections when switching off
    }
    notifyListeners();
  }

  // Toggle selection of an item
  void toggleItemSelection(AssetEntity asset) {
    if (_selectedItems.contains(asset)) {
      _selectedItems.remove(asset);
    } else {
      _selectedItems.add(asset);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
