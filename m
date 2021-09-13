Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B907CC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9790F6101C
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbhIMIvu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:51:50 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238121AbhIMIvt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 04:51:49 -0400
Received: from stretch.efe.local ([79.233.161.113]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MxHLs-1nA65U3agq-00xXQG; Mon, 13 Sep 2021 10:50:28 +0200
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com, renner@efe-gmbh.de
Subject: [PATCH] clk: si5351: update multisynth limits
Date:   Mon, 13 Sep 2021 10:50:18 +0200
Message-Id: <20210913085018.116591-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5AyDpDJt23SAQ7LPt7glz1uGSlyR2cVDOj1jW0K9A6TwW+v753f
 tsM58oh31W9djKVcxsjVTY4cqIVu08s1LEBM1lBTdgy96iIyoxh/Wtl2ZiJWyqxIfaQcyu5
 8luUR7Lg4tUwRNt27ebOvKOWLXQA00TvYJ/GO4Zs3wg1WXusMSjV/CIOc2ga/ZEws3QFtTv
 uaPIZpZo/1Fp/5/3YAcKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tHLt6Pxvgj0=:AHNrOFu1Xg9l/qjH97ZlmE
 NUv/0oAy3f6Ju/C3Eb+zeVNwljzydk3Za02QAnVfcrWgJ9k21r737XKXoQnbXR/3Q3Jn6cxaY
 Ve3dJBtR6KPWXbp7/ner1xi53yJskETB8iQhqVdozL42jwm0QWQYT8WaSJHy2QlHmkiBSoe08
 gqnUnlG4rJj2THnskRGqajTReQRqFHhCkZCh8o0OWiQvR9FTLdz2MNZ8PGYF8v5i0sa7+EPsi
 xy2/NClUrUY+8N1WzHRivmplkhIRHW33+qXsz32FLI/GjlXGwBc6JswX3R3VGjbbfFd/F7udz
 Q6bpresmStlt17/HUW7907Qn4SDhb2IGC8UaHIxGDtfSb5M/tjETAbtSg1S7Olr5Ong33hxCp
 hvFAbb+h0RotrOrzRcDymrCyqBKXSYZ2CQygdX4O/Z3w4ZFnMToBokRQ2WaNPN1llMrxWAV+J
 E8HATojgR0U3juZmrD1QpFUA47nEGnMwFQ3SpRhDJCFkVfMQZNUHMS5+TOGFgnuJzFcp+5a8k
 S4X94DhQLr1hzV3pKdxUYwmH3/L/MKW7MpkdOhcMZv9nr4qYmKxR3N+eFCM3a5avisfZ++tV5
 rsT8H62O6P7+1E0N4zxG19oEX/dXUdb6R4H8tOyJlLBi/XjMW0Kyg/UgUeeNuUWPKCxtb7UTA
 xeHllKpRGo+1msJABDflR7uKXeeFIwf7InJ1n+f1i15VdyrwnAOnemp1oa7Tq19TC5mRJsGQh
 mlZkY0xlCFASvUq3yfCQ/T/Vy5UW0JNvg1GRkg==
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

