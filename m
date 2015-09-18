Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, ulf.hansson@linaro.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] ARM: sunxi: Introduce CHIP support
Date: Fri, 18 Sep 2015 15:18:57 +0200
Message-ID: <13485899.XsimukeSAF@wuerfel>
In-Reply-To: <20150918121905.GO4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com> <2353279.QTDzFUHVnF@wuerfel> <20150918121905.GO4684@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Friday 18 September 2015 14:19:05 Maxime Ripard wrote:
> 
> There's actually two issues that are pretty orthogonal:
> 
>   * the fact that the regulator to power the wifi chip needs to be
>     enabled before it enumerates and the driver is probed. The MMC
>     pwrseq stuff seems to fix that, even if it doesn't really fit in
>     the usual DT model.

Ok. If there is anything missing in the pwrseq implementation or
binding at the moment, you'll have to work with Ulf to get it to
drive your hardware then.

>   * The fact that that regulator on this board is actually two
>     regulators in parallel that needs to be controlled in parallel
>     too. Here, it will probably require a new regulator driver to
>     combine two regulators into one.

I don't yet understand what it means to control them in parallel.
Do you mean the hardware uses two outputs to support a higher
current than you could do with one?

How critical is the timing? Would it be enough if the mmc
code knew how to set more than one regulator and do them
one at a time?

	Arnd
