Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Shunqian Zheng <zhengsq@rock-chips.com>
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org,
	maxime.ripard@free-electrons.com, heiko@sntech.de,
	caesar.wang@rock-chips.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, dianders@chromium.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	xjq@rock-chips.com, ZhengShunQian <zhengsq@rock-chips.com>
Subject: [PATCH v2 2/5] nvmem: fix the out-of-range leak in read/write()
Date: Tue, 11 Aug 2015 18:13:41 +0800
Message-Id: <1439288024-13359-3-git-send-email-zhengsq@rock-chips.com>
In-Reply-To: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
References: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: ZhengShunQian <zhengsq@rock-chips.com>

The position to read/write must be less than max
register size.

Signed-off-by: ZhengShunQian <zhengsq@rock-chips.com>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d3c6676..f4af8e5 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -67,7 +67,7 @@ static ssize_t bin_attr_nvmem_read(struct file *filp, struct kobject *kobj,
 	int rc;
 
 	/* Stop the user from reading */
-	if (pos > nvmem->size)
+	if (pos >= nvmem->size)
 		return 0;
 
 	if (pos + count > nvmem->size)
@@ -92,7 +92,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 	int rc;
 
 	/* Stop the user from writing */
-	if (pos > nvmem->size)
+	if (pos >= nvmem->size)
 		return 0;
 
 	if (pos + count > nvmem->size)
-- 
1.9.1

