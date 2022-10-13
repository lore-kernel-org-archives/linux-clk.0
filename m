Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C762C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiJMNTV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJMNTT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:19:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC8E4E183;
        Thu, 13 Oct 2022 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667152; x=1697203152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xv8HxVPlpEWF3lIMukDZmZVZn0GD+2rh6X0WO70HEZ0=;
  b=ofWxo02+Ksdes9NHteKVMKvmIZTTyaODsMjrnN3/ikWtD7wZm/hRGIyp
   czmM5pV4XvlaqU9tDMrxpaIST+EFcM2sro/bXx24XoUmwtelq9fdCswsz
   8oHGTYKLXzry7qdVoXqkW77hjOZ+1S9XB3ywiTYL7w1/ScA8OVcjZ+on6
   tZXVStSnDbMFH3I3zN0dDDa4qCDCASau1Cu17ayw3iXRIPMrlh04XqaQ9
   CLShCdx2eZ9zBCXXIWcab1Arlr8Q584vRy+CSueqJZOnwrJUaVNOXxMa9
   UtoWR0hR3bumLwUfQiuqid9h8hX+6ekv316GnCGQhykYiWxfpudUHLmM/
   g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736854"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:19:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667143; x=1697203143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xv8HxVPlpEWF3lIMukDZmZVZn0GD+2rh6X0WO70HEZ0=;
  b=RKNsQx5Wr5CL5ZQvEpGHvKEJCAQYiNNq1pN3Lp6Eyk8OQowEL1EcBxi2
   P7SHYAgeIWc62f7V9HxJcjX3BBEF8iqcZkWHt19u46olb6kBBWGD2W/67
   7BURNlVQZ7zklbD/c4kX6y4gzfd18xzVDJ1deHwDyd6gZQQdIPpLOm335
   cl9hLTYB93xzaoFU2mwbDJV1bmsCb0VyJSHnMK3cOmBxcVEgxIkQNi+q6
   RURg6L8l8fVg4tVwmYiZbKUpYF1CS0i7abFBNcVJklJbQBzEWI+NPU549
   px30FYYNdTvKDfnwf1RlbtYnPi+qPxs1Yyq0+0TwhwRviszrjiW4I6fhf
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736853"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 593AB280072;
        Thu, 13 Oct 2022 15:19:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] clk: imx6q: Add ipp-di0 and ipp-di1 clocks
