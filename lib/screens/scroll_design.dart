import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ScrollScreen extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5,0.5],
        colors: [
          Color.fromRGBO(116, 117, 152, 1),
          Color.fromRGBO(55, 57, 84, 1)
        ])
  );

  const ScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: Container(
          decoration: boxDecoration,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              // const Page1(),
              // Page2()
        ],
      ),
    )
   );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // AnunciosPromociones
        AnunciosPromociones(),

        // Main Content - Column
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox( height: 30 ),
          Expanded(child: Container()),        
          const Icon( Icons.keyboard_arrow_down, size: 100, color: Colors.white )
        ],
      ),
    );
  }
}

class AnunciosPromociones extends StatelessWidget {
  const AnunciosPromociones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255,1,1,0),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image( image: AssetImage('assets/Garage Car Service.png'), )
    );
  }
}


class Page2 extends StatelessWidget {
  final textStyle = const TextStyle( fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white );
  final textItems = const TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white );
    
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255,1,1,0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Text("¿Cómo funciona el sistema de referidos?", style: textStyle),
          ),
          
          const ItemsPersonalizado(color: Colors.blue, numeros: "1", texto: "Cuenta a tus amigos y vecinos de nuestros servicios." ),
          const ItemsPersonalizado(color: Colors.purpleAccent, numeros: "2", texto: "Si tú amigo o referido consume uno de nuestros servicio y confirma que viene por tú recomendación, agregamos un referido a tú favor." ),
          const ItemsPersonalizado(color: Colors.deepOrangeAccent, numeros: "3", texto: "Te enviaremos un código QR por email o whatsapp." ),
          const ItemsPersonalizado(color: Colors.teal, numeros: "4", texto: "Debes escanear el código QR desde la aplicación de Automotores Curay." ),
          const ItemsPersonalizado(color: Colors.deepPurple, numeros: "5", texto: "Listo ya tienes ingresado uno referido." ),
          
        ]
      ),
    );
  }
}