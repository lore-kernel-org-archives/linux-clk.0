Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D836FC4708C
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 04:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6CF1613ED
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 04:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbhE1E7b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 May 2021 00:59:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51830 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbhE1E7a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 May 2021 00:59:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14S4vqWQ124474;
        Thu, 27 May 2021 23:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622177872;
        bh=pf8udZ2UekHUvQ2Nmw8pMcqhs98XLqsqR1Rk2VqDJq0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=muiI4tt1tECmPOzIhqaYyribyAJT3buuYH7hTSVkYASNtukKKFWKb+6oQRLEhcwKr
         tPMbDZ1I4JHCWhY5skLCaXRsO8Yg+nix6cf2J2nkth2gPaIJIpzEYpvcqN1NE4DiLB
         U/GExaEN89rZzFNwF5BaF/UNJweiqdQ4mvQBNKDY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14S4vqXr066477
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 23:57:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 23:57:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 23:57:51 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14S4viJ3087638;
        Thu, 27 May 2021 23:57:48 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
Date:   Fri, 28 May 2021 10:27:42 +0530
Message-ID: <20210528045743.16537-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528045743.16537-1-lokeshvutla@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce AM64 specific compatible for epwm time-base sub-module clock.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml b/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
index 6b419a9878f3..9b537bc876b5 100644
--- a/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: ti,am654-ehrpwm-tbclk
+      - enum:
+          - ti,am654-ehrpwm-tbclk
+          - ti,am64-epwm-tbclk
       - const: syscon
 
   "#clock-cells":
-- 
2.31.1

