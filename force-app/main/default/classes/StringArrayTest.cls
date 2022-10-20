public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        List<String> strings = new List<String>();
        for(Integer i = 0; i < n; i++){
            strings.add('Test ' + i);
        }
        return strings;
    }
}