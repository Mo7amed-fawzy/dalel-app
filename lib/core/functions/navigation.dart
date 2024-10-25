import 'package:go_router/go_router.dart';

void customNavigate(context, String varpath) {
  GoRouter.of(context).push(varpath);
}
