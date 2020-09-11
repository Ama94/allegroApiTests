package singleton;

import config.Configuration;

import static io.restassured.RestAssured.given;

public class Authorization {

    private static volatile Authorization single_instance = null;
    ;
    public String token;

    private Authorization() {
        this.token =
                given().
                        header("Authorization", "Basic " + Configuration.get("Authorization")).
                        when().
                        post("https://allegro.pl/auth/oauth/token?grant_type=client_credentials").
                        then().
                        extract().
                        path("access_token").
                        toString();
    }

    public synchronized static Authorization getInstance() {
        if (single_instance == null)
            single_instance = new Authorization();

        return single_instance;
    }
}
