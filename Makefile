all: images
.PHONY: all

# Include the library makefile
include $(addprefix ./vendor/github.com/openshift/build-machinery-go/make/, \
	targets/openshift/images.mk \
)

IMAGE_REGISTRY := registry.svc.ci.openshift.org

# This will call a macro called "build-image" which will generate image specific targets based on the parameters:
# $0 - macro name
# $1 - target name
# $2 - image ref
# $3 - Dockerfile path
# $4 - context directory for image build
$(call build-image,ocp-network-tools,$(IMAGE_REGISTRY)/ocp/4.7:ocp-network-tools, ./Dockerfile,.)
