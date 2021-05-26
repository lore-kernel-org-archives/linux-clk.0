Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E215DC47088
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 16:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C439B613ED
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 16:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhEZQzj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 12:55:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49660 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbhEZQzj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 12:55:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QGs49i110647;
        Wed, 26 May 2021 11:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622048045;
        bh=pQe1rfyW1cR6o7OWZz+JOzAKeQCeQ4EkrGw/6iCy2N4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KYBozZA7Cav5zWIo7bOxVXoqCGhKG7GMihDfCxSKmTZlvtWulsS7f2a+GAxlA6JsE
         EVGcABbf4yyFJkMbIYLi+Tw03b0EWEL2B2W9eG5apzxYH9dV0fEqmKQYov0gR+EpmY
         JR155HqqUbeZNBKtvVgJNMTFTXBPfMg0lHi3w39I=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QGs4ZE091594
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 11:54:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 11:54:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 11:54:04 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QGruiG097418;
        Wed, 26 May 2021 11:54:01 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/2] dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
Date:   Wed, 26 May 2021 22:23:55 +0530
Message-ID: <20210526165356.22690-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526165356.22690-1-lokeshvutla@ti.com>
References: <20210526165356.22690-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce AM64 specific compatible for ehrpwm time-base sub-module clock.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml b/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
index 6b419a9878f3..c4adf0a80ca4 100644
--- a/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: ti,am654-ehrpwm-tbclk
+      - enum:
+          - ti,am654-ehrpwm-tbclk
+          - ti,am64-ehrpwm-tbclk
       - const: syscon
 
   "#clock-cells":
-- 
2.31.1

