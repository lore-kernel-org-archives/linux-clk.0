Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A3872C.3020301@ti.com>
Date: Mon, 13 Jul 2015 12:38:52 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 43/45] clk: ti: Switch clk-provider.h include to clk.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-44-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-44-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/11/2015 02:33 AM, Stephen Boyd wrote:
> This file isn't a clock provider but uses the consumer API, so
> include clk.h instead of clk-provider.h.
>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/clk/ti/clk-2xxx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ti/clk-2xxx.c b/drivers/clk/ti/clk-2xxx.c
> index c808ab3d2bb2..20cf5eed8c3d 100644
> --- a/drivers/clk/ti/clk-2xxx.c
> +++ b/drivers/clk/ti/clk-2xxx.c
> @@ -16,7 +16,7 @@
>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> -#include <linux/clk-provider.h>
> +#include <linux/clk.h>
>   #include <linux/clk/ti.h>
>
>   static struct ti_dt_clk omap2xxx_clks[] = {
>

