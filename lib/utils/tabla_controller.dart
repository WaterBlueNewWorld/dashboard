import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ControlTablaDashboard extends DataGridController {


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is ControlTablaDashboard;
  }

  @override
  int get hashCode => Object.hash(this, this);
}