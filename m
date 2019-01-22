Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BEBC41518
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA68821841
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="hssDkxBF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfAVT7k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:59:40 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43767 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfAVT7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 14:59:40 -0500
Received: by mail-lj1-f195.google.com with SMTP id q2-v6so21778471lji.10
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jx3qFbaEtJXxaHPqMOOSkAqfrMwSN13MlLYOuyS4TfE=;
        b=hssDkxBFqKL5R9hiffdUyZMect8HDLjopWFtwF1DUkiqcxw4WHianKsdqsPlIPGjsH
         N3kle69kkydJ+VEgafJPsUEavecZbmhS7YJ45piX2a5fbxuXDdeUvGGCraH1OQdXDyNi
         HrUUfgrCMcF6nPWnaQXESlhiNXoYCzQNYtJOdfOFXelXzv/uCylqYh9I2bnj2TO6rj4q
         H+2GQ6tgxtkJrEv1czgC4ygtM+3Neksd8h0nXDyIh5CvVGPU6rTwM3giy4lTL0PGCwvb
         xbtttEldWkzZSILsx8dOkEzuQsd1PFdXWSVdE9npvY/v6x/buhWYp5YAfUbPEPxNS6Jk
         5ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jx3qFbaEtJXxaHPqMOOSkAqfrMwSN13MlLYOuyS4TfE=;
        b=owbItsuSLUSWp6hNcuZXZC8pmyseeiO+tOorh6o+ox214Dmp7irCq7A/IHxW5RIjMD
         0zq37vNTm6Qsl0Z0N0GoWjysLudvhNupPBJaAdJQbb7Y/B5R8w0ItOLzTJUWmif0FmTv
         igKqZIa7fDfoM3ADvpo9GlXUZUUEoh8152NaRxjNmSp4zuSguBe1ybtA32JTEboTxyFS
         a3CZltVmZjn2pcbQqvXmvvr5mc4JhgXEZnA+RUPLlDXJzrVQqnTgzoBG3IT3CPd7vY2f
         Xsi4ux53kvFkePKDk5TTJVwoM3NuKdktFKwvEL527yhQ/QrbAM3C4jNa9Hsi+oLAI1TX
         oDsw==
X-Gm-Message-State: AJcUukcD4FUHnDQALZS6pJdf82ZzyyPJDi0GjdGO4F0Ni4Aw2s02wgdq
        TWWlzbjGqr3owM5m8sd0XBpa3/0y40w=
X-Google-Smtp-Source: ALg8bN7JuJ98H3l2gVPzjRqiYfuJ+6uMbQ9doV4UKEo7PptakIOFJYJfl8PqM4obxfnG3/EVjt7zLg==
X-Received: by 2002:a2e:3218:: with SMTP id y24-v6mr6113870ljy.157.1548187177598;
        Tue, 22 Jan 2019 11:59:37 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.82.69])
        by smtp.gmail.com with ESMTPSA id z2-v6sm148323ljk.50.2019.01.22.11.59.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jan 2019 11:59:36 -0800 (PST)
Subject: [PATCH v3 3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5c5dbf41-16a9-9d1a-8a29-997906696045@cogentembedded.com>
Date:   Tue, 22 Jan 2019 22:59:35 +0300
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

The RPCSRC internal clock is controlled by the RPCCKCR.DIV[4:3] on all
the R-Car gen3 SoCs except V3M (R8A77970) but the encoding of this field
is different between SoCs; it makes sense to support the most common case
of this encoding in the R-Car gen3 CPG driver...

After adding the RPCSRC clock, we can add the RPC[D2] clocks derived from
it and controlled by the RPCCKCR register on all the R-Car gen3 SoCs except
V3M (R8A77970); the composite clock driver seems handy for this task, using
the spinlock added in the previous patch...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- added 'struct rpcd2_clock' embracing both 'struct clk_fixed_factor' and
  'struct clk_gate' to reduce the # of kzalloc() calls;
- added a comment about the single notifier to 'struct rpc_clock';
- refreshed the patch.

Changes in version 2:
- merged in the RPCD2 clock support from the next patch;
- moved in the RPCSRC clock support from the R8A77980 CPG/MSSR driver patch;
- switched the RPC and RPCSD2 clock support to the composite clock driver;
- changed the 1st parameter of cpg_rpc[d2]_clk_register();
- rewrote the patch description, renamed the patch.

 drivers/clk/renesas/rcar-gen3-cpg.c |   99 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |    4 +
 2 files changed, 103 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -422,6 +422,90 @@ free_clock:
 	return clk;
 }
 
