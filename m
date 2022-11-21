Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7B7C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 15:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiKUPy5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiKUPy4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 10:54:56 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991F5CB966
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:54:54 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id r10-20020a1c440a000000b003d0283bf132so337648wma.4
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhC7MH0VaCgvduDECjUtDc6gX+8kpBTvl/K92Gs9O8M=;
        b=AJtiw86Id5SmGMWAq9DYsqntgYJPzqqtBZ2l6Kz1rELUS1RN4e1Wry4QlU2kwHhIOf
         7ZMXCjQYDuhbW5Se/DSJ9pVp+PS6e7qdk3npkRuaRyvbJ45ruqV0YgXs0jirD2oeR2AQ
         f73ixzFcyRMSCYteFw2bgzQp9wWAT1/5KbfOjzXDU+8+0BJgdLd7TU+4sNCjc0OdUEcf
         WQyoZJAQWwrDUiUcOOIQKDjtNJTJmJf2zo/34NhZ+AX5yANdT1Mu983J1HMh34fozbI1
         yk+PFgFxVdgeSQTEq5zTX4/tbWyvAvsc1ISSTgRz8BiTXnWlnd6pmULODga6H0eUiai4
         V53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhC7MH0VaCgvduDECjUtDc6gX+8kpBTvl/K92Gs9O8M=;
        b=carawQbU0K/FcptyZJdnmDVgQQ1sZsVP7LWhsFwA9oq27KhqeeVnVeMVSeuX36j5WH
         93k9ebQ7dQ6pTv5VladDCE16xEcG8mT1KYFCIywI4Ca+gRS45RYVHOYzRWUFt1rKZuj5
         jrHKCgCDlAgObhknV/z6/Zmrzcu9qA01LbXjpijNc20D0oIAQ6Al3waiPyTC2T8zzTEg
         xo6jr303cbRrTGPqC3lmRHjLj+l+9FwofPlKisPmBkDJ4bOMtbpK+kcJT73RPXf/KVBm
         Of3B6lRxd+c2HffGHzRsYmKMtOA50PKMF99GkLcoqkLntiqfqbrTE/OVqvU5GY9RgzDw
         Ky8A==
X-Gm-Message-State: ANoB5plQltlqotz4ZDCe8T9Vdy/lMddx2u+Jh94hEpuGTFqqj5Lh9f1H
        J3tb9YkJXf57DwcvSG0tbn/u+Ap8aKcxzQ==
X-Google-Smtp-Source: AA0mqf5kO52nvv+XXbv5ZCPepkiMpWr0j+e5sA/DUAEzQC8s/uD10WhBRyCgfrEnpDm8QptnPqrQ7g==
X-Received: by 2002:a05:600c:3b09:b0:3cf:987a:2bf with SMTP id m9-20020a05600c3b0900b003cf987a02bfmr103773wms.157.1669046093174;
        Mon, 21 Nov 2022 07:54:53 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m42-20020a05600c3b2a00b003cf47556f21sm20559865wms.2.2022.11.21.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:54:52 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:54:51 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     haibo.chen@nxp.com
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-clk@vger.kernel.org, linux-imx@nxp.com,
        peng.fan@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH v2] clk: imx93: correct the flexspi1 clock setting
Message-ID: <Y3ufS144g5ndCQPs@linaro.org>
References: <1666589199-1199-1-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1666589199-1199-1-git-send-email-haibo.chen@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-24 13:26:39, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> Correct IMX93_CLK_FLEXSPI1_GATE CCGR setting. Otherwise the flexspi
> always can't be assigned to a parent clock when dump the clock tree.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to my tree. Thanks.

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 99cff1fd108b..40ecee3b5e78 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -170,7 +170,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
> -	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
> +	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
>  	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",		0x8880, },
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
> -- 
> 2.34.1
> 
