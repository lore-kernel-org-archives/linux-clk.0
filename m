Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Aug 2016 14:25:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
Message-ID: <20160804212553.GB15690@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

+Rob in case he has any insight

On 07/09, Masahiro Yamada wrote:
> Hi.
> 
> I think the current code allows to add
> clk_providers multiple times against one DT node.
> 
> Are there cases that really need to do so?

If we have clk drivers that have a device driver structure and
also use CLK_OF_DECLARE then we could get into a situation where
they register two providers for the same device node. I can't
think of any other situation where this would happen though.

> 
> 
> I am thinking the behavior of __of_clk_get_from_provider() is strange.
> 
> 
> The result of __of_clk_get_from_provider() has three patterns:
> 
> [1] success
> [2] return -EPROBE_DEFER
> [3] return -EINVAL  (if clkspec == NULL)
> 
> 
> [3] is a rare case.
> So, almost all error cases are treated as -EPROBE_DEFER.
> 

It used to return the last provider's error, but I accidentally
changed that behavior when adding clk_hw providers in commit
0861e5b8cf80 (clk: Add clk_hw OF clk providers, 2016-02-05).
Nobody seems to have complained though, so you're the first to
have reported this.

> 
> 
> A strange scenario
> ------------------
> 
> If a too big clock index is passed in clkspec,
> of_clk_src_onecell_get() returns -EINVAL. This is reasonable.
> 
> 
> But, __of_clk_get_from_provider() tries to search next nodes despite
> that it has already failed to get a clk.
> 
> Then, it reaches the end of list_for_each_entry() loop, and returns
> -EPROBE_DEFER.  This is not deferred probe at all!  In this case,
> __of_clk_get_from_provider() should return -EINVAL.
> 
> 
> If this is a bug, I am happy to volunteer to fix it.
> 
> 

Right, a behavior change that shouldn't have happened. How about
this patch?

-----8<-----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d584004f7af7..cd8106b17cf4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3125,7 +3125,7 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 {
 	struct of_clk_provider *provider;
 	struct clk *clk = ERR_PTR(-EPROBE_DEFER);
-	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
+	struct clk_hw *hw;
 
 	if (!clkspec)
 		return ERR_PTR(-EINVAL);
@@ -3133,12 +3133,13 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 	/* Check if we have such a provider in our array */
 	mutex_lock(&of_clk_mutex);
 	list_for_each_entry(provider, &of_clk_providers, link) {
-		if (provider->node == clkspec->np)
+		if (provider->node == clkspec->np) {
 			hw = __of_clk_get_hw_from_provider(provider, clkspec);
-		if (!IS_ERR(hw)) {
 			clk = __clk_create_clk(hw, dev_id, con_id);
+		}
 
-			if (!IS_ERR(clk) && !__clk_get(clk)) {
+		if (!IS_ERR(clk)) {
+			if (!__clk_get(clk)) {
 				__clk_free_clk(clk);
 				clk = ERR_PTR(-ENOENT);
 			}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
