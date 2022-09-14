Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BADBC6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 22:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiINWLN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 18:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiINWLI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 18:11:08 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39B386B45
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 15:11:05 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so16445154wma.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 15:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NtHUpnkTzZLClNVo69m+97iJj6YVMUW1mrBbO6+GYx4=;
        b=k2pheIKKkU+v+L7T78yXrfbXdox99kc/Tr45O+C7PY7veqxy0014cMCxQVXON4s2s5
         bjH2835AjYfVooRAqAaLXN46FFfFKz+yTuex+r2f7lCxZurHDc4UdYiF8eLRo0KAplWR
         howoQOCotQNuEVzUXqcqGIoxmMAnxUpg1Nfe9d0Jxelq/67lT0FWysxG1WSfq+tllrjF
         MJGftTJiPRdKNtaMK8f6XZUTaNntZtfd/XstIgXIWzhi4UbcNZACk5afdo4Gcg15URcE
         POfHX75eaFbmiVIcvYCWJEfT2RE09oo6kgsX5SeMsEEBrOhKyU0oNum9hOQ4q8nVbdPe
         lGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NtHUpnkTzZLClNVo69m+97iJj6YVMUW1mrBbO6+GYx4=;
        b=NgGOV4OqWa15bP+JiqZQwcJS53oRy+MYmhaIglRrAlfcnKq5lmA19+1KbdE6h08LVu
         Z1B7zaNCOkw7qmoqzgWzHy2z9JcxKiVfTxuuYFiIpmOCLp9zE7BVBz3h8GPQI1JH0cD6
         MxZdsdo+MQsvkaw++FFCR6BpqJ7YozSR5vlA1j/WIid3iYHr8ZFN+fAuro6uZBT+xjyz
         4ehyYAtFYegnMVclBf2sFNpoZ8KA5y+VLXXmS2Tltup5Gcqctgd8MI1uJ9iBQ7H9Vriz
         /gTI3He9ORvYKyKkgjPAfvT+D3KJ1Z3qLz+kypPi2RNHgqDl1AHY9XfSpQqzyU664X/q
         1rWw==
X-Gm-Message-State: ACgBeo0/1zh8iCt5rMi8GhRgR97y4fSRBde65q4D8Vg6Rd7kSYjC3T4Q
        L5XR3l963B6hqq/EtJlEuv0h/A==
X-Google-Smtp-Source: AA6agR6NcwwbUlfaV8V54oY0YHXnyEWnJv3scoxu+jgnhyd/kEyHVKwb+mdfdcFhsX6xndenkvt7mg==
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id y13-20020a1c4b0d000000b003b476aef7a5mr4848503wma.23.1663193464311;
        Wed, 14 Sep 2022 15:11:04 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b0022a9246c853sm396428wrr.41.2022.09.14.15.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 15:11:03 -0700 (PDT)
Date:   Thu, 15 Sep 2022 01:11:02 +0300
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
Subject: Re: [PATCH] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for
 QSPI clocks
Message-ID: <YyJRdnTpoM7kw/Bt@linaro.org>
References: <20220914201049.3508104-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914201049.3508104-1-han.xu@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-14 15:10:48, Han Xu wrote:
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.
> 
> Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> Signed-off-by: Han Xu <han.xu@nxp.com>

Acked-by: Abel Vesa <abel.vesa@linaro.org>

Stephen, will you be picking this?

> ---
>  drivers/clk/imx/clk-imx6sx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 2301d8fb8c76..1e53e366cde7 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -324,13 +324,13 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6SX_CLK_SSI3_SEL]           = imx_clk_hw_mux("ssi3_sel",         base + 0x1c,  14,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI2_SEL]           = imx_clk_hw_mux("ssi2_sel",         base + 0x1c,  12,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI1_SEL]           = imx_clk_hw_mux("ssi1_sel",         base + 0x1c,  10,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
> -	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux_flags("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels, ARRAY_SIZE(qspi1_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux("qspi1_sel",        base + 0x1c,  7,      3,      qspi1_sels,        ARRAY_SIZE(qspi1_sels);
>  	hws[IMX6SX_CLK_PERCLK_SEL]         = imx_clk_hw_mux("perclk_sel",       base + 0x1c,  6,      1,      perclk_sels,       ARRAY_SIZE(perclk_sels));
>  	hws[IMX6SX_CLK_VID_SEL]            = imx_clk_hw_mux("vid_sel",          base + 0x20,  21,     3,      vid_sels,          ARRAY_SIZE(vid_sels));
>  	hws[IMX6SX_CLK_ESAI_SEL]           = imx_clk_hw_mux("esai_sel",         base + 0x20,  19,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_CAN_SEL]            = imx_clk_hw_mux("can_sel",          base + 0x20,  8,      2,      can_sels,          ARRAY_SIZE(can_sels));
>  	hws[IMX6SX_CLK_UART_SEL]           = imx_clk_hw_mux("uart_sel",         base + 0x24,  6,      1,      uart_sels,         ARRAY_SIZE(uart_sels));
> -	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux_flags("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels, ARRAY_SIZE(qspi2_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux("qspi2_sel",        base + 0x2c,  15,     3,      qspi2_sels,        ARRAY_SIZE(qspi2_sels);
>  	hws[IMX6SX_CLK_SPDIF_SEL]          = imx_clk_hw_mux("spdif_sel",        base + 0x30,  20,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_AUDIO_SEL]          = imx_clk_hw_mux("audio_sel",        base + 0x30,  7,      2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_ENET_PRE_SEL]       = imx_clk_hw_mux("enet_pre_sel",     base + 0x34,  15,     3,      enet_pre_sels,     ARRAY_SIZE(enet_pre_sels));
> -- 
> 2.25.1
> 
