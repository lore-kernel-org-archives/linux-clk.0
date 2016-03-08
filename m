Return-Path: <alexandre.belloni@free-electrons.com>
Date: Tue, 8 Mar 2016 04:06:00 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: at91: fix check of clk_register() returned value
Message-ID: <20160308030600.GA5845@piout.net>
References: <1457394089-15319-1-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1457394089-15319-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/03/2016 at 01:41:29 +0200, Vladimir Zapolskiy wrote :
> The clk_register() function returns a valid pointer to struct clk or
> ERR_PTR() error code, this makes a check for returned NULL value
> useless and may lead to oops on error path.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

> ---
> Alexandre, Boris,
> 
> I've seen your recent huge updates to the driver, but I haven't found
> them in clk-next, I hope that this trivial fix against clk-next won't
> cause a big pain on rebase.
> 

They went through arm-soc and should have been in linux-next for a while
now.

>  drivers/clk/at91/clk-h32mx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
> index 61566bc..a165230 100644
> --- a/drivers/clk/at91/clk-h32mx.c
> +++ b/drivers/clk/at91/clk-h32mx.c
> @@ -116,7 +116,7 @@ void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
>  	h32mxclk->pmc = pmc;
>  
>  	clk = clk_register(NULL, &h32mxclk->hw);
> -	if (!clk) {
> +	if (IS_ERR(clk)) {
>  		kfree(h32mxclk);
>  		return;
>  	}
> -- 
> 2.1.4
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
