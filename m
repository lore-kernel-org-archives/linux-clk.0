Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF1C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6302081C
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rjj9veCX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B6302081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbeLDTs0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:48:26 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36615 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbeLDTs0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:48:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so16079452ljk.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sc8MvtQxCmVpiClgDNU/2M1d/NPNsLLlA1tVvSdzAag=;
        b=rjj9veCXkRUrVeqNHxRo34F/aPmBy/We/ZCRXteBPUmtYl1UNztwCqLO2mzdzBSw3D
         9fZCCbRHvRPzpTz9IpLJnYSGjsZ853cWBvQmEVBAgqWcb8820v0NczssMntnP5MJ1dwF
         E2FFizQtMEm9XC2/ViehOY2mTkL01KeZ+CNAUFxgCsz1MSyQBGkn1Fp2MBteFVG83Ork
         jgWwSrq7c+6gFiwI5MjBLMSGwlViBW7INluY0ql3xyrmMRKtnYZb9Sj3xWOLjHzUMgHq
         S+Gk8gA0AhBt44mjRtQcRyqHpYQsw2UE++lnfWBUaY7+EnnGKV+alOWgA6gDpOlVptdW
         C8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=sc8MvtQxCmVpiClgDNU/2M1d/NPNsLLlA1tVvSdzAag=;
        b=QZX3vLvR938XM7a5C+wlxTsJYLSrRyK7xmNUjBhiZDEOu9tIhUpnh2dcU+nKmJgruK
         WzWSRJgQ25Jj4bdTvy+NlEi73xcPWy4NYV8kMBrM4hsWPKtgE5ocTIgMxBiGnMJTDpG+
         bU4shSwO+vN5DYan1Bg2S418aEkVOoNbUnCJto2xgOx6wtV8OQYtw4uFLzNu/FDyOaYQ
         h0YsarcbGU4K3OLC3iupiqscpi4sPNpTt9DvH6NYrRsEQXA3N1xVMzs5zXsf8dKnVSPz
         Qgih6aawIjsw1CSsntL7NsuHgTNDdaCTEa83zNp4OmLUuXx6CDfKyHPNH5/zO0/LaXXu
         fw7w==
X-Gm-Message-State: AA+aEWag+v9wiI7bMnehmHhRNBqVJpAmlXwtiFl7mtaUup6sc15E7M4e
        sIGN/UNZ9Cw5lRsJz78n8EwAHSosKeU=
X-Google-Smtp-Source: AFSGD/VDbw7BWIUxmITAeKl8Pc+RNZ5enmRmpe1xQwH9PkFIyWq1MdbhCksO2yaRH8p0DYRLHFtmbw==
X-Received: by 2002:a2e:9107:: with SMTP id m7-v6mr13831958ljg.23.1543952903309;
        Tue, 04 Dec 2018 11:48:23 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.250])
        by smtp.gmail.com with ESMTPSA id u15-v6sm3595917lja.63.2018.12.04.11.48.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 11:48:22 -0800 (PST)
Subject: [PATCH v2 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
Date:   Tue, 4 Dec 2018 22:48:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's quite often repeated sequence of a CPG register read-modify-write,
so it seems worth factoring it out into a function -- this saves 68 bytes
of the object code (AArch64 gcc 4.8.5) and simplifies protecting all such
sequences with a spinlock in the next patch...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- moved the readl() call from the initializer in cpg_reg_modify();
- adjusted the patch description.

 drivers/clk/renesas/rcar-gen3-cpg.c |   38 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,6 +30,16 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	u32 val;
+
+	val = readl(reg);
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+};
+
 struct cpg_simple_notifier {
 	struct notifier_block nb;
 	void __iomem *reg;
@@ -118,7 +128,6 @@ static int cpg_z_clk_set_rate(struct clk
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int mult;
 	unsigned int i;
-	u32 val, kick;
 
 	/* Factor of 2 is for fixed divider */
 	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * 2, parent_rate);
@@ -127,17 +136,14 @@ static int cpg_z_clk_set_rate(struct clk
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	val = readl(zclk->reg) & ~zclk->mask;
-	val |= ((32 - mult) << __ffs(zclk->mask)) & zclk->mask;
-	writel(val, zclk->reg);
+	cpg_reg_modify(zclk->reg, zclk->mask,
+		       ((32 - mult) << __ffs(zclk->mask)) & zclk->mask);
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
 	 * clock change completion.
 	 */
-	kick = readl(zclk->kick_reg);
-	kick |= CPG_FRQCRB_KICK;
-	writel(kick, zclk->kick_reg);
+	cpg_reg_modify(zclk->kick_reg, 0, CPG_FRQCRB_KICK);
 
 	/*
 	 * Note: There is no HW information about the worst case latency.
@@ -262,12 +268,10 @@ static const struct sd_div_table cpg_sd_
 static int cpg_sd_clock_enable(struct clk_hw *hw)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	u32 val = readl(clock->csn.reg);
-
-	val &= ~(CPG_SD_STP_MASK);
-	val |= clock->div_table[clock->cur_div_idx].val & CPG_SD_STP_MASK;
 
-	writel(val, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
+		       clock->div_table[clock->cur_div_idx].val &
+		       CPG_SD_STP_MASK);
 
 	return 0;
 }
@@ -276,7 +280,7 @@ static void cpg_sd_clock_disable(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	writel(readl(clock->csn.reg) | CPG_SD_STP_MASK, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
@@ -323,7 +327,6 @@ static int cpg_sd_clock_set_rate(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
-	u32 val;
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
@@ -335,10 +338,9 @@ static int cpg_sd_clock_set_rate(struct
 
 	clock->cur_div_idx = i;
 
-	val = readl(clock->csn.reg);
-	val &= ~(CPG_SD_STP_MASK | CPG_SD_FC_MASK);
-	val |= clock->div_table[i].val & (CPG_SD_STP_MASK | CPG_SD_FC_MASK);
-	writel(val, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
+		       clock->div_table[i].val &
+		       (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
 
 	return 0;
 }
