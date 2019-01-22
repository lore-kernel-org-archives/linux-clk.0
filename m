Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF414C282C5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EFAA2084A
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="JN3V1nIT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfAVT5n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:57:43 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39357 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfAVT5n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 14:57:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so21768890ljh.6
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 11:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y5pD8IiGs3MGHd/hieqN/F+NJHTyJgePEHoUTjzBTFY=;
        b=JN3V1nIT8+QXSF09xw/u75brDWFUYn65iZ8LRHf6efZNjTCndk+eKQ8khHhIzXrrzc
         cistc6NBaeSMasq0PAad4rW49F++iNTqEafXy8TW469bBNRJUKOYAM0C4tN8BwOEmcec
         CGA3ASZ9nx2gHX6s9TvU4/OWI96+gmKSIjyx/Z7O6pUhfoszRHXtM3XZKd9MCeQ82OaN
         +ChlT+N6Kft4H2s+B+lLLEul1jVJuLbw+pEGliWxaFiCQQVM1CD49YQ1syjEaSM6wfFm
         M1m68/aQP/SI84zfnd4AAy4Y2aZXjl3Kv9kay+tlNOX6Ku5FGETLq15OoPp+Oij0+hyi
         InoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y5pD8IiGs3MGHd/hieqN/F+NJHTyJgePEHoUTjzBTFY=;
        b=l8f6IlwV1svJR8u2/tNX5HEeKLh/61yxN8QO+/VQnXM0nf9536XsQh5+k7stkiPijS
         OrInr/oB9ZeSHX+S+8lAdW9/Zkd2XUYTgfxbwT9GkE1lVct/YEEUCkhEmUZRKF/QpKD9
         lKeVYFmP2TUciCG8P5CpwURJgezMIsoIycun1H5tHT6p5QeWKZEjaQ7G4CcNgiuWnEXx
         fKOlUc1RUtLFu3CelbhTmKU87+s6h8Moii4Ch9OgqDcsIhluYHgnYqEWzV5xjk8BmETp
         33gz6rRa9udIko5mfU4jLYRoDZlaAjJfDJj3W2prvFvZIpuOEsy5sok4B9ZJtWadd+xI
         OX1g==
X-Gm-Message-State: AJcUukfUWjpzHef6JnoASxSThfqGXcYaoubRXvkEEmaDY6b4BgyLPu1G
        rgfFvtJsJtaLDExGXihbZOMmcXjXyIc=
X-Google-Smtp-Source: ALg8bN5XJtshftwEDXSVFyBk3gLXsVOjty93l0wMCG+VkX5D8hhA6fb3lQoZHkwCu2DfNTl8S3Fy+Q==
X-Received: by 2002:a2e:83d7:: with SMTP id s23-v6mr23760996ljh.139.1548187059902;
        Tue, 22 Jan 2019 11:57:39 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.82.69])
        by smtp.gmail.com with ESMTPSA id k20sm150788lfe.3.2019.01.22.11.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jan 2019 11:57:39 -0800 (PST)
Subject: [PATCH v3 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c59058e2-cfa5-386b-7a1a-d5b309a10144@cogentembedded.com>
Date:   Tue, 22 Jan 2019 22:57:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- refreshed the patch;
- added Geert's tag.

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
@@ -266,12 +272,10 @@ static const struct sd_div_table cpg_sd_
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
@@ -280,7 +284,7 @@ static void cpg_sd_clock_disable(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	writel(readl(clock->csn.reg) | CPG_SD_STP_MASK, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
@@ -327,7 +331,6 @@ static int cpg_sd_clock_set_rate(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
-	u32 val;
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
@@ -339,10 +342,9 @@ static int cpg_sd_clock_set_rate(struct
 
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
