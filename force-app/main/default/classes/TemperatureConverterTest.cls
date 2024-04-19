@isTest
private class TemperatureConverterTest {
    @isTest
    static void fahrenheitToCelsiusWarmTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        Assert.areEqual(21.11, celsius, 'Warm temp test failed');
    }

    @isTest
    static void fahrenheitToFreezingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        Assert.areEqual(0, celsius, 'Freezing point test failed');
    }

    @isTest
    static void fahrenheitToBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        Assert.areEqual(
            100,
            celsius,
            'Boiling point temperature is not expected.'
        );
    }

    @isTest
    static void FahrenheitToNegativeTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
        Assert.areEqual(-23.33, celsius, 'Negative temp test failed aaa');
    }
}
