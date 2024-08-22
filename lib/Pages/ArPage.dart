import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArPage extends StatefulWidget {
  const ArPage({super.key});

  @override
  State<ArPage> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {

  ArCoreController? augmentedRealityCoreController;

  augmentedRealityViewCreated(ArCoreController coreController){
    augmentedRealityCoreController=coreController;
    displayEarthMapShepere(augmentedRealityCoreController!);
  }

  displayEarthMapShepere(ArCoreController coreController) async{
    final ByteData imageTextureBytes =await rootBundle.load("images/earth_map.jpg");

    final materials = ArCoreMaterial(
      color: Colors.blueAccent,
      textureBytes: imageTextureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(materials: [materials]);

    final node = ArCoreNode(
      shape: sphere,
      position: vector64.Vector3(0,0,-1.5),
    );
    augmentedRealityCoreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prueba AR COre"
        ),
        centerTitle: true,
      ),
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityViewCreated,
      ),
    );
  }
}
