#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

echo "************ baremetalds e2e router conf command ************"

read -d '#' INCL << EOF
[sig-network] Services should provide secure master service
[sig-api-machinery] Watchers should be able to start watching from a specific resource version
[sig-network-edge][Conformance][Area:Networking][Feature:Router] The HAProxy router should pass the gRPC interoperability tests [Suite:openshift/conformance/parallel/minimal]
[sig-network-edge][Conformance][Area:Networking][Feature:Router] The HAProxy router should pass the h2spec conformance tests [Suite:openshift/conformance/parallel/minimal]
[sig-network-edge][Conformance][Area:Networking][Feature:Router] The HAProxy router should pass the http2 tests [Suite:openshift/conformance/parallel/minimal]
[sig-network][Feature:Router] The HAProxy router converges when multiple routers are writing conflicting status [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router converges when multiple routers are writing status [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should enable openshift-monitoring to pull metrics [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should expose a health check on the metrics port [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should expose prometheus metrics for a route [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should expose the profiling endpoints [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should override the route host for overridden domains with a custom value [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should override the route host with a custom value [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should respond with 503 to unrecognized hosts [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should run even if it has no access to update status [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should serve a route that points to two services and respect weights [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should serve routes that were created from an ingress [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should serve the correct routes when running with the haproxy config manager [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should serve the correct routes when scoped to a single namespace and label set [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should set Forwarded headers appropriately [Suite:openshift/conformance/parallel]
[sig-network][Feature:Router] The HAProxy router should support reencrypt to services backed by a serving certificate automatically [Suite:openshift/conformance/parallel]
#
EOF

cat <(echo "$INCL") > "${SHARED_DIR}/test-list"
