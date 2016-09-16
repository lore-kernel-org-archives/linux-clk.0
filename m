Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:12:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Jay Sternberg <jay.e.sternberg@intel.com>,
	Jens Axboe <axboe@fb.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Alan Tull <atull@opensource.altera.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] clk: probe common clock drivers earlier
Message-ID: <20160916231245.GX7243@codeaurora.org>
References: <1463755793-9131-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATY9wTjHjsLtGHAJ-DueqXcCHdrw_uoSfyTOEmpp-ZPGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNATY9wTjHjsLtGHAJ-DueqXcCHdrw_uoSfyTOEmpp-ZPGw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Masahiro Yamada wrote:
> Hi Stephen, Greg,
> 
> 
> 2016-05-20 23:49 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > Several SoCs implement platform drivers for clocks rather than
> > CLK_OF_DECLARE().  Clocks should come earlier because they are
> > prerequisites for many of other drivers.  It will help to mitigate
> > EPROBE_DEFER issues.
> >
> > Also, drop the comment since it does not look valuable.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > Changes in v2:
> >   - Move clk/ above dma/ since DMA drivers generally enable clk
> >
> >  drivers/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/Makefile b/drivers/Makefile
> > index 8f5d076..ff39051 100644
> > --- a/drivers/Makefile
> > +++ b/drivers/Makefile
> > @@ -29,6 +29,8 @@ obj-$(CONFIG_SFI)             += sfi/
> >  # was used and do nothing if so
> >  obj-$(CONFIG_PNP)              += pnp/
> >  obj-y                          += amba/
> > +
> > +obj-y                          += clk/
> >  # Many drivers will want to use DMA so this has to be made available
> >  # really early.
> >  obj-$(CONFIG_DMADEVICES)       += dma/
> > @@ -141,8 +143,6 @@ obj-$(CONFIG_VHOST_RING)    += vhost/
> >  obj-$(CONFIG_VLYNQ)            += vlynq/
> >  obj-$(CONFIG_STAGING)          += staging/
> >  obj-y                          += platform/
> > -#common clk code
> > -obj-y                          += clk/
> >
> >  obj-$(CONFIG_MAILBOX)          += mailbox/
> >  obj-$(CONFIG_HWSPINLOCK)       += hwspinlock/
> 
> 
> What do you think of this patch?
> 

I assumed Greg would pick it up given that Mike already acked it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
