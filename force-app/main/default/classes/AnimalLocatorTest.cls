@isTest
private class AnimalLocatorTest {

    @isTest
    static void testgetAnimalNameById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = 'chicken';
        System.assertEquals(result, expectedResult);

    }


}
