Return-Path: <boris.brezillon@free-electrons.com>
Date: Mon, 20 Jul 2015 10:36:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 44/45] clk: at91: Include clk.h and slab.h
Message-ID: <20150720103637.7bb5d082@bbrezillon>
In-Reply-To: <1436571223-10959-45-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-45-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Fri, 10 Jul 2015 16:33:42 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> This clock provider uses the consumer API, so include clk.h
> explicitly. Also include slab.h instead of relying on clkdev.h
> for it.
> 
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/clk/at91/clk-slow.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
> index 98a84a865fe1..0a7aef39ab5b 100644
> --- a/drivers/clk/at91/clk-slow.c
> +++ b/drivers/clk/at91/clk-slow.c
> @@ -10,8 +10,10 @@
>   *
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> +#include <linux/slab.h>
>  #include <linux/clk/at91_pmc.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
