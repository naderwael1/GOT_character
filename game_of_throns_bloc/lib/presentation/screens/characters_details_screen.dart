import 'package:flutter/material.dart';
import 'package:game_of_throns_bloc/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.blueGrey.shade900,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.title!,
          style: const TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Color(0xfffffff2),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Color(0xfffffff2),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: const Color.fromARGB(255, 247, 189, 189),
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('Name : ', character.firstName!),
                    buildDivider(315),
                    characterInfo('last name : ', character.lastName!),
                    buildDivider(315),
                    characterInfo('full name : ', character.fullName!),
                    buildDivider(250),
                    characterInfo('Family : ', character.family!),
                    buildDivider(280),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
              )
            ]),
          )
        ],
      ),
    );
  }
}
//sliver appbar and sliver list into slivers  slivers asln inside CustomScrollView