Return-Path: <boris.brezillon@free-electrons.com>
Date: Fri, 26 Jun 2015 15:12:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Dueck <davidcdueck@googlemail.com>
Cc: mturquette@linaro.org, nicolas.ferre@atmel.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: at91: clk-h32mxclk: fix memory leak
Message-ID: <20150626151215.2323965f@bbrezillon>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi David,

On Fri, 26 Jun 2015 14:33:27 +0200
David Dueck <davidcdueck@googlemail.com> wrote:

> Do not leak memory if clk_register fails.


Thanks for those fixes. Could you squash them in one single patch.
Once done you can add my

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Best Regards,

Boris

> 
> Signed-off-by: David Dueck <davidcdueck@googlemail.com>
> ---
>  drivers/clk/at91/clk-h32mx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
> index 152dcb3..61566bc 100644
> --- a/drivers/clk/at91/clk-h32mx.c
> +++ b/drivers/clk/at91/clk-h32mx.c
> @@ -116,8 +116,10 @@ void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
>  	h32mxclk->pmc = pmc;
>  
>  	clk = clk_register(NULL, &h32mxclk->hw);
> -	if (!clk)
> +	if (!clk) {
> +		kfree(h32mxclk);
>  		return;
> +	}
>  
>  	of_clk_add_provider(np, of_clk_src_simple_get, clk);
>  }



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
