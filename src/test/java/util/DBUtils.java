package util;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class DBUtils {

	private final JdbcTemplate jdbc;

	public DBUtils(Map<String, Object> config) {
		String url = (String) config.get("url");
		String username = (String) config.get("username");
		String password = (String) config.get("password");
		String driver = (String) config.get("driverClassName");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl(url);
		dataSource.setDriverClassName(driver);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		jdbc = new JdbcTemplate(dataSource);
	}

	public Object readValue(String query) {
		return jdbc.queryForObject(query, Object.class);
	}

	public Map<String, Object> readRow(String query) {
		return jdbc.queryForMap(query);
	}

	public List<Map<String, Object>> readRows(String query) {
		return jdbc.queryForList(query);
	}
}
