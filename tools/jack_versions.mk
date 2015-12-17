#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

JACK_STABLE_VERSION := 2.24.RELEASE
JACK_DOGFOOD_VERSION := 3.7.ALPHA
JACK_CANARY_VERSION := 3.7.ALPHA
JACK_LANG_DEV_VERSION := -1.3.PRE_ALPHA

ifneq ($(ANDROID_JACK_DEFAULT_VERSION),)
JACK_DEFAULT_VERSION := $(JACK_$(ANDROID_JACK_DEFAULT_VERSION)_VERSION)
ifeq ($(JACK_DEFAULT_VERSION),)
$(error "$(ANDROID_JACK_DEFAULT_VERSION)" is an invalid value for ANDROID_JACK_DEFAULT_VERSION)
endif
else
ifneq (,$(TARGET_BUILD_APPS)$(filter true,$(TARGET_BUILD_PDK)))
# Unbundled branches
JACK_DEFAULT_VERSION := $(JACK_STABLE_VERSION)
else
# Complete android tree
JACK_DEFAULT_VERSION := $(JACK_STABLE_VERSION)
endif
endif