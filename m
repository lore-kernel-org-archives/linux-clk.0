Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44504E743EC
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 05:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbjI2FmJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 01:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbjI2Flb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 01:41:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266581FC9
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:40:01 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso64322566b.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965999; x=1696570799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wor+2ysYovWwz79wDHgf6lw48XDzirr+UHoMWUaKK0I=;
        b=hv11lyyqdIZllhGvop+tiXsvBx+tCxEzKcTeHASCgpgZ9P2/FvzCwN43vmBXmgW9lU
         WT5FouJdYvDCClB9VU8nBoiBZb5IbUKYe2aHIZmaGrBOeqt4xX/1SiDuj4zEQF83xA6+
         XPqTN8YFTydiGU2wCnBNzQDIkhWp6pm6D5htLXIX+W4tzaxfm6A6BkQe2tPyFeyDhDK2
         qV1AcaIYCZlwbLFSMgIxEdEgpIzgUij3uquB0kjLpJ3FrfUB4hIJD5MZ1mvvdZn+6JQX
         l3IAv6QWf/bAzaRyzleVx0O5xlLqVd8BCDO6ZDyenLshiMqa12ghthwRxc3vqXZ+egsT
         wPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965999; x=1696570799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wor+2ysYovWwz79wDHgf6lw48XDzirr+UHoMWUaKK0I=;
        b=xPSZ6Q6YhLkxlMCdso8nT7SDgbVTAEzwh8xvoGPsT2RM0pFtASQYzhkxRZDl+drEh6
         y7J9Gk/ZTiCuIjmvE/RNPp442jJrS6AAO6zLXERdK1PlpyZGQzRgJJc7UgVy+bA75kKp
         cN8w9tpB0SWKcNWTEgoqELxjLWnwQssbaNtrAHSEW1aCrV0ZrHSBZUOPdNThiLO1vFk6
         os8TcL0Zkhr+M0rH7ZycgCutKXv3XRbgS89y7ez3ZmwDuGtuiOwtMPPkkxKPVGXwmBw1
         Ae0d5LKDtd69RXM/x0qv2Dl3fJe8aXvd7MLF+HOvsWC8USnBme2Rv6xkwJS9R80eMLQP
         GHJQ==
X-Gm-Message-State: AOJu0YwPAOLr7qjrhh2VwtS5JXQ5aP8FC1moAdTrUDvg9dZ57JTdM1A/
        9mFCsmXeRdOslOrnW9ZV9ClB6g==
X-Google-Smtp-Source: AGHT+IGuHtC57n+o1bpWpASywaDobhLzZbsZm4sa2GVeKsCcbnMjDU8gtdTIYb+NLm0dPD1iTjOvRQ==
X-Received: by 2002:a17:907:948b:b0:9a5:aa43:1c7c with SMTP id dm11-20020a170907948b00b009a5aa431c7cmr3069995ejc.26.1695965999656;
        Thu, 28 Sep 2023 22:39:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:59 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 20/28] dt-bindings: pinctrl: renesas: document RZ/G3S SoC
Date:   Fri, 29 Sep 2023 08:39:07 +0300
Message-Id: <20230929053915.1530607-21-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add documentation for pin controller found on RZ/G3S (R9A08G045) SoC.
Compared with RZ/G2{L,UL} RZ/G3S has 82 general-purpose IOs, no slew
rate and output impedance support and more values for drive strength
which needs to be expressed in microamp.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- defined drive-strength-microamp as general and make if/then schema to
  not allow specific properties depending on compatible

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index eb726770f571..86228ba69aab 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
+              - renesas,r9a08g045-pinctrl # RZ/G3S
 
       - items:
           - enum:
@@ -78,6 +79,21 @@ additionalProperties:
         - $ref: pincfg-node.yaml#
         - $ref: pinmux-node.yaml#
 
+        - if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    - renesas,r9a08g045-pinctrl
+          then:
+            properties:
+              drive-strength: false
+              output-impedance-ohms: false
+              slew-rate: false
+          else:
+            properties:
+              drive-strength-microamp: false
+
       description:
         Pin controller client devices use pin configuration subnodes (children
         and grandchildren) for desired pin configuration.
@@ -92,6 +108,10 @@ additionalProperties:
         pins: true
         drive-strength:
           enum: [ 2, 4, 8, 12 ]
+        drive-strength-microamp:
+          enum: [ 1900, 2200, 4000, 4400, 4500, 4700, 5200, 5300, 5700,
+                  5800, 6000, 6050, 6100, 6550, 6800, 7000, 8000, 9000,
+                  10000 ]
         output-impedance-ohms:
           enum: [ 33, 50, 66, 100 ]
         power-source:
-- 
2.39.2

