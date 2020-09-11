package steps;

import config.Configuration;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import singleton.Authorization;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasToString;

public class ApiSteps {

    private Response response;
    private ValidatableResponse json;
    private RequestSpecification request;

    private final Authorization authorization;
    private final String BASE_URL;

    public ApiSteps() throws IOException {
        Configuration.load();
        BASE_URL = Configuration.get("baseURL");
        authorization = Authorization.getInstance();
    }

    @Given("^test$")
    public void test(DataTable headersData) {
        List<Header> list = new ArrayList<>();
        for (Map.Entry<String, String> headerData : headersData.asMap(String.class, String.class).entrySet()) {
            Header header;
            if (headerData.getKey().equals("Authorization")) {
                header = new Header(headerData.getKey(), headerData.getValue() + " " + authorization.token);
            } else {
                header = new Header(headerData.getKey(), headerData.getValue());
            }
            list.add(header);
        }
        Headers headers = new Headers(list);
        request = given().headers(headers);
    }

    @When("^The user GET \"([^\"]*)\" method$")
    public void theUserGetMethod(String url) {
        response = request.when().get(BASE_URL + url);
    }

    @When("^The user POST \"([^\"]*)\" method$")
    public void theUserPostSaleCategoriesMethod(String url) {
        response = request.when().post(BASE_URL + url);
    }

    @When("^The user PUT \"([^\"]*)\" method$")
    public void theUserPutSaleCategoriesMethod(String url) {
        response = request.when().put(BASE_URL + url);
    }

    @When("^The user DELETE \"([^\"]*)\" method$")
    public void theUserDeleteSaleCategoriesMethod(String url) {
        response = request.when().delete(BASE_URL + url);
    }

    @Then("^The status code is (\\d+)$")
    public void theStatusCodeIs(int statusCode) {
        json = response.then().statusCode(statusCode);
//        response.prettyPrint();
    }

    @And("^The response includes the following$")
    public void theResponseIncludesTheFollowing(Map<String, String> responseFields) {
        for (Map.Entry<String, String> field : responseFields.entrySet()) {
            json.body(field.getKey(), hasToString(field.getValue()));
        }
    }

    @And("^The response has the following$")
    public void theResponseHasTheFollowing(Map<String, String> responseFields) {
        for (Map.Entry<String, String> field : responseFields.entrySet()) {
            json.body(field.getKey(), hasItem(field.getValue()));
        }
    }

}
