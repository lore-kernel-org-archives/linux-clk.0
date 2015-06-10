Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] clk: cdce925: Fix printk size_t warning
Date: Wed, 10 Jun 2015 14:17:36 -0700
Message-Id: <1433971056-9931-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk-cdce925.c:550: warning: format ‘%u’ expects type
‘unsigned int’, but argument 6 has type ‘size_t’

Cc: Mike Looijmans <mike.looijmans@topic.nl>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-cdce925.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 56b870d331a1..85fafb41e6ca 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -547,7 +547,7 @@ static int cdce925_regmap_i2c_read(void *context,
 
 	ret = i2c_transfer(i2c->adapter, xfer, 2);
 	if (likely(ret == 2)) {
-		dev_dbg(&i2c->dev, "%s(%zu, %u) %#x %#x\n", __func__,
+		dev_dbg(&i2c->dev, "%s(%zu, %zu) %#x %#x\n", __func__,
 				reg_size, val_size, reg_data[0], *((u8 *)val));
 		return 0;
 	} else if (ret < 0)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
