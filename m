Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1485506633.2442.9.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson8b: fix clk81 register address
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Kevin Hilman
	 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
	linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jan 2017 09:43:53 +0100
In-Reply-To: <20170126235745.GI8801@codeaurora.org>
References: <1485341586-2929-1-git-send-email-jbrunet@baylibre.com>
	 <20170126235745.GI8801@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-01-26 at 15:57 -0800, Stephen Boyd wrote:
> On 01/25, Jerome Brunet wrote:
> > 
> > During meson8b clock probe, clk81 register address is fixed twice.
> > First using the meson8b_clk_gates array, then by directly changing
> > meson8b_clk81 register.
> > 
> > As a result meson8b_clk81.reg = HHI_MPEG_CLK_CNTL + clk_base +
> > clk_base.
> > 
> > Fixed by just removing the second fixup.
> > 
> > Fixes: e31a1900c1ff ("meson: clk: Add support for clock gates")
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  Patch based on khilman/linux-amlogic.git master branch.
> 
> The problem isn't introduced there though?
Indeed, I should have based my patch on clk-next. Will do next time.

> 
> > 
> > 
> >  I don't have a meson8b HW so this patch so this patch has not been
> >  tested on real HW.
> 
> Applied to clk-next.
> 
