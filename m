Return-Path: <SRS0=o4d4=OB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62CEC43441
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DE9920824
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="aPijYIih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE9920824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbeKWFUW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 00:20:22 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38567 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbeKWFUW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 00:20:22 -0500
Received: by mail-lf1-f66.google.com with SMTP id p86so7150164lfg.5
        for <linux-clk@vger.kernel.org>; Thu, 22 Nov 2018 10:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KG0pP74NvsqMG6H+tGCfruA/yxmbUS9d4iBkyYnv338=;
        b=aPijYIih+hHyuRLbkc7/bT+XR5Z/15Vj8e1UEbLdweNQAi8Sn4THiHZsYKcqoZvPK7
         tZfpNqcWHntx5wiyQ41hOzLPYISPKa270G9ui14lwFN52n+BbzL/HAJHBSVhUQxWiZcR
         XKyhcSh8AOPNBm5aXdOXjEDToNRY7eHE6newTFOIvDMhXiyHVSImWuc3B1A3SRxDexNm
         2Z+8D2hFtWDxWYk2eiv1VfMqL9DEL5R72xDgloqAMhV5d2aXt1QtpWbuwib4Qx7/138L
         dmHhJwYrl5HbX/7sm3mBMJvQAKUPlIbdkI009kkjCyBnj0znvTiqqpECYwkALYFHDer/
         QBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KG0pP74NvsqMG6H+tGCfruA/yxmbUS9d4iBkyYnv338=;
        b=IJdGPsqvySs0AHWizoCcKeFfq0c+vy0tzrBWnHh/e4uQaUYbdC/qfdRLY/i9Aih33E
         JCv/X29kOxZ2dXL4o0R4HJFJJ+fun3JfiB7Uin3hMxsXyV+OAEsyTCQFidAMYvXhDEN6
         +LEEQFiAZMaLFqFf0jsSNN4xe3xRre+xIlr3yu2lUFhLrlHcG5fOyQ8XkuETpCO9KOJc
         NHSvZjJiNjO/dx4jxhTxAFZggVJPbDrb4HinttwgFvZN+xYyEE+P0UX3hPfyrEUkCs/1
         yUax8QNMG08DZ7Iiu1fbdaCApYeTB6QwafT7OxL1G5LsNdb2C0/VP/q+LuxEl+5ZzIFm
         n9nQ==
X-Gm-Message-State: AGRZ1gLioparUoj0YITMWgZAYs7uS+UjbAfTYt+77FwcFGfDR6/78YAr
        RVwk8+hnhrFN9D9BB/YmnLGbxbakaAw=
X-Google-Smtp-Source: AJdET5eu5S9qsDaJcyttRilaA1aU9IhBMcXIC6coh9AKU21kJzkiGDzBrn5O6nXAkJwoOpSE+l7e1w==
X-Received: by 2002:a19:9904:: with SMTP id b4mr6917604lfe.95.1542911984418;
        Thu, 22 Nov 2018 10:39:44 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.10])
        by smtp.gmail.com with ESMTPSA id f20-v6sm4294792ljk.33.2018.11.22.10.39.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 10:39:43 -0800 (PST)
Subject: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
Date:   Thu, 22 Nov 2018 21:39:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's quite often repeated sequence of a CPG register read-modify-write,
so it seems worth factoring it out into a function -- this saves 68 bytes
of the object code already (AArch64 gcc 4.8.5) and will save more with the
next patches...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |   37 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,6 +30,15 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	u32 val = readl(reg);
+
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+};
+
 struct cpg_simple_notifier {
 	struct notifier_block nb;
 	void __iomem *reg;
@@ -118,7 +127,6 @@ static int cpg_z_clk_set_rate(struct clk
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int mult;
 	unsigned int i;
-	u32 val, kick;
 
 	/* Factor of 2 is for fixed divider */
 	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * 2, parent_rate);
@@ -127,17 +135,14 @@ static int cpg_z_clk_set_rate(struct clk
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
@@ -262,12 +267,10 @@ static const struct sd_div_table cpg_sd_
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
@@ -276,7 +279,7 @@ static void cpg_sd_clock_disable(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	writel(readl(clock->csn.reg) | CPG_SD_STP_MASK, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
@@ -323,7 +326,6 @@ static int cpg_sd_clock_set_rate(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
-	u32 val;
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
@@ -335,10 +337,9 @@ static int cpg_sd_clock_set_rate(struct
 
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
