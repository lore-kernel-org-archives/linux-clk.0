Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B89C43217
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F0860F57
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241431AbhJHLoz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:44:55 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47764
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243324AbhJHLnm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 07:43:42 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E734B40002
        for <linux-clk@vger.kernel.org>; Fri,  8 Oct 2021 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693262;
        bh=YenCxJtlGV3PQlymT33h0MoUTyi5idKH+CvjTblUKV8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jMvxH1CwIT/9CBvh3h0vlXkivI6eRQceXXIPMJkT3jhsCkoJshhCfffBU3avyQBL8
         zuJLF5TAemahK9bzlqZ3uqHIa+H4SGRnoJwO4+wvzLqLvbyOc1egqsDL59vjtPT40i
         3LrrpN+yPvRf6rCQAXuvv4ZX8hG/e5f8gZjRv3gEgfcyfRVdAx1SsFN9b1UhEJYEJi
         uOZsVst/LlHlZIVmJXnlBxi8KqdQ+ST7z6bQlPcMGOdMOM/4bWkkvSbdDr9aNy8p9v
         eh6uH9kfMwHgpepLATrpITtNQGYjq93E6lt5V0T57FfYzlW8/c9WkTL++l9Jz49423
         vUAY6U1nHJCCQ==
Received: by mail-ed1-f70.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso8907212edt.11
        for <linux-clk@vger.kernel.org>; Fri, 08 Oct 2021 04:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YenCxJtlGV3PQlymT33h0MoUTyi5idKH+CvjTblUKV8=;
        b=tAJBDb8M04B6ydRj7nMD1EHYmF7M6KTL5IQf5HZm+in5gCes9rwleoXWI8vdsNSt9/
         owMBeEMjq1TxCxocF8N3KXNcM5MWR7I9qqfDtUDhG7hEuITZXQz44xWomMBrTezM4Q3S
         8IWzFoQ1r0GshkNg33LPVJgbZ3S9bph3iwIJJu6EyRWLxRxxspes8R0WE6Bv5swMlJB0
         0UWQte1lRZjwwUcSShLRnE2o4n4hGr3qYxGcfJs9M7Bn6D2kfJl1hrDZHidHRcATp/V0
         sI3dnZ/L5tTflS+0kS6ARKFIpnz53ins6Ppld5cspOMfcqrHHLOuUWpWv+IljyV2BVRD
         89GA==
X-Gm-Message-State: AOAM532hhmi3sHvRgEcTWeP0ELZ0FQgGeA31HcZPcUTXBsN8eEO8hmpW
        Knkgg9UYdOTrNF/HfScF3HuxHlnV2bixEaMwaS8ddIusBXeYu1jwRs1s0PzvmomAVA6oxZcqCcS
        ri/azGDQMIXFAefjnS5ofwBfz2C6/+MH4lCv9VA==
X-Received: by 2002:a17:907:1c0e:: with SMTP id nc14mr3610932ejc.103.1633693259154;
        Fri, 08 Oct 2021 04:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxomzDMpxmD/kRXVctv2bbCqa67VNyIA5xEzK0LWLUsGmubPwb/clohBcAxG5qJ4i+p3jGu3g==
X-Received: by 2002:a17:907:1c0e:: with SMTP id nc14mr3610907ejc.103.1633693258920;
        Fri, 08 Oct 2021 04:40:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id kw5sm10121ejc.110.2021.10.08.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:40:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 10/10] dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
Date:   Fri,  8 Oct 2021 13:40:24 +0200
Message-Id: <20211008114024.135335-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the properties with regulator supplies for bucks and LDOs.  At
least one board uses it (Exynos5250 Arndale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index b2529a48c890..5531718abdf0 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -96,6 +96,44 @@ properties:
     description: |
       GPIO specifiers for three host gpio's used for dvs.
 
+  vinb1-supply:
+    description: Power supply for buck1
+  vinb2-supply:
+    description: Power supply for buck2
+  vinb3-supply:
+    description: Power supply for buck3
+  vinb4-supply:
+    description: Power supply for buck4
+  vinb5-supply:
+    description: Power supply for buck5
+  vinb6-supply:
+    description: Power supply for buck6
+  vinb7-supply:
+    description: Power supply for buck7
+  vinb8-supply:
+    description: Power supply for buck8
+  vinb9-supply:
+    description: Power supply for buck9
+
+  vinl1-supply:
+    description: Power supply for LDO3, LDO10, LDO26, LDO27
+  vinl2-supply:
+    description: Power supply for LDO13, LDO16, LDO25, LDO28
+  vinl3-supply:
+    description: Power supply for LDO11, LDO14
+  vinl4-supply:
+    description: Power supply for LDO4, LDO9
+  vinl5-supply:
+    description: Power supply for LDO12, LDO17, LDO19, LDO23
+  vinl6-supply:
+    description: Power supply for LDO18, LDO20, LDO21, LDO24
+  vinl7-supply:
+    description: Power supply for LDO5, LDO22
+  vinl8-supply:
+    description: Power supply for LDO1, LDO6, LDO7, LDO8, LDO15
+  vinl9-supply:
+    description: Power supply for LDO2
+
   wakeup-source: true
 
 required:
-- 
2.30.2

