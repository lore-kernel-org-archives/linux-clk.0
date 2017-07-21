Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Jul 2017 14:41:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] clk: si5351: Do not enable parent clocks on probe
Message-ID: <20170721214157.GK19878@codeaurora.org>
References: <1486239477-24720-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486239477-24720-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/04, Sergej Sawazki wrote:
> The si5351 driver should not, by default, enable other clocks in
> the tree. Let the clients decide when to enable the clocks.
> 
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
> ---

I'll bite after many months.

>  drivers/clk/clk-si5351.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index b051db4..f9eb590 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -1442,9 +1442,9 @@ static int si5351_i2c_probe(struct i2c_client *client,
>  	}
>  
>  	if (!IS_ERR(drvdata->pxtal))
> -		clk_prepare_enable(drvdata->pxtal);
> +		clk_prepare(drvdata->pxtal);
>  	if (!IS_ERR(drvdata->pclkin))
> -		clk_prepare_enable(drvdata->pclkin);
> +		clk_prepare(drvdata->pclkin);

Why isn't the prepare also removed?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
