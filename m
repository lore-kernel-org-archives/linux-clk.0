Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17299C83003
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 14:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjFIOJK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241063AbjFIOIm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 10:08:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E193A86
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 07:08:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9745baf7c13so273224266b.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 07:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319674; x=1688911674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vuuH12IFYzE8hSEom6ACjhga+vJ8Y/H3cnZUjmxwo0=;
        b=JtP8ZGwKiKVR9ztC07TLerrR2Uxqkt5Ox3XUhN0+sESN99DQUWXct7i1n4UUWpjCjW
         /PbkfRUGBAQ+bmuqF5p3hOmnG9mO43gbKoSKbh77vKQ2l+cvecsCYETjHxG1AUhlnjHB
         oplUWEUtsY3z+rLu58KPl0HQdEY47WZic5K0JTkmPHBMcL6dl2d5KwF0narTk9/Ux4kb
         /vQS1Qmjy6G6BXHiPk3U4pk2pepOfGfRvi0sOK6luWZz4pvabw5jC2qtln4SzI21HgqC
         dOOY6z+757Ds0KILE1JmuyoOJH9K0o94pjOUz+0TKqCv/u27YU3/Qjc29pIoiS3c29qZ
         kdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319674; x=1688911674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vuuH12IFYzE8hSEom6ACjhga+vJ8Y/H3cnZUjmxwo0=;
        b=UjrSrKBI1Crmu4KyIw3VFMUQeZY+UShjxWe7OObdwFBaw2YObdm9nYEXI3xz35AUV1
         /5m1FObD7tJ/gKzKJJxFoncYP/i8c/OVwJFQzjvTaNEOYPQnXBlJqZTZVD8HM2Bdxh8C
         Ik/U2el7fvZB1YfJUgOvjH2B9Fi5Lvw31H8cYowiWOpi3B+Eki/Wepzj1/iOqJCacLHL
         VsauSNELYZsmWqFWKgj9Zdwi6BaEvuY2jgbriA3kNDE5jeLIWEUPqT3rGF4K3X3x0Jq2
         Mdt18GqgWIdbkpFTn77I2DDmBf1GDguG5ZgFS8hC3QtYZspi+vY0jP4pB4SU2cZE9pTH
         iXqg==
X-Gm-Message-State: AC+VfDyLHPlt1vt1LelfsIIitvPbtZNI/R+Yjp33BkRmtnk3b43O/H/D
        2iMQP4y+GQ1SDiuUss0XQY2miQ==
X-Google-Smtp-Source: ACHHUZ5MsU3kZrlq0EHll8zAjRlT4wiVMedsx6Lb2KqQmJZoJPwkDb+hz8M5k8j3xnrrBkI/nyEgtA==
X-Received: by 2002:a17:906:ee82:b0:96a:ca96:3e49 with SMTP id wt2-20020a170906ee8200b0096aca963e49mr2011879ejb.13.1686319674156;
        Fri, 09 Jun 2023 07:07:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o17-20020a1709062e9100b00974c32c9a75sm1317644eji.216.2023.06.09.07.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: drop unneeded quotes and use absolute /schemas path
Date:   Fri,  9 Jun 2023 16:07:51 +0200
Message-Id: <20230609140751.65129-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.  Also absolute path
starting with /schemas is preferred.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml      | 4 ++--
 .../devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index 9e733b10c392..509df06b9c9d 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -98,9 +98,9 @@ required:
 
 patternProperties:
   "^usb-phy@[a-f0-9]+$":
-    allOf: [ $ref: "../phy/ingenic,phy-usb.yaml#" ]
+    $ref: /schemas/phy/ingenic,phy-usb.yaml#
   "^mac-phy-ctrl@[a-f0-9]+$":
-    allOf: [ $ref: "../net/ingenic,mac.yaml#" ]
+    $ref: /schemas/net/ingenic,mac.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
index 99686085f751..26d94cedc871 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
@@ -48,7 +48,7 @@ properties:
 patternProperties:
   "^dma-router@[a-f0-9]+$":
     type: object
-    $ref: "../dma/renesas,rzn1-dmamux.yaml#"
+    $ref: /schemas/dma/renesas,rzn1-dmamux.yaml#
 
 required:
   - compatible
-- 
2.34.1

