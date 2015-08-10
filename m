Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Message-ID: <55C91082.6040705@gmail.com>
Date: Mon, 10 Aug 2015 22:58:42 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: si5351: Convert __clk_get_name() to clk_hw_get_name()
References: <1438990544-8464-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438990544-8464-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 08.08.2015 01:35, Stephen Boyd wrote:
> This driver uses __clk_get_name() when it's dealing with struct
> clk_hw pointers. Use the simpler form so that we can get rid of
> the clk member in struct clk_hw one day.
>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Sorry for the late response,

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>



> ---
>
> This depends on the series that introduces clk_hw_get_name()[1].
>
> [1] http://lkml.kernel.org/r/<1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
>
>   drivers/clk/clk-si5351.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 4b2ee39f05fd..5596c0aac22f 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -439,7 +439,7 @@ static unsigned long si5351_pll_recalc_rate(struct clk_hw *hw,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk),
> +		__func__, clk_hw_get_name(hw),
>   		hwdata->params.p1, hwdata->params.p2, hwdata->params.p3,
>   		parent_rate, (unsigned long)rate);
>
> @@ -497,7 +497,7 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: a = %lu, b = %lu, c = %lu, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk), a, b, c,
> +		__func__, clk_hw_get_name(hw), a, b, c,
>   		*parent_rate, rate);
>
>   	return rate;
> @@ -521,7 +521,7 @@ static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk),
> +		__func__, clk_hw_get_name(hw),
>   		hwdata->params.p1, hwdata->params.p2, hwdata->params.p3,
>   		parent_rate, rate);
>
> @@ -632,7 +632,7 @@ static unsigned long si5351_msynth_recalc_rate(struct clk_hw *hw,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, m = %lu, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk),
> +		__func__, clk_hw_get_name(hw),
>   		hwdata->params.p1, hwdata->params.p2, hwdata->params.p3,
>   		m, parent_rate, (unsigned long)rate);
>
> @@ -745,7 +745,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: a = %lu, b = %lu, c = %lu, divby4 = %d, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk), a, b, c, divby4,
> +		__func__, clk_hw_get_name(hw), a, b, c, divby4,
>   		*parent_rate, rate);
>
>   	return rate;
> @@ -777,7 +777,7 @@ static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, divby4 = %d, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk),
> +		__func__, clk_hw_get_name(hw),
>   		hwdata->params.p1, hwdata->params.p2, hwdata->params.p3,
>   		divby4, parent_rate, rate);
>
> @@ -1042,7 +1042,7 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk), (1 << rdiv),
> +		__func__, clk_hw_get_name(hw), (1 << rdiv),
>   		*parent_rate, rate);
>
>   	return rate;
> @@ -1093,7 +1093,7 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>
>   	dev_dbg(&hwdata->drvdata->client->dev,
>   		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
> -		__func__, __clk_get_name(hwdata->hw.clk), (1 << rdiv),
> +		__func__, clk_hw_get_name(hw), (1 << rdiv),
>   		parent_rate, rate);
>
>   	return 0;
>
