# Daxus

Unofficial Python library for single-shot data acquisition from DXS-100 Daxis devices. Connect to your DXS-100 over TCP/IP and retrieve real-time channel measurements with minimal setup.

## Quick Start

```bash
pip install daxus
python -c "from daxus import Daxus; print('Daxus installed successfully')"
python -c "from daxus import Daxus; d = Daxus('192.168.1.100', 2864); print(d.get_measurements())"
```

## Example

```python
with Daxus('127.0.0.1', 2864) as d:
    print(d.channels[0])
    d.set_mode('realtime')
    print(d.get_measurements())
```

Output:
```json
{"channel_label": "DCFC4-I", "channel_num": 1, "channel_id": 18, "slot_num": 0, "span_top": 0.1, "span_bottom": 0.0, "attenuation_code": 0, "units": "V"}
```

```python
{'example_chan4-I': 0.000117, 'example_chan3-I': 0.000175, 'example_chan2-I': 0.000282, 'example_chan1-I': 0.000120, 'example_chan4-V': 0.000667, 'example_chan3-V': -0.004, 'example_chan2-V': 0.000667, 'example_chan1-V': 0.008667}
```

## Features

- TCP/IP connection to DXS-100 devices
- Real-time measurement acquisition
- Channel configuration and metadata retrieval
- Automatic scaling of raw values to engineering units

## License

BSD License - see LICENSE file for details.
