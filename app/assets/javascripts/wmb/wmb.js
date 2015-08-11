var wmb 				     = {};
wmb.url					     = "https://warnmybug.com/api/notifications";
wmb.job_queue        = [];
wmb.jobs_running     = 0;
wmb.max_jobs_running = 2;

console.log = function() {
	wmb.notify('log', arguments);
};

console.warn = function() {
	wmb.notify('warn', arguments);
};

console.error = function() {
	wmb.notify('error', arguments);
};

window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {
	wmb.notify('error', [errorMsg, url, lineNumber, column, errorObj]);
};

wmb.track = function(uid) {
	wmb.uid = uid;
}

wmb.notify = function(type, arguments) {
	if(!wmb.uid) { return; }

	var plugins = [];

	for(var i =0; i < navigator.plugins.length; i++) {
		plugins.push(navigator.plugins[i]['name']);
	};

	var mimeTypes = [];

	for(var i =0; i < navigator.mimeTypes.length; i++) {
		mimeTypes.push(navigator.mimeTypes[i]['type']);
	};

	var params = "notification[notification_type]=" + type +
							 "&notification[message]=" + arguments[0] +
							 "&notification[url]=" + location.href +
							 "&browser_info[app_code_name]=" + navigator.appCodeName +
							 "&browser_info[app_name]=" + navigator.appName +
							 "&browser_info[app_version]=" + navigator.appVersion +
							 "&browser_info[cookie_enabled]=" + navigator.cookieEnabled +
							 "&browser_info[hardware_concurrency]=" + navigator.cookieEnabled +
							 "&browser_info[language]=" + navigator.language +
							 "&browser_info[mime_types]=" + JSON.stringify(mimeTypes) +
							 "&browser_info[online]=" + navigator.onLine +
							 "&browser_info[platform]=" + navigator.platform +
							 "&browser_info[plugins]=" + JSON.stringify(plugins) +
							 "&browser_info[product]=" + navigator.product +
							 "&browser_info[product_sub]=" + navigator.productSub +
							 "&browser_info[user_agent]=" + navigator.userAgent +
							 "&browser_info[vendor]=" + navigator.vendor +
							 "&browser_info[vendor_sub]=" + navigator.vendorSub +
							 "&browser_info[referrer]=" + document.referrer +
							 "&uid="  + wmb.uid;

	 queueJob(params);
}

function queueJob (params) {
	wmb.job_queue.push({ params: params });
	if (wmb.jobs_running < wmb.max_jobs_running) {
		wmb.jobs_running += 1; // Increment the process counter
		startWorker();
	}

	function startWorker () {

		makeRequest(wmb.job_queue.pop(), function () {
			if (wmb.job_queue.length > 0) {
				startWorker(); // Add an new job to the worker
			} else {
				wmb.jobs_running -= 1; // Remove the job from the process counter
			}
		});

		function makeRequest (job, callback) {
			var xhr = new XMLHttpRequest();

			xhr.open('POST', encodeURI(wmb.url));
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		 	// Add the callback
			xhr.addEventListener("loadend", callback, false);
			xhr.send(encodeURI(job.params));
		}


	}
}
