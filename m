Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <1531918658-32278-1-git-send-email-phil.edworthy@renesas.com> <20180718130228.GG17271@n2100.armlinux.org.uk>
In-Reply-To: <20180718130228.GG17271@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jul 2018 15:19:21 +0200
Message-ID: <CAMuHMdUjzVBXn-goAwbTBULfo=HrJEY6eBae4w7Z6qA-gScUUw@mail.gmail.com>
Subject: Re: [PATCH] clk: Add functions to get optional clocks
To: Russell King <linux@armlinux.org.uk>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Simon Horman <horms@verge.net.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,

On Wed, Jul 18, 2018 at 3:02 PM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Wed, Jul 18, 2018 at 01:57:38PM +0100, Phil Edworthy wrote:
> > Behaves the same as (devm_)clk_get except where there is no clock
> > producer. In this case, instead of returning -ENOENT, the function
> > returns NULL. This makes error checking simpler and allows
> > clk_prepare_enable, etc to be called on the returned reference
> > without additional checks.
>
> How does this work with non-DT systems, where looking a clock up which
> isn't yet registered with clkdev returns -ENOENT ?
>
> (clkdev doesn't know when all clocks are registered with it.)

Good question.

I guess all drivers trying to handle optional clocks this way are already broken
on non-DT systems where clocks may be registered late...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
