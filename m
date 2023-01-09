Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAC4C54EBE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 11:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbjAILDD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 06:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbjAILCk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 06:02:40 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8052F15FC4
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 03:02:38 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v10so10700754edi.8
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q22IC76NIFlUNFVLEBeBBzq7VTQyyR7B6FppDsOGIVs=;
        b=xeJ0UCQzhRtoIqJQJk9zQ3LFzkuI7DT6oqFapRd0kXo0DK0DfvvtODIr5LDADyKbzj
         qqEdrTCiOqruOCLupVh4scPyXTwma9BY8J5dYLhopYd3oHU8AKmmTtNJgssET9n+JCiN
         +IPVFu2HmyC3+D/Axi/uxWJ+8Oy0aR9shRaNGmxCgBNFsTCDaR1yhdgL55wugtF5UTEz
         7/cbhVt+iFP9cO3gulQedA18N5U4xUnhuT6WQK7/RvHGzvGuzD/pCWr/ZR5gs5oVOshA
         4rwyNKtjLSII74Sk312sYmAaYi/t44qkII01grTyTk8wcPgC+ybpb1WzWN6OlegktMHp
         +16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q22IC76NIFlUNFVLEBeBBzq7VTQyyR7B6FppDsOGIVs=;
        b=ZeqQgOpW7kU1w65qlbKIRswiHoIF/jHPJ/zjff22r70060xtbbYW4u6616nfo7shrx
         b/AVJcQd7Xiurcbd54sE2pswMdfNlKAyou6XPR4SVqcwGjpyM4vQ2SdjtvJ8z7/vUdcC
         kMAcOVeJY3/6hwSalDe77Fdp8RDLY6ALQ891mK3ahnTo6B3eTpUFVTIBjNmPkxz+C9gl
         9w7oAriSmbMIwCydT5r6JzXMosoqZJF6BDptMIWApT07uHaUal/F4gZ6YYCnN6w6q0xR
         pBETxIKgstI4IGDt6ZYmk/dDILPa5DD7IZvTkLI4bZa7+yUAEeWDzc05dXQjr8eeF60I
         IEAQ==
X-Gm-Message-State: AFqh2krKjioZ20gmUss1w0JeA9+3I5+BJ1iQoVk430QSyOC3JfkPRusN
        cxbFYqgGl2gpi1fZ8kUBzLSA7A==
X-Google-Smtp-Source: AMrXdXvRBcQNoMEEc0ZGbEm27gjbzB9svuMRfS+32K4VRWjZ2D7MVbGll/YhgRnPNOd1mcnQxIqQPA==
X-Received: by 2002:a05:6402:299b:b0:499:b320:fc2d with SMTP id eq27-20020a056402299b00b00499b320fc2dmr3158785edb.33.1673262156983;
        Mon, 09 Jan 2023 03:02:36 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7cb8e000000b00499b6b50419sm660929edt.11.2023.01.09.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:02:36 -0800 (PST)
Date:   Mon, 9 Jan 2023 13:02:35 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     sboyd@kernel.org, abelvesa@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, mturquette@baylibre.com, l.stach@pengutronix.de,
        peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Message-ID: <Y7v0S7y+JaRVIewv@linaro.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-30 22:54:21, Li Jun wrote:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
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
