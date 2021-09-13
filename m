Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E2BC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DC4460FE6
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238465AbhIMIty (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:49:54 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54617 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238476AbhIMItu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 04:49:50 -0400
Received: from stretch.efe.local ([79.233.161.113]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MatmF-1mw1eH10It-00cPMW; Mon, 13 Sep 2021 10:48:30 +0200
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, renner@efe-gmbh.de
Subject: [PATCH] clk: si5351: Update datasheet references
Date:   Mon, 13 Sep 2021 09:48:23 +0200
Message-Id: <20210913074823.115212-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wzqlxJi40j2sKko4YJ9Lg847UXl2YS2B5uKzZqhTKTtfmXs+wNj
 7Mb8mkXVVSGr5uD0WE6ZntvvveFZYf1Jo8gzYYMXKKyjXOhCbyJmxMLoGVjaQflTmqk6J4K
 8BToJI6i0p9UoStWj8yRh+JqE33RJjvTQrwi9FifyqgU6ZqjCl27IOvlCW/ABOhV8sw/ok9
 Rystt16Wv0kL/DE49/nVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Cu8QfukTn8=:6c382jIQTVlxkRP0+MiA3m
 RCmS9UmbHO86Ejvk+cpfsqlRBkHlm8yDG6E9CzbvJq41KzeJZD0k00pHtvAyMKTNdEiXbVqiY
 Tuq4LZQTeHrpR+FmzKRTpboZDszYrh+mgXpyIG0Vcsnbv97p25ZHg2GqNUCimquBbp5agsuKc
 9p2jFcGXBtcwqq5iTjl/ANJoIL2aWUaEh/4eKagwBXQpaYv61nPPBOAoB1v2jVP+hxDImT+Ob
 qPdzP7B+db8XkAmcTzhm7GcTe0iKeLpUp1jxIOCUu5FR0h0UA28qR69j4NK1VomJXsDbsDDxV
 2AdB/e3TLiwGzUPy9P1yPM/rhHKsPYcL6LfbolFwbZnkCdlaq6XosmNlrYPNtYZPM46ooQ51l
 h7oZklUDNiPTg/PLo0PfbMDaQNIAmrHS5eP0G9bsjaXbhun+lGBowR+fCjEZGSaokn6PU0Bio
 J3TSBxWF15OREBKOGEzubtaVKuNxLlbnhji+Z4rBam7jQrRiL5HbANg4AtfQpkXwMj7704iUZ
 UCJniqcQNDHrq50x9TqEciPhm17tOksHoLCJAnmdg5MPecMC5A7BtRGEDHGtGJELXvjDUw7Uj
 LjNec50kho0vJtwXXVXs1oKL/xGDfW8krFq77SW3hdHHIxkDXfvLrFQdh73UtGxP0N/N7rEcp
 72zR2GH7JxO+8xVItZOPlGLeXB6yf5H235HE1sSUsO+d52iTwKLCp1IlglU+P5++irlKaz+qE
 JD+ZTcF/A4DjjlONhHerPdCSlBPdcp/JHArnkg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Silicon Labs is now part of Skyworks Inc. so update the URLs to the
datasheet and application note.

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
 Documentation/devicetree/bindings/clock/silabs,si5351.txt | 2 +-
 drivers/clk/clk-si5351.c                                  | 8 ++++----
 drivers/clk/clk-si5351.h                                  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index 8fe6f80afade..bfda6af76bee 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -2,7 +2,7 @@ Binding for Silicon Labs Si5351a/b/c programmable i2c clock generator.
 
 Reference
 [1] Si5351A/B/C Data Sheet
-    https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
+    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/Si5351-B.pdf
 
 The Si5351a/b/c are programmable i2c clock generators with up to 8 output
 clocks. Si5351a also has a reduced pin-count package (MSOP10) where only
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 57e4597cdf4c..93fa8c9e11be 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * clk-si5351.c: Silicon Laboratories Si5351A/B/C I2C Clock Generator
+ * clk-si5351.c: Skyworks / Silicon Labs Si5351A/B/C I2C Clock Generator
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Rabeeh Khoury <rabeeh@solid-run.com>
  *
  * References:
  * [1] "Si5351A/B/C Data Sheet"
- *     https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
- * [2] "Manually Generating an Si5351 Register Map"
- *     https://www.silabs.com/Support%20Documents/TechnicalDocs/AN619.pdf
+ *     https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/Si5351-B.pdf
+ * [2] "AN619: Manually Generating an Si5351 Register Map"
+ *     https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/application-notes/AN619.pdf
  */
 
 #include <linux/module.h>
diff --git a/drivers/clk/clk-si5351.h b/drivers/clk/clk-si5351.h
index 73dc8effc519..e9e2bfdaaedf 100644
--- a/drivers/clk/clk-si5351.h
+++ b/drivers/clk/clk-si5351.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * clk-si5351.h: Silicon Laboratories Si5351A/B/C I2C Clock Generator
+ * clk-si5351.h: Skyworks / Silicon Labs Si5351A/B/C I2C Clock Generator
  *
  * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
  * Rabeeh Khoury <rabeeh@solid-run.com>
-- 
2.33.0

