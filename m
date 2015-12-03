Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@huawei.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <xuwei5@hisilicon.com>,
        <haojian.zhuang@linaro.org>, <zhangfei.gao@linaro.org>,
        <bintian.wang@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
        <suwenping@hisilicon.com>, <ml.yang@hisilicon.com>,
        <gaofei@hisilicon.com>, Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v2 8/9] clk: hisilicon: rename ARCH_HI3xxx to ARCH_HI36xx
Date: Thu, 3 Dec 2015 10:48:56 +0800
Message-ID: <1449110936-23894-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Rename ARCH_HI3xxx to ARCH_HI36xx.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 drivers/clk/hisilicon/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 9a601c0..5a1c195 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -4,7 +4,7 @@
 
 obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o
 
-obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
+obj-$(CONFIG_ARCH_HI36xx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
-- 
1.9.1
