Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 10 May 2016 08:41:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
	mturquette@baylibre.com, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.wolfsonmicro.com
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Message-ID: <20160510074125.GI19473@dell>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160507005510.GO3492@codeaurora.org>
 <20160509074459.GD8324@dell>
 <20160509193404.GP3492@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160509193404.GP3492@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, 09 May 2016, Stephen Boyd wrote:
> On 05/09, Lee Jones wrote:
> > On Fri, 06 May 2016, Stephen Boyd wrote:
> > 
> > > On 01/08, Charles Keepax wrote:
> > > > Now we have a clock driver that can control the 32k clock use this
> > > > rather than directly controlling the 32k clock from the MFD device.
> > > > 
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > > > ---
> > > 
> > > Applied to clk-next
> > 
> > If you're going to take the set though the clk tree, don't forget to
> > sent out a pull-request of the immutable branch you created.  If
> > you're not happy to do that, drop the patch and I'll happily oblige.
> > 
> 
> Oh sorry, I got confused. I thought you acked this mfd patch so I could
> take it through the clk tree but it seems you acked them so you
> could apply it later without re-reviewing it?

Right, that's what I mean by "for my own reference".  Since MFD is
more often than not the central/parent device, it's usually easier to
tunnel patch sets through the MFD, and I will always sent out a
pull-requests out to the other maintainers concerned in order to
prevent merge conflicts for Linus.

> Either way, I'm going to drop these patches for now and wait for
> a v4 because Charles has suggested there are some more issues to
> work out.

Sure.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
