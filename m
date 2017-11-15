Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47168 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757373AbdKOAld (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Nov 2017 19:41:33 -0500
Date: Tue, 14 Nov 2017 16:41:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: tegra: add fence_delay for clock registers
Message-ID: <20171115004132.GM11955@codeaurora.org>
References: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
 <1510313868-24810-3-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1510313868-24810-3-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/10, Peter De Schrijver wrote:
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>

Some commit text perhaps explaining why we add this?

> ---
>  drivers/clk/tegra/clk.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 872f118..3b8947e 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
>  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
>  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  
> +/* Combined read fence with delay */
> +#define fence_udelay(delay, reg)	\
> +	do {				\
> +		readl_relaxed(reg);	\
> +		udelay(delay);		\

Does the udelay() need to be after the readl()? As far as I
recall, the delay can start spinning before the read returns
because there isn't any sort of barrier between the two. One
approach would be to have an mb() between the read and the delay
so that the read is ordered with respect to the delay. If not, we
need a better comment than "combined read fence with delay".

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
