Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E098FC64E7B
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 22:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9198321D93
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 22:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgLBWUF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 17:20:05 -0500
Received: from aposti.net ([89.234.176.197]:37088 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728186AbgLBWUF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 17:20:05 -0500
Date:   Wed, 02 Dec 2020 22:19:12 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add missing clocks for Ingenic
 SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     sboyd@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <0OGQKQ.9XH5E7BM1Y913@crapouillou.net>
In-Reply-To: <20201125172618.112707-3-zhouyanjie@wanyeetech.com>
References: <20201125172618.112707-1-zhouyanjie@wanyeetech.com>
        <20201125172618.112707-3-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Le jeu. 26 nov. 2020 à 1:26, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add CIM, AIC, DMIC clocks bindings for the X1000 SoC, and CIM, AIC,
> DMIC, I2S clocks for the X1830 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  include/dt-bindings/clock/x1000-cgu.h | 3 +++
>  include/dt-bindings/clock/x1830-cgu.h | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/x1000-cgu.h 
> b/include/dt-bindings/clock/x1000-cgu.h
> index f187e07..fa92257 100644
> --- a/include/dt-bindings/clock/x1000-cgu.h
> +++ b/include/dt-bindings/clock/x1000-cgu.h
> @@ -50,5 +50,8 @@
>  #define X1000_CLK_PDMA			35
>  #define X1000_CLK_EXCLK_DIV512	36
>  #define X1000_CLK_RTC			37
> +#define X1000_CLK_CIM			38
> +#define X1000_CLK_AIC			39
> +#define X1000_CLK_DMIC			40
> 
>  #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
> diff --git a/include/dt-bindings/clock/x1830-cgu.h 
> b/include/dt-bindings/clock/x1830-cgu.h
> index 8845537..3732507 100644
> --- a/include/dt-bindings/clock/x1830-cgu.h
> +++ b/include/dt-bindings/clock/x1830-cgu.h
> @@ -53,5 +53,9 @@
>  #define X1830_CLK_OST			38
>  #define X1830_CLK_EXCLK_DIV512	39
>  #define X1830_CLK_RTC			40
> +#define X1830_CLK_CIM			41
> +#define X1830_CLK_AIC			42
> +#define X1830_CLK_DMIC			43
> +#define X1830_CLK_I2S			44
> 
>  #endif /* __DT_BINDINGS_CLOCK_X1830_CGU_H__ */
> --
> 2.7.4
> 


