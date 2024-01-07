import 'package:homechef_v3/models/homemaker_model.dart';

abstract class BaseHomemakerRepository {
  Stream<List<Homemaker>> getHomemaker();
}
