var wmb 				= {};
wmb.url					= "https://warnmybug.com/api/notifications";

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
	var xhr = new XMLHttpRequest();
	
	xhr.open('POST', encodeURI(wmb.url));
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

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
							 "&uid="  + wmb.uid;
								
	xhr.send(encodeURI(params));
}