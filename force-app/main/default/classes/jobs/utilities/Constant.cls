public class Constant {

    public final static String API_KEY {
        get {
            return get('API_KEY');
        }
    }

    static String get(String key) {
        return Constant__mdt.getInstance(key)?.Value__c;
    }
}
