Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73FEC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 21:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD8BB6112F
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 21:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350231AbhICVBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 17:01:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:46434 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350205AbhICVBC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 17:01:02 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mMGI2-0007Iw-D3; Fri, 03 Sep 2021 22:59:58 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Miles Chen <miles.chen@mediatek.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: rockchip: use module_platform_driver_probe
Date:   Fri, 03 Sep 2021 22:59:57 +0200
Message-ID: <1764446.vrLGdHa7mH@diego>
In-Reply-To: <20210902075713.7563-1-miles.chen@mediatek.com>
References: <20210902075713.7563-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Donnerstag, 2. September 2021, 09:57:13 CEST schrieb Miles Chen:
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that rk3399 and rk3568 can be built as kernel modules.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

on both rk3399 and rk3568:
Tested-by: Heiko Stuebner <heiko@sntech.de>

and also
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko

> ---
>  drivers/clk/rockchip/clk-rk3399.c | 2 +-
>  drivers/clk/rockchip/clk-rk3568.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> index 62a4f2543960..a5169156f1d2 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -1653,7 +1653,7 @@ static struct platform_driver clk_rk3399_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
> +module_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
>  
>  MODULE_DESCRIPTION("Rockchip RK3399 Clock Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
> index 75ca855e720d..939e7079c334 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -1719,7 +1719,7 @@ static struct platform_driver clk_rk3568_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
> +module_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
>  
>  MODULE_DESCRIPTION("Rockchip RK3568 Clock Driver");
>  MODULE_LICENSE("GPL");
> 




