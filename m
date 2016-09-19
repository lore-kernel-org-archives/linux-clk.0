Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] ARM: mvebu: drivers for v4.9 (#1)
Date: Tue, 20 Sep 2016 00:16:41 +0200
Message-ID: <4134529.ol6KhRYAQp@wuerfel>
In-Reply-To: <87a8fabikx.fsf@free-electrons.com>
References: <87a8fabikx.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday, September 14, 2016 5:35:10 PM CEST Gregory CLEMENT wrote:
> mvebu drivers for 4.9 (part 1)
> 
> - Add pinctrl and clk support for the Orion5x SoC mv88f5181 variant
> 
> ----------------------------------------------------------------
> Jamie Lentin (2):
>       clk: mvebu: Add clk support for the orion5x SoC mv88f5181
>       pinctrl: mvebu: orion5x: Generalise mv88f5181l support for 88f5181
> 
>  .../devicetree/bindings/clock/mvebu-core-clock.txt |  1 +
>  .../bindings/pinctrl/marvell,orion-pinctrl.txt     |  4 +-
>  drivers/clk/mvebu/orion.c                          | 70 ++++++++++++++++++++++
>  drivers/pinctrl/mvebu/pinctrl-orion.c              | 23 +++----
>  4 files changed, 86 insertions(+), 12 deletions(-)

I see this touches pinctrl and clk drivers, but none of the maintainers are
on Cc for this pull request, nor have they provided an Ack for the patches
according to your git log.

Why did you not send the driver changes to them?

Not pulled for now, until this is resolved, sorry.

	Arnd
