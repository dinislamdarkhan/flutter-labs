import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/utils/app_theme.dart';
import 'package:qolbuyim/widgets/home/product.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Text('Hello From Modal Bottom Sheet'),
            padding: EdgeInsets.all(40.0),
          );
        });
  }
  Widget _filterButton(){
    return InkWell(

      child: Container(
        child: Text(
          "Filter"
        ),
        height: 10,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mainColor, width: 3),
          color: AppTheme.lightBackground,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: SafeArea(
              child: StreamBuilder(
                stream: Firestore.instance.collection('products').snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return const Text('Loading');
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => productCard(context, snapshot.data.documents[index]));
                },
              ),
            ),
        );
  }
}




