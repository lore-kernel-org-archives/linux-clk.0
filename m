Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40222 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbbGMWlR (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jul 2015 18:41:17 -0400
Message-ID: <55A43E8B.8020104@codeaurora.org>
Date: Mon, 13 Jul 2015 15:41:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>,
	boris.brezillon@free-electrons.com
CC: linux-clk@vger.kernel.org
Subject: Re: clk: change clk_ops' ->determine_rate() prototype
References: <20150710082612.GC29999@mwanda>
In-Reply-To: <20150710082612.GC29999@mwanda>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/10/2015 01:26 AM, Dan Carpenter wrote:
> Hello Boris Brezillon,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 4a7c639697ef: "clk: change clk_ops' ->determine_rate()
> prototype" from Jul 7, 2015, leads to the following Smatch complaint:
>
> drivers/clk/clk.c:458 clk_mux_determine_rate_flags()
> 	 error: we previously assumed 'parent' could be null (see line 452)
>
> drivers/clk/clk.c
>     451			if (core->flags & CLK_SET_RATE_PARENT) {
>     452				ret = __clk_determine_rate(parent ? parent->hw : NULL,
>                                                             ^^^^^^
> Check for NULL.
>
>     453							   &parent_req);
>     454				if (ret)
>     455					return ret;
>     456	
>     457				best = parent_req.rate;
>     458				req->best_parent_hw = parent->hw;
>                                                        ^^^^^^^^^^
> Patch adds unchecked dereference.
>
>     459				req->best_parent_rate = best;
>     460			} else if (parent) {
>
>

Thanks Dan.

Boris,

It looks like the transformation here isn't equivalent. If parent is 
NULL here and we don't crash, parent_req->rate == req->rate and before 
this patch req->rate would be 0 instead. How about this patch squashed 
in? It includes some of the removals of best_parent_* assignments that 
you had in your follow-up patch, because those make it equivalent to the 
previous code.

------8<----

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c182d8a7924e..244a6535c69c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -455,16 +455,10 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, struct clk_rate_request *req,
  				return ret;
  
  			best = parent_req.rate;
-			req->best_parent_hw = parent->hw;
-			req->best_parent_rate = best;
  		} else if (parent) {
  			best = clk_core_get_rate_nolock(parent);
-			req->best_parent_hw = parent->hw;
-			req->best_parent_rate = best;
  		} else {
  			best = clk_core_get_rate_nolock(core);
-			req->best_parent_hw = NULL;
-			req->best_parent_rate = 0;
  		}
  
  		goto out;
@@ -810,8 +804,10 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
   */
  int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
  {
-	if (!hw)
+	if (!hw) {
+		req->rate = 0;
  		return 0;
+	}
  
  	return clk_core_round_rate_nolock(hw->core, req);
  }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

