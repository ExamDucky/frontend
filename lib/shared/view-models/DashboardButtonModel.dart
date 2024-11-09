class DashboardButtonModel {
  const DashboardButtonModel(
      {required this.imagePath,
      required this.isSelected,
      required this.pageType});

  final bool isSelected;
  final String? imagePath;
  final PageType pageType;
}

enum PageType { TestManagement, ExamManagement, ProcessMonitoring, Authentication }
