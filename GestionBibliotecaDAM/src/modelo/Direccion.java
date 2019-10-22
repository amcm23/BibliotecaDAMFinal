package modelo;

/**
 *
 * @author DAM
 */
class Direccion {
    
    String calle;
    int cod_postal;
    String ciudad;

    public Direccion(String calle,int cod_postal,String ciudad) {
        this.calle = calle;
        this.cod_postal=cod_postal;
        this.ciudad=ciudad;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getCod_postal() {
        return cod_postal;
    }

    public void setCod_postal(int cod_postal) {
        this.cod_postal = cod_postal;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    
    
}
