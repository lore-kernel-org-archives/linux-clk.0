Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655D1C31E44
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 04:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 384A9218A0
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 04:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0D7EoGx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfFQEgr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 00:36:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45520 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfFQEgq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 00:36:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id s21so5019734pga.12
        for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2019 21:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LcVfoyx+IKUrcAoeMajo6YLem6IoPuW7TnJ7S24MVbI=;
        b=g0D7EoGxu+ZBE2XnqEGzHo+7FUECWykhUzh4IG5vbtgoaqZvr58pnKxaGSfcNKcYgO
         pLj7JMBVHqIajig6Cs0dFTNJ61WyRdpxs9qxmByWocFnSW5JF1UMirAXTSDiATD00ryI
         PCFSSFH9NtM4sLjJDDs460qF2Pxrj15OFC2CtMGDIIZtrT6XAiDG7M9slwaOqKRAj3eO
         WxfZigtUKWfgjPtflZAiuTNHIOkNfDIZfUB8C5UD9NczksrTN11lFiFASTgUbET20fFC
         v83ptHtINIVo6Eg0d6cOEL63ZmxepxU6rkPJKxpKPibf/99frwz1zbhzQQnctPCMitK+
         Qxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LcVfoyx+IKUrcAoeMajo6YLem6IoPuW7TnJ7S24MVbI=;
        b=N5e5J7qQNETdtKS8vzvTJnPFObolS29ITtNXyN7ua0hkvSpFSzZDqWzmd0xZPVyiWI
         7Igwc7NZ3ES7a/NWev6miikY+p9A28Lc6YLdkSyT/WZ8uq3YWepNhzHkTc8KQpvgARwy
         3mxHOFjNvul2QM/+6g1KVzYTByA9tiNTzqmbiLk1ZoKY7ads1HJxVj0x+ILRVGDDJnGN
         PzyXmWaQOJe7o/Nfr2P6I4R9j5ISiNzxvkABcV95N6aADuVGEY12C0QDNJQAfeZEE+e6
         DaddQktheYoIbzHvwL2aB++ix36cZxjp/vfK4qAirVTXQdTJ/ag4Nx6Ca9Jp8UI6MKBG
         bPQw==
X-Gm-Message-State: APjAAAVOXDZiMxSlWoSCX2bizUKHunSbC8LD1qXkd4cQ/lzXwP7DwBKn
        TcI+n94zmkB1GhgBC5ffARcM4Q==
X-Google-Smtp-Source: APXvYqwaXT1vWRfaUZBa3iao8TmQH3I7WTJSG1f7j0Qp94C/dS2RPdnTcYlCqDXB01aPXlXAre9TWw==
X-Received: by 2002:a63:6cc3:: with SMTP id h186mr46635775pgc.292.1560746205933;
        Sun, 16 Jun 2019 21:36:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c9sm11004164pfn.3.2019.06.16.21.36.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:36:45 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:37:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
Message-ID: <20190617043734.GH750@tuxbook-pro>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612091722.9377-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:

> We have couple of instances in the driver with unnecessary
> u64 casts, drop them.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 0ced4a5a9a17..b48707693ffd 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -832,7 +832,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
>  	int div;
>  
>  	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
> -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
> +	div = DIV_ROUND_UP_ULL(parent_rate, rate) - 1;

Afaict DIV_ROUND_UP_ULL() will first add "parent_rate" and "rate" and
then stash this in a unsigned long long and do the division. So what
happens if parent_rate + rate > 32 bits on a 32-bit target?

(Shouldn't there be a cast of (ll) in the macro to ULL?)

Regards,
Bjorn

>  
>  	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
>  				  PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_SHIFT,
> @@ -1094,7 +1094,7 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
>  		return -EINVAL;
>  	}
>  
> -	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	div = DIV_ROUND_UP_ULL(parent_rate, rate);
>  	for (i = 0; i < pll->num_post_div; i++) {
>  		if (pll->post_div_table[i].div == div) {
>  			val = pll->post_div_table[i].val;
> -- 
> 2.20.1
> 
