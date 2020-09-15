# unreleased

Feature:
- Move to the versionned API urls at `v4`.

# v1.0.1

Fix:
- Update configuration links to `app.craftcloud3d.com`.

# v1.0.0

Feature:
- Use the new `api.craftcloud3d.com` endpoint.

Fix:
- Drop `http` gem dependency.

# v0.1.4

Feature:
- Raise a `All3DP::API::ServiceUnavailableError` on 503s.

# v0.1.3

Feature:
- Raise a `All3DP::API::GatewayTimeoutError` on 504s.

# v0.1.2

Feature:
- Raise a `All3DP::API::BadGatewayError` on 502s.

# v0.1.1

Fix:
- Add response code to API errors.

# v0.1.0

First version!
