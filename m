Return-Path: <SRS0=3VTX=3J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560EAC2D0DB
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3275122314
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgATNlB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:41:01 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45740 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNlA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jan 2020 08:41:00 -0500
Received: by mail-lj1-f194.google.com with SMTP id j26so33850477ljc.12
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2020 05:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b7IcMZOZRKM7wABCjaraoN1BhMpdfzJuK/FcI3+K21A=;
        b=k3FpUKfo+mODjSIOgegQ1MOZUHqm0b7/5a/5bJ3KPpzOQ3gVNjyfTFQK0wANiUBHo8
         zIhDtGuMU7YXFb3vRb3L1oaNMd6f9iul/XD7rR9DPFcAfrLKO92LnU5ccTL5l2vajjv2
         JtR0pAw5u/xyTk6IPsXFjD1WwNrnHR40LAl9k4icma02JqiuS/v2sUpd2APUBWEQKHKx
         wRkblBnKUJO4uRoO3ZQImBntikI/QqWaVUeIt+YDfO5xDw82/sRPZgrfuMU1+VWjGeA7
         grsPvdMpKLURzaA20+FfgGdHaxM7+kQFekHZr0cwQb183zDa7FWFbNMoqKAQcu1qmnoL
         rEyA==
X-Gm-Message-State: APjAAAX/MwwUsZD4nU6rcELfQgQ69dtd45KaV7l6tIM2XfYVfqZLOMYt
        phX4dHd0Y48WeLIC9BCBqw9ZFUte
X-Google-Smtp-Source: APXvYqxfndlZOCtH4biUMPw/hbnhZkJFqaT1jxxYoYrXIl14m6UFmNgQKG01EWNDQ4AVf3Rvi2hyMw==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr12793672ljk.163.1579527658998;
        Mon, 20 Jan 2020 05:40:58 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v16sm3912512lfp.92.2020.01.20.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 05:40:58 -0800 (PST)
Date:   Mon, 20 Jan 2020 15:40:47 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: [PATCH v13 01/11] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <35bf147cc3077ceda9689655e5a23dad8098dbb2.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 .../bindings/leds/rohm,bd71828-leds.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
new file mode 100644
index 000000000000..b50f4bcc98f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/rohm,bd71828-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit LED driver
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  This module is part of the ROHM BD71828 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+
+  The LED controller is represented as a sub-node of the PMIC node on the device
+  tree.
+
+  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
+
+select: false
+
+properties:
+  compatible:
+    const: rohm,bd71828-leds
+
+patternProperties:
+  "^led-[1-2]$":
+    type: object
+    description:
+      Properties for a single LED.
+    properties:
+      #allOf:
+        #- $ref: "common.yaml#"
+      rohm,led-compatible:
+        description: LED identification string
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/string"
+          - enum:
+            - bd71828-ambled
+            - bd71828-grnled
+      function:
+        description:
+          Purpose of LED as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/string"
+      color:
+        description:
+          LED colour as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+
+required:
+  - compatible
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
