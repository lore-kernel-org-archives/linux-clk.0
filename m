Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcin Ziemianowicz <marcin@ziemianowicz.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180429190111.14247-1-marcin@ziemianowicz.com>
Cc: Marcin Ziemianowicz <marcin@ziemianowicz.com>, stable@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20180429190111.14247-1-marcin@ziemianowicz.com>
Message-ID: <152645278298.237094.13637070780064221668@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH V4] clk: at91: PLL recalc_rate() now using cached MUL and DIV
 values
Date: Tue, 15 May 2018 23:39:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Marcin Ziemianowicz (2018-04-29 12:01:11)
> When a USB device is connected to the USB host port on the SAM9N12 then
> you get "-62" error which seems to indicate USB replies from the device
> are timing out. Based on a logic sniffer, I saw the USB bus was running
> at half speed.
> =

> The PLL code uses cached MUL and DIV values which get set in set_rate()
> and applied in prepare(), but the recalc_rate() function instead
> queries the hardware instead of using these cached values. Therefore,
> if recalc_rate() is called between a set_rate() and prepare(), the
> wrong frequency is calculated and later the USB clock divider for the
> SAM9N12 SOC will be configured for an incorrect clock.
> =

> In my case, the PLL hardware was set to 96 Mhz before the OHCI
> driver loads, and therefore the usb clock divider was being set
> to /2 even though the OHCI driver set the PLL to 48 Mhz.
> =

> As an alternative explanation, I noticed this was fixed in the past by
> 87e2ed338f1b ("clk: at91: fix recalc_rate implementation of PLL
> driver") but the bug was later re-introduced by 1bdf02326b71 ("clk:
> at91: make use of syscon/regmap internally").
> =

> Fixes: 1bdf02326b71 ("clk: at91: make use of syscon/regmap internally)
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Marcin Ziemianowicz <marcin@ziemianowicz.com>
> ---

Applied to clk-next
