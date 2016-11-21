Return-Path: <icenowy@aosc.xyz>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>
In-Reply-To: <20161121130629.2qp6tvdd5slvl5m6@lukather>
References: <20161118071557.30195-1-wens@csie.org> <20161121130629.2qp6tvdd5slvl5m6@lukather>
Subject: Re: [linux-sunxi] Re: [PATCH] clk: sunxi-ng: sun6i-a31: Enable PLL-MIPI LDOs when ungating it
MIME-Version: 1.0
Message-Id: <189391479745659@web24g.yandex.ru>
Date: Tue, 22 Nov 2016 00:27:39 +0800
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



21.11.2016, 21:06, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> On Fri, Nov 18, 2016 at 03:15:57PM +0800, Chen-Yu Tsai wrote:
>>  The PLL-MIPI clock is somewhat special as it has its own LDOs which
>>  need to be turned on for this PLL to actually work and output a clock
>>  signal.
>>
>>  Add the 2 LDO enable bits to the gate bits. This fixes issues with
>>  the TCON not sending vblank interrupts when the tcon and dot clock are
>>  indirectly clocked from the PLL-MIPI clock.
>>
>>  Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
>>  Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Applied, thanks!
> Maxime

Could you check my patch on A33 which fixes the same problem?

It has been ACKed by Chen-Yu.

>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
