Return-Path: <hofrat@osadl.at>
Date: Thu, 26 Jul 2018 05:43:42 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Kees Cook <keescook@chromium.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers: clk: st: warn on iomap failure
Message-ID: <20180726054342.GA22040@osadl.at>
References: <1531649904-6072-1-git-send-email-hofrat@osadl.org>
 <153255129875.48062.4075642035553635128@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <153255129875.48062.4075642035553635128@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 25, 2018 at 01:41:38PM -0700, Stephen Boyd wrote:
> Quoting Nicholas Mc Guire (2018-07-15 03:18:23)
> >  While the return value of clkgen_get_register_base() is being checked
> > at the call site, there is no indication of failure cause thus making
> > diagnosis of the issues hard. The WARN_ON() allows to determine the
> > cause of failure.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > ---
> > 
> > Problem found by an experimental coccinelle script
> > 
> > Patch was compile tested with: multi_v7_defconfig (implies
> > CONFIG_ARCH_STI=y)
> > 
> > Patch is against 4.18-rc4 (localversion-next is next-20180713)
> > 
> >  drivers/clk/st/clkgen-pll.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> > index cbb5184..aeb30ab 100644
> > --- a/drivers/clk/st/clkgen-pll.c
> > +++ b/drivers/clk/st/clkgen-pll.c
> > @@ -647,6 +647,7 @@ static void __iomem * __init clkgen_get_register_base(
> >                 return NULL;
> >  
> >         reg = of_iomap(pnode, 0);
> > +       WARN_ON(!reg);
> >  
> >         of_node_put(pnode);
> >         return reg;
> 
> Shouldn't the caller blow up on NULL pointer access? This patch doesn't
> seem useful, sorry.
>
if you look at the call chain then there is a check for !NULL along
the way - but never any information - no pr_*/printk or the like so
ultimately you would get a failure but not know where that failure came
from - the intent of the WARN_ON() is to allow you to locate the trigger
event. Blowing up with a BUG_ON() is not necessary as the call chain
does check for !NULL along the way.

thx!
hofrat
