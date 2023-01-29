Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801E4C61D97
	for <linux-clk@archiver.kernel.org>; Sun, 29 Jan 2023 17:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbjA2RnI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Jan 2023 12:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbjA2RnI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Jan 2023 12:43:08 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808BC420B
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:43:06 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso7774571wmb.0
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EESc6yHcetQSdYJXbMgFW7vC03SHAVb9eblyBiy6LFU=;
        b=y01AtHPUuoTnAyyQI5Y84VCRlVRSr6eK1jtn5D9X0DeY0QtIqW7YKA7tL67ecJs0jS
         taxMzSGnxw19AK5gbJZAxDxZq4FaRiVmOA0m6JnWFtG5vT6qT98kqn9dPPh07HeOrqjN
         fvB4+zd1zcLkNC9evzo/NR29Bb5C/X3/6awaXbJ9vE3LcLIglsgTpwsbaBCC7E+jgFsz
         LpQXWmO/MlfK6hSkR7YlLs02RpeoTHMwyKH436Rxp52pQHvyg5IGFtqP1usdCbr7/Ea4
         quCDo3cBFfXG8cvkjcG0LC2wa2Bf089k4P5K3Iy/XaqTYHHI1hNol7f5jtreas3zrIBD
         RPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EESc6yHcetQSdYJXbMgFW7vC03SHAVb9eblyBiy6LFU=;
        b=KmtuOfpr8z2130DhaKLrKMo0ADxOQTN9eDUQ82xpvN19KOGXIX9ywwy4XGCOpW27Nc
         zG3RZy28iCnfL7n3k1EGEmIUZFrAVZ91uM82MsulHZGJ7yUvrmd4weHAq/LceY5a1VqI
         7m58CFO3rL3JYtDpp92gpcasIbAPPp0c12NKv7F54Vn1FyyEXiN/Zc2u8SbfitYhldWy
         NqxH8xDaevdFNq27l4uNYb3C0qeY9Xb3HR48O2RgJ48EYqFUqXWWHrVkoFhOu+SLiBD3
         agw2tBz+YQJqQlGGz9q1/ax1lxj4wb2Nkw3sq/OrZZU2XtlfF5iYVONX97CuMPSXfRHf
         2ngA==
X-Gm-Message-State: AO0yUKXgUNPEHRRf7gvJFmlDp7ERoLdHiB62AHd0ozmYUPn2/9X9E5vh
        iGdlv5SJZJkUPkd1nCirOT0JiQ==
X-Google-Smtp-Source: AK7set+2UOrnRZs2WQATlKfJG00hkAln8uWzTi7jsYZeI2wVskdLLWL0SHLBX0y2Hy280n/qgI8G6A==
X-Received: by 2002:a05:600c:6008:b0:3da:282b:e774 with SMTP id az8-20020a05600c600800b003da282be774mr2998074wmb.38.1675014185123;
        Sun, 29 Jan 2023 09:43:05 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d640e000000b002bfb5bda59asm9737686wru.25.2023.01.29.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:43:04 -0800 (PST)
Date:   Sun, 29 Jan 2023 19:43:03 +0200
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
Message-ID: <Y9awJ04VzbGexSuc@linaro.org>
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

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

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
