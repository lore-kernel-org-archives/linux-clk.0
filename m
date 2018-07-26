Return-Path: <ukl@pengutronix.de>
Date: Thu, 26 Jul 2018 16:32:32 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 03, 2017 at 08:56:25PM +0200, Uwe Kleine-König wrote:
> Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
> 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
> SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
> to 288 MHz because the initial frequency "seems too high to be ssp clock
> source directly". However this isn't enough to ensure that the frequency
> isn't increased later again. In fact this happens on my machine as the
> mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
> ssp2 which is resolved to
> 
> 	ref_io1.rate = 320 MHz
> 	ssp2_sel.parent = ref_io1
> 	ssp2_div.divider = 2
> 
> . The observed effect is that reading MISO reliably fails: Instead of
> the least significant bit the second least significant bit is reported
> twice. This is probably related to the reports
> 
> 	https://community.nxp.com/thread/290209
> 	https://community.nxp.com/thread/310434
> 	https://community.nxp.com/thread/385546
> 
> So additionally to initializing ref_io0 and ref_io1 to 288 MHz ensure
> that their frequency is never set to something bigger later on. This is
> done by adding a parameter min_frac to clk-ref and use that instead of
> the hard coded 18 to limit the valid values for FRAC. For all ref clocks
> but ref_io0 and ref_io1 18 is used and so there is no functional change
> for those.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Back in 2017 this patch made the issue disappear on a customer's machine
(using TQ's TQMa28). Now the problem is back on a variant of the machine
(using TQMa28L). Back then Stefan had the problem with my patch on a
Duckbill, too.

Here you can see the problem in action:

I hava a file that contains just the bytes from 0 to 256:

	root@em-switch:~ hexdump -C lala
	00000000  00 01 02 03 04 05 06 07  08 09 0a 0b 0c 0d 0e 0f  |................|
	00000010  10 11 12 13 14 15 16 17  18 19 1a 1b 1c 1d 1e 1f  |................|
	00000020  20 21 22 23 24 25 26 27  28 29 2a 2b 2c 2d 2e 2f  | !"#$%&'()*+,-./|
	00000030  30 31 32 33 34 35 36 37  38 39 3a 3b 3c 3d 3e 3f  |0123456789:;<=>?|
	00000040  40 41 42 43 44 45 46 47  48 49 4a 4b 4c 4d 4e 4f  |@ABCDEFGHIJKLMNO|
	00000050  50 51 52 53 54 55 56 57  58 59 5a 5b 5c 5d 5e 5f  |PQRSTUVWXYZ[\]^_|
	00000060  60 61 62 63 64 65 66 67  68 69 6a 6b 6c 6d 6e 6f  |`abcdefghijklmno|
	00000070  70 71 72 73 74 75 76 77  78 79 7a 7b 7c 7d 7e 7f  |pqrstuvwxyz{|}~.|
	00000080  80 81 82 83 84 85 86 87  88 89 8a 8b 8c 8d 8e 8f  |................|
	00000090  90 91 92 93 94 95 96 97  98 99 9a 9b 9c 9d 9e 9f  |................|
	000000a0  a0 a1 a2 a3 a4 a5 a6 a7  a8 a9 aa ab ac ad ae af  |................|
	000000b0  b0 b1 b2 b3 b4 b5 b6 b7  b8 b9 ba bb bc bd be bf  |................|
	000000c0  c0 c1 c2 c3 c4 c5 c6 c7  c8 c9 ca cb cc cd ce cf  |................|
	000000d0  d0 d1 d2 d3 d4 d5 d6 d7  d8 d9 da db dc dd de df  |................|
	000000e0  e0 e1 e2 e3 e4 e5 e6 e7  e8 e9 ea eb ec ed ee ef  |................|
	000000f0  f0 f1 f2 f3 f4 f5 f6 f7  f8 f9 fa fb fc fd fe     |...............|
	000000ff

this was written to an spi eeprom. Reading it looks ok on the
oscilloscope, but in the driver I get the described read errors:

	root@em-switch:~ cmp -l lala /sys/bus/spi/devices/spi1.0/eeprom
	  3   2   3
	 15  16  17
	 18  21  20
	 23  26  27
	 34  41  40
	 35  42  43
	 38  45  44
	 46  55  54
	 54  65  64
	 87 126 127
	143 216 217
	199 306 307
	203 312 313
	211 322 323
	231 346 347
	239 356 357
	243 362 363
	251 372 373
	cmp: EOF on lala
	root@em-switch:~ cmp -l lala /sys/bus/spi/devices/spi1.0/eeprom
	 10  11  10
	 11  12  13
	 18  21  20
	 23  26  27
	 26  31  30
	 38  45  44
	 39  46  47
	 47  56  57
	 59  72  73
	114 161 160
	151 226 227
	179 262 263
	203 312 313
	239 356 357
	247 366 367
	251 372 373
	255 376 377
	cmp: EOF on lala
	root@em-switch:~ cmp -l lala /sys/bus/spi/devices/spi1.0/eeprom
	 15  16  17
	 19  22  23
	 27  32  33
	 35  42  43
	 51  62  63
	 55  66  67
	 63  76  77
	 71 106 107
	 79 116 117
	 83 122 123
	 87 126 127
	 91 132 133
	 95 136 137
	 99 142 143
	123 172 173
	138 211 210
	139 212 213
	151 226 227
	155 232 233
	163 242 243
	166 245 244
	187 272 273
	231 346 347
	cmp: EOF on lala

(The output of cmp -l is for each differing byte: The decimal byte number
(starting at 1), and then in octal the two values.) As you can see the
problem is on changing offsets and the value in the third column always
only differs in the least-significant bit and the wrong values always
end in 0, 3, 4 or 7, so the two least-significant bits are always
identical.

So it seems the last bit (which is the last on the bus, too) is sampled
too early by the CPU.

Is the problem better understood in the meantime by someone? It would be
great to find and fix the underlying issue. I guess only someone with a
view into the SoC can give definitive results, though.
Fabio: Doesn't that look bad enough to let the hardware guys at NXP
look into that?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
