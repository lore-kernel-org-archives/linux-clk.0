Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:59072 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759185AbcGKPdi (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2016 11:33:38 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	jason@lakedaemon.net, Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Wan Zongshun <mcuos.com@gmail.com>
Subject: Re: [PATCH v2 03/10] Clocksource: add nuc970 clocksource driver
Date: Mon, 11 Jul 2016 17:36:13 +0200
Message-ID: <3277576.eNgdG7zPqq@wuerfel>
In-Reply-To: <1468135649-19980-4-git-send-email-vw@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <1468135649-19980-4-git-send-email-vw@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sunday, July 10, 2016 3:27:23 PM CEST Wan Zongshun wrote:
> 
> +config NUC900_TIMER
> +        bool "Clocksource timer for nuc900 platform" if COMPILE_TEST
> +        depends on ARM
> +        select CLKSRC_OF if OF
> +        select CLKSRC_MMIO
> +        help
> +          Enables the clocksource for the NUC900 platform.
> 

I have put this patch into my randconfig build system and found that
it lacks a dependency:



diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index e18ef32776a3..59b9251eef37 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -523,7 +523,7 @@ config CLKSRC_ST_LPC
 
 config NUC900_TIMER
         bool "Clocksource timer for nuc900 platform" if COMPILE_TEST
-        depends on ARM
+        depends on ARM && GENERIC_CLOCKEVENTS
         select CLKSRC_OF if OF
         select CLKSRC_MMIO
         help
	

Also the init function has changed its return type in linux-next:

> +static void __init nuc970_timer_of_init(struct device_node *node)

This now needs to return an error code or we get:

../include/linux/of.h:1004:20: error: comparison of distinct pointer types lacks a cast [-Werror]
        .data = (fn == (fn_type)NULL) ? fn : fn  }

Daniel Lezcano seems to have implemented a migration strategy, but I
can't see what you are supposed to do here, since the
CLOCKSOURCE_OF_DECLARE_RET macro is no longer part of linux-next.

	Arnd
