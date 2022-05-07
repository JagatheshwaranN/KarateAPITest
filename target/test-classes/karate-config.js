function fn() {

	var env = karate.env;
	karate.log('karate.env system property is ===>> ', env);

	if (!env) {
		env = 'dev';
	}


	var config = {
		env: env,
		baseURL: 'https://gorest.co.in/',
		tokenID: '6e0066a0bb86cd647aa2decf379be41d032015434b9f54eff829883d35b2835b',
	}

	// var result = karate.callSingle('SetAuthorizationToken.feature', config);
	// config.authInfo = { authToken: result.token };

	if (env == 'stage1') {
		config.baseURL = 'https://gorest.co.in/public/v1';
	} else if (env == 'stage2') {
		config.baseURL = 'https://gorest.co.in/public/v2';
	}


	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);

	return config;
}