+struct rpc_clock {
+	struct clk_divider div;
+	struct clk_gate gate;
+	/*
+	 * One notifier covers both RPC and RPCD2 clocks as they are both
+	 * controlled by the same RPCCKCR register...
+	 */
+	struct cpg_simple_notifier csn;
+};
+
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 2, 5 }, { 3, 6 }, { 0, 0 },
+};
+
+static const struct clk_div_table cpg_rpc_div_table[] = {
+	{ 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
+};
+
+static struct clk * __init cpg_rpc_clk_register(const char *name,
+	void __iomem *base, const char *parent_name,
+	struct raw_notifier_head *notifiers)
+{
+	struct rpc_clock *rpc;
+	struct clk *clk;
+
+	rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
+	if (!rpc)
+		return ERR_PTR(-ENOMEM);
+
+	rpc->div.reg = base + CPG_RPCCKCR;
+	rpc->div.width = 3;
+	rpc->div.table = cpg_rpc_div_table;
+	rpc->div.lock = &cpg_lock;
+
+	rpc->gate.reg = base + CPG_RPCCKCR;
+	rpc->gate.bit_idx = 8;
+	rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
+	rpc->gate.lock = &cpg_lock;
+
+	rpc->csn.reg = base + CPG_RPCCKCR;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &rpc->div.hw,  &clk_divider_ops,
+				     &rpc->gate.hw, &clk_gate_ops, 0);
+	if (IS_ERR(clk))
+		kfree(rpc);
+
+	cpg_simple_notifier_register(notifiers, &rpc->csn);
+	return clk;
+}
+
+struct rpc2_clock {
+	struct clk_fixed_factor fixed;
+	struct clk_gate gate;
+};
+
+static struct clk * __init cpg_rpcd2_clk_register(const char *name,
+						  void __iomem *base,
+						  const char *parent_name)
+{
+	struct rpc2_clock *rpc2;
+	struct clk *clk;
+
+	rpc2 = kzalloc(sizeof(*rpc2), GFP_KERNEL);
+	if (!rpc2)
+		return ERR_PTR(-ENOMEM);
+
+	rpc2->fixed.mult = 1;
+	rpc2->fixed.div = 2;
+
+	rpc2->gate.reg = base + CPG_RPCCKCR;
+	rpc2->gate.bit_idx = 9;
+	rpc2->gate.flags = CLK_GATE_SET_TO_DISABLE;
+	rpc2->gate.lock = &cpg_lock;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &rpc2->fixed.hw, &clk_fixed_factor_ops,
+				     &rpc2->gate.hw, &clk_gate_ops, 0);
+	if (IS_ERR(clk))
+		kfree(rpc2);
+
+	return clk;
+}
+
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
@@ -600,6 +684,21 @@ struct clk * __init rcar_gen3_cpg_clk_re
 		}
 		break;
 
+	case CLK_TYPE_GEN3_RPCSRC:
+		return clk_register_divider_table(NULL, core->name,
+						  __clk_get_name(parent), 0,
+						  base + CPG_RPCCKCR, 3, 2, 0,
+						  cpg_rpcsrc_div_table,
+						  &cpg_lock);
+
+	case CLK_TYPE_GEN3_RPC:
+		return cpg_rpc_clk_register(core->name, base,
+					    __clk_get_name(parent), notifiers);
+
+	case CLK_TYPE_GEN3_RPCD2:
+		return cpg_rpcd2_clk_register(core->name, base,
+					      __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -23,6 +23,9 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
+	CLK_TYPE_GEN3_RPCSRC,
+	CLK_TYPE_GEN3_RPC,
+	CLK_TYPE_GEN3_RPCD2,
 
 	/* SoC specific definitions start here */
 	CLK_TYPE_GEN3_SOC_BASE,
@@ -57,6 +60,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_RPCCKCR	0x238
 #define CPG_RCKCR	0x240
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,

