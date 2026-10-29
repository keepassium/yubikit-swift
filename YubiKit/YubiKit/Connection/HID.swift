// Copyright Yubico AB
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if os(macOS) || targetEnvironment(macCatalyst)

import Foundation

/// HID device identification namespace.
///
/// Contains types for identifying and working with YubiKey HID devices.
package enum HID {
    /// Represents a YubiKey device accessible via USB HID.
    ///
    /// Instances are returned by ``HIDFIDOConnection/availableDevices()`` and used to create
    /// connections with ``HIDFIDOConnection/makeConnection(device:)``.
    package struct YubiKeyDevice: Sendable, Hashable, CustomStringConvertible {
        /// The human-readable name of the YubiKey device.
        package let name: String

        /// A textual representation of the YubiKey device.
        package var description: String { name }

        // Shared with the OTP HID connection for the same physical device.
        let locationID: Int

        init(hidLocationID: Int, name: String) {
            self.locationID = hidLocationID
            self.name = name
        }
    }
}

#endif  // os(macOS) || targetEnvironment(macCatalyst)
