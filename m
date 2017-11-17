Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:11003 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757452AbdKQJ2R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Nov 2017 04:28:17 -0500
From: Xu YiPing <xuyiping@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <xuwei5@hisilicon.com>, <catalin.marinas@arm.com>,
        <will.deacon@arm.com>, <xuejiancheng@hisilicon.com>,
        <wenpan@hisilicon.com>, <leo.yan@linaro.org>,
        <zhangfei.gao@linaro.org>, <guodong.xu@linaro.org>,
        <zhongkaihua@huawei.com>, <chenjun14@huawei.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <suzhuangluan@hisilicon.com>, <xuezhiliang@hisilicon.com>,
        <kevin.wangtao@hisilicon.com>
Subject: [PATCH v3 1/3] dt-bindings: clk: Hi3660: Document stub clock
Date: Fri, 17 Nov 2017 17:27:30 +0800
Message-ID: <1510910852-2175-2-git-send-email-xuyiping@hisilicon.com>
In-Reply-To: <1510910852-2175-1-git-send-email-xuyiping@hisilicon.com>
References: <1510910852-2175-1-git-send-email-xuyiping@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Leo Yan <leo.yan@linaro.org>

Document the DT binding for stub clock which is used for CPU,
GPU and DDR frequency scaling.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/devicetree/bindings/clock/hi3660-clock.txt | 6 ++++++
 include/dt-bindings/clock/hi3660-clock.h                 | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/hi3660-clock.txt b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
index 0035a7e..946da7c 100644
--- a/Documentation/devicetree/bindings/clock/hi3660-clock.txt
+++ b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
@@ -13,12 +13,18 @@ Required Properties:
 	- "hisilicon,hi3660-pmuctrl"
 	- "hisilicon,hi3660-sctrl"
 	- "hisilicon,hi3660-iomcu"
+	- "hisilicon,hi3660-stub-clk"
 
 - reg: physical base address of the controller and length of memory mapped
   region.
 
 - #clock-cells: should be 1.
 
+Optional Properties:
+
+- mboxes: Phandle to the mailbox for sending message to MCU.
+            (See: ../mailbox/hisilicon,hi3660-mailbox.txt for more info)
+
 Each clock is assigned an identifier and client nodes use this identifier
 to specify the clock which they consume.
 
diff --git a/include/dt-bindings/clock/hi3660-clock.h b/include/dt-bindings/clock/hi3660-clock.h
index adb768d..75d583e 100644
--- a/include/dt-bindings/clock/hi3660-clock.h
+++ b/include/dt-bindings/clock/hi3660-clock.h
@@ -208,4 +208,11 @@
 #define HI3660_CLK_I2C6_IOMCU		3
 #define HI3660_CLK_IOMCU_PERI0		4
 
+/* clk in stub clock */
+#define HI3660_CLK_STUB_CLUSTER0	0
+#define HI3660_CLK_STUB_CLUSTER1	1
+#define HI3660_CLK_STUB_GPU		2
+#define HI3660_CLK_STUB_DDR		3
+#define HI3660_CLK_STUB_NUM		4
+
 #endif	/* __DTS_HI3660_CLOCK_H */
-- 
1.9.1

