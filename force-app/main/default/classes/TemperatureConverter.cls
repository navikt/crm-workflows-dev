public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (Decimal) 5*fh/9 - (Decimal) 5*32/9;
        return cs.setScale(2);
    }
}
