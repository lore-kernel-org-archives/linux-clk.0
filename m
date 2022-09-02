Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB845C6FA82
	for <linux-clk@archiver.kernel.org>; Fri,  2 Sep 2022 18:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIBS3Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Sep 2022 14:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiIBS3V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 14:29:21 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331D910DE5E
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 11:22:14 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s23so1689587wmj.4
        for <linux-clk@vger.kernel.org>; Fri, 02 Sep 2022 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ojk6sR1enpNZ4A6UZuJ0vO1AZQgVqYffnIr1R5iYzjs=;
        b=hSgAt7QMHun6u+JdezesHvolMKXWzxe+bCTJE9Q5nVxNU2NTcqsw1Xm0NE7ImFH64X
         GTD0bfyzJHGXEAFMoAa62yt0Ek+XP+3uTlpZPZ8rwnqM1Y46rLXyqRT3XWOJxFktwJxT
         JHGZnltvkyLsOsuAcS2YWOBAG9AzYZfzrDeXiptT6ei99+CYUubhGDIxBZ2CgYol6l0/
         OGz+NrPXMr8rRHFpQHReyhX+E27bqhcjhZXqqL05FN+r1/4RdIvRCBuNvlE8LYqJ/qy6
         O7tVs7ODtzCSrg3C3h642tluAW+nWIhrd2cQscJGLuY3hGpk7CBX/fOaebHsrm/IgXdH
         a0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ojk6sR1enpNZ4A6UZuJ0vO1AZQgVqYffnIr1R5iYzjs=;
        b=Fvotc4TJU7Oewd1B1rIS+W0N3UKKkSvqcXc4Bohaa7nej7EvVMpykfOdvud0jCJ/m0
         XZuXCp2ytvmGByvR0Xg5TY//kG0Yycsr9se7yG+A34gdA/uvNzGKtV9OW0D+UYQ30KFQ
         +Fs6LH6pFMiP7fRasmo0kacPcD/gk6mwdYTvpt8gf7gm2/8geBe4yebjZwHDj5ltwcuY
         Z6JSsRpLSZjSrukCs9vL7mMR66A2Cy9LDxxxiHUHb7MU1vAOpi0GhKD84bvpZe3u/VHz
         s4qefXwGdMMB4ZFfs0fx1VDxy9dpAx1G0qNXLoPg6XGEfRiwfv03cAdAQ39Prd9K70yZ
         9J1w==
X-Gm-Message-State: ACgBeo1R79ghWzhX90JxX7+7p22rRbVc9kLCfr01a2M4JG45M0F6LtmB
        OGej+YEfN+XmrXmoBFqC4zVG7g==
X-Google-Smtp-Source: AA6agR4bECAgBJdNC4rnIclnJIrhx1jPSkwqM//T2yRdLncrat9vR3gP5/Myy3t1VemeWXXVUKPiKQ==
X-Received: by 2002:a05:600c:1c8d:b0:3a6:9d60:faf0 with SMTP id k13-20020a05600c1c8d00b003a69d60faf0mr3848787wms.82.1662142932774;
        Fri, 02 Sep 2022 11:22:12 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c15ca00b003a5dadcf1a8sm2701188wmf.19.2022.09.02.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:22:12 -0700 (PDT)
Date:   Fri, 2 Sep 2022 21:22:08 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Message-ID: <YxJJ0IQ1Gu1lp02p@linaro.org>
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

Applied both, thanks!

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
