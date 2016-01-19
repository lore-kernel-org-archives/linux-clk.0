Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56747 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757208AbcASXiz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jan 2016 18:38:55 -0500
Subject: Re: [PATCH v2 2/3] clk: s2mps11: merge two for loop in one
To: Andi Shyti <andi.shyti@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
 <1453193552-4761-3-git-send-email-andi.shyti@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Andi Shyti <andi@etezian.org>,
	Yadwinder Singh Brar <yadi.brar01@gmail.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <569EC90D.9040409@samsung.com>
Date: Wed, 20 Jan 2016 08:38:53 +0900
MIME-version: 1.0
In-reply-to: <1453193552-4761-3-git-send-email-andi.shyti@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 19.01.2016 17:52, Andi Shyti wrote:
> the driver already loops once, there is no reason to loop again

/s/the/The/

> for a different purpose. Merge the second loop into the first.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 22d4df2..cae92fc 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -202,12 +202,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>  			ret = -ENOMEM;
>  			goto err_reg;
>  		}
> -	}
> -
> -	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
> -		/* Skip clocks not present on S2MPS14 */
> -		if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)

You changed this line in patch 1/3 - meaningless. This is a indication
that this patch should go before 1st.

BR,
Krzysztof

> -			continue;
>  		clk_table[i] = s2mps11_clks[i].clk;
>  	}
>  
> 

