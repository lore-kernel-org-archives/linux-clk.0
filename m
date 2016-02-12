Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1494732.M6VqoIU5NQ@phil>
Cc: sboyd@codeaurora.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <3862076.Cf1OAGsbuq@phil> <20160212021936.3210.79199@quark.deferred.io>
 <1494732.M6VqoIU5NQ@phil>
Message-ID: <20160212151329.1685.89663@quark.deferred.io>
Subject: Re: [GIT PULL] first bunch of rockchip clock changes for 4.6
Date: Fri, 12 Feb 2016 07:13:29 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Heiko Stuebner (2016-02-12 03:39:43)
> Hi Mike,
> =

> Am Donnerstag, 11. Februar 2016, 18:19:36 schrieb Michael Turquette:
> > Quoting Heiko Stuebner (2016-02-11 05:00:02)
> > =

> > > Yakir Yang (1):
> > >       clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for
> > >       hclk_vio_bus
> > =

> > Thanks for sending the very readable PR. One question below,
> > =

> > We'll likely have critical clock and handoff clock support merged in the
> > next few days. I'm starting to audit any new CLK_IGNORE_UNUSED flag
> > usage to see if it should use either of those two flags. Is the above
> > patch a candidate?
> =

> the above clock is part of the interconnect. We don't model that yet, but=
 I =

> guess that would make it more a candidate for the handoff-type instead.
> =

> I'd guess for the Rockchip side, everything that is CLK_IGNORE_UNUSED sho=
uld =

> be the handoff type (leaf-clocks used by some component we don't control =

> yet). =

> =

> The clocks we already register as critical most likely are the ones that =

> should be critical, as they are central clocks where it causes havok when =

> they get disabled :-) .

OK. It sounds like you might go back and clean up these clocks to use
the new infrastructure once it gets merged, so I'll go ahead and pull
this tag now.

Thanks,
Mike

> =

> =

> Heiko
