Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 00:27:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Adriana Reus <adriana.reus@nxp.com>
Cc: mturquette@baylibre.com, anson.huang@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] clk: imx: imx7d: Fix parent clock for
 OCRAM_CLK
Message-ID: <20171102072758.GR30645@codeaurora.org>
References: <1506940331-16742-1-git-send-email-adriana.reus@nxp.com>
 <1506940331-16742-2-git-send-email-adriana.reus@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1506940331-16742-2-git-send-email-adriana.reus@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/02, Adriana Reus wrote:
> The parent of OCRAM_CLK should be axi_main_root_clk
> and not axi_post_div.
> 
> before:
> 
>     axi_src                     1       1       332307692       0 0
>       axi_cg                    1       1       332307692       0 0
>         axi_pre_div             1       1       332307692       0 0
>           axi_post_div          1       1       332307692       0 0
>             ocram_clk           0       0       332307692       0 0
>             main_axi_root_clk   1       1       332307692       0 0
> 
> after:
> 
>     axi_src                     1       1       332307692       0 0
>       axi_cg                    1       1       332307692       0 0
>         axi_pre_div             1       1       332307692       0 0
>           axi_post_div          1       1       332307692       0 0
>             main_axi_root_clk   1       1       332307692       0 0
>               ocram_clk         0       0       332307692       0 0
> 
> Reference Doc: i.MX 7D Reference Manual - Chap 5, p 516
> (https://www.nxp.com/docs/en/reference-manual/IMX7DRM.pdf)
> 
> Fixes: 8f6d8094b215 ("ARM: imx: add imx7d clk tree support")
> Signed-off-by: Adriana Reus <adriana.reus@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
