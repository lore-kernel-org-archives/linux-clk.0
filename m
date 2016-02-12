Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] first bunch of rockchip clock changes for 4.6
Date: Fri, 12 Feb 2016 12:39:43 +0100
Message-ID: <1494732.M6VqoIU5NQ@phil>
In-Reply-To: <20160212021936.3210.79199@quark.deferred.io>
References: <3862076.Cf1OAGsbuq@phil> <20160212021936.3210.79199@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

Am Donnerstag, 11. Februar 2016, 18:19:36 schrieb Michael Turquette:
> Quoting Heiko Stuebner (2016-02-11 05:00:02)
> 
> > Yakir Yang (1):
> >       clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for
> >       hclk_vio_bus
> 
> Thanks for sending the very readable PR. One question below,
> 
> We'll likely have critical clock and handoff clock support merged in the
> next few days. I'm starting to audit any new CLK_IGNORE_UNUSED flag
> usage to see if it should use either of those two flags. Is the above
> patch a candidate?

the above clock is part of the interconnect. We don't model that yet, but I 
guess that would make it more a candidate for the handoff-type instead.

I'd guess for the Rockchip side, everything that is CLK_IGNORE_UNUSED should 
be the handoff type (leaf-clocks used by some component we don't control 
yet). 

The clocks we already register as critical most likely are the ones that 
should be critical, as they are central clocks where it causes havok when 
they get disabled :-) .


Heiko
