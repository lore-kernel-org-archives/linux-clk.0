Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Nov 2016 12:46:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v3 10/11] clk: Add clk_hw_get_clk() helper API to be used
 by clk providers
Message-ID: <20161103194613.GX16026@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
 <1475138152-859-11-git-send-email-rnayak@codeaurora.org>
 <20161102222208.GT16026@codeaurora.org>
 <581AF698.2030906@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <581AF698.2030906@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/03, Rajendra Nayak wrote:
> 
> 
> On 11/03/2016 03:52 AM, Stephen Boyd wrote:
> > On 09/29, Rajendra Nayak wrote:
> >> Add a helper API that will allow clk providers to turn their clk_hw
> >> structures into struct clk pointer.
> >>
> > 
> > Did I suggest this?
> 
> I did this back when you suggested we store clk_hw's for all
> clocks associated with a gdsc instead of extracting them from
> the clients device tree node.
> 
> > 
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> ---
> >>  drivers/clk/clk.c            | 6 ++++++
> >>  include/linux/clk-provider.h | 1 +
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index 820a939..a084132 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -186,6 +186,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
> >>  }
> >>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
> >>  
> >> +struct clk *clk_hw_get_clk(const struct clk_hw *hw)
> >> +{
> >> +	return hw->clk;
> > 
> > I'd prefer we actually went through all the work and actually
> > allocated another clk structure here. We can add another string
> > or two for the dev_id and con_id too for debug/accouting
> > purposes.
> 
> I don't quite get the part of allocating another clk structure,
> can you please elaborate?
> 

With "per-user" clks we want to have accounting for all the
struct clk consumers of a particular clk_hw instance. Given that
this function lets someone get a clk pointer from a clk_hw
structure, we want to make it follow the same "per-user"
accounting that we already have for each time the call is made.

Also, we want to make sure callers call clk_put() on the clk when
they're done with it. If we don't allocate a new one here that
clk_put() will destroy the one we allocate and assign during
registration time.

So I'm saying we want a wrapper to __clk_create_clk() for clk
providers to use to generate a clk pointer if needed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
