Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1513791908.29566.18.camel@baylibre.com>
Subject: Re: [PATCH v5 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Quentin
 Schulz <quentin.schulz@free-electrons.com>, Kevin Hilman
 <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 20 Dec 2017 18:45:08 +0100
In-Reply-To: <151373031022.33554.13905466641279532222@resonance>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
	 <151373031022.33554.13905466641279532222@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-19 at 16:38 -0800, Michael Turquette wrote:
> Applied to clk-protect-rate,

Thx !

>  with the exception that I did not apply
> "clk: fix CLK_SET_RATE_GATE with clock rate protection" as it breaks
> qcom clk code.

Here is a reminder of what I found at the time (so you don't to dig in your
mailbox for it)

Regressions reported by Kci on the following platforms:
* qcom-apq8064-cm-qs600
* qcom-apq8064-ifc6410

it seems the problem is coming from the clock used by the mmc driver
(drivers/mmc/host/mmci.c)

the driver does following sequence:
* get_clk
* prepare_enable
* get_rate
* set_rate
* ...

with clock SDCx_clk (qcom_apq8064.dtsi:1037). This clock has CLK_SET_RATE_PARENT
flag so it will transmit the request to its parent.
The parent of this clock is SDCx_src which has the CLK_SET_RATE_GATE flag.

> 
> Stephen, do you plan to fix up the qcom clock code so that the
> SET_RATE_GATE improvement can go in?
> 
> Thanks,
> Mike
