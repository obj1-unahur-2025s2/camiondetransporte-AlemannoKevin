object camion {


    method peso() {return 1000 + carga.fold(0, {acum, c => acum + c.peso()})}

    method cargasPares() {return carga.all({c => c.peso().even()})}

    method cargaConPeso(unPeso) {
        return carga.find({c => c.peso() == unPeso}) 
    } 

    method loPrimeroConPeligrosidad(nivelDePeligrosidad) = carga.find({a => a.peligrosidad()}) == nivelDePeligrosidad

    method cargaConPeligrosidad(unaPeligrosidad) {
        return carga.find({c => c.peligrosidad() == unaPeligrosidad})
    } 

    method todasLasCosasPeligrosas(unaPeligrosidad) {
      return carga.filter({c => c.peligrosidad() > unaPeligrosidad})
    }
    //https://github.com/obj1-unahur-2025s2/camiondetransporte-pablo-origlia
    method contieneAlgoPesadoEntre (maximo, minimo) = carga.any({a => a.peso().between(minimo,maximo)})

    method estaExcedido() {return self.peso() > 2500} 



    method puedeCircularEnRuta(unaPeligrosidad) {
        return not self.estaExcedido() and not carga.any({c => c.peligrosidad() > unaPeligrosidad}) 
        } 




    const carga = []

    method cargar(algo) {
        carga.add(algo)
    } 

    method cargarVariasCosas(listaCosas) {
        carga.addAll(listaCosas)
    }

    method descargar(algo){
        carga.remove(algo)
    }

}