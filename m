Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA01C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:51:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BFB02082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="w8b49uu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BFB02082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbeLDTvm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:51:42 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40281 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbeLDTvm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:51:42 -0500
Received: by mail-lf1-f68.google.com with SMTP id v5so12893574lfe.7
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hk7c181Uq2O4knistJehu6gRFlyCrhXvWdLgm5uv4E0=;
        b=w8b49uu+ZJveRgzAnohYO7mBGZypiM3K0U4NtwcWFfbNbmle02T5/uqJXmEBLfMonR
         PrSDsqsK7APmM+0+w3m7dpQAJUdSIXlg1jjnnsXhCX5ABXnpe68mIRZhcM7r84eNduOI
         BRmfH7tfUn6dWeMjJuR4Bd0lRtBaIuhcDZbuxR4UKJhimoeJRcArEfuj90SMSdvE8TI4
         xqkzJaF7YGlxMbndGZk3tfTCEU9imDjzRFt0YyhXMwGczzFcm+7HALscL9kR6hDRWa6A
         hDWQWljnwOtAsi4uFwI3wwIVb5AuY4mcwFkLDEcgqAdidGC/HuEWVYgn0mJfFKqu5rJ5
         SuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hk7c181Uq2O4knistJehu6gRFlyCrhXvWdLgm5uv4E0=;
        b=qSzYtjI1EWh/ic7BqY4kkDaRxcJMZyhzGMMjPDLhbuXlf5haLSgbqZQJk2D2Z2KP+7
         fW8rzlmsx/S+XZkdmRLDKi8UUBOtFBLvtjmB4xRzUQEXXzGVwxdKDlVZQB+nuXXbFLZf
         0iXx85398Rk3yE4COaXr3ZxhlWnrbntf9qcAOgQ2n7Lsltrhmh2JwDiXnj5I7h0t8g6m
         a0QxabzB4DHo5tyje3VVnX9E33x+XC44+GotGUY8ZTbmbh1iaK1xFxQcar2sV1VY1ZS4
         8LULobiiRu982IUL1lWopx+nUAhI5kOFlbHDj0Gk/o1gwgYIOe5gSrLwtRF1BlLMfGfe
         t7tQ==
X-Gm-Message-State: AA+aEWaLsC0ZYOYSYfCJW8tMVQRjJr/TjqkM18FjJEK99E5O2Zqv1Jvq
        Unhi/xmG7OMqDprNudWbG7+DnseEBPU=
X-Google-Smtp-Source: AFSGD/W/oHtE1WPRL3YhEKj9ALtMAFhpeStwhkopLAsCBlOz8b8zminEit6hOTf88VPZRkXqevdwYg==
X-Received: by 2002:a19:ced3:: with SMTP id e202mr12613146lfg.13.1543953099351;
        Tue, 04 Dec 2018 11:51:39 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.250])
        by smtp.gmail.com with ESMTPSA id s3-v6sm3355300lje.73.2018.12.04.11.51.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 11:51:38 -0800 (PST)
Subject: [PATCH v2 3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <29eba2fe-942a-6b71-afc1-e30ac603f162@cogentembedded.com>
Date:   Tue, 4 Dec 2018 22:51:37 +0300
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
@@ -415,6 +415,90 @@ free_clock:
 	return clk;
 }
 
+struct rpc_clock {
+	struct clk_divider div;
+	struct clk_gate gate;
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
+static struct clk * __init cpg_rpcd2_clk_register(const char *name,
+						  void __iomem *base,
+						  const char *parent_name)
+{
+	struct clk_fixed_factor *fixed;
+	struct clk_gate *gate;
+	struct clk *clk;
+
+	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return ERR_PTR(-ENOMEM);
+
+	fixed->mult = 1;
+	fixed->div = 2;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate) {
+		kfree(fixed);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	gate->reg = base + CPG_RPCCKCR;
+	gate->bit_idx = 9;
+	gate->flags = CLK_GATE_SET_TO_DISABLE;
+	gate->lock = &cpg_lock;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &fixed->hw, &clk_fixed_factor_ops,
+				     &gate->hw,  &clk_gate_ops, 0);
+	if (IS_ERR(clk)) {
+		kfree(fixed);
+		kfree(gate);
+	}
+
+	return clk;
+}
+
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
@@ -589,6 +673,21 @@ struct clk * __init rcar_gen3_cpg_clk_re
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
