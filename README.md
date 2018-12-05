# Daxus

Unofficial library to read single shot data from
DXS-100 Daxis Data Acquisition Device

## Example

    with Daxus('127.0.0.1', 2864) as d:
        print(d.channels[0])
        d.set_mode('realtime')
        print(d.get_measurements())

{"channel_label": "DCFC4-I", "channel_num": 1, "channel_id": 18, "slot_num": 0, "span_top": 0.1, "span_bottom": 0.0, "attenuation_code": 0, "units": "V"}            
{'example_chan4-I': 0.0001166666666666677, 'example_chan3-I': 0.00017500000000000154, 'example_chan2-I': 0.0002816666666666662, 'example_chan1-I': 0.00012000000000000205, 'example_chan4-V': 0.0006666666666674814, 'example_chan3-V': -0.003999999999997783, 'example_chan2-V': 0.0006666666666674814, 'example_chan1-V': 0.0086666666666666}

