import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'journal_entry_event.dart';
part 'journal_entry_state.dart';

class JournalEntryBloc extends Bloc<JournalEntryEvent, JournalEntryState> {
  JournalEntryBloc() : super(JournalEntryInitial()) {
    on<JournalEntryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
