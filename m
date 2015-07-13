Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A3B2BD.1010308@linaro.org>
Date: Mon, 13 Jul 2015 07:44:45 -0500
From: Alex Elder <elder@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 29/45] clk: bcm: Include clk.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-30-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-30-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/10/2015 06:33 PM, Stephen Boyd wrote:
> This clock provider uses the consumer API, so include clk.h
> explicitly.
> 
> Cc: Alex Elder <elder@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/clk/bcm/clk-kona.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
> index 79a98506c433..5638de8c6489 100644
> --- a/drivers/clk/bcm/clk-kona.c
> +++ b/drivers/clk/bcm/clk-kona.c
> @@ -16,6 +16,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
> +#include <linux/clk.h>
>  
>  /*
>   * "Policies" affect the frequencies of bus clocks provided by a
> 

