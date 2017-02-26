Return-Path: <netz.kernel@gmail.com>
Return-Path: <netz.kernel@gmail.com>
Date: Sat, 25 Feb 2017 19:13:05 -0600
From: Marty Plummer <netz.kernel@gmail.com>
To: linux-clk@vger.kernel.org
Cc: wenpan@hisilicon.com, mturquette@baylibre.com, sboyd@codeaurora.org,
	leo.yan@linaro.org, xuejiancheng@hisilicon.com
Subject: clk: hisilicon: hi3521a crg driver info request
Message-ID: <20170226011303.ppgwbh7kcc6thnqe@tha-monstah.mydomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Greetings.

I've been doing some work on the hi3521a soc from hisilicon, and was
using existing mainlined chips as a reference. Currently dealing with
the i2c controller, particularly the clock portion of it.

In arch/arm/boot/dts/hisi-hix5hd2.dtsi the node is given
HIX5HD2_I2C0_RST as the clock, which has as a parent HIX5HD2_I2C0_CLK at
offset 0x6c from the crg at shifts 5 & 4 respectively. Regarding the SoC
I'm working on, at offset 0x84, shift 12, I only have a reset bit and no
clock gate bit.

Checking the sdk/kernel 3.10 code for this SoC I see the clock in
question is based off of a mux clock at offset 0x34, shift 12, width 2,
divided by 4. Does the hisilicon clock framework have a clock type for
this sort of setup?

Regards,
	Marty.
