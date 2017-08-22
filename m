Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33230 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754714AbdHVHt5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2017 03:49:57 -0400
Date: Tue, 22 Aug 2017 09:49:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: renesas: r8a7795: Add Z2 clock
Message-ID: <20170822074952.GC30838@verge.net.au>
References: <1501852980-22733-1-git-send-email-horms+renesas@verge.net.au>
 <1501852980-22733-5-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1501852980-22733-5-git-send-email-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 04, 2017 at 03:23:00PM +0200, Simon Horman wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds Z2 clock for r8a7795 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

It seems that this is missing:

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index 084ccf01fae6..b0266a4b0852 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -75,6 +75,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>  
>  	/* Core Clock Outputs */
>  	DEF_BASE("z",           R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
> +	DEF_BASE("z2",          R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
>  	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
>  	DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
>  	DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
> -- 
> 2.1.4
> 
