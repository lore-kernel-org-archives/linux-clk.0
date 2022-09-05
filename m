Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25515C54EE9
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 14:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbiIEOl0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 10:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238083AbiIEOlI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 10:41:08 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D3B5B060
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662388720;
  x=1693924720;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oscAHfsIvM9rN9FINVxD+yrGUWwe8bYXvo7M4237btc=;
  b=dv8a/3qH4rqcbr56kRLjD4Zk5vmy2EAojghygmivt2Uki6JVbElZXIMH
   h6ojBD9mHyAd9N7p5lXo9zMhMp38yaOyltIH7UZTvtps3B7Gf8cT7lfdR
   3HWXiGRmGbrGFtzS0oIx2U4dpEv0qUlvpGpLy57xS3t+G8zzjFSfzAc6y
   TYjsknS+Zajs8c2PTyjU/4PTxVl68h+SeNfgbJxwpA7+lML3VxpDZrSrF
   6exmYRPkVA5qxm3qCcvexvx0XpCapVM1TMDi7TS+P5s3z6na3sal6neVk
   7Dk2W+Entu7iSC3dSkC68VdZBvxZ8uni1vVz7zjI6QpGmlkyiAdG4IcEL
   A==;
Message-ID: <71a9367c-6565-aaed-0bd2-13bf28658110@axis.com>
Date:   Mon, 5 Sep 2022 16:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND] clk: si5351: update multisynth limits
Content-Language: en-US
To:     Jens Renner <renner@efe-gmbh.de>, <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <sebastian.hesselbarth@gmail.com>
References: <20211208154238.71727-1-renner@efe-gmbh.de>
From:   Waseem Arshad <Waseem.Arshad@axis.com>
In-Reply-To: <20211208154238.71727-1-renner@efe-gmbh.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail03w.axis.com (10.20.40.9) To se-mail03w.axis.com
 (10.20.40.9)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jens,

I had problems generating correct frequency values with your patch.

On 12/8/21 16:42, Jens Renner wrote:

> The revised datasheet (rev. 1.0 and later) specifies new limits for the
> multisynth dividers that lead to an extended clock output frequency
> range of 2.5 kHz - 200 MHz [1].
>
> [1] https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public
> /data-sheets/Si5351-B.pdf
>
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---
>   drivers/clk/clk-si5351.c | 15 ++++++++-------
>   drivers/clk/clk-si5351.h |  8 ++++----
>   2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 57e4597cdf4c..56bc59f91d20 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -556,7 +556,7 @@ static const struct clk_ops si5351_pll_ops = {
>    * MS[6,7] are integer (P1) divide only, P1 = divide value,
>    * P2 and P3 are not applicable
>    *
> - * for 150MHz < fOUT <= 160MHz:
> + * for 150MHz < fOUT <= 200MHz:
>    *
>    * MSx_P1 = 0, MSx_P2 = 0, MSx_P3 = 1, MSx_INT = 1, MSx_DIVBY4 = 11b
>    */
> @@ -653,7 +653,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>   	if (hwdata->num >= 6 && rate > SI5351_MULTISYNTH67_MAX_FREQ)
>   		rate = SI5351_MULTISYNTH67_MAX_FREQ;
>   
> -	/* multisync frequency is 1MHz .. 160MHz */
> +	/* multisync frequency is 300kHz .. 200MHz */
>   	if (rate > SI5351_MULTISYNTH_MAX_FREQ)
>   		rate = SI5351_MULTISYNTH_MAX_FREQ;
>   	if (rate < SI5351_MULTISYNTH_MIN_FREQ)
> @@ -681,8 +681,8 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>   
>   		*parent_rate = a * rate;
>   	} else if (hwdata->num >= 6) {
> -		/* determine the closest integer divider */
> -		a = DIV_ROUND_CLOSEST(*parent_rate, rate);
> +		/* determine the closest even integer divider */
> +		a = DIV_ROUND_CLOSEST(*parent_rate/2, rate) * 2;
>   		if (a < SI5351_MULTISYNTH_A_MIN)
>   			a = SI5351_MULTISYNTH_A_MIN;
>   		if (a > SI5351_MULTISYNTH67_A_MAX)
> @@ -715,7 +715,8 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>   
>   		b = 0;
>   		c = 1;
> -		if (rfrac)
> +		/* Smallest divider in fractional mode must be > 8 (AN619)! */
> +		if (rfrac && (a >= 8))
>   			rational_best_approximation(rfrac, denom,
>   			    SI5351_MULTISYNTH_B_MAX, SI5351_MULTISYNTH_C_MAX,
>   			    &b, &c);
> @@ -1039,11 +1040,11 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>   		container_of(hw, struct si5351_hw_data, hw);
>   	unsigned char rdiv;
>   
> -	/* clkout6/7 can only handle output freqencies < 150MHz */
> +	/* clkout6/7 can only handle output frequencies < 150MHz */
>   	if (hwdata->num >= 6 && rate > SI5351_CLKOUT67_MAX_FREQ)
>   		rate = SI5351_CLKOUT67_MAX_FREQ;
>   
> -	/* clkout freqency is 8kHz - 160MHz */
> +	/* clkout frequency is 2.5kHz - 200MHz */
>   	if (rate > SI5351_CLKOUT_MAX_FREQ)
>   		rate = SI5351_CLKOUT_MAX_FREQ;
>   	if (rate < SI5351_CLKOUT_MIN_FREQ)
> diff --git a/drivers/clk/clk-si5351.h b/drivers/clk/clk-si5351.h
> index 73dc8effc519..f799dc6ea8a1 100644
> --- a/drivers/clk/clk-si5351.h
> +++ b/drivers/clk/clk-si5351.h
> @@ -13,11 +13,11 @@
>   
>   #define SI5351_PLL_VCO_MIN			600000000
>   #define SI5351_PLL_VCO_MAX			900000000
> -#define SI5351_MULTISYNTH_MIN_FREQ		1000000
> +#define SI5351_MULTISYNTH_MIN_FREQ		300000

 > The lower limit should be 500KHz (AN619: 
https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/application-notes/AN619.pdf)

Changing the lower limit in your patch to 500KHz solved the problem.

>   #define SI5351_MULTISYNTH_DIVBY4_FREQ		150000000
> -#define SI5351_MULTISYNTH_MAX_FREQ		160000000
> +#define SI5351_MULTISYNTH_MAX_FREQ		200000000
>   #define SI5351_MULTISYNTH67_MAX_FREQ		SI5351_MULTISYNTH_DIVBY4_FREQ
> -#define SI5351_CLKOUT_MIN_FREQ			8000
> +#define SI5351_CLKOUT_MIN_FREQ			2500
>   #define SI5351_CLKOUT_MAX_FREQ			SI5351_MULTISYNTH_MAX_FREQ
>   #define SI5351_CLKOUT67_MAX_FREQ		SI5351_MULTISYNTH67_MAX_FREQ
>   
> @@ -26,7 +26,7 @@
>   #define SI5351_PLL_B_MAX			(SI5351_PLL_C_MAX-1)
>   #define SI5351_PLL_C_MAX			1048575
>   #define SI5351_MULTISYNTH_A_MIN			6
> -#define SI5351_MULTISYNTH_A_MAX			1800
> +#define SI5351_MULTISYNTH_A_MAX			2048
>   #define SI5351_MULTISYNTH67_A_MAX		254
>   #define SI5351_MULTISYNTH_B_MAX			(SI5351_MULTISYNTH_C_MAX-1)
>   #define SI5351_MULTISYNTH_C_MAX			1048575
