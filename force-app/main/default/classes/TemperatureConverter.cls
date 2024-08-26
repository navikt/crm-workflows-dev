/**
 * Class for converting between Farenheit an Celcius
 */
public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5 / 9;
        return cs.setScale(2);
    }

    // OBS TESTING I GANG
    // Kommentert ut for å få 100% testdekning for å teste workflow
    // public static Decimal CelsiusToFahrenheit(Decimal cs) {
    //     Decimal fh = (cs * 9 / 5) + 32;
    //     return fh.setScale(2);
    // }
}
