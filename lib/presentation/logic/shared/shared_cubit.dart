import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(SharedInitial());

  int index=0;
}
