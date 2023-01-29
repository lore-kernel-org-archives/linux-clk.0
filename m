Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29BCC05027
	for <linux-clk@archiver.kernel.org>; Sun, 29 Jan 2023 17:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbjA2RpB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Jan 2023 12:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjA2RpA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Jan 2023 12:45:00 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCEA420B
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:44:59 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l35-20020a05600c1d2300b003dc4634a466so2573717wms.4
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDVqMwkXzQiwnLCIs/h43LafiVs1rZMTm8awi1qCCKc=;
        b=w0aTvaIintJcu8HU7uxDd+368iaEn8jPDp5DkzPJFdRPAwMrnip0Y77XTRfcJBAdHj
         VWTidx1OV9y+w7+urHB/D+3I3K17rwJZbw7QYHtpaaIAXdBALUARE+t7mgaI4Wfw3IUH
         GxyVFgg73RVe1BnW83ZJvtaIDw2ts0ODJ+TICcSb13MDrOOt1AwvudgwTzv2jeHzwXS6
         YLbt3dPHP6LYvyUikKHBn65VPT0Cau8k1DSzDEV8vHxgcc/PydLwMSZo3gCJewqhNU9X
         Padm4pJxlO9d+5aaSaEb752vxypSJyeab7IMASNwwtHsQ62dE50IDtJITU0rUKtJ+rPu
         Sx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDVqMwkXzQiwnLCIs/h43LafiVs1rZMTm8awi1qCCKc=;
        b=geEYyd9mqIMWf6w2TovFpBSUZnZrRs38CQHmZZj/nqaUlvX6xQK+N2eK12S7WmZW55
         3No7Hngfmw11cvG/313H3IZlKpQPi7GWUZrlgNvSFGHg3HcHTD/zl3AfwarAb/QBIF5y
         XNkXTZlV3klzbj+jFUZ6+nh8g3YvWl1sChDMAz2zMF8SIgkK2z7RGE6KJyUIg+M2AN+v
         rdiCvjJhc5fxTNtM/GAmU6iWGNbVKLFzuT1SOld74632y/ywgZev3/KFm8RB7WIRsbgf
         kIJcOUop+a1EFvVr0+cpvjxnSJJmBTpOgUHBqvt6ApW/SdwqKyn0XJncEd7Uho7wi0Td
         EGKQ==
X-Gm-Message-State: AO0yUKWc6Lsk1DLei3KXS0I82FPavc/ELt2R9sXGZgYq5VxWGN12AB1X
        Tni7GxVHjHnwVtt1GVJE9sh4Z3kcDkz9lipg
X-Google-Smtp-Source: AK7set9OhOe4XHsV2+ozJ/7/aDfXe0ptogZxgvVXaITVWgOHypR3+G8KPJ7ocr022Dmi0R2srkRVIw==
X-Received: by 2002:a05:600c:1e08:b0:3dc:58fb:c1eb with SMTP id ay8-20020a05600c1e0800b003dc58fbc1ebmr1126427wmb.8.1675014297663;
        Sun, 29 Jan 2023 09:44:57 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003d9fba3c7a4sm14899978wmq.16.2023.01.29.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:44:57 -0800 (PST)
Date:   Sun, 29 Jan 2023 19:44:55 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1 2/2] dt-bindings: imx8ulp: clock: no spaces
 before tabs
Message-ID: <Y9awlwWhjoH77dM2@linaro.org>
References: <20230119085421.102804-1-marcel@ziswiler.com>
 <20230119085421.102804-3-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119085421.102804-3-marcel@ziswiler.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-19 09:54:21, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following warnings:
> 
> include/dt-bindings/clock/imx8ulp-clock.h:204: warning: please, no space
>  before tabs
> include/dt-bindings/clock/imx8ulp-clock.h:215: warning: please, no space
>  before tabs
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Applied both.

Thanks.

> 
> ---
> 
>  include/dt-bindings/clock/imx8ulp-clock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
> index 953ecfe8ebcc..827404fadf5c 100644
> --- a/include/dt-bindings/clock/imx8ulp-clock.h
> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
> @@ -201,7 +201,7 @@
>  #define IMX8ULP_CLK_SAI7		2
>  #define IMX8ULP_CLK_SPDIF		3
>  #define IMX8ULP_CLK_ISI			4
> -#define IMX8ULP_CLK_CSI_REGS 		5
> +#define IMX8ULP_CLK_CSI_REGS		5
>  #define IMX8ULP_CLK_PCTLD		6
>  #define IMX8ULP_CLK_CSI			7
>  #define IMX8ULP_CLK_DSI			8
> @@ -212,7 +212,7 @@
>  #define IMX8ULP_CLK_GPU2D		13
>  #define IMX8ULP_CLK_GPU3D		14
>  #define IMX8ULP_CLK_DC_NANO		15
> -#define IMX8ULP_CLK_CSI_CLK_UI 		16
> +#define IMX8ULP_CLK_CSI_CLK_UI		16
>  #define IMX8ULP_CLK_CSI_CLK_ESC		17
>  #define IMX8ULP_CLK_RGPIOD		18
>  #define IMX8ULP_CLK_DMA2_MP		19
> -- 
> 2.36.1
> 
