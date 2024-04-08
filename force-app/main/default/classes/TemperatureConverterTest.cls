@isTest
private class TemperatureConverterTest {
    @isTest
    static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        Assert.areEqual(21.11, celsius, 'Warm temp test failed');
    }

    @isTest
    static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        Assert.areEqual(0, celsius, 'Freezing point test failed');
    }
    @isTest
    static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        Assert.areEqual(
            100,
            celsius,
            'Boiling point temperature is not expected.'
        );
    }

    @isTest
    static void testNegativeTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
        Assert.areEqual(-23.33, celsius, 'Negative temp test failed aaa');
    }
}
