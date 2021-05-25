Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC24C2B9F7
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 03:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E64061404
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 03:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhEYDNl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 May 2021 23:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhEYDNk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 May 2021 23:13:40 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093D5C06138B
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 20:12:11 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id z3so28978962oib.5
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 20:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LzZi3Q25vKg3XhS1Ic0lRTfT6eSF+5WUdcs1/J6hy2Y=;
        b=KiZ7geh13gcARZT8mSzJFcrIk05fkvTTjIk8CLSHiGYBxiybxhUD1F0ZuRHi56V9S0
         UMUccQgfUbA4cGGs5yqNLckMrl5KIDcdm7bjjFr0HI7/YCX5wkf7vRb4nWhpo7ccywpH
         tOWVylQII31yvzek/fzTMlJPc/mBectQvhwumZg/NXiEG30Qb1ks2ngB1BLw8KBPUofY
         lDHlfDQd/aDqCzf+RI/gsRXwwrkKk+kS4kEE5RlmBvSoeazJ4Tt/adeEo8sLE0dkIjr7
         P7posTi86TqIcQcUctDyQiJAZdvqW2CM/pt085lwuuwFlQS8FOC2YtNMajwX6JfvupYi
         UUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LzZi3Q25vKg3XhS1Ic0lRTfT6eSF+5WUdcs1/J6hy2Y=;
        b=GVQVG16yj5R+/tV8iqhgk69mJ3OycE7X/n9Nc+6fPMzeyh3WSlpJ3w1/jES6PJwKqg
         D+P9E9hnS2H6h9mQ2M02OI0kGlxXm6iUJdI8Wdv6E1rar/l+4leL9JtsGLYhzyP/VHgH
         u6h+r1BXn1EEpivb6843lCVwTaXjrDw70+StnLNKqgjuZaorwKDl22vL064Jh71EvTwx
         cFvSLZIRfwge5kKSz6JZjtm4qgoihPzs4HLeNPV9sBGs5k8AiW6RyU0jY3jrbjEaPt1v
         ZWyDMQllQBSSTNZNqiv3qmjD25cneInEgTtnPCi0jl3ON5cyad8wpkXQRJG/ZlMZbVWk
         KDiA==
X-Gm-Message-State: AOAM531mR7IO0LclFFyr5peiTJQEMwufm77a0pGmK3brQ4o1KinHsE4j
        86LpR9jIDrMmLpWosBbVHpmS/Q==
X-Google-Smtp-Source: ABdhPJwfVJOo2UBAigec/ToH+3zn+ksCtwT3t0kun5HoEK1TJkhAS70gURQ1MwmEquyuXN0SmW90vQ==
X-Received: by 2002:a05:6808:997:: with SMTP id a23mr1397330oic.129.1621912330250;
        Mon, 24 May 2021 20:12:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm1130940oon.20.2021.05.24.20.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:12:09 -0700 (PDT)
Date:   Mon, 24 May 2021 22:12:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] clk: qcom: Add SM6125 (TRINKET) GCC driver
Message-ID: <YKxrB3xIIqtxXPzf@yoga>
References: <20210523211016.726736-1-martin.botka@somainline.org>
 <20210523211016.726736-2-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523211016.726736-2-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 23 May 16:10 CDT 2021, Martin Botka wrote:

> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

This looks quite good to me, just two small things below.

> diff --git a/drivers/clk/qcom/gcc-sm6125.c b/drivers/clk/qcom/gcc-sm6125.c
[..]
> +static struct clk_alpha_pll gpll0_out_early = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.enable_reg = 0x79000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0_out_early",
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "bi_tcxo",
> +				.name = "bi_tcxo",

For new drivers we don't need to rely on global name lookup, so just
keep fw_name for the external clocks.

> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_fixed_factor gpll0_out_aux2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll0_out_aux2",
> +		.parent_data = &(const struct clk_parent_data){
> +			.hw = &gpll0_out_early.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_fixed_factor_ops,
> +	},
> +};
> +
> +static struct clk_fixed_factor gpll0_out_main = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll0_out_main",
> +		.parent_data = &(const struct clk_parent_data){

Please use parent_hws instead when referencing a single hw in the same
driver.

> +			.hw = &gpll0_out_early.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_fixed_factor_ops,
> +	},
> +};
> +

Regards,
Bjorn
