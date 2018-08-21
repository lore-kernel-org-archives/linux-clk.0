Return-Path: <khoroshilov@ispras.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] clk: cdce925: release child device nodes
Date: Wed, 22 Aug 2018 00:05:32 +0300
Message-Id: <1534885532-26558-1-git-send-email-khoroshilov@ispras.ru>
List-ID: <linux-clk.vger.kernel.org>

of_get_child_by_name() returns device node with refcount incremented,
but there is no decrement in cdce925_probe(). The patch adds one.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/clk/clk-cdce925.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 0a7e7d5a7506..e9c3ffad4ac3 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -703,6 +703,7 @@ static int cdce925_probe(struct i2c_client *client,
 				0x12 + (i*CDCE925_OFFSET_PLL),
 				0x07, value & 0x07);
 		}
+		of_node_put(np_output);
 	}
 
 	/* Register output clock Y1 */
-- 
2.7.4
