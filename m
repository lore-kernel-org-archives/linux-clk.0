Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDC7C43387
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 18:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0731720866
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 18:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbfAPSil (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 13:38:41 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:19272 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729056AbfAPSik (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jan 2019 13:38:40 -0500
X-IronPort-AV: E=Sophos;i="5.56,487,1539615600"; 
   d="scan'208";a="5151677"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2019 03:38:38 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F0B1340F10E1;
        Thu, 17 Jan 2019 03:38:31 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, ebiharaml@si-linux.co.jp
Subject: [PATCH 04/11] arm64: dts: renesas: Add Si-Linux EK874 board support
Date:   Wed, 16 Jan 2019 18:37:47 +0000
Message-Id: <1547663874-29411-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The EK874 development kit from Silicon Linux is made of CAT874 (the main
board) and CAT875 (the sub board that goes on top of CAT874).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile           |  2 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts | 14 ++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/cat875.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 11997d7..6cde526 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
new file mode 100644
index 0000000..a41d0d8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Silicon Linux sub board for CAT874 (CAT875)
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/ {
+	model = "Silicon Linux sub board for CAT874 (CAT875)";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
new file mode 100644
index 0000000..e7b6619
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Silicon Linux RZ/G2E evaluation kit (EK874)
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include "r8a774c0-cat874.dts"
+#include "cat875.dtsi"
+
+/ {
+	model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875)";
+	compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
+};
-- 
2.7.4

