Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B35C2B9F4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 10:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07AF3613C0
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 10:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhFVKRn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 06:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhFVKRm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jun 2021 06:17:42 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D79C061756
        for <linux-clk@vger.kernel.org>; Tue, 22 Jun 2021 03:15:17 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id f2so22925120wri.11
        for <linux-clk@vger.kernel.org>; Tue, 22 Jun 2021 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zYV7hqqp2NUmMYcdGW3YHE3qT5LHwub4HNP+0eHal0A=;
        b=zKhd0Pwpfpit6QP/op/rRTOyEXkXh2gcDJ7Xmn0KHeDskCe+FNDHUIQA2D9japVVRf
         1ygggadDXv/i6flr2li5qwx3TllsVkFylc6kwdcMGpkkFN8ZZ+knfYLqygM02lqqPDET
         /H6YOT1hLtC6vBdhRrA9RIv4ucCQpxYxcJTfpgoIKAJ39tT7oc0u/TDtOWp8Se+vb7Gu
         DFaSeKncT8ZMzh0kgnKpbet8g06wWCZxT0yWYob2UMNk1bk39BzJWtrJjPVAvGZwtNSC
         NZlbQ6OcySq/tObHJQtkl+pYePgRXlwSFwFWFOo/+QP3GqoOYI0VoszBWxHN1Ysmx8GE
         eOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=zYV7hqqp2NUmMYcdGW3YHE3qT5LHwub4HNP+0eHal0A=;
        b=sneXzO+IoQKcrfX6Tu7Z8gVrCYFaQAmBBRKNlPdzHw7UcZYVv+WVZJ6t2UqKNDmjiC
         h5d+bsyO8TOKLfl6XkKvMTVWswlf0oIZZuDEMSd3pcpNZ3ewA1VGEC/7G8ssp8stVvd1
         e9cec5KncHO/IsezV2jg3wVCs+3tvHa6iRM6N8mZ2jhLzAAOQph94thaBe6cQVm7HiIk
         nqxBtVwi6MeceEzAsRSV8oL6F/Sjh7QAFhNV/iNUC4IYWQ+xTS8PDwtwQLcu06NdWP8p
         b0PJrv8D3qaDVLIk4qOj/DpQisCsHJcxX9pTgcrhp6LUR1xM/yDSx0GOJ/Av+S9ry6Z0
         eakg==
X-Gm-Message-State: AOAM5325cmZnJXUVaRMe5sNxDaCzcOPKDiopcNBFgIzpYfbXvquPkuZo
        DUEj35mcU2sPs20JboB8vLVzpQ1vdAw1hYa+
X-Google-Smtp-Source: ABdhPJxt8obSRXvVypphkRGgMVXcrgAsDsUhRgYgzVfdvQnodGoMOhJQHlzTPJd8yocqaKzzoGWIdA==
X-Received: by 2002:adf:eed2:: with SMTP id a18mr3865604wrp.268.1624356915906;
        Tue, 22 Jun 2021 03:15:15 -0700 (PDT)
Received: from localhost ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id o203sm1999307wmo.36.2021.06.22.03.15.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 03:15:15 -0700 (PDT)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        quanyang.wang@windriver.com
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH v3] clk: zynqmp: fix compile testing without ZYNQMP_FIRMWARE
Date:   Tue, 22 Jun 2021 12:15:11 +0200
Message-Id: <f1c4e8c903fe2d5df5413421920a56890a46387a.1624356908.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When the firmware code is disabled, the incomplete error handling
in the clk driver causes compile-time warnings:

drivers/clk/zynqmp/pll.c: In function 'zynqmp_pll_recalc_rate':
drivers/clk/zynqmp/pll.c:147:29: error: 'fbdiv' is used uninitialized [-Werror=uninitialized]
  147 |         rate =  parent_rate * fbdiv;
      |                 ~~~~~~~~~~~~^~~~~~~
In function 'zynqmp_pll_get_mode',
    inlined from 'zynqmp_pll_recalc_rate' at drivers/clk/zynqmp/pll.c:148:6:
drivers/clk/zynqmp/pll.c:61:27: error: 'ret_payload' is used uninitialized [-Werror=uninitialized]
   61 |         return ret_payload[1];
      |                ~~~~~~~~~~~^~~
drivers/clk/zynqmp/pll.c: In function 'zynqmp_pll_recalc_rate':
drivers/clk/zynqmp/pll.c:53:13: note: 'ret_payload' declared here
   53 |         u32 ret_payload[PAYLOAD_ARG_CNT];
      |             ^~~~~~~~~~~
drivers/clk/zynqmp/clk-mux-zynqmp.c: In function 'zynqmp_clk_mux_get_parent':
drivers/clk/zynqmp/clk-mux-zynqmp.c:57:16: error: 'val' is used uninitialized [-Werror=uninitialized]
   57 |         return val;
      |                ^~~

