Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:38083 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752289AbdGaMmo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2017 08:42:44 -0400
Received: by mail-wr0-f179.google.com with SMTP id f21so122263169wrf.5
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2017 05:42:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: clock: gxbb-aoclk: Add CEC 32k clock
Date: Mon, 31 Jul 2017 14:42:36 +0200
Message-Id: <1501504957-19476-4-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1501504957-19476-1-git-send-email-narmstrong@baylibre.com>
References: <1501504957-19476-1-git-send-email-narmstrong@baylibre.com>
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

