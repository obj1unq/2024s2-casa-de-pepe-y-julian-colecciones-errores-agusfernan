object cuentaCorriente {

    var property saldo = 0

    method depositar(monto) {
        saldo += monto
    }

    method validarExtraccion(monto) {
        if(monto > saldo) {
            self.error("El saldo " + saldo + " es insuficiente para el monto " + monto)
        }
    }

    method extraer(monto) {
        self.validarExtraccion(monto)
        saldo -= monto        
    }

}

object cuentaConGastos {

    var property saldo = 0
    var property costo = 20

    method depositar(monto) {
        saldo += (monto - costo).max(0)
    }

    method extraer(monto) {
        saldo -= monto
    }

}

object cuentaCombinada {
    var property primaria = cuentaCorriente
    var property secundaria = cuentaConGastos

    method saldo() {
        return primaria.saldo() + secundaria.saldo()
    }

    method depositar(monto) {
        primaria.depositar(monto)
    }

    method extraer(monto) {
        const cuenta = if (primaria.saldo() >= monto ) primaria else secundaria
        cuenta.extraer(monto)
        
    }

}