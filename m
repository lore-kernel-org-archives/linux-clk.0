Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
        <linux@arm.linux.org.uk>, <khilman@linaro.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <xuwei5@hisilicon.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
        <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
        <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
        <zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [RESEND PATCH v10 5/6] ARM: dt-bindings: add device tree bindings for Hi3519 sysctrl
Date: Thu, 31 Mar 2016 16:10:10 +0800
Message-ID: <1459411811-12390-6-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1459411811-12390-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1459411811-12390-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Jiancheng Xue <xuejiancheng@huawei.com>

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