As it was apparently intentional to support this for compile testing
purposes, change the code to have just enough error handling for the
compiler to not notice the remaining bugs.

Fixes: 21f237534661 ("clk: zynqmp: Drop dependency on ARCH_ZYNQMP")
Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v3:
- Also check PLL_MODE_ERROR return in zynqmp_pll_recalc_rate() - reported
  by Quanyang
- Change Arnd's authorhip based on our discussing at
https://lore.kernel.org/r/CAK8P3a1twOhC8DFxpLxpk8bcy0+JfGZUSE9bX4tdMetVLGTcSQ@mail.gmail.com

Changes in v2:
Based on discussion here
Link: https://lore.kernel.org/r/20210421134844.3297838-1-arnd@kernel.org
I have updated error return value which I got from clock core based on
error cases.

zynqmp_clk_mux_get_parent() should return num_parents() as error defined in
clk_core_get_parent_by_index() where num_parents is incorrect index.

Extend zynqmp_pll_get_mode() with PLL_MODE_ERROR to handle error case.

zynqmp_pll_recalc_rate() returns 0 because __clk_core_init() consider 0 as
default rate. But maybe -1ul which was used by Arnd is also good option.

---
 drivers/clk/zynqmp/clk-mux-zynqmp.c | 10 ++++++++--
 drivers/clk/zynqmp/pll.c            | 22 ++++++++++++++++------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 06194149be83..d576c900dee0 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -38,7 +38,7 @@ struct zynqmp_clk_mux {
  * zynqmp_clk_mux_get_parent() - Get parent of clock
  * @hw:		handle between common and hardware-specific interfaces
  *
- * Return: Parent index
+ * Return: Parent index on success or number of parents in case of error
  */
 static u8 zynqmp_clk_mux_get_parent(struct clk_hw *hw)
 {
@@ -50,9 +50,15 @@ static u8 zynqmp_clk_mux_get_parent(struct clk_hw *hw)
 
 	ret = zynqmp_pm_clock_getparent(clk_id, &val);
 
-	if (ret)
+	if (ret) {
 		pr_warn_once("%s() getparent failed for clock: %s, ret = %d\n",
 			     __func__, clk_name, ret);
+		/*
+		 * clk_core_get_parent_by_index() takes num_parents as incorrect
+		 * index which is exactly what I want to return here
+		 */
+		return clk_hw_get_num_parents(hw);
+	}
 
 	return val;
 }
diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index abe6afbf3407..e025581f0d54 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -31,8 +31,9 @@ struct zynqmp_pll {
 #define PS_PLL_VCO_MAX 3000000000UL
 
 enum pll_mode {
-	PLL_MODE_INT,
-	PLL_MODE_FRAC,
+	PLL_MODE_INT = 0,
+	PLL_MODE_FRAC = 1,
+	PLL_MODE_ERROR = 2,
 };
 
 #define FRAC_OFFSET 0x8
@@ -54,9 +55,11 @@ static inline enum pll_mode zynqmp_pll_get_mode(struct clk_hw *hw)
 	int ret;
 
 	ret = zynqmp_pm_get_pll_frac_mode(clk_id, ret_payload);
-	if (ret)
+	if (ret) {
 		pr_warn_once("%s() PLL get frac mode failed for %s, ret = %d\n",
 			     __func__, clk_name, ret);
+		return PLL_MODE_ERROR;
+	}
 
 	return ret_payload[1];
 }
@@ -126,7 +129,7 @@ static long zynqmp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
  * @hw:			Handle between common and hardware-specific interfaces
  * @parent_rate:	Clock frequency of parent clock
  *
- * Return: Current clock frequency
+ * Return: Current clock frequency or 0 in case of error
  */
 static unsigned long zynqmp_pll_recalc_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
@@ -138,14 +141,21 @@ static unsigned long zynqmp_pll_recalc_rate(struct clk_hw *hw,
 	unsigned long rate, frac;
 	u32 ret_payload[PAYLOAD_ARG_CNT];
 	int ret;
+	enum pll_mode mode;
 
 	ret = zynqmp_pm_clock_getdivider(clk_id, &fbdiv);
-	if (ret)
+	if (ret) {
 		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
 			     __func__, clk_name, ret);
+		return 0ul;
+	}
+
+	mode = zynqmp_pll_get_mode(hw);
+	if (mode == PLL_MODE_ERROR)
+		return 0ul;
 
 	rate =  parent_rate * fbdiv;
-	if (zynqmp_pll_get_mode(hw) == PLL_MODE_FRAC) {
+	if (mode == PLL_MODE_FRAC) {
 		zynqmp_pm_get_pll_frac_data(clk_id, ret_payload);
 		data = ret_payload[1];
 		frac = (parent_rate * data) / FRAC_DIV;
-- 
2.32.0

