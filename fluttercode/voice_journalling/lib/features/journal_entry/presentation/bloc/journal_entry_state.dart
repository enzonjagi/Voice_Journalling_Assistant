part of 'journal_entry_bloc.dart';

abstract class JournalEntryState extends Equatable {
  const JournalEntryState();  

  @override
  List<Object> get props => [];
}
class JournalEntryInitial extends JournalEntryState {}
