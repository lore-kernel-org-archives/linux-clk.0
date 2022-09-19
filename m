Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14576C54EE9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 09:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiISJd0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiISJdY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 05:33:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83AB1D0D0
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 02:33:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id az6so20498204wmb.4
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=d12+OyZjgr7PoWm5cPjXSNuyiIQvN3uPV/EGY5V2b1Q=;
        b=gnfr8cRXbS/wpbvVPvZcKVAjeMmrwlloM2/a/LrdrXKRopoda+y4KaVz6Iju/uYK1P
         toQR5Q7TobkmWgYQflg+5P8/eftdMw3JyxzmKyoTwa7E0u3e6/Ib2eRqCiqdIpafGHqk
         OezJxyh9DaEuQXclro49QZR4/pSvVkaTgGhJAOjKNdvDi1BcKVTR2aA95jMZuFZydubi
         KkpxQviaYs608z0ps55rGip2N2aPpzu0wckrt2joTIKOrveQE4WEzTryTpOWZq+1366i
         1hkUJzi8X5zwJwLS8e6/a6B6yh1js+HjL1v96fYcmUuWJIoWKjyB/aCqsMwhbcTDWFi7
         qL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=d12+OyZjgr7PoWm5cPjXSNuyiIQvN3uPV/EGY5V2b1Q=;
        b=B9LOTKS7Q7JTMrFzbZUArR5sWSS0/0WTp2AY6GCcS3bYR/zgxfcFw/EJj3uMhR8mBg
         NtlpMmNXvfNGcn+baI6HSaHAvYUJAvYnyYGFh8/rfBR1UsbjZW1ExIMtP5JW8yMBZvtW
         vmk+dzaBWhFHLi+bVCOYbKAAdQGujwLvCXx2hGcpmSm4S6O1cNadbTrFCZfIK6Nf/Wnp
         gcC/wJfaUGZqvQUCSMZT8sKVVGc42xxFqhNi1Km/tmQAZq+OuRTSzMvxtZkYo3qSas1K
         tcQh1rixa8gwREnRGEW4aDFtzKSCcFqfVhHxJtl/WDinyocKidJ40BiKWXlywZ/ctgg2
         u4nw==
X-Gm-Message-State: ACgBeo2cHPK0h7HHgEHDuh3VgUYuSl80wiumalJeF64sSivWOyLet71Y
        XWXZtU2OQYyzyykX0A/SEjmsgf1Dcqfe7A==
X-Google-Smtp-Source: AA6agR5lkQJ3tnCpGQZbJHAgXSSBjez6nvJjs1S6nmUjNgnywaLZOTGb8zhkbD7IGIUFr9qwaLADpQ==
X-Received: by 2002:a05:600c:a46:b0:3a6:9c49:b751 with SMTP id c6-20020a05600c0a4600b003a69c49b751mr18914823wmq.169.1663580000598;
        Mon, 19 Sep 2022 02:33:20 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003a342933727sm15121521wmp.3.2022.09.19.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 02:33:20 -0700 (PDT)
Date:   Mon, 19 Sep 2022 12:33:18 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Han Xu <han.xu@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for
 QSPI clocks
Message-ID: <Yyg3XtsmMKgC9IDz@linaro.org>
References: <20220915150959.3646702-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915150959.3646702-1-han.xu@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-15 10:09:59, Han Xu wrote:
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.
> 
> Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> Signed-off-by: Han Xu <han.xu@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Stephen, will you be picking this?

Thanks.

> 
> ---
> changes in v2
> - fix the build break due to missing close parenthesis
> ---
>  drivers/clk/imx/clk-imx6sx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 2301d8fb8c76..d9ff831bdf47 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -324,13 +324,13 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6SX_CLK_SSI3_SEL]           = imx_clk_hw_mux("ssi3_sel",         base + 0x1c,  14,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI2_SEL]           = imx_clk_hw_mux("ssi2_sel",         base + 0x1c,  12,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI1_SEL]           = imx_clk_hw_mux("ssi1_sel",         base + 0x1c,  10,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
> -	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux_flags("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels, ARRAY_SIZE(qspi1_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux("qspi1_sel",        base + 0x1c,  7,      3,      qspi1_sels,        ARRAY_SIZE(qspi1_sels));
>  	hws[IMX6SX_CLK_PERCLK_SEL]         = imx_clk_hw_mux("perclk_sel",       base + 0x1c,  6,      1,      perclk_sels,       ARRAY_SIZE(perclk_sels));
>  	hws[IMX6SX_CLK_VID_SEL]            = imx_clk_hw_mux("vid_sel",          base + 0x20,  21,     3,      vid_sels,          ARRAY_SIZE(vid_sels));
>  	hws[IMX6SX_CLK_ESAI_SEL]           = imx_clk_hw_mux("esai_sel",         base + 0x20,  19,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_CAN_SEL]            = imx_clk_hw_mux("can_sel",          base + 0x20,  8,      2,      can_sels,          ARRAY_SIZE(can_sels));
>  	hws[IMX6SX_CLK_UART_SEL]           = imx_clk_hw_mux("uart_sel",         base + 0x24,  6,      1,      uart_sels,         ARRAY_SIZE(uart_sels));
> -	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux_flags("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels, ARRAY_SIZE(qspi2_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux("qspi2_sel",        base + 0x2c,  15,     3,      qspi2_sels,        ARRAY_SIZE(qspi2_sels));
>  	hws[IMX6SX_CLK_SPDIF_SEL]          = imx_clk_hw_mux("spdif_sel",        base + 0x30,  20,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_AUDIO_SEL]          = imx_clk_hw_mux("audio_sel",        base + 0x30,  7,      2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_ENET_PRE_SEL]       = imx_clk_hw_mux("enet_pre_sel",     base + 0x34,  15,     3,      enet_pre_sels,     ARRAY_SIZE(enet_pre_sels));
> -- 
> 2.25.1
> 
