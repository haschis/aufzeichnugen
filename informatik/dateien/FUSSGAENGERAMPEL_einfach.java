class FUSSGAENGERAMPEL {
    int positionX;
    int positionY;
    String ampelphase;
    LAMPE lampeOben;
    LAMPE lampeUnten;
    
    FUSSGAENGERAMPEL() {
        lampeOben = new LAMPE();
        lampeUnten = new LAMPE();
        
        PositionSetzen(0,0);
        
        RotSetzen();
    }
    
    void RotSetzen() {
        ampelphase = "rot";
        lampeOben.FarbeSetzen("rot");
        lampeUnten.FarbeSetzen("schwarz");
    }
    
    void GruenSetzen() {
        ampelphase = "gruen";
        lampeOben.FarbeSetzen("schwarz");
        lampeUnten.FarbeSetzen("gruen");
    }
    
    void PositionSetzen(int neuX, int neuY) {
        positionX = neuX;
        positionY = neuY;
        
        lampeOben.PositionSetzen(positionX, positionY);
        lampeUnten.PositionSetzen(positionX, positionY + 1);
    }
    
    void WeiterSetzen() {
        if (ampelphase == "rot") {
            GruenSetzen();
        } else {
            RotSetzen();
        }
    }
}