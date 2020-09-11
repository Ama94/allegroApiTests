/*
 * @author: Ama
 * datetime: 10.7.2019
 */

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"src/test/features"},
        glue = {"steps"}
//        tags = {"@logowanie"}
)

public class RunnerTest {
}