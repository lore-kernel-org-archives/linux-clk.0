Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1501537388.2759.7.camel@baylibre.com>
Subject: Re: [GIT PULL] Meson clock fixes for 4.13-rc4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Neil Armstrong
	 <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 31 Jul 2017 23:43:08 +0200
In-Reply-To: <20170731202031.GK2146@codeaurora.org>
References: <ce41382f-fd93-1dc9-0dba-1484ac555945@baylibre.com>
	 <20170731202031.GK2146@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-07-31 at 13:20 -0700, Stephen Boyd wrote:
> On 07/31, Neil Armstrong wrote:
> > Hi Mike, Stephen,
> > 
> > Here is some fixes for Meson GXBB and Meson8 drivers, that could go for
> > 4.13-rc4.
> > 
> 
> Are any of these critical fixes for regressions in the v4.13-rc
> series? All the Fixes tags look like they go back to before
> v4.13-rc1, so they don't look critical at first glance. If
> anything, they're mostly nice to have non-critical fixes? If so,
> can we defer these until the next merge window?

I agree that these fixes hardly qualify as critical, except maybe for the mpll
fix. The clock rate actually applied can be really off compared to what CCF will
 except to have set.

These fixes are quite simple and safe, it would be nice if we could avoid having
 the next version tagged with known issues.

> 
