Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143E8C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 08:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D45F32082F
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 08:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="pbDrN2zk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbfC2IpG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 04:45:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46227 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbfC2IpG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 04:45:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D70BB25BECC;
        Fri, 29 Mar 2019 19:45:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553849104; bh=nvOjSuN3Bf+3PwLBlvMHL5GwCovf2GdHWKFo4yha1+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pbDrN2zk14LSmAWmeA80zT7gyotdPPEew8X1yhXQA8fxSWSaADbmdEoGRcWP3czZo
         pF4/c7GZy1k6pXPKlFDfZpbJ2wtE7yLpvPlP1HfiLuKfczZwGjxIzrlTRQngH6orXw
         70BVVcdPoK070mvRS94gVSoivvVDlsj25jj1hFEM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D20E5940381; Fri, 29 Mar 2019 09:45:01 +0100 (CET)
Date:   Fri, 29 Mar 2019 09:45:01 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate()
 return value
Message-ID: <20190329084501.mbtss6szqpvbv5ce@verge.net.au>
References: <20190327123133.7949-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327123133.7949-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:31:33PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> cpg_sd_clock_round_rate() may return an unsupported clock rate for the
> requested clock rate. Therefore, when cpg_sd_clock_set_rate() sets the
> clock rate acquired by cpg_sd_clock_round_rate(), an error may occur.
> 
> This is not conform the clk API design.
> 
> This patch fixes that by making sure cpg_sd_clock_calc_div() considers
> only the division values defined in cpg_sd_div_table[].
> With this fix, the cpg_sd_clock_round_rate() always return a support
> clock rate.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.2.
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index d5fb768b089ff1c1..d2745c57207efc01 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -3,6 +3,7 @@
>   * R-Car Gen3 Clock Pulse Generator
>   *
>   * Copyright (C) 2015-2018 Glider bvba
> + * Copyright (C) 2019 Renesas Electronics Corp.
>   *
>   * Based on clk-rcar-gen3.c
>   *
> @@ -236,8 +237,6 @@ struct sd_clock {
>  	const struct sd_div_table *div_table;
>  	struct cpg_simple_notifier csn;
>  	unsigned int div_num;
> -	unsigned int div_min;
> -	unsigned int div_max;
>  	unsigned int cur_div_idx;
>  };
>  
> @@ -314,14 +313,20 @@ static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
>  					  unsigned long rate,
>  					  unsigned long parent_rate)
>  {
> -	unsigned int div;
> -
> -	if (!rate)
> -		rate = 1;
> +	unsigned long calc_rate, best_rate = 0, diff, diff_min = ULONG_MAX;
> +	unsigned int i;
>  
> -	div = DIV_ROUND_CLOSEST(parent_rate, rate);
> +	for (i = 0; i < clock->div_num; i++) {
> +		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
> +					      clock->div_table[i].div);
> +		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
> +		if (diff <= diff_min) {
> +			best_rate = calc_rate;
> +			diff_min = diff;
> +		}
> +	}

My reading is that.
a) this algorithm picks a clock based on the div field of the
   members of cpg_sd_div_table. and
b) in the case of duplicate values of that field the first one is chosen; and
c) such duplicates (of sd_div values) do exist in cpg_sd_div_table

Is this the intended behaviour?

>  
> -	return clamp_t(unsigned int, div, clock->div_min, clock->div_max);
> +	return DIV_ROUND_CLOSEST(parent_rate, best_rate);

Would it be better to return the value of clock->div_table[i].div
that yielded best_rate?

>  }
>  
>  static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
> @@ -405,13 +410,6 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
>  	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
>  	writel(val, clock->csn.reg);
>  
> -	clock->div_max = clock->div_table[0].div;
> -	clock->div_min = clock->div_max;
> -	for (i = 1; i < clock->div_num; i++) {
> -		clock->div_max = max(clock->div_max, clock->div_table[i].div);
> -		clock->div_min = min(clock->div_min, clock->div_table[i].div);
> -	}
> -
>  	clk = clk_register(NULL, &clock->hw);
>  	if (IS_ERR(clk))
>  		goto free_clock;
> -- 
> 2.17.1
> 
