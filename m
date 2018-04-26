Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:46342 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755359AbeDZLNf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Apr 2018 07:13:35 -0400
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Tali Perry <tali.perry1@gmail.com>, Stephen Boyd <sboyd@kernel.org>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <openbmc@lists.ozlabs.org>,
        <linux-clk@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] clk: npcm7xx: fix return value check in npcm7xx_clk_init()
Date: Thu, 26 Apr 2018 11:21:08 +0000
Message-ID: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In case of error, the function ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index dba5384..740af90 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -555,7 +555,7 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	}
 
 	clk_base = ioremap(res.start, resource_size(&res));
-	if (IS_ERR(clk_base))
+	if (!clk_base)
 		goto npcm7xx_init_error;
 
 	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *

