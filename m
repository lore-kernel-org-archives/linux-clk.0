Return-Path: <sboyd@codeaurora.org>
Date: Tue, 15 Mar 2016 15:16:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160315221601.GJ25972@codeaurora.org>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org>
 <20160304152711.GR8418@lukather>
 <20160304171841.GF24999@codeaurora.org>
 <20160308221320.GI8418@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160308221320.GI8418@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 03/08, Maxime Ripard wrote:
> On Fri, Mar 04, 2016 at 09:18:41AM -0800, Stephen Boyd wrote:
> > Oh right. Let's hope third time is the last.
> > 
> > ---8<---
> > From: Stephen Boyd <sboyd@codeaurora.org>
> > Subject: [PATCH] clk: sunxi: Remove use of variable length array
> > 
> > Using an array allocated on the stack may lead to stack overflows
> > and other problems so let's move the allocation to the heap
> > instead. This silences the following checker warning as well.
> > 
> > drivers/clk/sunxi/clk-sun8i-mbus.c:36:29: warning: Variable length array is used.
> > 
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
