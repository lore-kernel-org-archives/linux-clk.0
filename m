Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46664E95A82
	for <linux-clk@archiver.kernel.org>; Sun,  8 Oct 2023 11:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344694AbjJHLN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Oct 2023 07:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344679AbjJHLNv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Oct 2023 07:13:51 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC71C5
        for <linux-clk@vger.kernel.org>; Sun,  8 Oct 2023 04:13:49 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9b9faf05f51so384900366b.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Oct 2023 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1696763628; x=1697368428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGvwmv7blnoHjX1qS2bGhDolAncwyiZsBGNZLg6R4Cw=;
        b=QWv/4MZhau5K2WfbYMvWbSjkfR/1c/JF5H9j5lj7RcDbGAE9cCMOfES00twBrFvm7Z
         RRz0TrykTvAuW6CIKVRKVXQZEda4yIblC0ZVI2sNAEvdGT2XMEviSGA4ZzacgpkIAbHU
         +Gz9ZADJs2j/DDm8llnjRp3mXDh0U/EoBQMfim5BNzAmaOTlBWnN7UBa0bpBPExrTc4z
         FkkO4A0vFHi1To86aGiFEOe8bm7BoVDkEddPafQCvTH2goDf1EKSJg+X0HQUEeWx4Ysf
         tYIef/zCUN+vmtphDBNBi/wQ+abQUzsuWtiIbLM0XchYHw0CNbiYbJfVWEBrkKZbgJcx
         /sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696763628; x=1697368428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGvwmv7blnoHjX1qS2bGhDolAncwyiZsBGNZLg6R4Cw=;
        b=RG/MuPbrvYjjj7Gj8NfMK83kHpShBZkXoBfqm0FNsivWZrfoUoYEd7AhVvrzBHCaiN
         eCmtW72czT91YsTheljMOlq9tJ2dy+l9T2ntIWCkTHNBNLwV9/ZLbMAVNtHZPqAPOwuJ
         0YRiMwE2M3v/0msdN0qNwmMmxJict8NwVPeK2mzP6JraQlDBaD6STy9UQfGiBJVkltR4
         StoKY1egxL0ldASuHEODYWvtGYQWXAIT3t2Ngmi/iVdJLBFF1T/8KB1W1uuo+mIhGQUe
         UxwK5xAbiW8Gls26S0RRbuCgcR1xd8HuUQqEqNSHJPCcTuK/+8vqHY2oS2GvOfZyZF+F
         RZpA==
X-Gm-Message-State: AOJu0Yyy681TKn1t6noB0JnmiSIm5kMZOXdyhsil73QgYx6oR5FDsb6x
        nFEC/EeHN9XHA0tiGOHAx9BM2Q==
X-Google-Smtp-Source: AGHT+IE0QA27/V+vCqomxsUSXZAqQdvYTkjRYYSLNt6jPoolnR8WC8vIMJw/yOTtDhMBgFUY9V5PxA==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id e22-20020a170906315600b009b2b71f83bemr11113918eje.1.1696763628206;
        Sun, 08 Oct 2023 04:13:48 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id t3-20020a1709064f0300b009b928eb8dd3sm5383396eju.163.2023.10.08.04.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:13:47 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: clock: si5351: add PLL reset mode property
Date:   Sun,  8 Oct 2023 13:09:38 +0200
Message-ID: <20231008111324.582595-3-alvin@pqrs.dk>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008111324.582595-1-alvin@pqrs.dk>
References: <20231008111324.582595-1-alvin@pqrs.dk>
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
index 99c4e2271b6d..9a36d1f55c18 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.yaml
@@ -56,6 +56,27 @@ properties:
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
@@ -198,6 +219,9 @@ examples:
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

