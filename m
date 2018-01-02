Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, ABE Hiroshige <hiroshige.abe.zc@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add FDP clock
Date: Tue, 02 Jan 2018 17:54:44 +0200
Message-ID: <2397934.0Hfvr3l64P@avalon>
In-Reply-To: <1514906503-8535-1-git-send-email-geert+renesas@glider.be>
References: <1514906503-8535-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Tuesday, 2 January 2018 17:21:43 EET Geert Uytterhoeven wrote:
> From: ABE Hiroshige <hiroshige.abe.zc@renesas.com>
> 
> This patch adds FDP1-0 clock to the R8A7796 SoC.
> 
> Signed-off-by: ABE Hiroshige <hiroshige.abe.zc@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: s/fdp0/fdp1-0/]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I can't verify the parent clock, but apart from that,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This gets rid of the following error messages during boot and system
> resume:
> 
>     renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 119:
> -2 rcar_fdp1 fe940000.fdp1: failed to add to PM domain a3vc: -2
> 
> To be queued in clk-renesas-for-v4.16.
> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> b/drivers/clk/renesas/r8a7796-cpg-mssr.c index
> 83a68e51e4ec1d12..dfb267a92f2a20d3 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -117,6 +117,7 @@ static const struct cpg_core_clk r8a7796_core_clks[]
> __initconst = { };
> 
>  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
> +	DEF_MOD("fdp1-0",		 119,	R8A7796_CLK_S0D1),
>  	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
>  	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
>  	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),

-- 
Regards,

Laurent Pinchart
