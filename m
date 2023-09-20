Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B4BCE79CE
	for <linux-clk@archiver.kernel.org>; Wed, 20 Sep 2023 14:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbjITOEh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Sep 2023 10:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236485AbjITOEf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Sep 2023 10:04:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1CAEC
        for <linux-clk@vger.kernel.org>; Wed, 20 Sep 2023 07:04:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b962535808so110821111fa.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Sep 2023 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1695218659; x=1695823459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+1FYQtXao8Yw3xmiSSXbsCd2slRgXlF0cJKkQ9uwuw=;
        b=fvWGL1FDWlDDIQdjhq4RBtPk/M4I83C260VqT4/XWdMpCpI8IGTNSZAiJ2aDcWPNYj
         GhS35BVCDT8Oq/O8VTpTq4eDtOpSF+K3TfMva8TlusPkGjr7K3h0PKhqc7ZaYlr8HE93
         ERMo4bWqNhFmFNK+sCPJLMIIhtm2vUE/9iFqsFRQoRQswnV1IXVGoZvm1zxLstHCcqGx
         0vo+PrKACrQQfZckVTINoc9pfkLoQCuUXkSbcEdy/+jxjb0TNPq7giQlWfw+XpxIewAV
         zt1HAUv+Sx+rNWpDdOYutVUfVUu9HPI0falAz2cD5ufSPeXLBtqbl7EJ2xh9FWiRyhmr
         8crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218659; x=1695823459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+1FYQtXao8Yw3xmiSSXbsCd2slRgXlF0cJKkQ9uwuw=;
        b=IOGDhwQQmpI5yByzYIZfoJIXRKTJeMRb35AtIzYWWhs9wrwMsB0NK+h71iUk85mK2K
         vMBdt8AmPHNJISXp+8kDhCafH+RkX3/iIrLBUl/1OMIesSqsz3yOLYZP0BtoCMJtGx5R
         rxTdBwcLofbfWxGaAbHpC7qtbwkwV0fQF3cqwVeKlOm1D5knVPlJ/LiVKNEUfhmcWqGZ
         K5h0NORzWLt+HvRMmxCpQJw5BxmX18hFnjqeN1gtNkJ74j3vgYYu6QRvW4MlIl1QOimu
         /g84QatFRgN6V0S2IvAl26+T2dpGPj9Iu6QBBMwaLAalGZT8+hkX1XN0QmLxgUlZY7oj
         q/OA==
X-Gm-Message-State: AOJu0Yxm/7Jy2KWLW7ts15opdnek+mqDyeK64AnsrXlO4tsnrGryev+f
        jWucq/YOdJhnF/XKi7TPGipfEdxSBUHa9Y7tKV0/GQ==
X-Google-Smtp-Source: AGHT+IEQTVY1dOxQ7FflbyCH6FG41txpgBQJW4pLB9FREGqvZ8x4GI4US/x2CxXL2cRI/3PVc5b4Bg==
X-Received: by 2002:a2e:8905:0:b0:2b1:a89a:5f2b with SMTP id d5-20020a2e8905000000b002b1a89a5f2bmr2445060lji.2.1695218659209;
        Wed, 20 Sep 2023 07:04:19 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906341a00b00993470682e5sm9397761ejb.32.2023.09.20.07.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:04:18 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Jacob Siverskog <jacob@teenage.engineering>,
        Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clock: si5351: add PLL reset mode property
Date:   Wed, 20 Sep 2023 15:09:54 +0200
Message-ID: <20230920140343.2329225-3-alvin@pqrs.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920140343.2329225-1-alvin@pqrs.dk>
References: <20230920140343.2329225-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

For applications where the PLL must be adjusted without glitches in the
clock output(s), a new silabs,pll-reset-mode property is added. It
can be used to specify whether or not the PLL should be reset after
adjustment. Resetting is known to cause glitches.

For compatibility with older device trees, it must be assumed that the
default PLL reset mode is to unconditionally reset after adjustment.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Cc: Jacob Siverskog <jacob@teenage.engineering>
Cc: Sergej Sawazki <sergej@taudac.com>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 .../bindings/clock/silabs,si5351.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.yaml b/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
index 3ca8d998c48c..b6692b323a66 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
@@ -50,6 +50,22 @@ properties:
       Pair of <number source> for each PLL. Allows to overwrite clock source of
       PLL A (number=0) or PLL B (number=1).
 
+  silabs,pll-reset-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 2
+    description: |
+      Pair of <number mode> for each PLL. Configures the reset mode for PLL A
+      (number=0) and/or PLL B (number=1). Mode can be one of:
+
+      0 - reset whenever PLL rate is adjusted (default mode)
+      1 - do not reset when PLL rate is adjusted
+
+      In mode 1, the PLL is only reset if the silabs,pll-reset is specified in
+      one of the clock output child nodes that also sources the PLL. This mode
+      may be preferable if output clocks are expected to be adjusted without
+      glitches.
+
 patternProperties:
   "^clkout@?[0-8]$":
     type: object
@@ -205,6 +221,9 @@ examples:
         /* Use XTAL input as source of PLL0 and PLL1 */
         silabs,pll-source = <0 0>, <1 0>;
 
+        /* Don't reset PLL1 on rate adjustment */
+        silabs,pll-reset-mode = <1 1>;
+
         /*
          * Overwrite CLK0 configuration with:
          * - 8 mA output drive strength
-- 
2.41.0

