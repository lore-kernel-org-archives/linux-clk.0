Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486EFC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiJMNTS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJMNTR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:19:17 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208994E184;
        Thu, 13 Oct 2022 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667154; x=1697203154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lVAouun3MMjIWLoleby1CjdLkZcRUwdVl9u7eErVfd0=;
  b=O61C91JISWScZ5JO9Uu5H6raF26o9GkNWqVFt64p2kyN+nufi1U3kKbo
   U3YuXX/I3nF+3W96Cgc33pILvHB6d3lt5qTCkDsZnfGvi5ZjGHLxQPMOV
   ZM8rxTFqSQzzrlOppW/iaxcxOah/NajT+Ciw9U9C28SFL9eIzFbcylCDN
   qDV28sghqg2FtLBxfqJHh5b3UK1j7KpKdCNkgQmHWaRfqvL0ne0FEFezT
   0SxdVKvR1rTCnGKLWbuIS9aszi9c8xVmXjj0T7hNzXKCuxIlOajX0k7Ck
   6q56FHfkkY4gO5RTEiBfnwYpXySJkS7QtTyPht2Q06PKejRLfMD8O/fcV
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736856"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:19:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:19:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:19:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667144; x=1697203144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lVAouun3MMjIWLoleby1CjdLkZcRUwdVl9u7eErVfd0=;
  b=NknvOv3R7U1AjCtkxmJ6R3LaU+dgTAXZNn5oHn3FCVRbKXqA84XuzAvI
   SM9wMWymqqs80xPqGsV6DwLbQw+YmX7VwYMzO51I0RgSy6Kpf7h1Frjg7
   IZXPghq2QDNj83Ck1gN71xBz15SEnw9sU8/Gx+rNQoPBUIlT4O4wictF2
   7NycjcqTKSNzI5KhtXYB7qF0Q2GNuBe8J/ONGBwbFDuSrBKLiImbTpmDt
   hM1o+tPYNpRC8eoHL/6cFLfcgj0ZeNBQCkbZLxMY33UBQneiKLumdNJ2A
   Len2pPzMSujquGLf547CH1MOhIbcaAXhxGON3D0lxSYE+jvuez4U+MXvW
   g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736855"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9855C280056;
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
Subject: [PATCH 5/5] ARM: dts: imx6q: add ipp_di0 and ipp_di1 pad configuration
Date:   Thu, 13 Oct 2022 15:18:39 +0200
Message-Id: <20221013131839.1365394-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The reference manual does not mention this setting, but it works.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/imx6dl-pinfunc.h | 3 +++
 arch/arm/boot/dts/imx6q-pinfunc.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-pinfunc.h b/arch/arm/boot/dts/imx6dl-pinfunc.h
index 9d88d09f9bf6..876ff4545c30 100644
--- a/arch/arm/boot/dts/imx6dl-pinfunc.h
+++ b/arch/arm/boot/dts/imx6dl-pinfunc.h
@@ -525,11 +525,13 @@
 #define MX6QDL_PAD_EIM_DA12__EPDC_DATA02            0x194 0x564 0x000 0x8 0x0
 #define MX6QDL_PAD_EIM_DA13__EIM_AD13               0x198 0x568 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_DA13__IPU1_DI1_D0_CS         0x198 0x568 0x000 0x1 0x0
+#define MX6QDL_PAD_EIM_DA13__IPP_DI1_CLK            0x198 0x568 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_DA13__GPIO3_IO13             0x198 0x568 0x000 0x5 0x0
 #define MX6QDL_PAD_EIM_DA13__SRC_BOOT_CFG13         0x198 0x568 0x000 0x7 0x0
 #define MX6QDL_PAD_EIM_DA13__EPDC_DATA13            0x198 0x568 0x000 0x8 0x0
 #define MX6QDL_PAD_EIM_DA14__EIM_AD14               0x19c 0x56c 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_DA14__IPU1_DI1_D1_CS         0x19c 0x56c 0x000 0x1 0x0
