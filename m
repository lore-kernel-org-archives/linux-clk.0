Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC5CC001DF
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 11:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjGaLAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 07:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGaLAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 07:00:33 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E5E199
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 04:00:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbc64f9a91so36605435ad.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690801228; x=1691406028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP1HvhmILSDZxBxnehc/orNHE8euRpEXGakH0zc2A7k=;
        b=vu53Q9UAlOg6BDlJrkAy6fQOvq8rg045i4qiJrtblnnk3iOqoYyWZ7uOZjYd2EeZgx
         P5AyemhYD2+unRxsl+Z4PWruWaLgXb0jgcpcdFiHhsl1aQ9WP5MXMz9arwajyizMCs42
         dR9X7rcvjJeaZ/g76zi9zAw6lllsNtaWFzaIJHWCswRIFZgxplvbsWOV9rO9HbX2UeCX
         HMBtbR8j84mTk3Il76l66YygZjIWaQOnW+76w2ntsSVkcySJlSeZ9EE939VatbsO74Yu
         JOngwf0ht//eV7beeWzxcxb4n207cpIwwT3l47asgL3cqlQnpTa1UavhhqNRPzW1eDAn
         DfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801228; x=1691406028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP1HvhmILSDZxBxnehc/orNHE8euRpEXGakH0zc2A7k=;
        b=LnPQ9da7tq2r95Kej5f56Zxs3bo3T47UrWzPyJQ4WpRVMhXT/ViBmumSEphZ5kkXT2
         tbT6wrbo1ik6Ynbs8R+1RmFG+YGIqeqOoN0nClYUCaWt5kgqK03nVPMNSHUpdc7G0FNw
         ztMrmGPgjdeNM4f5TZYjyVGU/+ZXr7W2zDeJObVgJz2z0DaFZsIRdughg3ITtBIYvVjQ
         end/KLycXmYiV35hsEwfSul1fea7D3/bM3sUKESmwmS4QcEQMQwZoiJzVL9Ip3cVwRDQ
         7xpg/gmkrj9huZVZA/lt4werZuruFFYZD/HZ1dQbARkf8LOFrgzUmHJXYq06B4FJacQR
         gnUQ==
X-Gm-Message-State: ABy/qLbHoHvIJ7MKX8Pbv3T2ms/MMgsNL/TsKdRgAO9BsjUo35voaM+W
        gasdBNSwwrmUsk+l5LQKwACJ0Q==
X-Google-Smtp-Source: APBJJlH8SyBbLB03Bth3Pd8z8lX9ED3lmZv12VgI5f3Sa1hnE8Ivym4zh3nPE9tU5JbnHWoZUfS4bQ==
X-Received: by 2002:a17:902:dac4:b0:1b8:8dbd:e1a0 with SMTP id q4-20020a170902dac400b001b88dbde1a0mr10540287plx.13.1690801228399;
        Mon, 31 Jul 2023 04:00:28 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.15])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709028c8e00b001b1a2c14a4asm8281096plo.38.2023.07.31.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:00:27 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 02/14] clk: rockchip: rv1126: Add PD_VO clock tree
Date:   Mon, 31 Jul 2023 16:30:00 +0530
Message-Id: <20230731110012.2913742-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731110012.2913742-1-jagan@edgeble.ai>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PD_VO clock tree diagram in RV1126 is connected to
- BIU_VO
- VOP
- RGA
- IEP
- DSIHOST

Add entire PD_VO clock tree for rv1126.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>

 drivers/clk/rockchip/clk-rv1126.c | 59 +++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rv1126.c b/drivers/clk/rockchip/clk-rv1126.c
