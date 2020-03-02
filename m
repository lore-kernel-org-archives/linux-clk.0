Return-Path: <SRS0=oWSs=4T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF944C3F2D1
	for <linux-clk@archiver.kernel.org>; Mon,  2 Mar 2020 15:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC53321D56
	for <linux-clk@archiver.kernel.org>; Mon,  2 Mar 2020 15:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgCBP6a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Mar 2020 10:58:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47280 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgCBP6a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Mar 2020 10:58:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: myjosserand)
        with ESMTPSA id 0B2A628A18A
From:   =?UTF-8?q?Myl=C3=A8ne=20Josserand?= 
        <mylene.josserand@collabora.com>
To:     linux@armlinux.org.uk, heiko@sntech.de, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     mylene.josserand@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
Date:   Mon,  2 Mar 2020 16:57:02 +0100
Message-Id: <20200302155703.278421-2-mylene.josserand@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200302155703.278421-1-mylene.josserand@collabora.com>
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Determine which revision of rk3288 by checking the HDMI version.
According to the Rockchip BSP kernel, on rk3288w, the HDMI
revision equals 0x1A which is not the case for the rk3288 [1].

As these SOC have some differences, the new function
'soc_is_rk3288w' will help us to know on which revision
we are.

[1]:https://github.com/rockchip-linux/u-boot/blob/f992fe3334aa5090acb448261982628b5a3d37a5/arch/arm/include/asm/arch-rockchip/cpu.h#L30..L34

Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
---
 arch/arm/mach-rockchip/rockchip.c | 45 +++++++++++++++++++++++++++++++
 include/soc/rockchip/revision.h   | 22 +++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 include/soc/rockchip/revision.h

diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/rockchip.c
index f9797a2b5d0d..b907ba390093 100644
--- a/arch/arm/mach-rockchip/rockchip.c
+++ b/arch/arm/mach-rockchip/rockchip.c
@@ -9,12 +9,14 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/irqchip.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <soc/rockchip/revision.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/hardware/cache-l2x0.h>
@@ -22,6 +24,49 @@
 #include "pm.h"
 
 #define RK3288_TIMER6_7_PHYS 0xff810000
+#define RK3288_HDMI_REV_REG	0x04
+#define RK3288W_HDMI_REV	0x1A
+
+static const struct of_device_id rk3288_dt_hdmi_match[] __initconst = {
+	{ .compatible = "rockchip,rk3288-dw-hdmi" },
+	{ }
+};
+
+int rk3288_get_revision(void)
+{
+	static int revision = RK3288_SOC_REV_UNKNOWN;
+	struct device_node *dn;
+	void __iomem *hdmi_base;
+
+	if (revision != RK3288_SOC_REV_UNKNOWN)
+		return revision;
+
+	dn = of_find_matching_node(NULL, rk3288_dt_hdmi_match);
+	if (!dn) {
+		pr_err("%s: Couldn't find HDMI node\n", __func__);
+		return -EINVAL;
+	}
+
+	hdmi_base = of_iomap(dn, 0);
+	of_node_put(dn);
+
+	if (!hdmi_base) {
+		pr_err("%s: Couldn't map %pOF regs\n", __func__,
+		       hdmi_base);
+		return -ENXIO;
+	}
+
+	if (readl_relaxed(hdmi_base + RK3288_HDMI_REV_REG) ==
+	    RK3288W_HDMI_REV)
+		revision = RK3288_SOC_REV_RK3288W;
+	else
+		revision = RK3288_SOC_REV_RK3288;
+
+	iounmap(hdmi_base);
+
+	return revision;
+}
+EXPORT_SYMBOL(rk3288_get_revision);
 
 static void __init rockchip_timer_init(void)
 {
diff --git a/include/soc/rockchip/revision.h b/include/soc/rockchip/revision.h
new file mode 100644
index 000000000000..226419c60af0
--- /dev/null
+++ b/include/soc/rockchip/revision.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Collabora
+ */
+
+#ifndef __SOC_ROCKCHIP_REVISION_H__
+#define __SOC_ROCKCHIP_REVISION_H__
+
+enum rk3288_soc_revision {
+	RK3288_SOC_REV_UNKNOWN,
+	RK3288_SOC_REV_RK3288,
+	RK3288_SOC_REV_RK3288W,
+};
+
+int rk3288_get_revision(void);
+
+static inline bool soc_is_rk3288w(void)
+{
+	return rk3288_get_revision() == RK3288_SOC_REV_RK3288W;
+}
+
+#endif /* __SOC_ROCKCHIP_REVISION_H__ */
-- 
2.25.1

