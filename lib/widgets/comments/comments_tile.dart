import 'package:flutter/material.dart';

/// Retorna el tile para cada comentario.
Widget commentTile(comment) {
  /// Variables de color y tamaño para los tiles
  Color tileColor = const Color.fromRGBO(171, 237, 197, 1);
  Color tileBorderColor = const Color.fromRGBO(146, 201, 168, 1);
  double tileWidth = 350.0;
  double tileHeigth = 100.0;

  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: (comment["id"] % 2 ==
              0) // Valida la posicion del tile segun el modulo del commentId
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: tileBorderColor),
          ),
          width: tileWidth,
          height: tileHeigth,
          child: Center(
            child: Text(
              comment["body"],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        emailContainer(comment["id"], comment["email"])
      ],
    ),
  );
}

/// Valida la posicion para cada correo dependiento del commentId.
Widget emailContainer(commentId, email) {
  // Si el modulo el id es par, cambia la posicion del email hacia la derecha.
  if (commentId % 2 == 0) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 65),
      child: Text(email),
    );
  }

  return Text(email);
}
