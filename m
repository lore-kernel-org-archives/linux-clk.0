Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAE1ECAAA2
	for <linux-clk@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbiHYUfE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Aug 2022 16:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiHYUfC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Aug 2022 16:35:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFB57969A
        for <linux-clk@vger.kernel.org>; Thu, 25 Aug 2022 13:35:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h22so31507138ejk.4
        for <linux-clk@vger.kernel.org>; Thu, 25 Aug 2022 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=wD4uWoqj3+az/+SARUZ5ScI+qiWgkadmWK0pjEjtkvU=;
        b=mvvg+SKhbTMcmWLrqC7XOvMEvHBw5yRZjUj7sgvAKpdWE93l1yrWvt4HNYO2iPlfZr
         jud2OBZlEw/PsEoAXrgpSpcK8PJ0QewBV/vqlYOnokjMsGBrIWQxXM9EC3Q4HzU889SV
         iqzwjzXtQrouTnmgiM/IQZd2UEGVzy/dDfXH/T0Nf62+K6J12n3qMoS3HZBbome2tu2E
         D6siYiK8F4lW+12ioIk0MiljhoInushgdQhbPa+FgNcMkyhZ5Nogu6J3KD5FoH4Z0EnX
         GaJvt38rGna5stjzUj8gg4guM6/WsBB0Fj7M+Vw5ffcGBnwDo1bGWDFT28t8loth8hXz
         1CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=wD4uWoqj3+az/+SARUZ5ScI+qiWgkadmWK0pjEjtkvU=;
        b=16C94ORiSwr4oYuQV5noRWLAwVVhLzEZQbLACvb4UdckhqMYDIW9Ng+/CQlotLtC+z
         eDC9XWn6k7kGgB9vGny0HA/xNxzmETveWnT926YhXzL7+JV3CqwOvu4YAuL0EkDjk3DV
         QeT2029zHDSptK2WBTZzqzai1SfrFlB0KZ1DxLrgZghoyP7EzrSpFzDncarzLvO3nS8m
         hq244umLrpd+qMBY9pq5iYBAxCJMU6jnacxXVM6dY8gJ0GJFz0bBkSoEo2UwchzeGPij
         d1sxCbIvo80N2F/8w/+VnHrn9IbNUCuJYroeYwVSycvHdAz7UD5piq1mMGuCUt99bbpC
         Dr5w==
X-Gm-Message-State: ACgBeo0IHgJSlNkeAT4IE7c0q8eHKK3+oddm7a25BOCGHWu1G4MRISCt
        g8RaKOln/TXBtTC3o7NtVqHU4A==
X-Google-Smtp-Source: AA6agR4Z44WxckNCVGrX9BJ8rAddXrLZQ706yYjsg78ZpgJVSUpKC61zLEmNzGp/VQoVqnv0snrfMw==
X-Received: by 2002:a17:907:2722:b0:731:2aeb:7942 with SMTP id d2-20020a170907272200b007312aeb7942mr3532659ejl.734.1661459699945;
        Thu, 25 Aug 2022 13:34:59 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906230d00b00722e50dab2csm68239eja.109.2022.08.25.13.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:34:59 -0700 (PDT)
Date:   Thu, 25 Aug 2022 23:34:58 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Message-ID: <Ywfc8jVPp/fihnE4@linaro.org>
References: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-24 16:04:21, Li Jun wrote:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 9d5cc2ddde89..1417b7b1b7df 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -324,8 +324,9 @@
>  #define IMX8MP_CLK_CLKOUT2_SEL			317
>  #define IMX8MP_CLK_CLKOUT2_DIV			318
>  #define IMX8MP_CLK_CLKOUT2			319
> +#define IMX8MP_CLK_USB_SUSP			320
>  
> -#define IMX8MP_CLK_END				320
> +#define IMX8MP_CLK_END				321
>  
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> -- 
> 2.34.1
> 
