Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DD6ECDE46
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C16320652
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C16320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbeJYGxn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 02:53:43 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:45494 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726297AbeJYGxm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 02:53:42 -0400
Received: from unknown (HELO relmlir2.idc.renesas.com) ([10.200.68.152])
  by relmlie3.idc.renesas.com with ESMTP; 25 Oct 2018 07:23:47 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir2.idc.renesas.com (Postfix) with ESMTP id 37B3046A0D;
        Thu, 25 Oct 2018 07:23:47 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,421,1534777200"; 
   d="scan'208";a="295976187"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 25 Oct 2018 07:23:45 +0900
Received: from localhost.localdomain (unknown [143.103.58.195])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 2DDE916B;
        Wed, 24 Oct 2018 22:23:39 +0000 (UTC)
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
Subject: [PATCH v5 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Date:   Wed, 24 Oct 2018 17:23:01 -0500
Message-Id: <20181024222301.21455-4-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181024222301.21455-1-chris.brandt@renesas.com>
References: <20181024222301.21455-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3:
 * Added Reviewed-by from Rob and Simon
v2:
 * Documented that R7S9210 has 2 clocks
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 27f2eab2981d..9391ae9a1d9d 100644
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
@@ -56,7 +57,7 @@ Required properties:
 	  "core" and "cd". If the controller only has 1 clock, naming is not
 	  required.
 	  Devices which have more than 1 clock are listed below:
-	  2: R7S72100
+	  2: R7S72100, R7S9210
 
 Optional properties:
 - pinctrl-names: should be "default", "state_uhs"
-- 
2.16.1

