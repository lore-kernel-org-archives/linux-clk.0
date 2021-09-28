Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28742C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 111CF61058
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239789AbhI1Iwf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:35 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53616
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239792AbhI1IwM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 04:52:12 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 91C3F40319
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819011;
        bh=MrRtMKWESY45De0HF10TbNHiqJiU4JWtrfj4T60+/KM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ndER0NAr0UN+YQHUTT2ns733/eJLlpx4hh5yjodfw+hgXyETeClSYKznf4KJ2p4pf
         D52xjHq1U7JzKDcK1PCskxIbfzRJrlnC9X6oaHD6c6d5d2VKqTSUcPrkRA9HZ/ZrsK
         SBqn+bVfxdNwD2eZKDPxGlLxsjDeatDfhYNH8xiveDJpXIm/VAjJYO9IQmmuB1ECEL
         mlDzNk6BUlT9rAt4aVYxyl+z6s69QmQLC1O2/ZL0zfepLNSMaUvipY84xrf6oEpRgQ
         LyEasZneHj6pW9X++t/ppSLTAmRy/nYq5yndLW3eMEnewnPAKvbnbzOKd8ZB+vjR0r
         mpiVVpr58LOHA==
Received: by mail-lf1-f71.google.com with SMTP id t187-20020a19c3c4000000b003fc1361fb20so18671744lff.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 01:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MrRtMKWESY45De0HF10TbNHiqJiU4JWtrfj4T60+/KM=;
        b=k++ePEe2LB1LCBVOykIqGv+Yu6QoOmYFg5t0kKe5Cz1yTayPpgfAEQ7Hg/352DJ40O
         8pkFRbm6bbPVu+ETAoM7if0J4PpqI5hg6pM7Y071wbB8IAA+JmYoR0UooqO4HcpvgfkB
         yhY6jmkiUZ0XZhzeuy+AZmvjRBWgEi1QX1t+H8GFC1FW9viimmxRlsQvUqF0VEekKzya
         OwMR94dK4rUwybz6PAyK8fzsv4tIIkeeZXWeHz0kmxWJ4euPE3TAMs4iRs0v4gjcwwM8
         APPLgCCDwr9Do7zhu95dUrVJNZjA0UZW/hOCNrTyjVG99BxG01erF/nX3ovGH2C8GBJZ
         KrZg==
X-Gm-Message-State: AOAM533SbwZa6V2n6UAP1J+suQTtIQHCgBGX9StFYs4Hn28FlGDX4Rxk
        d2msxPL3lijxioEKS0Uk9WpPYGMFflMesdvlqfxWa01zrteHY+9ONeHMZgFmRUFi1YQl3LS1svn
        mwtpdEU0QewkxIruMZ4fQOiYLKltbaT29kl4VnA==
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr4530582ljo.261.1632819010965;
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeT9hh5MikDORvgeeNHLdkoBlQ51tYUHQvGyxCDV/oLrmwZnjOgz8Pgq3riPZog98Bec4NGQ==
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr4530572ljo.261.1632819010805;
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 10/12] mfd: dt-bindings: samsung,s5m8767: document buck and LDO supplies
Date:   Tue, 28 Sep 2021 10:49:47 +0200
Message-Id: <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the properties with regulator supplies for bucks and LDOs.  At
least one board uses it (Exynos5250 Arndale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index 35018346f68b..e97a94cab4e8 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -96,6 +96,44 @@ properties:
     description: |
       GPIO specifiers for three host gpio's used for dvs.
 
+  vinb1-supply:
+    description: Power supply for buck1
+  vinb2-supply:
+    description: Power supply for buck1
+  vinb3-supply:
+    description: Power supply for buck1
+  vinb4-supply:
+    description: Power supply for buck1
+  vinb5-supply:
+    description: Power supply for buck1
+  vinb6-supply:
+    description: Power supply for buck1
+  vinb7-supply:
+    description: Power supply for buck1
+  vinb8-supply:
+    description: Power supply for buck1
+  vinb9-supply:
+    description: Power supply for buck1
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

