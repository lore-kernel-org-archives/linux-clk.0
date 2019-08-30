Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0513BC3A5A6
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 22:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA5B623431
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 22:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="p8F42Hz8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfH3WXL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 18:23:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45958 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbfH3WXL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 18:23:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id l1so7768327lji.12
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2019 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=aFhn7iu9I5henNaKqHi8L7m05WmSjwIRVZYHP8MdkwY=;
        b=p8F42Hz85A/2/K3UAyY7njPU6+S6o3PFI6WBLvzxiF6xubBIze4iseKYD8HBWhNTyR
         I3vqR8EI6TogIXXp+qkhIfZCbZGJ1JzeCp5LQJOG3EKLFpIZsipeF3Q4vnaJ6BHd8fyr
         AgHPxOTzGkzL1EBtfa+AgVsUD5U1r0CvBJk4+SxzepfD78zbCBh/r2VnfmIX9nzSCsjM
         d9jTzzvj2vjyK1fVjfPCPG+BDyV9oKldBb8kXHpBefEA5nhl60O47wA60XxI8u1S8Rai
         wK2G9JQKMNylGBXxXpOPGstmvNx6gJy7uKSdt0bCiVNVz26qSWEdX8ZrRbT5VPHATxUN
         Cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aFhn7iu9I5henNaKqHi8L7m05WmSjwIRVZYHP8MdkwY=;
        b=agag0nc8dBc+0zGMmqWLh6KvX345T2An8+bQ4/l70AXUiDWAPBudlP+0l+7hFzbTTo
         QAFrN8nYcR/ot3a/k7/AtD0l+NTdHleG6vinSDh/NF5uThFposAlrvpuQz+kw0xNJKR8
         l7AvA4V8fy2hyjZ4/4Zx2SzM3SjB5H8pWcCOdYXioiStxtyv/hIbMpnD+a6GmJT/7ldz
         Z9VD6nopJTKT34Ed2fzsVWkaUB6kzc05ohyY3JXKl8g4oAQI6HjVvRAEW1MM1llpVg9E
         xtonk6pCTOVSCFjNv1+LECJSN8ZnYZC6Y5h78lFdx8M80msxCclW2B43mrXPsUtPDXGm
         aq0w==
X-Gm-Message-State: APjAAAUL6sUaiqiVyf8GSQbQQPpduXGj0Zfskg/2V0XNIKjst4NUf/GN
        EtKnp/V7VvoCYgXJcAEHwwc8gQ==
X-Google-Smtp-Source: APXvYqyhbYgJEHEwysGkvqQbzaPTOsUlDgHi6Zy0tB39/amTTYUPoeM7rz/ayLHMEeLeAG1JpXjEKw==
X-Received: by 2002:a2e:800a:: with SMTP id j10mr9761006ljg.137.1567203789433;
        Fri, 30 Aug 2019 15:23:09 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id b11sm1139770lfi.91.2019.08.30.15.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 15:23:08 -0700 (PDT)
Date:   Sat, 31 Aug 2019 00:23:07 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/8] clk: renesas: rcar-gen3: Loop to find best rate
 in cpg_sd_clock_round_rate()
Message-ID: <20190830222307.GU8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-6-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-08-30 15:45:12 +0200, Geert Uytterhoeven wrote:
> cpg_sd_clock_round_rate() really needs the best rate, not the best
> divider.  Hence change the iteration to find the former, and get rid of
> the final division.
> 
> Add an out-of-range rate check while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - Split off from "clk: renesas: rcar-gen3: Switch SD clocks to
>     .determine_rate()".
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 12ea5c9a671de788..a612045cba7d97b7 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -312,21 +312,25 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
>  static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
>  				      unsigned long *parent_rate)
>  {
> -	unsigned long calc_rate, diff, diff_min = ULONG_MAX;
> +	unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
>  	struct sd_clock *clock = to_sd_clock(hw);
> -	unsigned int i, best_div = 0;
> +	unsigned long calc_rate, diff;
> +	unsigned int i;
>  
>  	for (i = 0; i < clock->div_num; i++) {
>  		calc_rate = DIV_ROUND_CLOSEST(*parent_rate,
>  					      clock->div_table[i].div);
>  		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
>  		if (diff < diff_min) {
> -			best_div = clock->div_table[i].div;
> +			best_rate = calc_rate;
>  			diff_min = diff;
>  		}
>  	}
>  
> -	return DIV_ROUND_CLOSEST(*parent_rate, best_div);
> +	if (best_rate > LONG_MAX)
> +		return -EINVAL;
> +
> +	return best_rate;
>  }
>  
>  static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