Date:   Thu, 13 Oct 2022 15:18:38 +0200
Message-Id: <20221013131839.1365394-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Described in CCM_CHSCCDR and CCM_CSCDR2 in the fields ipuX_diX_pre_clk_sel.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-imx6q.c               | 20 ++++++++++++--------
 include/dt-bindings/clock/imx6qdl-clock.h |  4 +++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index de36f58d551c..6f25361302a6 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -38,14 +38,14 @@ static const char *gpu3d_shader_sels[] = { "mmdc_ch0_axi", "pll3_usb_otg", "pll2
 static const char *ipu_sels[]		= { "mmdc_ch0_axi", "pll2_pfd2_396m", "pll3_120m", "pll3_pfd1_540m", };
 static const char *ldb_di_sels[]	= { "pll5_video_div", "pll2_pfd0_352m", "pll2_pfd2_396m", "mmdc_ch1_axi", "pll3_usb_otg", };
 static const char *ipu_di_pre_sels[]	= { "mmdc_ch0_axi", "pll3_usb_otg", "pll5_video_div", "pll2_pfd0_352m", "pll2_pfd2_396m", "pll3_pfd1_540m", };
-static const char *ipu1_di0_sels[]	= { "ipu1_di0_pre", "dummy", "dummy", "ldb_di0", "ldb_di1", };
-static const char *ipu1_di1_sels[]	= { "ipu1_di1_pre", "dummy", "dummy", "ldb_di0", "ldb_di1", };
-static const char *ipu2_di0_sels[]	= { "ipu2_di0_pre", "dummy", "dummy", "ldb_di0", "ldb_di1", };
-static const char *ipu2_di1_sels[]	= { "ipu2_di1_pre", "dummy", "dummy", "ldb_di0", "ldb_di1", };
-static const char *ipu1_di0_sels_2[]	= { "ipu1_di0_pre", "dummy", "dummy", "ldb_di0_podf", "ldb_di1_podf", };
-static const char *ipu1_di1_sels_2[]	= { "ipu1_di1_pre", "dummy", "dummy", "ldb_di0_podf", "ldb_di1_podf", };
-static const char *ipu2_di0_sels_2[]	= { "ipu2_di0_pre", "dummy", "dummy", "ldb_di0_podf", "ldb_di1_podf", };
-static const char *ipu2_di1_sels_2[]	= { "ipu2_di1_pre", "dummy", "dummy", "ldb_di0_podf", "ldb_di1_podf", };
+static const char *ipu1_di0_sels[]	= { "ipu1_di0_pre", "ipp_di0", "ipp_di1", "ldb_di0", "ldb_di1", };
+static const char *ipu1_di1_sels[]	= { "ipu1_di1_pre", "ipp_di0", "ipp_di1", "ldb_di0", "ldb_di1", };
+static const char *ipu2_di0_sels[]	= { "ipu2_di0_pre", "ipp_di0", "ipp_di1", "ldb_di0", "ldb_di1", };
+static const char *ipu2_di1_sels[]	= { "ipu2_di1_pre", "ipp_di0", "ipp_di1", "ldb_di0", "ldb_di1", };
+static const char *ipu1_di0_sels_2[]	= { "ipu1_di0_pre", "ipp_di0", "ipp_di1", "ldb_di0_podf", "ldb_di1_podf", };
+static const char *ipu1_di1_sels_2[]	= { "ipu1_di1_pre", "ipp_di0", "ipp_di1", "ldb_di0_podf", "ldb_di1_podf", };
+static const char *ipu2_di0_sels_2[]	= { "ipu2_di0_pre", "ipp_di0", "ipp_di1", "ldb_di0_podf", "ldb_di1_podf", };
+static const char *ipu2_di1_sels_2[]	= { "ipu2_di1_pre", "ipp_di0", "ipp_di1", "ldb_di0_podf", "ldb_di1_podf", };
 static const char *hsi_tx_sels[]	= { "pll3_120m", "pll2_pfd2_396m", };
 static const char *pcie_axi_sels[]	= { "axi", "ahb", };
 static const char *ssi_sels[]		= { "pll3_pfd2_508m", "pll3_pfd3_454m", "pll4_audio_div", };
@@ -452,6 +452,10 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	hws[IMX6QDL_CLK_ANACLK1] = imx6q_obtain_fixed_clk_hw(ccm_node, "anaclk1", 0);
 	hws[IMX6QDL_CLK_ANACLK2] = imx6q_obtain_fixed_clk_hw(ccm_node, "anaclk2", 0);
 
+	/* ipp_di clocks are external input */
+	hws[IMX6QDL_CLK_IPP_DI0] = imx6q_obtain_fixed_clk_hw(ccm_node, "ipp_di0", 0);
+	hws[IMX6QDL_CLK_IPP_DI1] = imx6q_obtain_fixed_clk_hw(ccm_node, "ipp_di1", 0);
+
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
 	anatop_base = base = of_iomap(np, 0);
 	WARN_ON(!base);
diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
index e20c43cc36f6..2beb8738ae3d 100644
--- a/include/dt-bindings/clock/imx6qdl-clock.h
+++ b/include/dt-bindings/clock/imx6qdl-clock.h
@@ -273,6 +273,8 @@
 #define IMX6QDL_CLK_MMDC_P0_IPG			263
 #define IMX6QDL_CLK_DCIC1			264
 #define IMX6QDL_CLK_DCIC2			265
-#define IMX6QDL_CLK_END				266
+#define IMX6QDL_CLK_IPP_DI0			266
+#define IMX6QDL_CLK_IPP_DI1			267
+#define IMX6QDL_CLK_END				268
 
 #endif /* __DT_BINDINGS_CLOCK_IMX6QDL_H */
-- 
2.25.1

