Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180117183244.28303-2-l.stach@pengutronix.de>
References: <20180117183244.28303-1-l.stach@pengutronix.de> <20180117183244.28303-2-l.stach@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Jan 2018 12:51:23 +0100
Message-ID: <CAK8P3a0WGrmDp_CbQjDVc_dGNyBN4A4h5HJqUeFygO3RFHuCxw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: add basic DTS for i.MX8MQ
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de,
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 17, 2018 at 7:32 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> This adds the basic DTS for the i.MX8MQ.
> For now only the following peripherals are supported:
> - IOMUXC (pin controller)
> - CCM (clock controller)
> - GPIO
> - UART
> - uSDHC (SD/eMMC controller)
> - FEC (ethernet controller)
> - i2c
>
> This is enough to get a very basic board support up and running.
>
> One known limitation is that the driver for the GPC interrupt
> controller is still missing, rendering the CPU sleep states unusable
> as there is nothing waking them up anymore. This will be fixed in
> due course.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I wonder if there is anything preventing us from putting it all into linux-4.16.
This is low-risk (nothing would break), and the other three arch/arm64 patches
are trivial, so if someone can do a review quickly, I'd be willing to pick the
arm-soc portion up.

I suppose we need the clk and pintrl drivers to also get merged at the
same time to make it usable, and we also want the bindings for pinctrl
and clk to be properly reviewed before adding the nodes to the DT
so it depends a, bit on the other maintainers.

To me it looks like the drivers are just "yet another i.MX variant" for them,
it should make little difference that this one is 64-bit.

     Arnd
