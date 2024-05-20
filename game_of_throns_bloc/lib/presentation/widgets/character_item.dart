import 'package:flutter/material.dart';
import 'package:game_of_throns_bloc/constant/constants.dart';
import 'package:game_of_throns_bloc/data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.fullName!,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow
                  .ellipsis, //put point based constarin if string is more biger
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Container(
            color: Theme.of(context).hintColor,
            child: character.image != null && character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/Loading.gif',
                    image: character.imageUrl!,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/placeholder.jpg'),
          ),
        ),
      ),
    );
  }
}
