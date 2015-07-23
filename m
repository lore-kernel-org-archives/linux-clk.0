Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1437636434.29746.1.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/6] clk: fractional-divider: keep mwidth and nwidth
 internally
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Date: Thu, 23 Jul 2015 10:27:14 +0300
In-Reply-To: <20150722234500.GF15042@codeaurora.org>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1436886723-111895-4-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20150722004124.GE15042@codeaurora.org>
	 <1437570566.8014.37.camel@linux.intel.com>
	 <20150722234500.GF15042@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2015-07-22 at 16:45 -0700, Stephen Boyd wrote:
> On 07/22, Andy Shevchenko wrote:
> > On Tue, 2015-07-21 at 17:41 -0700, Stephen Boyd wrote:
> > > On 07/14, Andy Shevchenko wrote:
> > > > diff --git a/drivers/clk/clk-fractional-divider.c 
> > > > b/drivers/clk/clk
> > > > -fractional-divider.c
> > > > index 7cfcc56..16f42ae 100644
> > > > --- a/drivers/clk/clk-fractional-divider.c
> > > > +++ b/drivers/clk/clk-fractional-divider.c
> > > > @@ -128,9 +128,11 @@ struct clk 
> > > > *clk_register_fractional_divider(struct device *dev,
> > > >  
> > > >  	fd->reg = reg;
> > > >  	fd->mshift = mshift;
> > > > -	fd->mmask = (BIT(mwidth) - 1) << mshift;
> > > > +	fd->mwidth = mwidth;
> > > > +	fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
> > > >  	fd->nshift = nshift;
> > > > -	fd->nmask = (BIT(nwidth) - 1) << nshift;
> > > > +	fd->nwidth = nwidth;
> > > > +	fd->nmask = GENMASK(nwidth - 1, 0) << nshift;
> > > 
> > > Please do the shifts in the GENMASK.
> > 
> > It's not optimal. Waste of performance.
> > 
> > 32-bit case on 32-bit machine (similar to other cases on x86).
> > 
> > a) GENMASK(x - 1, 0) << y
> > 
> >         movl    $32, %ecx
> >         subb    4(%esp), %cl
> >         movl    $-1, %eax
> >         shrl    %cl, %eax
> >         movzbl  8(%esp), %ecx
> >         sall    %cl, %eax
> >         ret
> > 
> > b) GENMASK(x + y - 1, y)
> > 
> >         pushl   %esi
> >         pushl   %ebx
> >         movl    $1, %edx
> >         movzbl  12(%esp), %eax
> >         movzbl  16(%esp), %esi
> >         movl    $-1, %ebx
> >         subl    %eax, %edx
> >         movl    %ebx, %eax
> >         subl    %esi, %edx
> >         leal    31(%edx), %ecx
> >         shrl    %cl, %eax
> >         movl    %esi, %ecx
> >         sall    %cl, %ebx
> >         andl    %ebx, %eax
> >         popl    %ebx
> >         popl    %esi
> >         ret
> > 
> 
> This is not hotpath code, so why do we care?

I care about memory foot print of kernel's .text as well.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
