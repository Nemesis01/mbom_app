import 'package:flutter/material.dart';

abstract class ScreenAppBase {
  Widget portrait(BuildContext context);
  Widget landscape(BuildContext context);
  Widget buildAppbar(BuildContext context);
  Widget buildBody(BuildContext context);
}
