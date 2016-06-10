Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Correct lvds clock parent
Date: Fri, 10 Jun 2016 16:22:27 +0300
Message-ID: <2566506.K23fCkD3hP@avalon>
In-Reply-To: <1465544673-23181-1-git-send-email-geert+renesas@glider.be>
References: <1465544673-23181-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Friday 10 Jun 2016 09:44:33 Geert Uytterhoeven wrote:
> According to the latest information, the parent clock of the LVDS module
> clock is the S0D4 clock, not the S2D1 clock.
> 
> Note that this change has no influence on actual operation, as the
> rcar-du LVDS encoder driver doesn't use the parent clock's rate.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Will queue in clk-renesas-for-v4.8.
> 
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> b/drivers/clk/renesas/r8a7795-cpg-mssr.c index
> 8f76af6f454d0823..ad01b0b1bc5fa172 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -180,7 +180,7 @@ static const struct mssr_mod_clk r8a7795_mod_clks[]
> __initconst = { DEF_MOD("du2",			 722,	R8A7795_CLK_S2D1),
>  	DEF_MOD("du1",			 723,	R8A7795_CLK_S2D1),
>  	DEF_MOD("du0",			 724,	R8A7795_CLK_S2D1),
> -	DEF_MOD("lvds",			 727,	R8A7795_CLK_S2D1),
> +	DEF_MOD("lvds",			 727,	R8A7795_CLK_S0D4),
>  	DEF_MOD("hdmi1",		 728,	R8A7795_CLK_HDMI),
>  	DEF_MOD("hdmi0",		 729,	R8A7795_CLK_HDMI),
>  	DEF_MOD("vin7",			 804,	R8A7795_CLK_S2D1),

-- 
Regards,

Laurent Pinchart
