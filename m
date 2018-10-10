Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E287BC43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A800C2087A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A800C2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbeJJT7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 15:59:36 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:37404 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726503AbeJJT7g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 15:59:36 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie2.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:35 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 2D96487782;
        Wed, 10 Oct 2018 21:37:35 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="294772607"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:33 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.66])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 0D273233;
        Wed, 10 Oct 2018 12:37:27 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Date:   Wed, 10 Oct 2018 07:37:13 -0500
Message-Id: <20181010123713.67541-4-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181010123713.67541-1-chris.brandt@renesas.com>
References: <20181010123713.67541-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
 * Documented that R7S9210 has 2 clocks
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index d39d5e46f7d2..cdfbcce34b97 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -13,6 +13,7 @@ Required properties:
 - compatible: should contain one or more of the following:
 		"renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
 		"renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
+		"renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
 		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
 		"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
@@ -54,7 +55,7 @@ Required properties:
 	  "core" and "cd". If the controller only has 1 clock, naming is not
 	  required.
 	  Devices which have more than 1 clock are listed below:
-	  2: R7S72100
+	  2: R7S72100, R7S9210
 
 Optional properties:
 - pinctrl-names: should be "default", "state_uhs"
-- 
2.16.1

