Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36344 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750704AbdGLXRa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2017 19:17:30 -0400
Date: Wed, 12 Jul 2017 16:17:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: dan.carpenter@oracle.com, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: fixed static checker warning in
 clk_cpumux_get_parent call
Message-ID: <20170712231726.GQ22780@codeaurora.org>
References: <59fd4aa684632f1d9d2e7573a95bc42850e81690.1499701486.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <59fd4aa684632f1d9d2e7573a95bc42850e81690.1499701486.git.sean.wang@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/11, sean.wang@mediatek.com wrote:
> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> index edd8e69..c6a3a1a 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -27,7 +27,6 @@ static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
>  static u8 clk_cpumux_get_parent(struct clk_hw *hw)
>  {
>  	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
> -	int num_parents = clk_hw_get_num_parents(hw);
>  	unsigned int val;
>  
>  	regmap_read(mux->regmap, mux->reg, &val);
> @@ -35,17 +34,18 @@ static u8 clk_cpumux_get_parent(struct clk_hw *hw)
>  	val >>= mux->shift;
>  	val &= mux->mask;
>  
> -	if (val >= num_parents)
> -		return -EINVAL;
> -

Yeah we really need to fix the get_parent() op to return a
clk_hw pointer instead. Time for another migration plan...

>  	return val;
>  }
>  
>  static int clk_cpumux_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 mask, val;
>  
> +	if (index >= num_parents)
> +		return -EINVAL;

When would we call this function with an invalid index? The
framework should be making sure to only call it with an index
that's valid. So perhaps this hunk can be left out?


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
