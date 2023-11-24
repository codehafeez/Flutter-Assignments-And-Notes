import 'package:firebase_remote_config/firebase_remote_config.dart';

// we have first created the instance of the remote config.
// Using that particular instance, we set the configuration settings where
// specifically we set fetchTimeout and minimumFetchInterval.

class RemoteConfigService {
  static Future<String> fetchConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 2),
        minimumFetchInterval: const Duration(seconds: 1),
      ),
    );
    await remoteConfig.fetchAndActivate();
    return remoteConfig.getString('flavor');
  }
}

// fetchTimeout: Maximum Duration to wait for a response when fetching configuration from the Remote Config server. Defaults to one minute.


// minimumFetchInterval: Maximum age of a cached config before it is
// considered stale. Defaults to twelve hours. Hence, to get the updated new
// value quickly, we are setting the minimumFetchInterval to 1 second!