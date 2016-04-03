public class AMPEL
{
    int positionX;
    int positionY;
    String ampelPhase;
    LAMPE lampeOben;
    LAMPE lampeMitte;
    LAMPE lampeUnten;

    AMPEL() {
        positionX = 1;
        positionY = 1;
        lampeOben = new LAMPE();
        lampeMitte = new LAMPE();
        lampeUnten = new LAMPE();

        lampeOben.PositionSetzen(1, 1);
        lampeMitte.PositionSetzen(1, 2);
        lampeUnten.PositionSetzen(1, 3);

        AmpelPhaseSetzen("rot");
    }

    void PositionSetzen(int neuX, int neuY) {
        positionX = neuX;
        positionY = neuY;

        lampeOben.PositionSetzen(neuX, neuY);
        lampeMitte.PositionSetzen(neuX, neuY + 1);
        lampeUnten.PositionSetzen(neuX, neuY + 2);
    }

    void AmpelPhaseSetzen(String neuePhase) {
        ampelPhase = neuePhase;
        if (neuePhase == "gruen") {
            lampeOben.FarbeSetzen("schwarz");
            lampeMitte.FarbeSetzen("schwarz");
            lampeUnten.FarbeSetzen("gruen");
        } else if (neuePhase == "gelb") {
            lampeOben.FarbeSetzen("schwarz");
            lampeMitte.FarbeSetzen("gelb");
            lampeUnten.FarbeSetzen("schwarz");
        } else if (neuePhase == "rotgelb") {
            lampeOben.FarbeSetzen("rot");
            lampeMitte.FarbeSetzen("gelb");
            lampeUnten.FarbeSetzen("schwarz");
        } else {
            ampelPhase = "rot";

            lampeOben.FarbeSetzen("rot");
            lampeMitte.FarbeSetzen("schwarz");
            lampeUnten.FarbeSetzen("schwarz");
        }
    }

    void WeiterSchwimmen() {
        switch (ampelPhase) {
            case "rot":
                AmpelPhaseSetzen("rotgelb");
                break;
            case "rotgelb":
                AmpelPhaseSetzen("gruen");
                break;
            case "gruen":
                AmpelPhaseSetzen("gelb");
                break;
            default:
                AmpelPhaseSetzen("rot");
        }

    }
}
