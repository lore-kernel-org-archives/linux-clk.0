Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 7 Jul 2015 19:54:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mike Turquette
 <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Silence warnings and cleanup __init usage
Message-ID: <20150707195405.31594ed4@bbrezillon>
In-Reply-To: <20150706213759.GC20866@codeaurora.org>
References: <1436211105-10491-1-git-send-email-sboyd@codeaurora.org>
	<20150706203811.GC3127@piout.net>
	<20150706213759.GC20866@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Mon, 6 Jul 2015 14:37:59 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 07/06, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 06/07/2015 at 12:31:45 -0700, Stephen Boyd wrote :
> > > Remove useless ifdefs around function prototypes to silence the
> > > following sparse warnings when the configs aren't enabled.
> > > 
> > > drivers/clk/at91/clk-h32mx.c:95:13: warning: symbol
> > > 'of_sama5d4_clk_h32mx_setup' was not declared. Should it be
> > > static?
> > > drivers/clk/at91/clk-utmi.c:159:13: warning: symbol
> > > 'of_at91sam9x5_clk_utmi_setup' was not declared. Should it be
> > > static?
> > > 
> > > Plus, using __init in function prototypes doesn't do anything, so
> > > just drop it throughout this file.
> > > 
> > 
> > The main drawback of that removal is that it destroys the alignment
> > throughout the header file :)
> > 
> 
> Ok I can fix the alignment at the same time.
> 
> ---8<---
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: at91: Silence warnings and cleanup __init usage
> 
> Remove useless ifdefs around function prototypes to silence the
> following sparse warnings when the configs aren't enabled.
> 
> drivers/clk/at91/clk-h32mx.c:95:13: warning: symbol
> 'of_sama5d4_clk_h32mx_setup' was not declared. Should it be
> static?
> drivers/clk/at91/clk-utmi.c:159:13: warning: symbol
> 'of_at91sam9x5_clk_utmi_setup' was not declared. Should it be
> static?
> 
> Plus, using __init in function prototypes doesn't do anything, so
> just drop it throughout this file.

I think we should also drop the useless extern keywords.
Otherwise,

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> 
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/at91/pmc.h | 120 +++++++++++++++++++++++--------------------------
>  1 file changed, 56 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index eb8e5dc9076d..619dd02554e6 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -59,71 +59,63 @@ static inline void pmc_write(struct at91_pmc *pmc, int offset, u32 value)
>  int of_at91_get_clk_range(struct device_node *np, const char *propname,
>  			  struct clk_range *range);
>  
> -extern void __init of_at91sam9260_clk_slow_setup(struct device_node *np,
> -						 struct at91_pmc *pmc);
> -
> -extern void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np,
> -						    struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np,
> -						       struct at91_pmc *pmc);
> -extern void __init of_at91rm9200_clk_main_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_main_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> +extern void of_at91sam9260_clk_slow_setup(struct device_node *np,
> +					  struct at91_pmc *pmc);
>  
> -extern void __init of_at91rm9200_clk_pll_setup(struct device_node *np,
> -					       struct at91_pmc *pmc);
> -extern void __init of_at91sam9g45_clk_pll_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> -extern void __init of_at91sam9g20_clk_pllb_setup(struct device_node *np,
> -						 struct at91_pmc *pmc);
> -extern void __init of_sama5d3_clk_pll_setup(struct device_node *np,
> -					    struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_plldiv_setup(struct device_node *np,
> -						  struct at91_pmc *pmc);
> -
> -extern void __init of_at91rm9200_clk_master_setup(struct device_node *np,
> -						  struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_master_setup(struct device_node *np,
> -						  struct at91_pmc *pmc);
> -
> -extern void __init of_at91rm9200_clk_sys_setup(struct device_node *np,
> -					       struct at91_pmc *pmc);
> -
> -extern void __init of_at91rm9200_clk_periph_setup(struct device_node *np,
> -						  struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_periph_setup(struct device_node *np,
> -						  struct at91_pmc *pmc);
> -
> -extern void __init of_at91rm9200_clk_prog_setup(struct device_node *np,
> +extern void of_at91rm9200_clk_main_osc_setup(struct device_node *np,
> +					     struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np,
>  						struct at91_pmc *pmc);
> -extern void __init of_at91sam9g45_clk_prog_setup(struct device_node *np,
> -						 struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_prog_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> -
> -#if defined(CONFIG_HAVE_AT91_UTMI)
> -extern void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> -#endif
> -
> -#if defined(CONFIG_HAVE_AT91_USB_CLK)
> -extern void __init of_at91rm9200_clk_usb_setup(struct device_node *np,
> -					       struct at91_pmc *pmc);
> -extern void __init of_at91sam9x5_clk_usb_setup(struct device_node *np,
> -					       struct at91_pmc *pmc);
> -extern void __init of_at91sam9n12_clk_usb_setup(struct device_node *np,
> -						struct at91_pmc *pmc);
> -#endif
> -
> -#if defined(CONFIG_HAVE_AT91_SMD)
> -extern void __init of_at91sam9x5_clk_smd_setup(struct device_node *np,
> -					       struct at91_pmc *pmc);
> -#endif
> -
> -#if defined(CONFIG_HAVE_AT91_H32MX)
> -extern void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
> -					      struct at91_pmc *pmc);
> -#endif
> +extern void of_at91rm9200_clk_main_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_main_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_pll_setup(struct device_node *np,
> +					struct at91_pmc *pmc);
> +extern void of_at91sam9g45_clk_pll_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +extern void of_at91sam9g20_clk_pllb_setup(struct device_node *np,
> +					  struct at91_pmc *pmc);
> +extern void of_sama5d3_clk_pll_setup(struct device_node *np,
> +				     struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_plldiv_setup(struct device_node *np,
> +					   struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_master_setup(struct device_node *np,
> +					   struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_master_setup(struct device_node *np,
> +					   struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_sys_setup(struct device_node *np,
> +					struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_periph_setup(struct device_node *np,
> +					   struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_periph_setup(struct device_node *np,
> +					   struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_prog_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +extern void of_at91sam9g45_clk_prog_setup(struct device_node *np,
> +					  struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_prog_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +
> +extern void of_at91sam9x5_clk_utmi_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +
> +extern void of_at91rm9200_clk_usb_setup(struct device_node *np,
> +					struct at91_pmc *pmc);
> +extern void of_at91sam9x5_clk_usb_setup(struct device_node *np,
> +					struct at91_pmc *pmc);
> +extern void of_at91sam9n12_clk_usb_setup(struct device_node *np,
> +					 struct at91_pmc *pmc);
> +
> +extern void of_at91sam9x5_clk_smd_setup(struct device_node *np,
> +					struct at91_pmc *pmc);
> +
> +extern void of_sama5d4_clk_h32mx_setup(struct device_node *np,
> +				       struct at91_pmc *pmc);
>  
>  #endif /* __PMC_H_ */
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