index 5c6f1ce34a2f..fc19c5522490 100644
--- a/drivers/clk/rockchip/clk-rv1126.c
+++ b/drivers/clk/rockchip/clk-rv1126.c
@@ -175,6 +175,7 @@ PNAME(mux_i2s2_p)			= { "mclk_i2s2_div", "mclk_i2s2_fracdiv", "i2s2_mclkin", "xi
 PNAME(mux_i2s2_out2io_p)		= { "mclk_i2s2", "xin12m" };
 PNAME(mux_gpll_cpll_xin24m_p)		= { "gpll", "cpll", "xin24m" };
 PNAME(mux_audpwm_p)			= { "sclk_audpwm_div", "sclk_audpwm_fracdiv", "xin24m" };
+PNAME(mux_dclk_vop_p)			= { "dclk_vop_div", "dclk_vop_fracdiv", "xin24m" };
 PNAME(mux_usb480m_gpll_p)		= { "usb480m", "gpll" };
 PNAME(clk_gmac_src_m0_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m0" };
 PNAME(clk_gmac_src_m1_p)		= { "clk_gmac_div", "clk_gmac_rgmii_m1" };
@@ -259,6 +260,10 @@ static struct rockchip_clk_branch rv1126_audpwm_fracmux __initdata =
 	MUX(SCLK_AUDPWM_MUX, "mclk_audpwm_mux", mux_audpwm_p, CLK_SET_RATE_PARENT,
 			RV1126_CLKSEL_CON(36), 8, 2, MFLAGS);
 
+static struct rockchip_clk_branch rv1126_dclk_vop_fracmux __initdata =
+	MUX(DCLK_VOP_MUX, "dclk_vop_mux", mux_dclk_vop_p, CLK_SET_RATE_PARENT,
+	    RV1126_CLKSEL_CON(47), 10, 2, MFLAGS);
+
 static struct rockchip_clk_branch rv1126_clk_pmu_branches[] __initdata = {
 	/*
 	 * Clock-Architecture Diagram 2
@@ -714,6 +719,49 @@ static struct rockchip_clk_branch rv1126_clk_branches[] __initdata = {
 			RV1126_CLKSEL_CON(72), 8, 1, MFLAGS, 0, 7, DFLAGS,
 			RV1126_CLKGATE_CON(11), 1, GFLAGS),
 
+	/*
+	 * Clock-Architecture Diagram 9
+	 */
+	/* PD_VO */
+	COMPOSITE(ACLK_PDVO, "aclk_pdvo", mux_gpll_cpll_p, 0,
+		  RV1126_CLKSEL_CON(45), 7, 1, MFLAGS, 0, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(14), 0, GFLAGS),
+	COMPOSITE_NOMUX(HCLK_PDVO, "hclk_pdvo", "aclk_pdvo", 0,
+			RV1126_CLKSEL_CON(45), 8, 5, DFLAGS,
+			RV1126_CLKGATE_CON(14), 1, GFLAGS),
+	COMPOSITE_NOMUX(PCLK_PDVO, "pclk_pdvo", "aclk_pdvo", 0,
+			RV1126_CLKSEL_CON(46), 8, 5, DFLAGS,
+			RV1126_CLKGATE_CON(14), 2, GFLAGS),
+	GATE(ACLK_RGA, "aclk_rga", "aclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(14), 6, GFLAGS),
+	GATE(HCLK_RGA, "hclk_rga", "hclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(14), 7, GFLAGS),
+	COMPOSITE(CLK_RGA_CORE, "clk_rga_core", mux_gpll_cpll_p, 0,
+		  RV1126_CLKSEL_CON(46), 7, 1, MFLAGS, 0, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(14), 8, GFLAGS),
+	GATE(ACLK_VOP, "aclk_vop", "aclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(14), 9, GFLAGS),
+	GATE(HCLK_VOP, "hclk_vop", "hclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(14), 10, GFLAGS),
+	COMPOSITE(DCLK_VOP_DIV, "dclk_vop_div", mux_gpll_cpll_p, 0,
+		  RV1126_CLKSEL_CON(47), 8, 1, MFLAGS, 0, 8, DFLAGS,
+		  RV1126_CLKGATE_CON(14), 11, GFLAGS),
+	COMPOSITE_FRACMUX(DCLK_VOP_FRACDIV, "dclk_vop_fracdiv", "dclk_vop_div",
+			  CLK_SET_RATE_PARENT, RV1126_CLKSEL_CON(48), 0,
+			  RV1126_CLKGATE_CON(14), 12, GFLAGS,
+			  &rv1126_dclk_vop_fracmux),
+	GATE(DCLK_VOP, "dclk_vop", "dclk_vop_mux", 0,
+	     RV1126_CLKGATE_CON(14), 13, GFLAGS),
+	GATE(PCLK_DSIHOST, "pclk_dsihost", "pclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(14), 14, GFLAGS),
+	GATE(ACLK_IEP, "aclk_iep", "aclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(12), 7, GFLAGS),
+	GATE(HCLK_IEP, "hclk_iep", "hclk_pdvo", 0,
+	     RV1126_CLKGATE_CON(12), 8, GFLAGS),
+	COMPOSITE(CLK_IEP_CORE, "clk_iep_core", mux_gpll_cpll_p, 0,
+		  RV1126_CLKSEL_CON(54), 7, 1, MFLAGS, 0, 5, DFLAGS,
+		  RV1126_CLKGATE_CON(12), 9, GFLAGS),
+
 	/*
 	 * Clock-Architecture Diagram 12
 	 */
@@ -905,6 +953,17 @@ static struct rockchip_clk_branch rv1126_clk_branches[] __initdata = {
 	GATE(0, "pclk_pdaudio_niu", "hclk_pdaudio", CLK_IGNORE_UNUSED,
 			RV1126_CLKGATE_CON(9), 3, GFLAGS),
 
+	/*
+	 * Clock-Architecture Diagram 9
+	 */
+	/* PD_VO */
+	GATE(0, "aclk_pdvo_niu", "aclk_pdvo", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(14), 3, GFLAGS),
+	GATE(0, "hclk_pdvo_niu", "hclk_pdvo", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(14), 4, GFLAGS),
+	GATE(0, "pclk_pdvo_niu", "pclk_pdvo", CLK_IGNORE_UNUSED,
+	     RV1126_CLKGATE_CON(14), 5, GFLAGS),
+
 	/*
 	 * Clock-Architecture Diagram 12
 	 */
-- 
2.25.1

