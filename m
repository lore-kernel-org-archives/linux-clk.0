Return-Path: <stefan.wahren@i2se.com>
Date: Sun, 28 Feb 2016 18:48:28 +0100 (CET)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org,
	kernel@martin.sperl.org, Eric Anholt <eric@anholt.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Message-ID: <518878293.330817.eb44c2f6-8870-42b4-ada5-1ccea76f532b.open-xchange@email.1und1.de>
In-Reply-To: <1456673831-2408-1-git-send-email-kernel@martin.sperl.org>
References: <1456673831-2408-1-git-send-email-kernel@martin.sperl.org>
Subject: Re: [PATCH v5 00/20] add additional clocks and frac/mash support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Martin,

> kernel@martin.sperl.org hat am 28. Februar 2016 um 16:36 geschrieben:
>
>
> From: Martin Sperl <kernel@martin.sperl.org>
>
> Fix issues found with current driver with regards to:
> * coding style
> * locking
> * setting register instead of bits in register
> * the use of BCM2835_CLOCK_COUNT in the device tree bindings
>
> adds:
> * frac/mash support (with correct limits)
> * exposing of additional clock parameters in debugfs
> (registers, divider and parent)
> * added all the missing pll dividers
> * almost all so far undefined clocks
>
> [...]
>
> Martin Sperl (20):
> clk: bcm2835: pll_off should only set CM_PLL_ANARST
> [...]
> clk: bcm2835: add locking to pll*_on/off methods
> [...]
> clk: bcm2835: enable clocks that have been enabled by firmware

i suggest you separate these 3 important fixes out of these series to get them
faster in.

Regards
Stefan
