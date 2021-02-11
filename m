Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF550C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C81F764DE7
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhBKFYB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhBKFX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:23:56 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19913C06178C
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:37 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id b8so2721209plh.12
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AogpeLuC6h2kbFRYh8jcxM2VMpLXaY9SBeWFYBbrCSA=;
        b=qemjCONMGzAQ0NwTu3cqoW70NuUDn+rAE++LbZMHgRYAkzC3ZjriXPCHEL1nsC+e8k
         XlkeRggIgE9Y1wJcFeFWB0SXButixlGaBGIRn/qgK3XKgWtEUgaJBtOfSKHKOkRpnAy9
         HJJrybQubhkyq8srL5lq26fpkNB4K8I88ydcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AogpeLuC6h2kbFRYh8jcxM2VMpLXaY9SBeWFYBbrCSA=;
        b=UCgUXFcRD8GXyGDX/NEh0ocQH8z5ByKu/HAGUukKVpCEijEHp52EvpCSEyGChLdeF5
         fBUQEOJgRkRW4Ha38/q6nQS0qo44fRpASJNRetZx7JUe24sJEiQqFTJkjZhllZL0YW8e
         EpfMl+RrOfwinvNKCo1lFwYSVPQzjFOJS0beHH+7kaieS1TTEn+h9CER8oyRu3iqAInu
         FjHlvqjxKqrsEh61EjznmODFS4pwrhpmqwyzeuuqQpcnbjIvQfpQoRI7hWdTTzA8T8It
         wO4v+hzulmyTVUOJNES6R3GE265B18G5P8TYe48Qql9/OuQpyKg01cGP+os9uMFP8ALN
         QDwA==
X-Gm-Message-State: AOAM530/RFbHavZcvodIckKAIdot2ojCTzjmBPlnwFKylgMxwWxZnwnS
        EMHmcjlKeY+HfW3yamuj/vYcV/QJ3OjOthcl
X-Google-Smtp-Source: ABdhPJy2wFjME1q+iuw0xrlRvsS0mzOVToh4DLZZpe6O9KBDNwverFfIK2xGmM4pNCocfDDhCQ9WNQ==
X-Received: by 2002:a17:90a:bf0c:: with SMTP id c12mr2446478pjs.36.1613020956478;
        Wed, 10 Feb 2021 21:22:36 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:36 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 2/7] dt-bindings: clk: mstar msc313 mpll binding description
Date:   Thu, 11 Feb 2021 14:22:01 +0900
Message-Id: <20210211052206.2955988-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a binding description for the MStar/SigmaStar MPLL clock block.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/clock/mstar,msc313-mpll.yaml     | 46 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
new file mode 100644
index 000000000000..0df5d75d4ebc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mstar,msc313-mpll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/Sigmastar MSC313 MPLL
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  The MStar/SigmaStar MSC313 and later ARMv7 chips have an MPLL block that
+  takes the external xtal input and multiplies it to create a high
+  frequency clock and divides that down into a number of clocks that
+  peripherals use.
+
+properties:
+  compatible:
+    const: mstar,msc313-mpll
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    mpll@206000 {
+        compatible = "mstar,msc313-mpll";
+        reg = <0x206000 0x200>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0622ff96ca2a..d004436c8860 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2145,6 +2145,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
 F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
-- 
2.30.0.rc2

