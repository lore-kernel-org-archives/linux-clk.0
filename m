Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbeIUNKv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Sep 2018 09:10:51 -0400
Date: Fri, 21 Sep 2018 09:23:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a77990: Fix incorrect PLL0 divider in
 comment
Message-ID: <20180921072312.vjzbjie32hzsqxll@verge.net.au>
References: <20180919145042.8429-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180919145042.8429-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 19, 2018 at 04:50:42PM +0200, Geert Uytterhoeven wrote:
> PLL0 runs at 4.8 GHz, i.e. EXTAL x 100.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> To be queued in clk-renesas-for-v4.20.
> 
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 7e000d0705891a3f..9eb80180eea0b1a6 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -250,8 +250,8 @@ static const unsigned int r8a77990_crit_mod_clks[] __initconst = {
>  /*
>   * MD19		EXTAL (MHz)	PLL0		PLL1		PLL3
>   *--------------------------------------------------------------------
> - * 0		48 x 1		x100/4		x100/3		x100/3
> - * 1		48 x 1		x100/4		x100/3		 x58/3
> + * 0		48 x 1		x100/1		x100/3		x100/3
> + * 1		48 x 1		x100/1		x100/3		 x58/3
>   */
>  #define CPG_PLL_CONFIG_INDEX(md)	(((md) & BIT(19)) >> 19)
>  
> -- 
> 2.17.1
> 
