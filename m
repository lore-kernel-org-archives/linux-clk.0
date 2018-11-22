Return-Path: <SRS0=o4d4=OB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0280FC43441
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA1BA20824
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="YLuo/Z2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA1BA20824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbeKWFZz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 00:25:55 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38907 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730435AbeKWFZz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 00:25:55 -0500
Received: by mail-lf1-f67.google.com with SMTP id p86so7158567lfg.5
        for <linux-clk@vger.kernel.org>; Thu, 22 Nov 2018 10:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lHRF8JiSotw7gOHMdQXBqjt0AcHczXZE9GdHmpsn0SI=;
        b=YLuo/Z2pjhVelarUAAAbL/9XxaS3N8WCZr5szOrfZa4OtvzlEz/0GAOM+3Qf+dhYBy
         +BfxF/jca7+fZyIZstqlFhvIcO0R99EVvQ2iOIg4iohbbnTNKCIBua74dp6AZ5C0L+mz
         aKMdv1cCAX6bRJ0e49tq4aW1Ax6EmkbN0+yfE/hEszjhIJrq+tWSDiMiImvffl8uNLZ/
         itRs/EYg647njN0vnfsq/dmwAeoRVkvrC985BTSuiXm0XYM4oxShRfJtkgIIi3l+qWBp
         D9IUVY2K/ZRS5ixz88ip9fHYpO8uSaRn/dCLGTPh4eSUQ/Z7EA+8Lxl+xgoKsx+8YexI
         Xihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lHRF8JiSotw7gOHMdQXBqjt0AcHczXZE9GdHmpsn0SI=;
        b=NVFwCuXtyrcdIdQoygSL/KuthhAdXllpnlWeQ9pPP2MyiM99nwn44WkMLiyqhZt390
         LCcpZjAPmOXust25qkIFPegGWrIeQSKNHqZrPTV/4n6GD61/7KySRBhGskphzpuRtG/V
         qdfbKvPk+bkRl7ue+MtL5UKoI7Cq/R3JkBqyNbwaOST9BZVQTZpk9V+tq11eXeFCC/RD
         U8xT0dbnK1EkTmVb638D86c+asGR83yMy/Ttvj3aCOglESt9rLHMtKXxA8Ugzif+PyxB
         v5SA46Firm2HUICk7aIzf5YQ0vkfgxpC00doZczDtVBnlqPa19rw2wm6K1+5zBz8AoiU
         T9Aw==
X-Gm-Message-State: AGRZ1gLAw1ahe1Ax4Nn2g+0FauGqiwTn5nqRGRMGEy5LGaKdsXXm1Q7K
        kdEqTzOUzjv/k2tSz6hMVcOIMVrjLrM=
X-Google-Smtp-Source: AJdET5cY+/c5HL7+2OqELiCp/7fLLd9pZvHI8O84Y4feVn8q5UadoNB+T62kq/uho1OOCpU1UjFkng==
X-Received: by 2002:a19:10da:: with SMTP id 87mr7107060lfq.60.1542912316114;
        Thu, 22 Nov 2018 10:45:16 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.10])
        by smtp.gmail.com with ESMTPSA id d23sm7223882lfc.11.2018.11.22.10.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 10:45:15 -0800 (PST)
Subject: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com>
Date:   Thu, 22 Nov 2018 21:45:14 +0300
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

Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
but the encoding of this field is different between SoCs.

Add the RPC[D2] clocks (derived from this internal clock) and the RPC-IF
module clock as well...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/r8a77980-cpg-mssr.c |   40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

Index: renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -10,6 +10,7 @@
  * Copyright (C) 2015 Glider bvba
  */
 
+#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -21,6 +22,10 @@
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen3-cpg.h"
 
+enum r8a77980_clk_types {
+	CLK_TYPE_R8A77980_RPCSRC = CLK_TYPE_GEN3_SOC_BASE,
+};
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R8A77980_CLK_OSC,
@@ -41,12 +46,17 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_OCO,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
 };
 
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 2, 5 }, { 3, 6 }, { 0, 0 },
+};
+
 static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -65,8 +75,14 @@ static const struct cpg_core_clk r8a7798
 	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,	   CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_R8A77980_RPCSRC, CLK_PLL1),
 	DEF_RATE(".oco",	CLK_OCO,           32768),
 
+	DEF_BASE("rpc",		R8A77980_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77980_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77980_CLK_RPC),
+
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",	R8A77980_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
@@ -164,6 +180,7 @@ static const struct mssr_mod_clk r8a7798
 	DEF_MOD("gpio1",		 911,	R8A77980_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77980_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77980_CLK_S3D2),
+	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPC),
 	DEF_MOD("i2c4",			 927,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A77980_CLK_S3D2),
@@ -215,6 +232,27 @@ static int __init r8a77980_cpg_mssr_init
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
+static struct clk * __init r8a77980_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	if (core->type == CLK_TYPE_R8A77980_RPCSRC) {
+		const struct clk *parent = clks[core->parent];
+
+		if (IS_ERR(parent))
+			return ERR_CAST(parent);
+
+		return clk_register_divider_table(NULL, core->name,
+						  __clk_get_name(parent), 0,
+						  base + CPG_RPCCKCR, 3, 2, 0,
+						  cpg_rpcsrc_div_table, NULL);
+	} else	{
+		return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
+						  notifiers);
+	}
+}
+
 const struct cpg_mssr_info r8a77980_cpg_mssr_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r8a77980_core_clks,
@@ -233,5 +271,5 @@ const struct cpg_mssr_info r8a77980_cpg_
 
 	/* Callbacks */
 	.init = r8a77980_cpg_mssr_init,
-	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+	.cpg_clk_register = r8a77980_cpg_clk_register,
 };
