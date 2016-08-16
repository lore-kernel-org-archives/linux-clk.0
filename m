Return-Path: <sboyd@codeaurora.org>
Date: Tue, 16 Aug 2016 10:31:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Denis Efremov <yefremov.denis@gmail.com>
Subject: Re: [PATCH 2/2] clk: fixed-rate: Remove export symbol on setup
 function
Message-ID: <20160816173123.GA361@codeaurora.org>
References: <20160813015023.28221-1-sboyd@codeaurora.org>
 <20160813015023.28221-2-sboyd@codeaurora.org>
 <CAMuHMdU5USf7SHpg5NXJ=G-RBhX4q+5DAQBYUaMYxJk07vPMOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdU5USf7SHpg5NXJ=G-RBhX4q+5DAQBYUaMYxJk07vPMOg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Geert Uytterhoeven wrote:
> Hi Stephen,
> 
> On Sat, Aug 13, 2016 at 3:50 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > This function is only called by builtin code, but we always
> > exported it and had marked it as __init before commit
> > e4eda8e0654c (clk: remove exported function from __init section,
> > 2013-01-06) removed that marking. Given that it isn't used by
> > modules, lets unexport it and add back __init.
> >
> > Cc: Denis Efremov <yefremov.denis@gmail.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> >  drivers/clk/clk-fixed-rate.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
> > index c735272ed706..b5c46b3f8764 100644
> > --- a/drivers/clk/clk-fixed-rate.c
> > +++ b/drivers/clk/clk-fixed-rate.c
> > @@ -190,11 +190,10 @@ static struct clk *_of_fixed_clk_setup(struct device_node *node)
> >  /**
> >   * of_fixed_clk_setup() - Setup function for simple fixed rate clock
> >   */
> > -void of_fixed_clk_setup(struct device_node *node)
> > +void __init of_fixed_clk_setup(struct device_node *node)
> >  {
> >         _of_fixed_clk_setup(node);
> >  }
> > -EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
> >  CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
> 
> This function is needed to instantiate clocks from DT overlays,
> which I'm using with out-of-tree "clk: add generic driver for fixed rate clock".
> 

I think Ricardo's latest series should make that work for you
with platform device drivers?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
