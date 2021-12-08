Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C9CC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 15:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhLHPt0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:49:26 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49449 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhLHPtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 10:49:25 -0500
Received: from localhost.localdomain ([87.166.17.165]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0nSN-1ma8sA0J6L-00wmUV; Wed, 08 Dec 2021 16:45:47 +0100
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org, renner@efe-gmbh.de
Subject: [PATCH v2 1/2] clk: si5351: Add DT property for phase offset
Date:   Wed,  8 Dec 2021 16:45:35 +0100
Message-Id: <20211208154535.72286-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211208154440.72087-1-renner@efe-gmbh.de>
References: <20211208154440.72087-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KF8uNhY+YaEbQlGBqReccVYyE+eLnW24w7AYCPjbAd+KMtK24gG
 co90XLDMxyf7zIjusgfujkHAMAPao0W4YCXeET3SSnxMAEbYgBLodhsqEwdC/d7oDG2vn7Z
 ORRbvPDpvjJwYCoNyeQooGfsmijBLqA/JpWIPlycTc1PU/s/9KX2+hxf9MVgCrLzBhc4t7w
 FcVONPCT6md+ijuHvQc2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FKrPajknymU=:vNws92pOXP+gHBkq14P3vi
 zn77SIEjJlq/b+d6tFriKet++grUksZANnPj9E+k4pjz1AIw9xmfMnfDlOFbQ3yBYP1xLLRXO
 +bE0LFhw09stGJHQ2qLnvttbdQjouGptzarVbfUpRgsaZzRUULr60knnXOplFGuxkHkU7R5tn
 hjnkCp9ngqQSUSZpxmKiOYrue9Te5Sw2CEZ5IieL2vP3R3nRIxKRsqGPFLV2mHWgyFARVzJ5J
 pE6mTMKpXOq5DBy7qt0+tYysyFXexWT4pNyEkUhhv1HgSWS4heQ3qx5NNdnwVAJF73loEVWVf
 4kE5xXqP+KjyOi2ttI7QZomA8Mjwqa6gOOXPOCdYLlKOH+zQRH4zQ97lFqKoIP81bfHZ2sqpi
 mgwjNmb4Zo0nD2widksRyy/1u3xWfZt54Oi1rnVNLn88O9ExzVvUM3IkG4GA8mkecSRg+Sanv
 TChPJwVBXK7QpPCdJTF9wFWKRrNZ5LsM975juv8Soz97waO4dl2vS6Q4JnH+bwolwGBQ0Mjai
 n5N/yGZl7V2mQtnMhN/AITW1TdT3uCchlLWGtpFjUIOzhTYqsRmcCrcz78K4A85fxHasvVimE
 yg7y7LuYEv5LrLK7wPMQkt/3XwaQJoYxGa1QlTU91HO9+qya7EvDwpyGuQugjyf3ux2hEio8e
 JZ5mgik4xbPbjn2/+YhbnLU1GTFa+9MvEMhAAzNyCX6//MKSdwft9XwvpCyeror+TB1Q=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add optional output clock DT property "silabs,clock-phase" to configure
the phase offset in degrees with respect to other clock outputs.
Add missing description for related optional output clock DT property
"clock-frequency".

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
Changes in v2:
  - Use vendor-specific DT property silabs,clock-phase

 .../devicetree/bindings/clock/silabs,si5351.txt        | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index bfda6af76..0f4e4f41f 100644
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
+- silabs,clock-phase: integer, phase shift in degrees (0-359), using the
+  multisynth initial phase offset register (depends on the clock source /
+  output ratio) and the clock output inverter (180 deg. only).
 
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
2.30.2

