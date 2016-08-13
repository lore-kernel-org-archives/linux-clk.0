Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 17:59:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v2 01/10] clk: Fix inconsistencies in usage of data types
Message-ID: <20160813005952.GG361@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
 <1470904858-11930-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470904858-11930-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Rajendra Nayak wrote:
> index is of type u8 in all places except in clk_hw_get_parent_by_index()
> and return value of all round_rate functions is long except for
> clk_hw_round_rate(). Make them consistent with the rest of the places
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/clk/clk.c            | 4 ++--
>  include/linux/clk-provider.h | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 820a939..e768071 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -261,7 +261,7 @@ static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
>  }
>  
>  struct clk_hw *
> -clk_hw_get_parent_by_index(const struct clk_hw *hw, unsigned int index)
> +clk_hw_get_parent_by_index(const struct clk_hw *hw, u8 index)

I guess this is ok, but u8 seems limiting for no reason and we
may want to expand the parent array at some point in the future
(although it would be a huge change). So I'd like to leave this
alone. Inconsistent as it is.

>  {
>  	struct clk_core *parent;
>  
> @@ -889,7 +889,7 @@ int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>  }
>  EXPORT_SYMBOL_GPL(__clk_determine_rate);
>  
> -unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
> +long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
>  {
>  	int ret;
>  	struct clk_rate_request req;

This function should never return a negative value, so the return
type is unsigned.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
