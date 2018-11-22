Return-Path: <SRS0=o4d4=OB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDE5C43441
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:43:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09A5120824
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="18gT9t5Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A5120824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbeKWFYA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 00:24:00 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39785 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbeKWFYA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 00:24:00 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so8736408ljh.6
        for <linux-clk@vger.kernel.org>; Thu, 22 Nov 2018 10:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vlcLr63GvcDk79yjDzZ3jOfhcgcoKQJL2Af67EiHTkc=;
        b=18gT9t5ZwK4A6yD3waPNelHvXUWGXbSP/Ai/UzCWfUgFcMbylWwhFU4JKKMoY1BqBs
         ekXxxMTqJxEQWkyfBFE5uLE5xOXlqJzt61jOU5Mc/HrDE+ixEShfKnusTDeNjefpUSVQ
         a93xWchaeWBqah2Qy76axxfCxDA2M5OzNJHBsq7ayhxb1vqkCRdAsuiR++4Qj6zgyZcM
         nkMgb+mISdHRdPWaySmul2rmVUjJhFuU9wPw1YkAVMVKMCnvCuNyxtcyP4i3dcDXrmCN
         JY/yn4v+hKbVbDKsNontUVkHtdsBXYuT+cvTNTERXuQGPTTHQYnCZJWT7CJMjfkArQb7
         K3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vlcLr63GvcDk79yjDzZ3jOfhcgcoKQJL2Af67EiHTkc=;
        b=jwLJ0dfGnF/d9VKeVtvlSuAw/Vwyv6oIUl78ohxyC1IpQt0g8fecYAz4fwEoDhkWl2
         u7bZa8/uuWZ8bwb1NW+/SgdTn/DLORscraJZMrg/kIzF/TTANPliMwgTOKZcA4XViPbf
         lS/LovPKql6zIWsXIGbi3r70OJ6KW9nJwTah0GLjfjY9c+6uVlSHcPPXhNwoVII8y5wI
         JQed0YvcQn4k+6EqylO0xjem3MaZeY8NNxf45nlEFJIur7OQVnXD1t04MalYKmErHQdu
         iaVoMtYMOKKmn5qWypQe2u8i1UDmOQnXIfP1jr8LHSPj0PAh3PyuhjJUC1IV/WMlFIyI
         CpxA==
X-Gm-Message-State: AA+aEWaRxQT8H1dan6mh3B+Uay3Gnl0e2cmK5Fvh8EIi0gRLor4GWUDk
        iIdgQfHBYaOX3L+hsbKUlsS9dyNVJ+4=
X-Google-Smtp-Source: AJdET5dYMR14SNPNlEl5O9l1yR20pjqVQ/zhTmHjCsO5R5tLVpVFDUAUxXrgBgUuFbZ2gtMJ9+idlA==
X-Received: by 2002:a2e:7403:: with SMTP id p3-v6mr7717496ljc.97.1542912201419;
        Thu, 22 Nov 2018 10:43:21 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.10])
        by smtp.gmail.com with ESMTPSA id u26-v6sm7511390lji.22.2018.11.22.10.43.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 10:43:20 -0800 (PST)
Subject: [PATCH 3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
Date:   Thu, 22 Nov 2018 21:43:19 +0300
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

Add the RPCD2 clock for the R-Car gen3 SoCs -- this clock is en/disabled
via the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970)
and has a fixed divisor of 2 (applied to the RPC clock).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |   87 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |    1 
 2 files changed, 88 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -524,6 +524,89 @@ static struct clk * __init cpg_rpc_clk_r
 	return clk;
 }
 
+static int cpg_rpcd2_clock_enable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_CKSTP2, 0);
+
+	return 0;
+}
+
+static void cpg_rpcd2_clock_disable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP2);
+}
+
+static int cpg_rpcd2_clock_is_enabled(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	return !(readl(clock->reg) & CPG_RPC_CKSTP2);
+}
+
+static unsigned long cpg_rpcd2_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	return parent_rate / 2;
+}
+
+static long cpg_rpcd2_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	return *parent_rate / 2;
+}
+
+static int cpg_rpcd2_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * the round_rate() method returns values that ensure this call is
+	 * a nop.
+	 */
+	return 0;
+}
+
+static const struct clk_ops cpg_rpcd2_clock_ops = {
+	.enable = cpg_rpcd2_clock_enable,
+	.disable = cpg_rpcd2_clock_disable,
+	.is_enabled = cpg_rpcd2_clock_is_enabled,
+	.recalc_rate = cpg_rpcd2_recalc_rate,
+	.round_rate = cpg_rpcd2_round_rate,
+	.set_rate = cpg_rpcd2_set_rate,
+};
+
+static struct clk * __init cpg_rpcd2_clk_register(const struct cpg_core_clk *core,
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
+	init.ops = &cpg_rpcd2_clock_ops;
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
@@ -701,6 +784,10 @@ struct clk * __init rcar_gen3_cpg_clk_re
 	case CLK_TYPE_GEN3_RPC:
 		return cpg_rpc_clk_register(core, base, __clk_get_name(parent));
 
+	case CLK_TYPE_GEN3_RPCD2:
+		return cpg_rpcd2_clk_register(core, base,
+					      __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPC,
+	CLK_TYPE_GEN3_RPCD2,
 
 	/* SoC specific definitions start here */
 	CLK_TYPE_GEN3_SOC_BASE,
