Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC94FC76195
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 20:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjCUUKe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 16:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjCUUKd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 16:10:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C88C4AFDF;
        Tue, 21 Mar 2023 13:10:31 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v1so8851189wrv.1;
        Tue, 21 Mar 2023 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679429429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWnw8tQIl1eV2yzunsb3XCftBZMuQrLVFpbCt6WM/74=;
        b=HlYmfnfQ4BzlqB+bwgyqO8Eq6S/dB+y2NPaaHH+3KiFwsen70eI9ZoNh9PI4f2wZQb
         kwAPc9K0NHkBvpyXYVDhy4mprsyAgNnFymRSu5Xuwz7x8ujxRC/P1ZthWFQbvz/DyQ58
         HuUWE4k8SoEGBC2JFGtt29tpJGtm174HRtwxw63TXJ59cTZciTtbcW392+GszXOZZEtT
         +I1Fu++oJE+Nuif3gfkJEddZAP5VPN+40QmnAY0Ku+jx930733ArJIM/AO9PtfMQ7Q+4
         F1RsdyYtEgs7QDGln4fSwNKgiRB2cvFdnCl2CJ7b1H0kRaOBhJ+SUmPGpKVGIbBKubDJ
         gNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679429429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWnw8tQIl1eV2yzunsb3XCftBZMuQrLVFpbCt6WM/74=;
        b=3LVqUIiun7UhLSkLYgaKGvfw5/mE02n7v17N8+qiuvCoEyTyKDn+WECU5NSV+/kfra
         HzFNeSo9Kwj5wBbEPiUHro2qgTGBR7PjYzzRqDvK4UewQzw30TQf0wMsNOhbsPudNkYy
         030+J0oD6VBxVT4O/TTQbUMHw62Qb1Ukr8IRsGJWZ6LX0VmohkeUYpeXTFTvAR1RSvn4
         CH8oiNKpeKQzA8bmhZxokpkknRFTBZqq2BtN1uJdPgImWtezXNCdjZXWIPOraZu4Sdnw
         CId9cAIkHzmGfxb+DwFK8b64JG/sAECDVZblwPPRkiusV+ggiRIpUza3DHNiOuU0IbLQ
         MHFg==
X-Gm-Message-State: AO0yUKWkjS0b7HXABsdBHLaI7H8yiMFNEEO2B1H2TURvmnbTGXWyKD0h
        nXAeHnsLmj9rKX85C6y3HKQ=
X-Google-Smtp-Source: AK7set+3DIdHlqhcrd6oqC3P+07f8ehmA/TGtvm6ziiJVvtseHgLBK8KePvtfTfzBO78QBMScqkaog==
X-Received: by 2002:adf:ea86:0:b0:2c9:23c4:8f93 with SMTP id s6-20020adfea86000000b002c923c48f93mr3355724wrm.57.1679429429443;
        Tue, 21 Mar 2023 13:10:29 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id b13-20020adff90d000000b002c54c92e125sm12107693wrr.46.2023.03.21.13.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:10:28 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, p.zabel@pengutronix.de,
        f.fainelli@gmail.com, jonas.gorski@gmail.com,
        william.zhang@broadcom.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: clock: Add BCM63268 timer binding
Date:   Tue, 21 Mar 2023 21:10:21 +0100
Message-Id: <20230321201022.1052743-4-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321201022.1052743-1-noltari@gmail.com>
References: <20210315122605.28437-1-noltari@gmail.com>
 <20230321201022.1052743-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the Broadcom BCM63268 Clock and Reset controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v3: no changes
 v2: no changes

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
2.30.2