+#define MX6QDL_PAD_EIM_DA14__IPP_DI0_CLK            0x19c 0x56c 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_DA14__GPIO3_IO14             0x19c 0x56c 0x000 0x5 0x0
 #define MX6QDL_PAD_EIM_DA14__SRC_BOOT_CFG14         0x19c 0x56c 0x000 0x7 0x0
 #define MX6QDL_PAD_EIM_DA14__EPDC_DATA14            0x19c 0x56c 0x000 0x8 0x0
@@ -602,6 +604,7 @@
 #define MX6QDL_PAD_EIM_EB1__EPDC_SDSHR              0x1c8 0x598 0x000 0x8 0x0
 #define MX6QDL_PAD_EIM_EB2__EIM_EB2_B               0x1cc 0x59c 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_EB2__ECSPI1_SS0              0x1cc 0x59c 0x7e4 0x1 0x2
+#define MX6QDL_PAD_EIM_EB2__IPP_DI1_CLK             0x1cc 0x59c 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_EB2__IPU1_CSI1_DATA19        0x1cc 0x59c 0x8ac 0x3 0x1
 #define MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL         0x1cc 0x59c 0x860 0x4 0x0
 #define MX6QDL_PAD_EIM_EB2__GPIO2_IO30              0x1cc 0x59c 0x000 0x5 0x0
diff --git a/arch/arm/boot/dts/imx6q-pinfunc.h b/arch/arm/boot/dts/imx6q-pinfunc.h
index e40409d04b97..40e53273c2e2 100644
--- a/arch/arm/boot/dts/imx6q-pinfunc.h
+++ b/arch/arm/boot/dts/imx6q-pinfunc.h
@@ -76,6 +76,7 @@
 #define MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE        0x088 0x39c 0x88c 0x6 0x0
 #define MX6QDL_PAD_EIM_EB2__EIM_EB2_B               0x08c 0x3a0 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_EB2__ECSPI1_SS0              0x08c 0x3a0 0x800 0x1 0x0
+#define MX6QDL_PAD_EIM_EB2__IPP_DI1_CLK             0x08c 0x3a0 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_EB2__IPU2_CSI1_DATA19        0x08c 0x3a0 0x8d4 0x3 0x0
 #define MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL         0x08c 0x3a0 0x890 0x4 0x0
 #define MX6QDL_PAD_EIM_EB2__GPIO2_IO30              0x08c 0x3a0 0x000 0x5 0x0
@@ -373,10 +374,12 @@
 #define MX6QDL_PAD_EIM_DA12__SRC_BOOT_CFG12         0x144 0x458 0x000 0x7 0x0
 #define MX6QDL_PAD_EIM_DA13__EIM_AD13               0x148 0x45c 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_DA13__IPU1_DI1_D0_CS         0x148 0x45c 0x000 0x1 0x0
+#define MX6QDL_PAD_EIM_DA13__IPP_DI1_CLK            0x148 0x45c 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_DA13__GPIO3_IO13             0x148 0x45c 0x000 0x5 0x0
 #define MX6QDL_PAD_EIM_DA13__SRC_BOOT_CFG13         0x148 0x45c 0x000 0x7 0x0
 #define MX6QDL_PAD_EIM_DA14__EIM_AD14               0x14c 0x460 0x000 0x0 0x0
 #define MX6QDL_PAD_EIM_DA14__IPU1_DI1_D1_CS         0x14c 0x460 0x000 0x1 0x0
+#define MX6QDL_PAD_EIM_DA14__IPP_DI0_CLK            0x14c 0x460 0x000 0x2 0x0
 #define MX6QDL_PAD_EIM_DA14__GPIO3_IO14             0x14c 0x460 0x000 0x5 0x0
 #define MX6QDL_PAD_EIM_DA14__SRC_BOOT_CFG14         0x14c 0x460 0x000 0x7 0x0
 #define MX6QDL_PAD_EIM_DA15__EIM_AD15               0x150 0x464 0x000 0x0 0x0
-- 
2.25.1

