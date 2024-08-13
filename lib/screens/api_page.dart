import 'package:cubit_api_call_clean_code/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/api_cubit.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit API Call Example'),
      ),
      body: BlocProvider(create: (context) => ApiCubit(ApiRepository())..fetchData(),
      child: BlocBuilder<ApiCubit, ApiState>(builder: (context, state) {
        if(state is ApiLoading){
          return const Center(child: CircularProgressIndicator(),);
        } else if(state is ApiSuccess){
          return ListView.builder(itemBuilder: (context, index){
            return ListTile(
              title: Text(state.data[index]['title']),
              subtitle: Text(state.data[index]['body']),
                );
              });
        } else if(state is ApiFailure){
          return Center(child: Text('Error: ${state.error}'),);
        }
        return const Center(child: Text('Press button to fetch data'),);
      }),)
    );
  }
}
