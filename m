Return-Path: <mazziesaccount@gmail.com>
Return-Path: <mazziesaccount@gmail.com>
Date: Fri, 7 Sep 2018 13:19:40 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: zyw@rock-chips.com, mturquette@baylibre.com, sboyd@kernel.org,
	w.egorov@phytec.de
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Does Rockchip RK808 driver unload work as intended?
Message-ID: <20180907101940.GE2472@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi dee Ho peeps,

I was browsing through the clk drivers as I tried to do some cleaning.
Few days ago I submitted a patch which would add devm variants for
clkdev lookup registration. I also added devm of_provider registration
for cases where it is actually the parent device which contains clock
definitions in DT. This seems to be quite typical for MFDs.

While doing this I hit to Rockchip RK808 driver which seems to utilize
oarent device (MFD dev) for pretty much all devm releasing. I wonder if
this is safe? What happens if one tries to remove the RK808 clk module?

I guess the clk deregistration and cleanups are not ran as parent device
stays there, right? But is the clk module and clk module code still
unload? So won't clk operation pointers registered to clk core become
invalid?

I guess I don't have any HW to test this mnyself. And as the driver has
been there since 2014 - well, chances are the driver does work and I
just don't get it =)

So can someone please shed some light on this? Is this a bug or am I
just plain wrong?

Br,
	Matti Vaittinen
