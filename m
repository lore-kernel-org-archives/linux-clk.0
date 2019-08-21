Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A18C3A589
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9F7320870
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEJF5hUt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfHUCks (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Aug 2019 22:40:48 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38178 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfHUCks (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 22:40:48 -0400
Received: by mail-pl1-f194.google.com with SMTP id m12so475109plt.5
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2019 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=66HDQRzZHdTqJMzuH6Ul2StzM+H88/d/kw2iTDPPxiw=;
        b=IEJF5hUtFv+y59Inx8n1xsEI0wZhB+RMvwdTwBQEdA27ffmbh2cr4lEkXcrFjtzAyo
         ZakWSuBTFoOP6BSvKmpi8PFPHY8Hkd3B46AFxHMPz2qPRgWvcgJPfkyWXJoAsoDkopa9
         QMKBVl/HjnyAyzfnMla8jkO/81dxcLtkjIuoHzs4opQn5HknuO0ckgRYFSnhI+op4kHb
         o3XVP+PpfhdbMQ41zImtOVlBZ0NpC3tQ4ZTTfA8u3omIQ06Ly+c2QxWzSof5Qyh1DNfD
         b1h5TuSeMBgRZMaOdKtOedjKed2gPlhbAVkhlJqJu8vNJQrupu7WV9+uSeITUoATjX9k
         E2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=66HDQRzZHdTqJMzuH6Ul2StzM+H88/d/kw2iTDPPxiw=;
        b=MzvokVfYDdm7gnAuXJeWQXFcAunmI/r1Zw9ZjzA8Ru6HdPg+s2N3rL7Lo1ZjCccueT
         mUot/voLBlSyENhYYpbpR8cgIgAxZ2L6txnlUgBia7ZWbN+5zB4dI+23He2qNlYEDwsp
         OP8irVHM9bina4cio7rDdebKrpau/FsclO8zyeK5mgFhvYrTAUrjLo3tbM8kXsectGuV
         3lq7OvmI8Sf2g57Ap/Gg7lnzIlkU8R+pftMiXY2e9idKHCGJyZZS6nyv9qBlh/oli1wo
         DocFmbhv34lcjuvry/rtnMtkkwNBwgjStQWUYAg5/3T2rB/RHq52/rKnsdCQuYgURuSv
         P+Fw==
X-Gm-Message-State: APjAAAUXEfzWaGlrMdJwK3VnRutmglJRjI4VK5bBvxWVMTSdzCUK8OXo
        SiXD4MfuiQyHtjS6OPRvWGIk
X-Google-Smtp-Source: APXvYqw4z1lUeLa7hhwNhxLpxYMtmgc2ZQdhZdONdZIKJ46sgEl2aFe3EpqIHVClUxJqKgthgh+yVg==
X-Received: by 2002:a17:902:8d95:: with SMTP id v21mr32091053plo.267.1566355247485;
        Tue, 20 Aug 2019 19:40:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7101:175:ddd7:6c31:ebc7:37e8])
        by smtp.gmail.com with ESMTPSA id b126sm26091608pfa.177.2019.08.20.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 19:40:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: mmc: Add Actions Semi SD/MMC/SDIO controller binding
Date:   Wed, 21 Aug 2019 08:10:09 +0530
Message-Id: <20190821024014.14070-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821024014.14070-1-manivannan.sadhasivam@linaro.org>
References: <20190821024014.14070-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree YAML binding for Actions Semi Owl SoC's SD/MMC/SDIO
controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/mmc/owl-mmc.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/owl-mmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/owl-mmc.yaml b/Documentation/devicetree/bindings/mmc/owl-mmc.yaml
new file mode 100644
index 000000000000..f7eff4c43017
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/owl-mmc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/owl-mmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl SoCs SD/MMC/SDIO controller
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    const: actions,owl-mmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: mmc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    mmc0: mmc@e0330000 {
+        compatible = "actions,owl-mmc";
+        reg = <0x0 0xe0330000 0x0 0x4000>;
+        interrupts = <0 42 4>;
+        clocks = <&cmu 56>;
+        resets = <&cmu 23>;
+        dmas = <&dma 2>;
+        dma-names = "mmc";
+        bus-width = <4>;
+    };
+
+...
-- 
2.17.1

