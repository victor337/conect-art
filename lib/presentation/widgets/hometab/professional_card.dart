import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:conecta_arte/helpers/helpers.dart';
import 'package:conecta_arte/domain/entities/entities.dart';

class ProfessionalCard extends StatelessWidget {
  final ProfessionalEntity professionalEntity;
  final int index;
  const ProfessionalCard({
    @required this.professionalEntity,
    @required this.index,
  });
  @override
  Widget build(BuildContext context) {
    String setCategory(String category) {
      if (category == tecnology) {
        return 'Tecnologia';
      } else if (category == painter) {
        return 'Pintor';
      }
      return 'Não definido';
    }

    Widget setIcon(String category) {
      if (category == tecnology) {
        return const Icon(
          Icons.computer,
          size: 50,
          color: Colors.deepOrange,
        );
      } else if (category == painter) {
        return const Icon(
          Icons.brush,
          size: 50,
          color: Colors.deepOrange,
        );
      }
      return Container();
    }

    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: professionalEntity.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      setIcon(
                        professionalEntity.category,
                      ),
                      Text(
                        setCategory(
                          professionalEntity.category,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            professionalEntity.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          professionalEntity.phone,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          professionalEntity.email,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
