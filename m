Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 12 Jul 2017 21:47:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	"open list:CLK API" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Provide bulk prepare_enable disable_unprepare
 variants
Message-ID: <20170713044751.GM1618@tuxbook>
References: <20170712220416.31785-1-bjorn.andersson@linaro.org>
 <20170712230432.GD22780@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170712230432.GD22780@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed 12 Jul 16:04 PDT 2017, Stephen Boyd wrote:

> On 07/12, Bjorn Andersson wrote:
> > This extends the existing set of bulk helpers with prepare_enable and
> > disable_unprepare variants.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Looks good. I can stick this under a tag in clk tree if you like
> so that it can be pulled into various driver trees?
> 

Yes please, I have a number of drivers that I could get moved over for
v4.14.

Regards,
Bjorn
