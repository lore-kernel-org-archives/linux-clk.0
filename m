Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E27EC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 431D460F6D
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbhIMIyI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:54:08 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43907 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbhIMIyI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 04:54:08 -0400
Received: from stretch.efe.local ([79.233.161.113]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVe5c-1mXVi92XGG-00Rd0a; Mon, 13 Sep 2021 10:52:49 +0200
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        sebastian.hesselbarth@gmail.com, renner@efe-gmbh.de
Subject: [PATCH 1/2] clk: si5351: Add DT property for phase offset
Date:   Mon, 13 Sep 2021 10:52:41 +0200
Message-Id: <20210913085241.116691-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913085138.116653-1-renner@efe-gmbh.de>
References: <20210913085138.116653-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hSoTZpsvu9Dsjq+WRuwQheEonReF4kVClKIUSKztYYnry8ToBUs
 qCd2BRCEBsjX8zsbBdgsuoMgqJyNPMaS4FGiGXbwy9/FuAPegRuNnWKttXPLWpZQzpJqnIa
 WZFN1gJSmDIyidtdJ0NM21eFbayc++1AIMxX8OIflx3/oti1k2sY3iCdAQJcTa4Ro0tIYTZ
 ku90BQtuAsWz2ivNGNG+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ul4td3h8OZA=:iD5gHFXPKJjPa0eBbYTIUG
 T3ZO0JNHSAWozvc7zVcgWvphLtLTta3/M3OnnXfp+R8ZdulZwqlsVQS/MGvAe5gwvZfHQ2cVS
 Ye3ypr690cGo64mY+09Yn7GyieIFj70Log4svvI0z1wt5vCIxFCK/FAEDyXDhf9BqXMn70wsx
 5pbrwowJik/5DvuYJrSNH43aJRhQQImmVwo9udg/EekvDuRWPtLospQlQxTdfZKBl9VkNpFnt
 5+njE5VITE/cX3aEvYBK+do3/3xERrzG5HSuFMpOjJL5yzqIATddx0r85/AISjXb5hTpXxxaa
 Z4BdgltpG+a3eBYKXZr3BFDDlBpa00OeQvYzynlCqnvhMBoxZGA4pdYykEfzuv5bKbydntMKl
 oDZJZpvopa7EjckR5JcvXSWT8iypxUOX7qJWVu9oSfbIREu4PXAPO8vjxexF2u9RL6siK5aGL
 tgFpOcbaQrqivGv9Rz3dI31+XVSnCjsYsRuBxRTlfDXJdFZwKN54W9Tn45EaR7OlGXXDLASjO
 l789TTfBJPIm8r+sh3dEnl5jL9xwTFYHflT0pi9HKsQClmNc8ELLItupiJdZEWABdwsGAuGlt
 q5VVUSXZxxqCo9254caz0ZwOTv/QZ90ZRE8bFEE062oMQas6t8JhBb5hcR9qoVtAkir6FDZZy
 qrjiaA3JSq1Qr9qPRYLXJS8f6DlnvJllC7buUog+bs1r9tUDHQfaV/oY2oQ42mcerjalydMc/
 4fiYd9GxuBSCqlnGeFOnf3DAWlvNusNnxH29zw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add optional output clock DT property "clock-phase" to configure the
phase offset in degrees with respect to other clock outputs.
Add missing description for related optional output clock DT property
"clock-frequency".

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
 .../devicetree/bindings/clock/silabs,si5351.txt        | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index 8fe6f80afade..62adf0d0874b 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -50,11 +50,17 @@ Optional child node properties:
   divider.
 - silabs,pll-master: boolean, multisynth can change pll frequency.
 - silabs,pll-reset: boolean, clock output can reset its pll.
-- silabs,disable-state : clock output disable state, shall be
+- silabs,disable-state: clock output disable state, shall be
   0 = clock output is driven LOW when disabled
   1 = clock output is driven HIGH when disabled
   2 = clock output is FLOATING (HIGH-Z) when disabled
   3 = clock output is NEVER disabled
+- clock-frequency: integer in Hz, output frequency to generate (2500-200000000)
+  This defines the output frequency set during boot. It can be reprogrammed
+  duing runtime through the common clock framework.
+- clock-phase: integer, phase shift in degrees (0-359), using the multisynth
+  initial phase offset register (depends on the clock source / output ratio)
+  and the clock output inverter (180 deg. only).
 
 ==Example==
 
@@ -111,7 +117,7 @@ i2c-master-node {
 			silabs,drive-strength = <4>;
 			silabs,multisynth-source = <1>;
 			silabs,clock-source = <0>;
-			pll-master;
+			silabs,pll-master;
 		};
 
 		/*
-- 
2.33.0

