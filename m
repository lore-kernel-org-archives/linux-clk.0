Return-Path: <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: clk: bulk: silently error out on EPROBE_DEFER
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20180409141303.14537-1-jbrunet@baylibre.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <9addb928-cec2-fda6-699e-489aa4518c64@rock-chips.com>
Date: Wed, 11 Apr 2018 10:54:58 +0800
MIME-Version: 1.0
In-Reply-To: <20180409141303.14537-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On 2018/4/9 22:13, Jerome Brunet wrote:
> In clk_bulk_get(), if we fail to get the clock due to probe deferal, we
> shouldn't print an error message. Just be silent in this case.
> 

I saw a confusing clk get failure log occasionally, but didn't pay
much attention to it as the driver finally probed fine. But probably it
came from clk_bulk_get,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/clk-bulk.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
> index 4c10456f8a32..6904ed6da504 100644
> --- a/drivers/clk/clk-bulk.c
> +++ b/drivers/clk/clk-bulk.c
> @@ -42,8 +42,9 @@ int __must_check clk_bulk_get(struct device *dev, int num_clks,
>   		clks[i].clk = clk_get(dev, clks[i].id);
>   		if (IS_ERR(clks[i].clk)) {
>   			ret = PTR_ERR(clks[i].clk);
> -			dev_err(dev, "Failed to get clk '%s': %d\n",
> -				clks[i].id, ret);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get clk '%s': %d\n",
> +					clks[i].id, ret);
>   			clks[i].clk = NULL;
>   			goto err;
>   		}
> 
