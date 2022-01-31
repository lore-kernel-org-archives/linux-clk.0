Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36822C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jan 2022 23:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237821AbiAaXOC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jan 2022 18:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237785AbiAaXOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jan 2022 18:14:02 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0402DC061714
        for <linux-clk@vger.kernel.org>; Mon, 31 Jan 2022 15:14:02 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so3648308ooq.10
        for <linux-clk@vger.kernel.org>; Mon, 31 Jan 2022 15:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tAs6liiCZpNsvkCPBcffS9NOV9WSEh87EBkU7qsrerM=;
        b=Y23W2CfQIlQQeDvvuVwA3b5q/soSX9xQalNwOgI+uh9shHxXCKg6uz0kqjwI51R0F2
         cxuPfsDjhyQfee4zwocBwvZPsCjAOGBURXZU/5Tt3EjMpuZax6WZRugASDiMVsbiQeYM
         /Q3fa8AdI7sFWt74OAMpsmWqoigKl+7/I5e+2c6UQSGvzVoJIhvrorwd7S0F1ygkhwE5
         rgTKOTMbFfzaPKB/SR44nspy5lCAQTGYJWZDfvUuBRP8PsU0hGt0cRXrPY864rEZBxnT
         lnJcZ98/Yslefyk4ekvbvvUX+ObmfZOKxykWEsAgm0XYUPro9V/03z2zIlia24j5JLal
         lu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tAs6liiCZpNsvkCPBcffS9NOV9WSEh87EBkU7qsrerM=;
        b=l+iZiecO0m0GKc9uOuvV7tKz7T4qbDhyvxtkszTqhVz6C+hYN0X2yNmyI6AqUmKYM4
         j6v/pJa4+N2jUOxIYBnNALEmy5lFMHxHQWTngNNunFonW4VOjZtzci2EJevdYssNEWpG
         lcis28gjWkSM8NBXYCxQDrczITNOYKlUmTjf5h4iNBO2anxtmYSypR7B6QoLsqA4hIM8
         Y2kirnGi1b7wFH9FZdEyl98Pvm2Q0B3ykPT9FYLcpnU2ntR9afTynZxjpp5HE9opF3ji
         735SNwqJwy8cpDApzq0jQy55xgQhuUoNtxHPHpO3xJyq5amQ+LRh9jAVWk2ZJ2JyQGF0
         uRmw==
X-Gm-Message-State: AOAM531J1ZR7oFpR1kjfYNNwY9IrGv8BhWTsmALJEjM0PKmk48TagXkX
        pAGYtqrQyqUADeGCrweEw+AK6g==
X-Google-Smtp-Source: ABdhPJwOMtyB4Auw6zKrzvw6nG44MG5fTL8czV/FhDZB7WLzH5+lD7N2+YlxYWwYh2/unTygN5ryLg==
X-Received: by 2002:a05:6830:120b:: with SMTP id r11mr12847170otp.182.1643670841358;
        Mon, 31 Jan 2022 15:14:01 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id h17sm11306161otn.60.2022.01.31.15.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 15:14:00 -0800 (PST)
Date:   Mon, 31 Jan 2022 17:13:59 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drivers: clk: qcom: gcc-ipq806x: fix wrong
 naming for gcc_pxo_pll8_pll0
Message-ID: <YfhtN9gxabaTNvfG@builder.lan>
References: <20220121210340.32362-1-ansuelsmth@gmail.com>
 <20220121210340.32362-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121210340.32362-5-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 21 Jan 15:03 CST 2022, Ansuel Smith wrote:

Please drop the "drivers: " prefix in $subject on all these patches to
align it with (most) other entried in the git log.

Thanks,
Bjorn

