Return-Path: <ukl@pengutronix.de>
Date: Wed, 10 May 2017 22:26:34 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Michael Krummsdorf <michael.krummsdorf@tq-group.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, kernel@pengutronix.de,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170510202634.z3xgdfdrnvejkm7o@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
 <16216689.278511.1494157914798@email.1und1.de>
 <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

	# cat dumpclk 
	#!/bin/sh

	for r in 0x80014070 0x80040060 0x80040090 0x800400A0 0x800400B0 0x800400C0 0x800400F0 0x800401B0 0x800401D0; do
		memtool md $r+4
	done

	# cat dumpeeprom 
	#!/bin/sh

	dd if=/sys/bus/spi/devices/spi1.0/eeprom bs=16 count=1 2>/dev/null | hexdump -C

Now when booting with an unpatched 4.9 kernel I have after startup:

	# ./dumpclk 
	80014070: 00000204                                           ....
	80040060: 00000003                                           ....
	80040090: 00000005                                           ....
	800400a0: 00000005                                           ....
	800400b0: 00000002                                           ....
	800400c0: 80000005                                           ....
	800400f0: 00000102                                           ....
	800401b0: 5e5b5513                                           .U[^
	800401d0: 00000104                                           ....
	# ./dumpeeprom 
	00000000  08 ab 00 00 5f 70 00 00  00 80 00 03 00 00 cb 00  |...._p..........|
	00000010

(which is broken, because the first byte in the eeprom is a 0x09).

Now I make ref_io slower again:

	# memtool mw 0x800401b0 0x5e5e5513
	# ./dumpclk
	80014070: 00000204                                           ....
	80040060: 00000003                                           ....
	80040090: 00000005                                           ....
	800400a0: 00000005                                           ....
	800400b0: 00000002                                           ....
	800400c0: 80000005                                           ....
	800400f0: 00000102                                           ....
	800401b0: 1e1e5513                                           .U^.
	800401d0: 00000104                                           ....
	# ./dumpeeprom
	00000000  09 aa 00 00 5f 70 00 00  00 80 00 02 00 00 ca 00  |...._p..........|
	00000010

So on my machine it really seems to only depend on ref-io1 clk speed.
With all available slower speeds resulting from IOFRAC1 in [0x1f ..
0x23] accessing the eeprom works fine. With IOFRAC = 0x1d reading works
fine already. With all lower values [0x12 .. 0x1c] reading shows these
bit errors. Also more or less randomly jumping between different
settings for IO1FRAC doesn't suggest that there might be something else
influencing the bug. It was always [0x12 .. 0x1c] shows the bug, [0x1d
.. 0x23] doesn't.

I also did a test using different values for SSP2_TIMING.CLOCK_DIVIDE
and SSP2_TIMING.CLOCK_RATE. Going through all 32504 settings that don't
yield a bus freq > 16 MHz with ssp2-clk running at 144 MHz or 160 MHz
doesn't show any variation. It's always fine on 144 MHz (IOFRAC = 0x1e)
and always fails on 160 MHz (IOFRAC = 0x1b).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
