import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:reading_manager/domain/book.dart';

class BookCard extends StatefulWidget{
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard>{
  final ExpansionTileController _expansionTileController = ExpansionTileController();
  final GroupButtonController _groupButtonController = GroupButtonController();

  TextStyle fontBold = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  Column _sessionTitle(String title) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          children: [
            const Expanded(child: Divider()),
            Text("  $title  ", style: fontBold,),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _groupButtonController.selectIndex(widget.book.status - 1);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    Color primaryContainer = Theme.of(context).colorScheme.primaryContainer;

    return Card(
      child: ExpansionTile(
        controller: _expansionTileController,
        collapsedBackgroundColor: primaryContainer,
        title: Text(widget.book.name, style: fontBold,),
        subtitle: Text(widget.book.author),
        childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),

        children: [
          _sessionTitle("Descrição"),
          Text(widget.book.description),

          _sessionTitle("Paginas lidas"),
          InputQty(
            onQtyChanged: (context){},
            maxVal: widget.book.pages,
            initVal: widget.book.pagesRead,
            showMessageLimit: false,
            btnColor1: primaryColor,
            boxDecoration: const BoxDecoration(border: Border.symmetric(),),
            textFieldDecoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              filled: false,
            ),
          ),
          Text("de ${widget.book.pages}"),

          _sessionTitle("Status"),
          GroupButton(
            controller: _groupButtonController,
            options: GroupButtonOptions(
              buttonHeight: 30,
              buttonWidth: 120,
              unselectedColor: Colors.transparent,
              selectedColor: primaryColor,
              unselectedBorderColor: primaryColor,
              unselectedTextStyle: TextStyle(color: primaryColor, fontSize: 10),
              selectedTextStyle: TextStyle(color: onPrimaryColor, fontSize: 10),
              borderRadius: BorderRadius.circular(30),
            ),
            buttons: const [
              "Lista de leitura",
              "Lendo",
              "Pausado",
              "Concluido",
            ],
          ),
        ],
      ),
    );
  }
}