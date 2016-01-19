Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:14248 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756936AbcASCvP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 18 Jan 2016 21:51:15 -0500
From: Jiancheng Xue <xuejiancheng@huawei.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
	<linux@arm.linux.org.uk>, <khilman@linaro.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <xuwei5@hisilicon.com>,
	<haojian.zhuang@linaro.org>, <zhangfei.gao@linaro.org>,
	<bintian.wang@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
	<yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
	<raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
	<gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
	<xuejiancheng@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v6 3/6] ARM: config: hisi: enable CONFIG_RESET_CONTROLLER
Date: Tue, 19 Jan 2016 10:38:28 +0800
Message-ID: <1453171111-21921-4-git-send-email-xuejiancheng@huawei.com>
In-Reply-To: <1453171111-21921-1-git-send-email-xuejiancheng@huawei.com>
References: <1453171111-21921-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

enable CONFIG_RESET_CONTROLLER in hisi_defconfig

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 arch/arm/configs/hisi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index b2e340b..ba62c07 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -75,6 +75,7 @@ CONFIG_DMADEVICES=y
 CONFIG_DW_DMAC=y
 CONFIG_PL330_DMA=y
 CONFIG_PWM=y
+CONFIG_RESET_CONTROLLER=y
 CONFIG_PHY_HIX5HD2_SATA=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
-- 
1.9.1