> Parent gcc_pxo_pll8_pll0 had the parent definition and parent map
> swapped. Fix this naming error.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index d6b7adb4be38..34cddf461dba 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -291,13 +291,13 @@ static const char * const gcc_pxo_pll3[] = {
>  	"pll3",
>  };
>  
> -static const struct parent_map gcc_pxo_pll8_pll0[] = {
> +static const struct parent_map gcc_pxo_pll8_pll0_map[] = {
>  	{ P_PXO, 0 },
>  	{ P_PLL8, 3 },
>  	{ P_PLL0, 2 }
>  };
>  
> -static const char * const gcc_pxo_pll8_pll0_map[] = {
> +static const char * const gcc_pxo_pll8_pll0[] = {
>  	"pxo",
>  	"pll8_vote",
>  	"pll0_vote",
> @@ -1993,7 +1993,7 @@ static struct clk_rcg usb30_master_clk_src = {
>  	},
>  	.s = {
>  		.src_sel_shift = 0,
> -		.parent_map = gcc_pxo_pll8_pll0,
> +		.parent_map = gcc_pxo_pll8_pll0_map,
>  	},
>  	.freq_tbl = clk_tbl_usb30_master,
>  	.clkr = {
> @@ -2001,7 +2001,7 @@ static struct clk_rcg usb30_master_clk_src = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "usb30_master_ref_src",
> -			.parent_names = gcc_pxo_pll8_pll0_map,
> +			.parent_names = gcc_pxo_pll8_pll0,
>  			.num_parents = 3,
>  			.ops = &clk_rcg_ops,
>  			.flags = CLK_SET_RATE_GATE,
> @@ -2063,7 +2063,7 @@ static struct clk_rcg usb30_utmi_clk = {
>  	},
>  	.s = {
>  		.src_sel_shift = 0,
> -		.parent_map = gcc_pxo_pll8_pll0,
> +		.parent_map = gcc_pxo_pll8_pll0_map,
>  	},
>  	.freq_tbl = clk_tbl_usb30_utmi,
>  	.clkr = {
> @@ -2071,7 +2071,7 @@ static struct clk_rcg usb30_utmi_clk = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "usb30_utmi_clk",
> -			.parent_names = gcc_pxo_pll8_pll0_map,
> +			.parent_names = gcc_pxo_pll8_pll0,
>  			.num_parents = 3,
>  			.ops = &clk_rcg_ops,
>  			.flags = CLK_SET_RATE_GATE,
> @@ -2133,7 +2133,7 @@ static struct clk_rcg usb_hs1_xcvr_clk_src = {
>  	},
>  	.s = {
>  		.src_sel_shift = 0,
> -		.parent_map = gcc_pxo_pll8_pll0,
> +		.parent_map = gcc_pxo_pll8_pll0_map,
>  	},
>  	.freq_tbl = clk_tbl_usb,
>  	.clkr = {
> @@ -2141,7 +2141,7 @@ static struct clk_rcg usb_hs1_xcvr_clk_src = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "usb_hs1_xcvr_src",
> -			.parent_names = gcc_pxo_pll8_pll0_map,
> +			.parent_names = gcc_pxo_pll8_pll0,
>  			.num_parents = 3,
>  			.ops = &clk_rcg_ops,
>  			.flags = CLK_SET_RATE_GATE,
> @@ -2197,7 +2197,7 @@ static struct clk_rcg usb_fs1_xcvr_clk_src = {
>  	},
>  	.s = {
>  		.src_sel_shift = 0,
> -		.parent_map = gcc_pxo_pll8_pll0,
> +		.parent_map = gcc_pxo_pll8_pll0_map,
>  	},
>  	.freq_tbl = clk_tbl_usb,
>  	.clkr = {
> @@ -2205,7 +2205,7 @@ static struct clk_rcg usb_fs1_xcvr_clk_src = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "usb_fs1_xcvr_src",
> -			.parent_names = gcc_pxo_pll8_pll0_map,
> +			.parent_names = gcc_pxo_pll8_pll0,
>  			.num_parents = 3,
>  			.ops = &clk_rcg_ops,
>  			.flags = CLK_SET_RATE_GATE,
> -- 
> 2.33.1
> 
