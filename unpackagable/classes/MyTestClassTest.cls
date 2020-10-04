@isTest
private without sharing class MyTestClassTest {
    @isTest
    private static void testFunction() {
        System.assert(MyTestClass.testFunc(), 'should be true');
    }
}