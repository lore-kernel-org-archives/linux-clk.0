Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBADFCD98D7
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbjJJWuM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbjJJWuD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 18:50:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCDADE
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5521377f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978194; x=1697582994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=vN7waHZJ1fE/CcYNyfTXYtR8ERDdtYJIeDhLqJw291GcLJFX0KecEkzom/XHOdNdti
         lh27WpfR7TENnqJEARGDk6cc0Ul8d/VcwkIzlUDWFFKtC7ic84bbBag59onJclssMUCz
         f6UE6uptuHo7a2+XNvfxbfoLP3PHIH84ejURu0oc/+SHj9edGpmQ0hw75WvkEGN7hEUK
         ACuu3C+KI5TlSKlEqg2veCSGNnOMrd/HX4/BzNfTIvOirMFxe3fUHxhGXjt8/5SNp3Yz
         t3KyHDwttKWjdISUekGBnBPlnyFECEZhwLxLmaV5rTfhNCijzR6npZY/whodkuHqkjLy
         r8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978194; x=1697582994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=Vg31SWlSdifYL/mwuVhih4+qvyzQMv3pkbPcVJV9/1En21DNCm73ovG9uNW/kIRjkA
         eM5F7um34AMXNJLd4wyj005ZwAbxT566Ou3hWB99D2b4Yth0+JFMuF2za0XOfpZxtIVv
         /VjTvRA6Z7UAbZAdxLbvo/1EBJ3SpyIObHNQ5fFO9PD6BWNHxg8S4Tj7/JGIlqBzuGvu
         fOhUSqRqxM53jTqvhXEvXD2Lz7IfijETqUlIoj4DBS6Rij6ClFCILkFPqXrKUVAUX2dn
         Er22FkxL5lwVbV7KZdg1Z1PeuLAJaLx2HVLD/7va6X+Fxfk4lnp41obhmWjEkFTkfFHA
         jt0g==
X-Gm-Message-State: AOJu0YxUzbI3R1HWXl87JR4Rwyfm6Kt5o6IQ4VpZzJ2wqSUcvfDuTxtr
        xBtdhz670PTh74IhO7Kmat4I1w==
X-Google-Smtp-Source: AGHT+IEjsAdZZ2TrgAKTWEGnW3p1wMPoziKHfwDUL1AzluyyUU59YKFDtce6RDEjYzrGHYVBL9ceag==
X-Received: by 2002:adf:f40c:0:b0:324:8700:2fec with SMTP id g12-20020adff40c000000b0032487002fecmr15763212wro.64.1696978194557;
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date:   Tue, 10 Oct 2023 23:49:14 +0100
Message-ID: <20231010224928.2296997-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..2464bc43aacb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
@@ -134,6 +135,24 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      properties:
+        interrupts:
+          description:
+            Required for external wakeup interrupts. List all external
+            wakeup interrupts supported by this bank.
+          minItems: 1
+          maxItems: 50
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.42.0.609.gbb76f46606-goog

