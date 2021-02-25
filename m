Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99205C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F75864F2C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbhBYTpN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 14:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbhBYTmr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 14:42:47 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB141C0617A7;
        Thu, 25 Feb 2021 11:42:06 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h98so6391405wrh.11;
        Thu, 25 Feb 2021 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TppbudApKqr9/1vLshZjoZZ44X7zamO26bYYtZloWoI=;
        b=eIgyIS/gpaPAvJ5lAlzqS/RHBxBpjnylUGEB6FBeiLubUWRwPgYGUGXL7wVrb1ZYE4
         hZMgNk9IpbLDe6nGWq+RHbBlRD5uLJem7/Sxn+n6OeV1So3icsP8+Zbx+2iPYTGkW+G9
         2Zs/XgONnGCwpHAJWZQhczEBIas8T66pC0asivLk34J5BoG1WBgfaagJYfu+TFPfRPh3
         aW8+hSREIaYlWRivlfvIOqzRD/Z0s7ax5A/ZaJiDo5LrCMhmirW8CA5g/ggfYU3pHx0+
         yAWOPHhBdtaKrycI68E++lOxqk+PxsWQ2y+aSn4rA6ZyBpQBKvqAnQtNbdXuvooJusmY
         NMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TppbudApKqr9/1vLshZjoZZ44X7zamO26bYYtZloWoI=;
        b=FKyv55Z1pvm+ZqJylGyDJogxRdJhdDeX6GFscU2/Z4uYD5Ou+fm/ZM1prrzQNQV2uu
         79bHZF/1rvuBEZC5comSXqf7uOFezo1zwjnRVqitaOq1Uyl3yo9C8T7oSxQgGsoGSQS7
         wGkaPtCxQJHP8lHnWZnyjYXi8Koe0RVjMTmvsp89eB+cp5S1Ka4MGtKAFWzUmE2ghsai
         9rZ6a7teuxZlF/fgToQM5nsq633EcNDOD96AdZSzzCELTaseNATtaDozfqmjWCJyXk4h
         BiZnDVDL+u7WMdztU86jZTaBqG0MMm3O4/0UtF36IH4O09eeG1uj+RbkGRUCOG33GOBe
         zlmA==
X-Gm-Message-State: AOAM530lR0/fk7grYPHwk0xB7ybazqMQAFyXhYMRL+qNIWXZFtlBSE77
        63Ja0fG58waRUgy18yk+ygY=
X-Google-Smtp-Source: ABdhPJzHl21x25rdO7cTnp8FkrKnWKUUQJvvA3PRQ8LVVWScL7D4+Z4Sz6+7ehSCxYTtE32z4lLH6g==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr5043140wrw.355.1614282125449;
        Thu, 25 Feb 2021 11:42:05 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a198sm890603wmd.11.2021.02.25.11.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:42:05 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: clock: Add BCM63268 timer binding
Date:   Thu, 25 Feb 2021 20:42:00 +0100
Message-Id: <20210225194201.17001-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225194201.17001-1-noltari@gmail.com>
References: <20210225194201.17001-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the Broadcom BCM63268 Clock and Reset controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../clock/brcm,bcm63268-timer-clocks.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
new file mode 100644
index 000000000000..199818b2fb6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm63268-timer-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM63268 Timer Clock and Reset Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm63268-timer-clocks
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    timer_clk: clock-controller@100000ac {
+      compatible = "brcm,bcm63268-timer-clocks";
+      reg = <0x100000ac 0x4>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.20.1

