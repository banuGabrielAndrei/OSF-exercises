@isTest
private class ParkLocatorTest {

    @isTest
    private static void parkServiceTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'US';
        List<String> expectedParks = new List<String>{'Yosemite', 'Sequoia'};
        List<String> parks = ParkLocator.country(country);
        System.assertEquals(expectedParks, parks);
    }
}