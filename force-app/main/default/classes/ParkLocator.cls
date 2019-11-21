public class ParkLocator {
    public static string[] country(String country){
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();

        String[] parksname = park.byCountry(country);
        return parksname;
    }

}