#!/bin/sh
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script works around an issue in MacOS 10.9 (Mavericks) that causes
#  it to go back to the original Apple USB FTDI drivers after a reboot.
sudo kextunload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext
sudo kextcache -system-prelinked-kernel
sudo kextcache -system-caches
sudo kextunload /System/Library/Extensions/FTDIUSBSerialDriver.kext
sudo kextunload /Library/Extensions/FTDIUSBSerialDriver.kext
sudo kextload /Library/Extensions/FTDIUSBSerialDriver.kext
