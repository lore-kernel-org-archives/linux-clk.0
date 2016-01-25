Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:8060 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754882AbcAYDP1 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 24 Jan 2016 22:15:27 -0500
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
	<xuejiancheng@hisilicon.com>, <lidongpo@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v7 5/6] ARM: dt-bindings: add device tree bindings for Hi3519 sysctrl
Date: Mon, 25 Jan 2016 11:01:22 +0800
Message-ID: <1453690883-31220-6-git-send-email-xuejiancheng@huawei.com>
In-Reply-To: <1453690883-31220-1-git-send-email-xuejiancheng@huawei.com>
References: <1453690883-31220-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add device tree bindings for Hi3519 system controller.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
new file mode 100644
index 0000000..115c5be
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
@@ -0,0 +1,14 @@
+* Hisilicon Hi3519 System Controller Block
+
+This bindings use the following binding:
+Documentation/devicetree/bindings/mfd/syscon.txt
+
+Required properties:
+- compatible: "hisilicon,hi3519-sysctrl".
+- reg: the register region of this block
+
+Examples:
+sysctrl: system-controller@12010000 {
+	compatible = "hisilicon,hi3519-sysctrl", "syscon";
+	reg = <0x12010000 0x1000>;
+};
-- 
1.9.1

