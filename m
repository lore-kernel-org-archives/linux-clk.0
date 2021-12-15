Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866DBC4167B
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244482AbhLOQJT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244427AbhLOQJR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:09:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B6CC06175C
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:14 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so1365554wmd.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dz9umB5IGIToqYZftMBO3IU3Cs19TgfRkZ7uiNPvoRw=;
        b=Lckz/WAa0xszZdKca065FH4mciLh/lYpayGiAm3jCEqUBANW+FM5KouHbtkuh9xUZi
         wc2OyvBCIn6/4n3DOEjw1QgJPxDyngupSYwQKM4N+KuBUV5GTUoVZUdOQUlqJ/UeaY90
         aWQDdTZxYyWTfIVpsbJOBv81+jjlmae6J5VzEHaUYvFwpq+6OlE1wQNopYOmLbGN3wDk
         1oU8cvmfiDR8XLBOuyV6LFBavUi2Y8WARzAbj1AbfuBovQoQ+OSDkYxU/aUZ0DNqo4Qv
         og2PXuI5ykIrXEozOAfw06I3+RTM7P4k6q8zqtb6yi/1J3JcIpOTA5z9RC8whXF7Ge42
         lJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dz9umB5IGIToqYZftMBO3IU3Cs19TgfRkZ7uiNPvoRw=;
        b=DQp+8gDITP5DWGizukbjZR7WsnWh2ePS8NzKa3KlxXrxuN6c2kMj/jsueFekXDVfZS
         zuD5Cv6262WzD8syIXvv7B4+Vgkbk1CpvmXdyuicGDvKNIZJNJxoB5fSHPk+IsuBarTN
         T74GWXz4A4wC+V0uEzi/4wjB+Id07WuARX3wYV6wdyFZfpOc7vSmUWcN/T8MLwJuX79Z
         xFo5/SOJzK+Ejgkji7sotqZKzWrP+Zl5rHxlTGEMQUkduWvVW/7y+0DsZcxx3NW71TNx
         bMktv0oM0qSezU+2Mq/G10VDTHZFpUoVrZUkDMkpS/2U+5hpGIvk8OrUWjIXeYXtwLTm
         aegg==
X-Gm-Message-State: AOAM530Tx321o+Fr0DKtOJWZIDfZSovTKiTJwYU4Dg/UmNd00vAdg4ex
        6KlB96TnKQlGSU4moOSnqnyKkQ==
X-Google-Smtp-Source: ABdhPJwyEiH0fomN/E3toR4LTUG8ouZsXe50NaVQvsh+mAJZehnftHhVnF2WZv6uA4D3FjmVmvUPZQ==
X-Received: by 2002:a05:600c:21cd:: with SMTP id x13mr547905wmj.52.1639584553539;
        Wed, 15 Dec 2021 08:09:13 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j14sm1859285wrn.88.2021.12.15.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:13 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Wed, 15 Dec 2021 18:09:03 +0200
Message-Id: <20211215160906.17451-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215160906.17451-1-semen.protsenko@linaro.org>
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding for the WinLink E850-96 board, which is based on Samsung
Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index ef6dc14be4b5..00f122197476 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -205,6 +205,12 @@ properties:
               - samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
           - const: samsung,exynosautov9
 
+      - description: Exynos850 based boards
+        items:
+          - enum:
+              - winlink,e850-96                 # WinLink E850-96
+          - const: samsung,exynos850
+
 required:
   - compatible
 
-- 
2.30.2

