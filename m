Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajan Vaja <rajan.vaja@xilinx.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520518500-5500-1-git-send-email-rajanv@xilinx.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, JOLLYS@xilinx.com,
 michals@xilinx.com, Rajan Vaja <rajanv@xilinx.com>
References: <1520518500-5500-1-git-send-email-rajanv@xilinx.com>
Message-ID: <152061989141.26240.15533446439693285034@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: clk-fixed-factor: Use new macro CLK_OF_DECLARE_DRIVER
Date: Fri, 09 Mar 2018 10:24:51 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajan Vaja (2018-03-08 06:15:00)
> Fixed factor clock has two initialization at of_clk_init()
> time and also during platform driver probe. So declare the
> fixed factor clock with CLK_OF_DECLARE_DRIVER instead of
> CLK_OF_DECLARE.
> =

> See below commit for reference:
> "clk: sunxi: apb0: Use new macro CLK_OF_DECLARE_DRIVER"
> (sha1: 915128b621a05c63fa58ca9e4cbdf394bbe592f3)
> =

> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> Suggested-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  drivers/clk/clk-fixed-factor.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-facto=
r.c
> index a5d402d..d72ef2d 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -196,8 +196,9 @@ void __init of_fixed_factor_clk_setup(struct device_n=
ode *node)
>  {
>         _of_fixed_factor_clk_setup(node);
>  }
> -CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
> -               of_fixed_factor_clk_setup);
> +
> +CLK_OF_DECLARE_DRIVER(fixed_factor_clk, "fixed-factor-clock",
> +                     of_fixed_factor_clk_setup);
> =


Is the intent to register the clk twice? I believe things are working as
intended without this patch, so maybe you can explain a little more what
you're trying to fix.
