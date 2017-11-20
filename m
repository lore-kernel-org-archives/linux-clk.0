Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Nov 2017 11:12:19 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cai Li <cai.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH] clk: fix a panic error caused by accessing NULL pointer
Message-ID: <20171120191219.GD18379@codeaurora.org>
References: <20171120033816.28414-1-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171120033816.28414-1-chunyan.zhang@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Chunyan Zhang wrote:
> From: Cai Li <cai.li@spreadtrum.com>
> 
> In some cases the clock parent would be set NULL when doing re-parent,
> it will cause a NULL pointer accessing if clk_set trace event is enabled,
> since the trace event function would not check the input parameter.
> 
> Signed-off-by: Cai Li <cai.li@spreadtrum.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

Fixes: tag?

> ---
>  drivers/clk/clk.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c8d83ac..64efaf0 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1242,13 +1242,12 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>  
>  	old_parent = __clk_set_parent_before(core, parent);
>  
> -	trace_clk_set_parent(core, parent);
> -
>  	/* change clock input source */
> -	if (parent && core->ops->set_parent)
> +	if (parent && core->ops->set_parent) {
> +		trace_clk_set_parent(core, parent);
>  		ret = core->ops->set_parent(core->hw, p_index);
> -
> -	trace_clk_set_parent_complete(core, parent);
> +		trace_clk_set_parent_complete(core, parent);
> +	}

Is the problem that parent may be NULL and the tracepoint
dereferences it? Perhaps we need to update the tracepoint code
instead so that we always see that the tracepoint is called even
if we don't actually touch the hardware. Something like the patch
below instead.

---8<----
diff --git a/include/trace/events/clk.h b/include/trace/events/clk.h
index 758607226bfd..5a85ea2090c4 100644
--- a/include/trace/events/clk.h
+++ b/include/trace/events/clk.h
@@ -139,7 +139,7 @@ DECLARE_EVENT_CLASS(clk_parent,
 
 	TP_fast_assign(
 		__assign_str(name, core->name);
-		__assign_str(pname, parent->name);
+		__assign_str(pname, parent ? parent->name : NULL);
 	),
 
 	TP_printk("%s %s", __get_str(name), __get_str(pname))
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
