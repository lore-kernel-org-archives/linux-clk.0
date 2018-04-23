Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42493 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932244AbeDWTfR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Apr 2018 15:35:17 -0400
Received: by mail-wr0-f196.google.com with SMTP id s18-v6so44350347wrg.9
        for <linux-clk@vger.kernel.org>; Mon, 23 Apr 2018 12:35:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: meson8b: export the NAND clock
Date: Mon, 23 Apr 2018 21:35:08 +0200
Message-Id: <20180423193509.30584-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
References: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Export the NAND clock to the dt-bindings.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index dea9d46d4fa7..a60f47b49231 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -102,5 +102,6 @@
 #define CLKID_MPLL0		93
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
+#define CLKID_NAND_CLK		112
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.17.0

