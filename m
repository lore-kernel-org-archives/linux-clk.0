Return-Path: <niklas.soderlund@ragnatech.se>
Return-Path: <niklas.soderlund@ragnatech.se>
Date: Thu, 17 May 2018 16:39:04 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Add CR clock
Message-ID: <20180517143904.GA24534@bigcity.dyn.berto.se>
References: <1526552462-3476-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1526552462-3476-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thanks for your patch.

On 2018-05-17 12:21:02 +0200, Geert Uytterhoeven wrote:
> Add the CR core clock, which is used by the Secure Engine (SCEG).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Pending successfull use of the SCEG.
> 
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index 775b0ceaa3378a83..e5b186566c097dd0 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -103,6 +103,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>  	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x26c),
>  
>  	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
> +	DEF_FIXED("cr",         R8A7795_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
>  	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
>  
>  	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
