Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:28:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Fix the clock provider
 registration
Message-ID: <20161017222851.GH8871@codeaurora.org>
References: <20160929142855.30408-1-gregory.clement@free-electrons.com>
 <87h98ovb4i.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87h98ovb4i.fsf@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/07, Gregory CLEMENT wrote:
> Hi Stephen and Mike
>  
>  On jeu., sept. 29 2016, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:
> 
> > While trying using a peripheral clock on a driver, I saw that the clock
> > pointer returned by the provider was NULL.
> >
> > The problem was a missing indirection. It was the pointer stored in the
> > hws array which needed to be updated not the value it contains.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> 
> I saw that you already did the pull request for the clk subsystem.
> 
> Do you consider to do a another pull request for the fixes?
> 
> It would be nice to have this driver working since the rc1 :)
> 
> For this driver an other fix is needed:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-September/459640.html
> 

Yep I was on vacation/conferencing during the merge window. I'll
be sending off a set of fixes in a couple days.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
