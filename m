Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F721C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 10:03:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E15420868
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 10:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbfFFKDB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 06:03:01 -0400
Received: from gloria.sntech.de ([185.11.138.130]:37234 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726972AbfFFKDB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 06:03:01 -0400
Received: from we0305.dip.tu-dresden.de ([141.76.177.49] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hYpEW-0003Vv-Kz; Thu, 06 Jun 2019 12:02:56 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on rk3328
Date:   Thu, 06 Jun 2019 12:02:56 +0200
Message-ID: <3485393.4UdOu2YNQE@phil>
In-Reply-To: <20190605235714.22432-1-papadakospan@gmail.com>
References: <20190605235714.22432-1-papadakospan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am Donnerstag, 6. Juni 2019, 01:57:13 CEST schrieb Leonidas P. Papadakos:
> From: <itdaniher@gmail.com>

Why is the From different from the Signed-off-by? Would also need a full name.
If the patch is from you, please just use the same From as for the Signed-off-by.

> 
> Following the discussion here:
> https://github.com/rockchip-linux/kernel/issues/123
> 
> it can be seen that these are the changes needed to enable the use of the hardware watchdog in the rk3328 SoC.
> 
> This is in line with past changes for the rk3288:
> http://lists.infradead.org/pipermail/linux-rockchip/2015-January/002314.html
> 
> Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
>  include/dt-bindings/clock/rk3328-cru.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
> index 076b9777a..546ee0ab7 100644
> --- a/drivers/clk/rockchip/clk-rk3328.c
> +++ b/drivers/clk/rockchip/clk-rk3328.c
> @@ -876,6 +876,8 @@ static const char *const rk3328_critical_clocks[] __initconst = {
>  
>  static void __init rk3328_clk_init(struct device_node *np)
>  {
> +	struct clk *clk;
> +
>  	struct rockchip_clk_provider *ctx;
>  	void __iomem *reg_base;
>  
> @@ -892,6 +894,13 @@ static void __init rk3328_clk_init(struct device_node *np)
>  		return;
>  	}
>  
> +	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_bus", 0, 1, 1);
> +	if (IS_ERR(clk))
> +		pr_warn("%s: could not register clock pclk_wdt: %ld\n",
> +			__func__, PTR_ERR(clk));
> +	else
> +		rockchip_clk_add_lookup(ctx, clk, PCLK_WDT);
> +

I've just Cc'ed you on 2 patches adding a SGRF_GATE clock-type. Please
use that as base for you rk3328-wdt-clock, so that we don't introduce more
boilderplate code.


>  	rockchip_clk_register_plls(ctx, rk3328_pll_clks,
>  				   ARRAY_SIZE(rk3328_pll_clks),
>  				   RK3328_GRF_SOC_STATUS0);

> diff --git a/include/dt-bindings/clock/rk3328-cru.h b/include/dt-bindings/clock/rk3328-cru.h
> index afb811340..555b4ff66 100644
> --- a/include/dt-bindings/clock/rk3328-cru.h
> +++ b/include/dt-bindings/clock/rk3328-cru.h
> @@ -164,6 +164,7 @@
>  #define PCLK_DCF		233
>  #define PCLK_SARADC		234
>  #define PCLK_ACODECPHY		235
> +#define PCLK_WDT		236
>  
>  /* hclk gates */
>  #define HCLK_PERI		308

please split the addition of the clock-id into a separate patch only adding
said id.


Thanks
Heiko



