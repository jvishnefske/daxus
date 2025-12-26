# Daxus Design Document

## Overview

Daxus is an unofficial Python library for single-shot data acquisition from DXS-100 Daxis devices via TCP/IP.

## MVP Functional Requirements

### Connection Management
- [x] FR-1: Establish TCP/IP connection to DXS-100 device by IP address and port
- [x] FR-2: Support context manager protocol for automatic resource cleanup
- [x] FR-3: Send heartbeat packets to verify link state
- [x] FR-4: Flush socket buffer to clear stale data

### Device Configuration
- [x] FR-5: Query device configuration (name, channel count)
- [x] FR-6: Enumerate available channels on the device
- [x] FR-7: Retrieve channel metadata (label, units, span, attenuation)

### Data Acquisition
- [x] FR-8: Set acquisition mode (realtime supported)
- [x] FR-9: Request and receive single-shot measurements
- [x] FR-10: Scale raw values to engineering units using channel configuration

### Data Parsing
- [x] FR-11: Parse signed/unsigned 16-bit integers from byte arrays
- [x] FR-12: Parse unsigned 32-bit integers from byte arrays
- [x] FR-13: Parse 64-bit floating point values from byte arrays
- [x] FR-14: Parse null-padded strings from byte arrays

## Non-Functional Requirements

- NFR-1: Connection timeout configurable (default 1 second)
- NFR-2: Network byte order (big-endian) for protocol messages
- NFR-3: Python 3 compatible

## Architecture

```
+------------------+
|      Daxus       |  Main interface class
+------------------+
         |
         v
+------------------+
|  _DaxusChannel   |  Per-channel configuration
+------------------+
         |
         v
+------------------+
|  Helper funcs    |  Binary parsing utilities
|  i16, u16, u32,  |
|  f64, chars      |
+------------------+
```

## Protocol Summary

- Port: 2864 (default)
- Transport: TCP/IP
- Byte order: Network (big-endian)
- Message format: 4-byte type followed by 4-byte arguments

## Traceability

| Requirement | Implementation |
|-------------|----------------|
| FR-1 | `Daxus.__init__` socket.connect() |
| FR-2 | `Daxus.__enter__`, `__exit__` |
| FR-3 | `Daxus.heartbeat()` |
| FR-4 | `Daxus.flush()` |
| FR-5 | `Daxus.get_config()` |
| FR-6 | `Daxus.__init__` channel enumeration loop |
| FR-7 | `_DaxusChannel.__init__` |
| FR-8 | `Daxus.set_mode()` |
| FR-9 | `Daxus.get_measurements()` |
| FR-10 | `_DaxusChannel.scaled_value()` |
| FR-11 | `i16()`, `u16()` |
| FR-12 | `u32()` |
| FR-13 | `f64()` |
| FR-14 | `chars()` |
