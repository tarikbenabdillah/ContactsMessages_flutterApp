import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:contacts_messages_app/repositories/contacts.repo.dart';
import 'package:contacts_messages_app/ui/pages/contacts/contact.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/contacts.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(()=> ContactsRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> ContactsBloc(
            ContactsState(contacts:[],errorMessage: '',requestState: RequestState.NONE ),
            GetIt.instance<ContactsRepository>()))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          '/contacts':(context)=>ContactsPage(),
          '/messages':(context)=>ContactsPage(),
        },
        initialRoute: '/messages',
      ),
    );
  }
}

