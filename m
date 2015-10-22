Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20151022083647.GQ10947@lukather>
Cc: linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
References: <1445470433-28374-1-git-send-email-sboyd@codeaurora.org>
 <20151022083647.GQ10947@lukather>
Message-ID: <20151022092804.20687.85883@quantum>
Subject: Re: [PATCH] clk: Remove clk_{register,unregister}_multiplier()
Date: Thu, 22 Oct 2015 02:28:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-10-22 01:36:47)
> Hi!
> =

> On Wed, Oct 21, 2015 at 04:33:53PM -0700, Stephen Boyd wrote:
> > These APIs aren't used, so remove them. This can be reverted if
> > we get a user at some point.
> > =

> > Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Suggested-by: Michael Turquette <mturquette@baylibre.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> =

> Reviewed-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied.

Thanks,
Mike

> =

> Thanks!
> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
