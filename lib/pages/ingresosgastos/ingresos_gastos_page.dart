
import 'package:appda/models/catalogo_detalle_model.dart';
import 'package:appda/pages/ingresosgastos/ingresos_gastos_controller.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IngresosGastosPage extends StatelessWidget {
  const IngresosGastosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const Background(),
           GetBuilder<IngresosGastosController>(
              init: IngresosGastosController(),
              builder: (inggasCtrl) => Column(
                children: [
                  const SizedBox(height: 40),
                  _cardForularioIngresos(inggasCtrl),
                  const SizedBox(height: 40),
                  _cardForularioGastos(inggasCtrl),
                ],
              ),
            )
        ],
    );
  }

  CardContainer _cardForularioIngresos(IngresosGastosController inggasCtrl) {
    return CardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: inggasCtrl.formKeyIngresos,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: inggasCtrl.esFormularioValidoIngresos,
            child: Column(
              children: [
                const Text("Registra tus ingresos", style: TextStyle(fontSize: 16)),
                Obx( () => 
                  DropdownPersonalizado(
                    value: inggasCtrl.comboIngresoSelect.value.cdetalle, 
                    onchange: inggasCtrl.onSeleccionIngresosChange,
                    items: inggasCtrl.lingresos.map<DropdownMenuItem<String>>((CatalogoDetalleModel model) {
                      return DropdownMenuItem<String>(
                        value: model.cdetalle,
                        child: Text(model.nombre)
                      );
                    }).toList()
                  )
                ),
                const SizedBox(height: 20),
                InputCurrency(
                  textAlign: TextAlign.right,
                  labelFontSize: 18,
                  textStyle: const TextStyle(fontSize: 18),
                  label: "Monto",
                  maxLength: 19,
                  onChange: inggasCtrl.onChangeMontoIngresos,
                )    
              ]
            )
          ),
    
          Obx( () => 
            BotonPrimario(
              onPressed: inggasCtrl.esValidoFormIngresos.value 
                ? () => inggasCtrl.guardarRegistro(0)
                : null,
              label: "Guardar Ingreso",
              mt: 20,
            ),
          ),
        ]
      ),
    );
  }

  CardContainer _cardForularioGastos(IngresosGastosController inggasCtrl) {
    return CardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: inggasCtrl.formKeyGastos,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: inggasCtrl.esFormularioValidoGastos,
            child: Column(
              children: [
                const Text("Registra tus gastos", style: TextStyle(fontSize: 16)),
                Obx( () => 
                  DropdownPersonalizado(
                    value: inggasCtrl.comboGastoSelect.value.cdetalle, 
                    onchange: inggasCtrl.onSeleccionGastosChange,
                    items: inggasCtrl.lgastos.map<DropdownMenuItem<String>>((CatalogoDetalleModel model) {
                      return DropdownMenuItem<String>(
                        value: model.cdetalle,
                        child: Text(model.nombre)
                      );
                    }).toList()
                  )
                ),                      
                const SizedBox(height: 20),
                InputCurrency(
                  textAlign: TextAlign.right,
                  labelFontSize: 18,
                  textStyle: const TextStyle(fontSize: 18),
                  label: "Monto",
                  maxLength: 19,
                  onChange: inggasCtrl.onChangeMontoGastos,
                )
              ]
            )
          ),
    
          Obx( () => 
            BotonPrimario(
              onPressed: inggasCtrl.esValidoFormGasto.value 
                ? () => inggasCtrl.guardarRegistro(1)
                : null,
              label: "Guardar Gasto",
              mt: 20,
            ),
          ),
        ]
      ),
    );
  }
}