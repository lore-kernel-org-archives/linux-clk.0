Return-Path: <sboyd@codeaurora.org>
Date: Fri, 23 Sep 2016 15:06:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marcin Wojtas <mw@semihalf.com>
Cc: linux-kernel@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Gregory =?iso-8859-1?Q?Cl=E9ment?= <gregory.clement@free-electrons.com>,
	nadavh@marvell.com, Lior Amsalem <alior@marvell.com>,
	Tomasz Nowicki <tn@semihalf.com>,
	Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: Re: [PATCH v3 3/3] clk: mvebu: migrate CP110 system controller to
 clk_hw API and registration
Message-ID: <20160923220659.GL21232@codeaurora.org>
References: <1474448759-24482-1-git-send-email-mw@semihalf.com>
 <1474448759-24482-4-git-send-email-mw@semihalf.com>
 <20160923214730.GF21232@codeaurora.org>
 <CAPv3WKfDrtDDMPi4oBmpNN_+b4mvG6cVnZT7pNTo8tcNUyzwyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAPv3WKfDrtDDMPi4oBmpNN_+b4mvG6cVnZT7pNTo8tcNUyzwyA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Marcin Wojtas wrote:
> Hi Stephen,
> 
> 2016-09-23 23:47 GMT+02:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 09/21, Marcin Wojtas wrote:
> >> @@ -203,80 +202,75 @@ static int cp110_syscon_clk_probe(struct platform_device *pdev)
> >>       if (ret)
> >>               return ret;
> >>
> >> -     cp110_clks = devm_kcalloc(&pdev->dev, sizeof(struct clk *),
> >> -                               CP110_CLK_NUM, GFP_KERNEL);
> >> -     if (!cp110_clks)
> >> -             return -ENOMEM;
> >> -
> >> -     cp110_clk_data = devm_kzalloc(&pdev->dev,
> >> -                                   sizeof(*cp110_clk_data),
> >> +     cp110_clk_data = devm_kcalloc(&pdev->dev, sizeof(*cp110_clk_data),
> >> +                                   sizeof(struct clk_hw *) * CP110_CLK_NUM,
> >>                                     GFP_KERNEL);
> >
> > This doesn't look right. Why are calloc()ing clk_hw_onecell_data this
> > way?
> 
> After some time, at a first sight it seems I should've used following:
> cp110_clk_data = devm_kzalloc(&pdev->dev, sizeof(*cp110_clk_data) +
>                                                     sizeof(struct
> clk_hw *) * CP110_CLK_NUM,
>                                                     GFP_KERNEL);
> 
> I'll re-check, but is that what you meant?

Yes that looks better.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
