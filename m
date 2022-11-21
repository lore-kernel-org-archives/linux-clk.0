Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC347C47089
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 15:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbiKUP7X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbiKUP7W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 10:59:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5550ED1C1B
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:59:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d1so8409055wrs.12
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtY5NXSwnrAtY0e/ka5M47AkPgHS8WuhijmOH1y8Gi8=;
        b=Pz3J+q4EZete1F75t+MGZeaBnzqNxBfgLKAEsCOgHvXxFfneRUswlarulNQnDhb4sG
         Uf1A148vQJDD4HArphhKc3lN2K/xJT4YOrCRxOSWKYnAOZGOIaQZD4avQArWV0Lhf8PW
         TaiKmt+jdxL+tGVBNC9VyGJoRBzH4spusvXVDWVrRbAaEx7CnmFlTu3vLZeabqOzZ/Yn
         XTAi22I66TR3UUUCuCWFi1edNGTuGMOZRzAgoCf1UuezZE74PsIXbSvuIRN+6j3R4Ab0
         P5d9mLBq94q/TjnBbm1Uf5vX6ooU0+FvzkneX433JQYlyzBaD0qqY1gdzaNh93sM68zX
         dbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtY5NXSwnrAtY0e/ka5M47AkPgHS8WuhijmOH1y8Gi8=;
        b=q3S3JH+pUp6LXKDiD+vONY6av6GUDeXv5a299h5NQV14X3gXqaP/Kk61X42L47Hl6u
         rSX+bgUeSIhS7fjHEomWwbNPykXrJrihi/6Jvoq5tDdZNYS24rFBh6yc0gMUXEImmJko
         PfWtwy3jTmVHwKUqQm4YyEjehxUHVfAKQMbBrU6o1YF1EKEuZJTeuyns0ma/y82tyxf7
         sRBGL1sTwUWf3LIaVRZp7W1TG/IeJHbXgP1cKUx/rgPVE48iw6J6djkwDm0GGKrALAt2
         i9tbqBpIeWdes4VOmrXqaCddLPKDdZz12w8Ob65vGTruvsOTSc1ZYz5fskF+KG2M3IIx
         hc8Q==
X-Gm-Message-State: ANoB5pkKNzL0vR5t/YFd2+qFj7vwMD3YvRbrV2+08KyoPjmGsC3vGvNJ
        se0w0J8jcI/abN6VqEdaNmqt1A==
X-Google-Smtp-Source: AA0mqf6T29yjuEb+TM2WHSa719YwO9Sz/irtnxqj5TVT1dvasSK7IzUxEKgnZdDYcuJLuOo7hZRWsA==
X-Received: by 2002:adf:fb91:0:b0:236:6de4:27b6 with SMTP id a17-20020adffb91000000b002366de427b6mr10946616wrr.601.1669046359875;
        Mon, 21 Nov 2022 07:59:19 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m16-20020adffe50000000b00241bee11825sm10454869wrs.103.2022.11.21.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:59:19 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:59:18 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 320 MHz and 640 MHz entries for
 PLL146x
Message-ID: <Y3ugVgU8DQA46wHa@linaro.org>
References: <20221031204838.195292-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031204838.195292-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-31 21:48:38, Marek Vasut wrote:
> The PLL146x is used to implement SYS_PLL3 on i.MX8MP and can be used
> to drive UARTn_ROOT clock. By setting the PLL3 to 320 MHz or 640 MHz,
> the PLL3 output can be divided down to supply UARTn_ROOT clock with
> precise 64 MHz, which divided down further by 16x oversampling factor
> used by the i.MX UART core yields 4 Mbdps baud base for the UART IP.
> This is useful e.g. for BCM bluetooth chips, which can operate up to
> 4 Mbdps.
> 
> Add 320 MHz and 640 MHz entries so the PLL can be configured accordingly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied. Thanks.

> ---
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-pll14xx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 1d0f79e9c3467..828336873a98f 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -54,7 +54,9 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
>  	PLL_1416X_RATE(800000000U,  200, 3, 1),
>  	PLL_1416X_RATE(750000000U,  250, 2, 2),
>  	PLL_1416X_RATE(700000000U,  350, 3, 2),
> +	PLL_1416X_RATE(640000000U,  320, 3, 2),
>  	PLL_1416X_RATE(600000000U,  300, 3, 2),
> +	PLL_1416X_RATE(320000000U,  160, 3, 2),
>  };
>  
>  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> -- 
> 2.35.1
> 
