Return-Path: <SRS0=n35e=4V=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD28C3F2D1
	for <linux-clk@archiver.kernel.org>; Wed,  4 Mar 2020 11:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA8BF22522
	for <linux-clk@archiver.kernel.org>; Wed,  4 Mar 2020 11:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387799AbgCDLAK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Mar 2020 06:00:10 -0500
Received: from gloria.sntech.de ([185.11.138.130]:37666 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387774AbgCDLAK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Mar 2020 06:00:10 -0500
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j9Rko-0006RL-Ow; Wed, 04 Mar 2020 11:59:54 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     =?ISO-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@collabora.com>
Cc:     linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
Date:   Wed, 04 Mar 2020 11:59:54 +0100
Message-ID: <2221545.2vEflg7qi2@diego>
In-Reply-To: <20200302155703.278421-2-mylene.josserand@collabora.com>
References: <20200302155703.278421-1-mylene.josserand@collabora.com> <20200302155703.278421-2-mylene.josserand@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
> Determine which revision of rk3288 by checking the HDMI version.
> According to the Rockchip BSP kernel, on rk3288w, the HDMI
> revision equals 0x1A which is not the case for the rk3288 [1].
> 
> As these SOC have some differences, the new function
> 'soc_is_rk3288w' will help us to know on which revision
> we are.

what happened to just having a different compatible in the dts?
Aka doing a 

rk3288w.dtsi with

#include "rk3288.dtsi"

&cru {
	compatible = "rockchip,rk3288w-cru";
}

I somehow don't expect boards to just switch between soc variants
on the fly.

Also, doing things in mach-rockchip is not very future-proof:

(1) having random soc-specific APIs spanning the kernel feels wrong,
    especially as at some point it might not be contained to our own special
    drivers like the cru. I cannot really see people being enthusiastic if
    something like this would be needed in say the core Analogix-DP bridge ;-)
(2) I guess the rk3288w will not be the last soc doing this and on arm64 you
    can't do it that way, as there is no mach-rockchip there

So my personal preference would really would be just a specific compatible
for affected ip blocks.

Heiko

> [1]:https://github.com/rockchip-linux/u-boot/blob/f992fe3334aa5090acb448261982628b5a3d37a5/arch/arm/include/asm/arch-rockchip/cpu.h#L30..L34
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
> ---
>  arch/arm/mach-rockchip/rockchip.c | 45 +++++++++++++++++++++++++++++++
>  include/soc/rockchip/revision.h   | 22 +++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 include/soc/rockchip/revision.h
> 
> diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/rockchip.c
> index f9797a2b5d0d..b907ba390093 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -9,12 +9,14 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> +#include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/irqchip.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clocksource.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <soc/rockchip/revision.h>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
>  #include <asm/hardware/cache-l2x0.h>
> @@ -22,6 +24,49 @@
>  #include "pm.h"
>  
>  #define RK3288_TIMER6_7_PHYS 0xff810000
> +#define RK3288_HDMI_REV_REG	0x04
> +#define RK3288W_HDMI_REV	0x1A
> +
> +static const struct of_device_id rk3288_dt_hdmi_match[] __initconst = {
> +	{ .compatible = "rockchip,rk3288-dw-hdmi" },
> +	{ }
> +};
> +
> +int rk3288_get_revision(void)
> +{
> +	static int revision = RK3288_SOC_REV_UNKNOWN;
> +	struct device_node *dn;
> +	void __iomem *hdmi_base;
> +
> +	if (revision != RK3288_SOC_REV_UNKNOWN)
> +		return revision;
> +
> +	dn = of_find_matching_node(NULL, rk3288_dt_hdmi_match);
> +	if (!dn) {
> +		pr_err("%s: Couldn't find HDMI node\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	hdmi_base = of_iomap(dn, 0);
> +	of_node_put(dn);
> +
> +	if (!hdmi_base) {
> +		pr_err("%s: Couldn't map %pOF regs\n", __func__,
> +		       hdmi_base);
> +		return -ENXIO;
> +	}
> +
> +	if (readl_relaxed(hdmi_base + RK3288_HDMI_REV_REG) ==
> +	    RK3288W_HDMI_REV)
> +		revision = RK3288_SOC_REV_RK3288W;
> +	else
> +		revision = RK3288_SOC_REV_RK3288;
> +
> +	iounmap(hdmi_base);
> +
> +	return revision;
> +}
> +EXPORT_SYMBOL(rk3288_get_revision);
>  
>  static void __init rockchip_timer_init(void)
>  {
> diff --git a/include/soc/rockchip/revision.h b/include/soc/rockchip/revision.h
> new file mode 100644
> index 000000000000..226419c60af0
> --- /dev/null
> +++ b/include/soc/rockchip/revision.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Collabora
> + */
> +
> +#ifndef __SOC_ROCKCHIP_REVISION_H__
> +#define __SOC_ROCKCHIP_REVISION_H__
> +
> +enum rk3288_soc_revision {
> +	RK3288_SOC_REV_UNKNOWN,
> +	RK3288_SOC_REV_RK3288,
> +	RK3288_SOC_REV_RK3288W,
> +};
> +
> +int rk3288_get_revision(void);
> +
> +static inline bool soc_is_rk3288w(void)
> +{
> +	return rk3288_get_revision() == RK3288_SOC_REV_RK3288W;
> +}
> +
> +#endif /* __SOC_ROCKCHIP_REVISION_H__ */
> 




