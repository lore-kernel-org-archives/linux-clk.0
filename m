Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473B8E8FDCC
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 06:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241423AbjJDGht (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 02:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjJDGho (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 02:37:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746F3B4
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 23:37:39 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso312183166b.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 23:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1696401458; x=1697006258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QGSDNn6mvgk3D6FylGr3G9S7gB7eM4JL0YqBrEuXRo=;
        b=cgmX09quanarZet8h2P8+bVl4u5yT293Uyg+CS01qEtYIdB5Ll1Uoylfwku5GapOAF
         iSvfccmHbYCWkAxZPpbNsqdK1CWQO9Wa+FNGWRamNFwLI+9W3uY/ErB93u4MhKZWV9MT
         NxxVZH0pHIoajQZrrcC/kGxr0lhUB6JhzrAD1iqfjWXh9RV6WK06rRDBHYkGxzJuB5t/
         Yb2ZkODMkoX6RlXdhRTaiN4XNDtQ4f9V0RMPnS2X/qqlET8ZFSSvf8RzBD8PdShRBwFZ
         pX0beRB3nQIJd0Mx4FzrU9NBNGlAoLqsglGCwY7ljeZnUDKXOXQPN6qbUWMl6X1H7ybf
         ojYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696401458; x=1697006258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QGSDNn6mvgk3D6FylGr3G9S7gB7eM4JL0YqBrEuXRo=;
        b=JIUvl3z/cR4ieUpIOJRZw2Sd+kLnS3hwqu2tObIvo0t/xS8OtwI2Qze7mSGW8FA4vr
         IPt5ykoyd1h2lyKQa3Q7MZSVA2CQZJvIrj/xzu2CwHVgoapfhFoX0v28Rp2rWrDuu1KA
         YGOpEIHBkJ7GkzIEEFRx2w+Ec5uu2CnOBDZDVRZzsBQ3nBL4J743eqNMmNu/Sk9Ay9FD
         geRpSN1MnEkU/oREFCm7GeSHPldk8dIyrpu2R/pXINj/n5EDe2oMIoISkeKgluBwYwLm
         jINGqbEfyCzAfVWdVocyLTa+1CGycO2UlMZrj+d51Qc7BP9ket0I8017gnSQu3LUgQxx
         ETDg==
X-Gm-Message-State: AOJu0YwTPsWqIc3FaccYkWqx+kEDs+PQPqK8jzA6mwPP+hWGM3TnzKdY
        A1XXjCmN/BfLwoOme42THdcHBQ==
X-Google-Smtp-Source: AGHT+IFndInI3ROJr7Xma3uL1HuF3MxWN7W2vtrRlnwhIYSMbBbuFCG3VE4WjMo60/MNXEXTe2yByQ==
X-Received: by 2002:a17:906:7492:b0:9b2:d018:20b2 with SMTP id e18-20020a170906749200b009b2d01820b2mr1372868ejl.39.1696401458083;
        Tue, 03 Oct 2023 23:37:38 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id jx14-20020a170906ca4e00b009ade1a4f795sm2193507ejb.168.2023.10.03.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 23:37:37 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     Rabeeh Khoury <rabeeh@solid-run.com>,
        Jacob Siverskog <jacob@teenage.engineering>,
        Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] dt-bindings: clock: si5351: add PLL reset mode property
Date:   Wed,  4 Oct 2023 08:35:29 +0200
Message-ID: <20231004063712.3348978-4-alvin@pqrs.dk>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004063712.3348978-1-alvin@pqrs.dk>
References: <20231004063712.3348978-1-alvin@pqrs.dk>
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
 .../bindings/clock/silabs,si5351.yaml         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.yaml b/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
index 400c8cec2a3a..f1be09b5c48c 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
@@ -53,6 +53,27 @@ properties:
         - description: PLL source, XTAL (0) or CLKIN (1, Si5351C only).
           enum: [ 0, 1 ]
 
+  silabs,pll-reset-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    description: |
+      A list of cell pairs containing a PLL index and its reset mode.
+    items:
+      items:
+        - description: PLL A (0) or PLL B (1)
+          enum: [ 0, 1 ]
+        - description: |
+            Reset mode for the PLL. Mode can be one of:
+
+                0 - reset whenever PLL rate is adjusted (default mode)
+                1 - do not reset when PLL rate is adjusted
+
+            In mode 1, the PLL is only reset if the silabs,pll-reset is
+            specified in one of the clock output child nodes that also sources
+            the PLL. This mode may be preferable if output clocks are expected
+            to be adjusted without glitches.
+          enum: [ 0, 1 ]
+
 patternProperties:
   "^clkout@[0-7]$":
     type: object
@@ -207,6 +228,9 @@ examples:
         /* Use XTAL input as source of PLL0 and PLL1 */
         silabs,pll-source = <0 0>, <1 0>;
 
+        /* Don't reset PLL1 on rate adjustment */
+        silabs,pll-reset-mode = <1 1>;
+
         /*
          * Overwrite CLK0 configuration with:
          * - 8 mA output drive strength
-- 
2.42.0

