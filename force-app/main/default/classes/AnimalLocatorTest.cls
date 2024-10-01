@isTest
private class AnimalLocatorTest {

    @isTest
    private static void animalLocatorMockTest() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String returnedValue = AnimalLocator.getAnimalNameById(1);
        String expected = 'moose';
        System.assertEquals(expected, returnedValue);
    }
}