Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180830152813.20883-1-geert+renesas@glider.be>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180830152813.20883-1-geert+renesas@glider.be>
Message-ID: <153566618042.93865.13252788689594331562@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: renesas: r8a77990: Add missing I2C7 clock
Date: Thu, 30 Aug 2018 14:56:20 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-08-30 08:28:13)
> When trying to use I2C7 on R-Car E3:
> =

>     renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 1=
003: -2
>     i2c-rcar e6690000.i2c: failed to add to PM domain always-on: -2
>     i2c-rcar: probe of e6690000.i2c failed with error -2
> =

> Unlike other R-Car Gen3 SoCs, R-Car E3 has more than 7 I2C bus
> interfaces.  Add the forgotten module clock for the 8th instance to fix
> this.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
