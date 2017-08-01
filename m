Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35084 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752055AbdHAL5J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2017 07:57:09 -0400
Received: by mail-wm0-f47.google.com with SMTP id m85so12511832wma.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Aug 2017 04:57:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3.1 3/4] dt-bindings: clock: gxbb-aoclk: Add CEC 32k clock
Date: Tue,  1 Aug 2017 13:56:58 +0200
Message-Id: <1501588619-10991-4-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1501588619-10991-1-git-send-email-narmstrong@baylibre.com>
References: <1501588619-10991-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchadds the clock binding entry for the CEC 32K AO Clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/gxbb-aoclkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/gxbb-aoclkc.h b/include/dt-bindings/clock/gxbb-aoclkc.h
index 3175148..9d15e22 100644
--- a/include/dt-bindings/clock/gxbb-aoclkc.h
+++ b/include/dt-bindings/clock/gxbb-aoclkc.h
@@ -62,5 +62,6 @@
 #define CLKID_AO_UART1		3
 #define CLKID_AO_UART2		4
 #define CLKID_AO_IR_BLASTER	5
+#define CLKID_AO_CEC_32K	6
 
 #endif
-- 
1.9.1

