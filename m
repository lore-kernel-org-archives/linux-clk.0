Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH] clk: stm32: Fix out-by-one error path in the index lookup
Date: Sun, 28 Jun 2015 10:55:32 +0100
Message-Id: <1435485332-14951-1-git-send-email-daniel.thompson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

If stm32f4_rcc_lookup() is called with primary == 0 and secondary == 192
then it will read beyond the end of the table array due to an out-by-one
error in the range check.

In addition to the fixing the inequality we also modify the r.h.s. to
make it even more explicit that we are comparing against the size of
table in bits.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/clk/clk-stm32f4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index c825bbd..148c151 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -268,7 +268,7 @@ static int stm32f4_rcc_lookup_clk_idx(u8 primary, u8 secondary)
 	memcpy(table, stm32f42xx_gate_map, sizeof(table));

 	/* only bits set in table can be used as indices */
-	if (WARN_ON(secondary > 8 * sizeof(table) ||
+	if (WARN_ON(secondary >= BITS_PER_BYTE * sizeof(table) ||
 		    0 == (table[BIT_ULL_WORD(secondary)] &
 			  BIT_ULL_MASK(secondary))))
 		return -EINVAL;
--
2.4.3

