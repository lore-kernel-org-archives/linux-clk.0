Return-Path: <SRS0=o4d4=OB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9BEC43441
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44DAC20824
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:41:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Vi15tN1z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44DAC20824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729237AbeKWFWe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 00:22:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36385 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbeKWFWe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 00:22:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id a16so7137595lfg.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Nov 2018 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ocOAVnsg5OG7IopN4hagdptj2GRehmLrdQj00Gve9jg=;
        b=Vi15tN1ziWiVxfQKgYJ1UnrbQH5/93DtmIeZtAlxEPQ4UVvVuaM7ZQpTh8PQZoP9kY
         cXhHu1bJNLsdT1kaW8/JGd6mX7QEFCjrcwKkhtGl/UK0+G3UuT1IPWwazcBCxmHnBm7b
         cdu2AZZhAEOdWoLJACHf9bmMeSGfOItlHm3eG+a15xILo4kVRDiKyA/gojh0Xr66fzEU
         uAEw+mhIS9huAvlL1EMsnhfwxL7mOmUlsT0Q8p2y0ZrG2U7JCe5CQDQiRbUui9orx2tN
         QpS0IVbZNU/UshYygxpUYh7+1PYkNksQFnY3vCgsvmCDJQiJep3yI1ZzqDmuygsTK+x+
         U5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ocOAVnsg5OG7IopN4hagdptj2GRehmLrdQj00Gve9jg=;
        b=sb6BCCaM5El7DO09/z0mU/HQSfxk+WUjhTRCOtk/jyRASaOjrB+LOMWsWC2MkjghUL
         91keJBM6lMMyfM2Af76zwOfHYgxvBqRC0k7mAtp9rRpOiN+XK74syYy3ENtBg85b4DlI
         Mg9cyVjzWc3PIr6VDMxnudn9gO7fMyEYdRI4He3B+0XbzhEgI4zVZ3/AQsxDwjLqQPFh
         2Phx4HZd6UUOcgdls8xjj0NSKBPub9dwsGPHcNgGma7O1Qqy6FmsoWJNdkgWb0URcpTH
         QD1IVhMNYQGcCdVFsNGU3k4P7FekdlsT+J1hBOMhtduQqzuHifnVBC2r1/WV+Z+MJsM0
         kiiw==
X-Gm-Message-State: AGRZ1gLU5aHEioafy/SCY6WLgYDD9SISYq+0Zc3G5tJihE8Vh3TStzM3
        ozX3fVqslkZ/zSPraXPMOxDbZX9vzSM=
X-Google-Smtp-Source: AJdET5dR10L7SYBKISYnM9x6XmoSK7FiD0FCAiAyfAdCZAVdr5DZLEJh/6foagQPrCVtYg7aUOCqYA==
X-Received: by 2002:a19:2c92:: with SMTP id s140mr6913802lfs.42.1542912115715;
        Thu, 22 Nov 2018 10:41:55 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.10])
        by smtp.gmail.com with ESMTPSA id 15-v6sm3431890lje.18.2018.11.22.10.41.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 10:41:55 -0800 (PST)
Subject: [PATCH 2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com>
Date:   Thu, 22 Nov 2018 21:41:54 +0300
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

Add the RPC clock for the R-Car gen3 SoCs -- this clock is controlled by
the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |  118 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |    2 
 2 files changed, 120 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -409,6 +409,121 @@ free_clock:
 	return clk;
 }
 
+#define CPG_RPC_CKSTP2		BIT(9)
+#define CPG_RPC_CKSTP		BIT(8)
+#define CPG_RPC_DIV_4_3_MASK	GENMASK(4, 3)
+#define CPG_RPC_DIV_2_0_MASK	GENMASK(2, 0)
+
+struct rpc_clock {
+	struct clk_hw hw;
+	void __iomem *reg;
+};
+
+#define to_rpc_clock(_hw) container_of(_hw, struct rpc_clock, hw)
+
+static int cpg_rpc_clock_enable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_CKSTP, 0);
+
+	return 0;
+}
+
+static void cpg_rpc_clock_disable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP);
+}
+
+static int cpg_rpc_clock_is_enabled(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	return !(readl(clock->reg) & CPG_RPC_CKSTP);
+}
+
+static unsigned long cpg_rpc_clock_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	u32 div = (readl(clock->reg) & CPG_RPC_DIV_2_0_MASK) + 1;
+
+	return DIV_ROUND_CLOSEST(parent_rate, div);
+}
+
+static unsigned int cpg_rpc_clock_calc_div(struct rpc_clock *clock,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	unsigned int div;
+
+	if (!rate)
+		rate = 1;
+
+	div = ALIGN(DIV_ROUND_CLOSEST(parent_rate, rate), 2);
+
+	return clamp_t(unsigned int, div, 2, 8);
+}
+
+static long cpg_rpc_clock_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	unsigned int div = cpg_rpc_clock_calc_div(clock, rate, *parent_rate);
+
+	return DIV_ROUND_CLOSEST(*parent_rate, div);
+}
+
+static int cpg_rpc_clock_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	unsigned int div = cpg_rpc_clock_calc_div(clock, rate, parent_rate);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_DIV_2_0_MASK, div - 1);
+
+	return 0;
+}
+
+static const struct clk_ops cpg_rpc_clock_ops = {
+	.enable = cpg_rpc_clock_enable,
+	.disable = cpg_rpc_clock_disable,
+	.is_enabled = cpg_rpc_clock_is_enabled,
+	.recalc_rate = cpg_rpc_clock_recalc_rate,
+	.round_rate = cpg_rpc_clock_round_rate,
+	.set_rate = cpg_rpc_clock_set_rate,
+};
+
+static struct clk * __init cpg_rpc_clk_register(const struct cpg_core_clk *core,
+						void __iomem *base,
+						const char *parent_name)
+{
+	struct clk_init_data init;
+	struct rpc_clock *clock;
+	struct clk *clk;
+
+	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
+	if (!clock)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &cpg_rpc_clock_ops;
+	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->reg = base + CPG_RPCCKCR;
+	clock->hw.init = &init;
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		kfree(clock);
+
+	return clk;
+}
+
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
@@ -583,6 +698,9 @@ struct clk * __init rcar_gen3_cpg_clk_re
 		}
 		break;
 
+	case CLK_TYPE_GEN3_RPC:
+		return cpg_rpc_clk_register(core, base, __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -23,6 +23,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
+	CLK_TYPE_GEN3_RPC,
 
 	/* SoC specific definitions start here */
 	CLK_TYPE_GEN3_SOC_BASE,
@@ -57,6 +58,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_RPCCKCR	0x238
 #define CPG_RCKCR	0x240
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
