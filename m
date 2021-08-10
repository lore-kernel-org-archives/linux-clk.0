Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9C9C43216
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D054B6101E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236507AbhHJJcx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:32:53 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:42874
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239097AbhHJJcx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 05:32:53 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0E53840634
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 09:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587950;
        bh=OzcbdzDbFX/7hdNHc1Uaa9h5AIzXuGJQ7WWbGJRZv2I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=s4IHJeV6bm9XYJ7hCRV5tq6xm0jKcBtwyzQyIDSsNeqkgj8z2x7F212gl8NA+lApX
         cS8g4rGwJBlqzYZE+uc0ucuzLYF949nJIStpaEwDo6Uo+XcsNoXDQcbGqCWz4yDn96
         +3fb2PQQn4YOIl2JhbzgVwc1wOG4HxInwOpBVRmEqQBW0NWqKHQnShwM5MhDBxsdEF
         jWXFc4Fo/kFEr1rIF6OTNGBJljWVFlr0TVthZEGrH5drVHeuT1IWQOxjjMwA20j44T
         PudpHNegvYEibsZNwsw/kdi6hU5mYPfEgX3KVyVOHgKTLDW5J60sZVsEuJ2ZUWmBfv
         UU/kuvSYuqv5w==
Received: by mail-ed1-f71.google.com with SMTP id d12-20020a50fe8c0000b02903a4b519b413so10488666edt.9
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 02:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzcbdzDbFX/7hdNHc1Uaa9h5AIzXuGJQ7WWbGJRZv2I=;
        b=MtmaT3DE+0BJo8GwGcJ5SUuGBmH905DgYtMF+sjeI5kMepfGaZcLGqm6zRyefrUuJV
         I4SECiN7heDc2Xv9tL5uQj7leOaBDN85aiXguS39Bo/figzDKj3kwnKEamWCoslcQlQe
         YujfyX02cMmjPpHlN8X0NN2kD4W9rNC3XU+yXOmXF/AA3HLVIjWXFm4hK2K6xArdadWs
         9h5ATS9XfXZvOqYA8TNoRtGuEqevJgQULBk/xsxb3gyUXygLl7nUHmx0pdLV7LRWBo1q
         iL5mDCy+0hvJ8V4k1uRehCN2okS6rN++nWbthjtZICJ8iTnVlV+LJAuugo+Ts8Y4MT0t
         VOig==
X-Gm-Message-State: AOAM530doFhAIBlNvJuolGpoEQC18NRuwcWaMADTe0YQ2bAMdtTtdEv+
        y3g0DmtAxrq+g6NdwUQ4lrU4ispT5ocmE7ZGnwixFf8Q1U90dqlI0K3sWq027+23eDnd1nL+ZoW
        DfldPidpuqcOTnzkEm0HIVarJzHEvWi3nnIOwPg==
X-Received: by 2002:a17:906:1919:: with SMTP id a25mr26443201eje.161.1628587949720;
        Tue, 10 Aug 2021 02:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEhq+DTJX3If44p8meBN5uqXskUe0qEC5dC6lsnCApRuAsi68OVH0j029oDIRI/IB9Bru+nA==
X-Received: by 2002:a17:906:1919:: with SMTP id a25mr26443186eje.161.1628587949557;
        Tue, 10 Aug 2021 02:32:29 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2 2/8] dt-bindings: clock: samsung: add bindings for Exynos external clock
Date:   Tue, 10 Aug 2021 11:31:39 +0200
Message-Id: <20210810093145.26153-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the bindings for Samsung Exynos external to SoC
(oscclk/XXTI/XusbXTI) clock provided on boards.  The bindings are
already implemented in most of the Exynos clock drivers and DTS files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../clock/samsung,exynos-ext-clock.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
new file mode 100644
index 000000000000..64d027dbe3b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos-ext-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC external/osc/XXTI/XusbXTI clock
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Samsung SoCs require an external clock supplied through XXTI or XusbXTI pins.
+
+properties:
+  compatible:
+    enum:
+      - samsung,clock-xxti
+      - samsung,clock-xusbxti
+      - samsung,exynos5420-oscclk
+
+  "#clock-cells":
+    const: 0
+
+  clock-frequency: true
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    fixed-rate-clocks {
+        clock {
+            compatible = "samsung,clock-xxti";
+            clock-frequency = <24000000>;
+        };
+    };
-- 
2.30.2

