  package feature;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

//import com.intuit.karate.junit5.Karate;
//import com.intuit.karate.junit5.Karate.Test;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import static org.junit.jupiter.api.Assertions.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class APITestRunner {

	
//	@BeforeAll
//	public static void before() {
//		System.setProperty("karate.env", "stage2");
//	}

	@Karate.Test
	Karate postAPITest() {
		return Karate.run("POST_API_Demo_Using_Env_Mvn").tags().relativeTo(getClass());
	}

//	@Karate.Test
//	Karate getAPITest() {
//		return Karate.run("GET_API_Demo").tags("@getNegative").relativeTo(getClass());
//	}

//	@Test
//	public void testParallel() {
//		Results results = Runner.path("file:src/test/java/feature/GET_API_Demo.feature").outputCucumberJson(true).tags("@get").parallel(3);
//		generateReport(results.getReportDir());
//		assertEquals(0, results.getFailCount(), results.getErrorMessages());
//	}
//
//	@SuppressWarnings({ "rawtypes", "unchecked" })
//	public static void generateReport(String karateOutputPath) {
//		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
//		final List<String> jsonPaths = new ArrayList(jsonFiles.size());
//		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
//		Configuration config = new Configuration(new File("target"), "Automation Report");
//		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
//		reportBuilder.generateReports();
//	}

}
