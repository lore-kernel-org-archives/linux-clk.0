Return-Path: <boris.brezillon@free-electrons.com>
Date: Mon, 20 Jul 2015 10:39:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [PATCH 18/45] clk: mvebu: Remove clk.h include
Message-ID: <20150720103925.4466345f@bbrezillon>
In-Reply-To: <1436571223-10959-19-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-19-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Adding the mvebu maintainers in Cc.

On Fri, 10 Jul 2015 16:33:16 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Only include the header if necessary. The
> clkdev.h include isn't used here either, so drop it and add in
> slab.h to keep things compiling.
> 
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/mvebu/clk-cpu.c | 3 ++-
>  drivers/clk/mvebu/common.c  | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
> index 3821a88077ea..86888a658d4c 100644
> --- a/drivers/clk/mvebu/clk-cpu.c
> +++ b/drivers/clk/mvebu/clk-cpu.c
> @@ -10,7 +10,8 @@
>   * warranty of any kind, whether express or implied.
>   */
>  #include <linux/kernel.h>
> -#include <linux/clkdev.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/of_address.h>
>  #include <linux/io.h>
> diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
> index 15b370ff3748..4a22429cd7a2 100644
> --- a/drivers/clk/mvebu/common.c
> +++ b/drivers/clk/mvebu/common.c
> @@ -13,8 +13,8 @@
>   */
>  
>  #include <linux/kernel.h>
> +#include <linux/slab.h>
>  #include <linux/clk.h>
> -#include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/of.h>



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
