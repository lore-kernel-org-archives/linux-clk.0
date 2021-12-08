Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909C1C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 15:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhLHPqv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:46:51 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:38143 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbhLHPqv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 10:46:51 -0500
Received: from localhost.localdomain ([87.166.17.165]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mn2eH-1mEoOc3TU7-00k4gd; Wed, 08 Dec 2021 16:43:05 +0100
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com, renner@efe-gmbh.de
Subject: [PATCH RESEND] clk: si5351: update multisynth limits
Date:   Wed,  8 Dec 2021 16:42:38 +0100
Message-Id: <20211208154238.71727-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bjO3KhPwF+BS083Xe/A4vjTBJWcH2l+TYNmM4tdSRthy9sEy+s4
 tcnGvaEnJLJjyRBDFaoGLVz+wXEMyuvw/AAHCIxRdnfJyyydtS9FvDfgK0lEO6Hf5vygY9g
 w8ZLnimF2achIIs0jaP9SQJ1ikg5XaGQgvwiAvyCdhvNE5v3+Zl7GC93saLaSKA3lJEkIKC
 mpvBGMQ1RaxSIT44/YfLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fhhfVlvOvCM=:IbUr7X5uddcp24qzzkJnt6
 8k6Avz67Z9awwnSYfoVNGXtv6uf48cMeIKRSrzrWc5yaZ1zkKMs5lU0xsBGWSdVgHDRMgZefQ
 0BEWGek36ilOwgXvtR0d96ZGKGOSmi8BoFi5TyyFRlwA//IzG9P21Jpm9RlE+6wO/TY38TGvq
 YjCusUIHOFU3Hu0lqv86Xv8FkztSqvzu7GHskHNSC7oyqNii1zpve+/Z5CwUOXgH6x3/bH5eG
 9LpGNuEGeEZ36cgAPufq1vSgHc2OXYmkpRbHwREVhHjUZtgknvKX5WW5Dh5I078T18l1i1odr
 nLbYY5tKd1bNV51roq4lQBqSkAHw6QU69aBy1WdfxEvJUU1yDjsXt28GuzlyOoBe+Px9qwLsR
 K/h382vxBM0R5eAHBjbJf/mw00hAJvNUfVhNSaJ18fkkkGb23py570vlH3pxaylTL76KGPvUR
 vE2xRLzFsdr6E2DxcZMnX4WfA9yjkq8ayLVSybasdCE7iIO16ykQnvWdGDPJKMFukN+GlWz2I
 jmB+nFJhPc6Fhfyyr1ZVFwYzvZNuDNldGgL5CKCcWuL6C33Ln65buCPSN6eNl8x2nxrE2o9vI
 Zjel+U+45zgAsvo6I7TA1id3A9YSDt69W1rAgo1+6dqzUmbOlx6XSocb9Di0zM3iZ2mmEn5YW
 wXh824RsUvenYLSu8FrXRVercAy5adycM4Cz9VeTUNayoIL4+zWGZfaYF8MRjWde9KaA=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The revised datasheet (rev. 1.0 and later) specifies new limits for the
multisynth dividers that lead to an extended clock output frequency
range of 2.5 kHz - 200 MHz [1].

[1] https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public
/data-sheets/Si5351-B.pdf

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
 drivers/clk/clk-si5351.c | 15 ++++++++-------
 drivers/clk/clk-si5351.h |  8 ++++----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 57e4597cdf4c..56bc59f91d20 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -556,7 +556,7 @@ static const struct clk_ops si5351_pll_ops = {
  * MS[6,7] are integer (P1) divide only, P1 = divide value,
  * P2 and P3 are not applicable
  *
- * for 150MHz < fOUT <= 160MHz:
+ * for 150MHz < fOUT <= 200MHz:
  *
  * MSx_P1 = 0, MSx_P2 = 0, MSx_P3 = 1, MSx_INT = 1, MSx_DIVBY4 = 11b
  */
@@ -653,7 +653,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (hwdata->num >= 6 && rate > SI5351_MULTISYNTH67_MAX_FREQ)
 		rate = SI5351_MULTISYNTH67_MAX_FREQ;
 
-	/* multisync frequency is 1MHz .. 160MHz */
+	/* multisync frequency is 300kHz .. 200MHz */
 	if (rate > SI5351_MULTISYNTH_MAX_FREQ)
 		rate = SI5351_MULTISYNTH_MAX_FREQ;
 	if (rate < SI5351_MULTISYNTH_MIN_FREQ)
@@ -681,8 +681,8 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		*parent_rate = a * rate;
 	} else if (hwdata->num >= 6) {
-		/* determine the closest integer divider */
-		a = DIV_ROUND_CLOSEST(*parent_rate, rate);
+		/* determine the closest even integer divider */
+		a = DIV_ROUND_CLOSEST(*parent_rate/2, rate) * 2;
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
 		if (a > SI5351_MULTISYNTH67_A_MAX)
@@ -715,7 +715,8 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		b = 0;
 		c = 1;
-		if (rfrac)
+		/* Smallest divider in fractional mode must be > 8 (AN619)! */
+		if (rfrac && (a >= 8))
 			rational_best_approximation(rfrac, denom,
 			    SI5351_MULTISYNTH_B_MAX, SI5351_MULTISYNTH_C_MAX,
 			    &b, &c);
@@ -1039,11 +1040,11 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		container_of(hw, struct si5351_hw_data, hw);
 	unsigned char rdiv;
 
-	/* clkout6/7 can only handle output freqencies < 150MHz */
+	/* clkout6/7 can only handle output frequencies < 150MHz */
 	if (hwdata->num >= 6 && rate > SI5351_CLKOUT67_MAX_FREQ)
 		rate = SI5351_CLKOUT67_MAX_FREQ;
 
-	/* clkout freqency is 8kHz - 160MHz */
+	/* clkout frequency is 2.5kHz - 200MHz */
 	if (rate > SI5351_CLKOUT_MAX_FREQ)
 		rate = SI5351_CLKOUT_MAX_FREQ;
 	if (rate < SI5351_CLKOUT_MIN_FREQ)
diff --git a/drivers/clk/clk-si5351.h b/drivers/clk/clk-si5351.h
index 73dc8effc519..f799dc6ea8a1 100644
--- a/drivers/clk/clk-si5351.h
+++ b/drivers/clk/clk-si5351.h
@@ -13,11 +13,11 @@
 
 #define SI5351_PLL_VCO_MIN			600000000
 #define SI5351_PLL_VCO_MAX			900000000
-#define SI5351_MULTISYNTH_MIN_FREQ		1000000
+#define SI5351_MULTISYNTH_MIN_FREQ		300000
 #define SI5351_MULTISYNTH_DIVBY4_FREQ		150000000
-#define SI5351_MULTISYNTH_MAX_FREQ		160000000
+#define SI5351_MULTISYNTH_MAX_FREQ		200000000
 #define SI5351_MULTISYNTH67_MAX_FREQ		SI5351_MULTISYNTH_DIVBY4_FREQ
-#define SI5351_CLKOUT_MIN_FREQ			8000
+#define SI5351_CLKOUT_MIN_FREQ			2500
 #define SI5351_CLKOUT_MAX_FREQ			SI5351_MULTISYNTH_MAX_FREQ
 #define SI5351_CLKOUT67_MAX_FREQ		SI5351_MULTISYNTH67_MAX_FREQ
 
@@ -26,7 +26,7 @@
 #define SI5351_PLL_B_MAX			(SI5351_PLL_C_MAX-1)
 #define SI5351_PLL_C_MAX			1048575
 #define SI5351_MULTISYNTH_A_MIN			6
-#define SI5351_MULTISYNTH_A_MAX			1800
+#define SI5351_MULTISYNTH_A_MAX			2048
 #define SI5351_MULTISYNTH67_A_MAX		254
 #define SI5351_MULTISYNTH_B_MAX			(SI5351_MULTISYNTH_C_MAX-1)
 #define SI5351_MULTISYNTH_C_MAX			1048575
-- 
2.33.0
