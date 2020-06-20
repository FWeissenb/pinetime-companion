//  Client API for accessing Bluetooth LE device
import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';
import '../models/models.dart';

class DeviceApiClient {
  /// Connect to the Bluetooth LE device and list the services
  Future<Device> fetchDevice(BluetoothDevice bluetoothDevice) async {
    print('Fetching device...\n');

    //  Connect to the device
    await bluetoothDevice.connect();
    print('Device: ${bluetoothDevice.toString()}\n');

    //  Discover the services
    List<BluetoothService> services = await bluetoothDevice.discoverServices();
    services.forEach((service) {
      print('Service: ${service.toString()}\n');
    });

    final device = Device(
      condition: DeviceCondition.clear,
      formattedCondition: bluetoothDevice.name, //// 'Ready for firmware update',
      minTemp: 0,
      temp: 1,
      maxTemp: 1,
      locationId: 0,
      lastUpdated: DateTime.now(),
      location: 'location',
      bluetoothDevice: bluetoothDevice
    );
    return device;
  }
}

/* Log:
Launching lib/main.dart on Pixel 4 XL in debug mode...
✓ Built build/app/outputs/apk/debug/app-debug.apk.
I/FlutterBluePlugin( 3854): setup
Connecting to VM Service at ws://127.0.0.1:49500/k9L4zT09Kp4=/ws
D/BluetoothAdapter( 3854): isLeEnabled(): ON
D/BluetoothLeScanner( 3854): onScannerRegistered() - status=0 scannerId=7 mScannerId=0
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->copyMemory(JJJ)V (greylist, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getByte(J)B (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getByte(Ljava/lang/Object;J)B (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getLong(J)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->putByte(JB)V (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->putByte(Ljava/lang/Object;JB)V (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/er_blue_exampl( 3854): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/er_blue_exampl( 3854): Accessing hidden field Ljava/nio/Buffer;->address:J (greylist, reflection, allowed)
D/FlutterBluePlugin( 3854): mDevices size: 0
I/flutter ( 3854): onEvent DeviceRequested
I/flutter ( 3854): Fetching device...
I/flutter ( 3854): onTransition Transition { currentState: DeviceInitial, event: DeviceRequested, nextState: DeviceLoadInProgress }
D/BluetoothGatt( 3854): connect() - device: E8:C1:1A:12:BA:89, auto: true
D/BluetoothGatt( 3854): registerApp()
D/BluetoothGatt( 3854): registerApp() - UUID=320d32a1-00db-4914-968c-72e235aac8d0
D/BluetoothGatt( 3854): onClientRegistered() - status=0 clientIf=8
D/BluetoothGatt( 3854): onClientConnectionState() - status=0 clientIf=8 device=E8:C1:1A:12:BA:89
D/FlutterBluePlugin( 3854): [onConnectionStateChange] status: 0 newState: 2
I/flutter ( 3854): Device: BluetoothDevice{id: E8:C1:1A:12:BA:89, name: pinetime, type: BluetoothDeviceType.le, isDiscoveringServices: false, _services: []
D/BluetoothGatt( 3854): discoverServices() - device: E8:C1:1A:12:BA:89
D/BluetoothGatt( 3854): onConnectionUpdated() - Device=E8:C1:1A:12:BA:89 interval=6 latency=0 timeout=500 status=0
D/BluetoothGatt( 3854): onSearchComplete() = Device=E8:C1:1A:12:BA:89 Status=0
D/FlutterBluePlugin( 3854): [onServicesDiscovered] count: 6 status: 0
I/flutter ( 3854): Service: BluetoothService{uuid: 00001800-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: 00002a00-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001800-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [], value: [], BluetoothCharacteristic{uuid: 00002a01-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001800-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, i
I/flutter ( 3854): Service: BluetoothService{uuid: 00001801-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: 00002a05-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001801-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: false, writeWithoutResponse: false, write: false, notify: false, indicate: true, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [BluetoothDescriptor{uuid: 00002902-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001801-0000-1000-8000-00805f9b34fb, characteristicUuid: 00002a05-0000-1000-8000-00805f9b34fb, value: []}], value: []], includedServices: []}
I/flutter ( 3854): Service: BluetoothService{uuid: 00001811-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: 00002a47-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001811-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [], value: [], BluetoothCharacteristic{uuid: 00002a46-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 00001811-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: false, writeWithoutResponse: false, write: false, notify: true, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, i
I/flutter ( 3854): Service: BluetoothService{uuid: 0000180a-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: 00002a24-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 0000180a-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [], value: [], BluetoothCharacteristic{uuid: 00002a26-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 0000180a-0000-1000-8000-00805f9b34fb, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: true, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, in
I/flutter ( 3854): Service: BluetoothService{uuid: 8d53dc1d-1db7-4cd3-868b-8a527460aa84, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: da2e7828-fbce-4e01-ae9e-261174997c48, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 8d53dc1d-1db7-4cd3-868b-8a527460aa84, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: false, writeWithoutResponse: true, write: false, notify: true, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [BluetoothDescriptor{uuid: 00002902-0000-1000-8000-00805f9b34fb, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 8d53dc1d-1db7-4cd3-868b-8a527460aa84, characteristicUuid: da2e7828-fbce-4e01-ae9e-261174997c48, value: []}], value: []], includedServices: []}
I/flutter ( 3854): Service: BluetoothService{uuid: 59462f12-9543-9999-12c8-58b459a2712d, deviceId: E8:C1:1A:12:BA:89, isPrimary: true, characteristics: [BluetoothCharacteristic{uuid: 5c3a659e-897e-45e1-b016-007107c96df6, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 59462f12-9543-9999-12c8-58b459a2712d, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: false, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, indicateEncryptionRequired: false}, descriptors: [], value: [], BluetoothCharacteristic{uuid: 5c3a659e-897e-45e1-b016-007107c96df7, deviceId: E8:C1:1A:12:BA:89, serviceUuid: 59462f12-9543-9999-12c8-58b459a2712d, secondaryServiceUuid: null, properties: CharacteristicProperties{broadcast: false, read: true, writeWithoutResponse: false, write: true, notify: false, indicate: false, authenticatedSignedWrites: false, extendedProperties: false, notifyEncryptionRequired: false, in
I/flutter ( 3854): onTransition Transition { currentState: DeviceLoadInProgress, event: DeviceRequested, nextState: DeviceLoadSuccess }
I/flutter ( 3854): onEvent DeviceChanged
I/flutter ( 3854): onTransition Transition { currentState: ThemeState, event: DeviceChanged, nextState: ThemeState }
D/BluetoothGatt( 3854): onConnectionUpdated() - Device=E8:C1:1A:12:BA:89 interval=36 latency=0 timeout=500 status=0
D/BluetoothAdapter( 3854): isLeEnabled(): ON
*/