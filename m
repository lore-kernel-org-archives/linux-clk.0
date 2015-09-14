Return-Path: <boris.brezillon@free-electrons.com>
Date: Mon, 14 Sep 2015 16:31:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: at91: utmi: use pmc_read when the at91_pmc is
 available
Message-ID: <20150914163152.30cd3d9c@bbrezillon>
In-Reply-To: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Alexandre,

On Fri, 11 Sep 2015 16:34:06 +0200
Alexandre Belloni <alexandre.belloni@free-electrons.com> wrote:

> at91_pmc_read is a workaround to allow external drivers to acces some
> registers of the PMC. There is no need for it in clk-utmi.c as we aready
> have a pointer to the struct at91_pmc.

Indeed.

> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> ---
>  drivers/clk/at91/clk-utmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index 30dd697b1668..ca561e90a60f 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -47,7 +47,7 @@ static int clk_utmi_prepare(struct clk_hw *hw)
>  {
>  	struct clk_utmi *utmi = to_clk_utmi(hw);
>  	struct at91_pmc *pmc = utmi->pmc;
> -	u32 tmp = at91_pmc_read(AT91_CKGR_UCKR) | AT91_PMC_UPLLEN |
> +	u32 tmp = pmc_read(pmc, AT91_CKGR_UCKR) | AT91_PMC_UPLLEN |
>  		  AT91_PMC_UPLLCOUNT | AT91_PMC_BIASEN;
>  
>  	pmc_write(pmc, AT91_CKGR_UCKR, tmp);
> @@ -73,7 +73,7 @@ static void clk_utmi_unprepare(struct clk_hw *hw)
>  {
>  	struct clk_utmi *utmi = to_clk_utmi(hw);
>  	struct at91_pmc *pmc = utmi->pmc;
> -	u32 tmp = at91_pmc_read(AT91_CKGR_UCKR) & ~AT91_PMC_UPLLEN;
> +	u32 tmp = pmc_read(pmc, AT91_CKGR_UCKR) & ~AT91_PMC_UPLLEN;
>  
>  	pmc_write(pmc, AT91_CKGR_UCKR, tmp);
>  }



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
