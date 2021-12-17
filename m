Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2EAC43217
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhLQBq0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbhLQBqX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:46:23 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A62C06173E
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:22 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id m12so935367ljj.6
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VcLGSgV6/NSps52EShuns7K7yBcmStDgIhJiXXEDqLA=;
        b=DmYHqFLGBjjHzA36/wA8dhtzvkCIhDKoDDxGNC54ODGq9kbmNcLc7uhhsKwca3WzhQ
         9UVcNINeXxYsC/C/126muLfE0kPsd0wmyCrgbpNRwKolaO7CYhkJAKQ8C8aeE+F8YNk2
         mdJZoeeI7GYYTLFE6L9wwBUxLRp3d5DjG6XVhAIGyBRIhiaydpgYPpAiIkD8FYSHKPIC
         VNk3SQF0w140bS+TeG1qxtLVt4DXb386Xak3YJ75YV0vmnWN7Ezjkh82YOFMp3zhzqSz
         J1G/z5S6HTMt4XGpqoRGq3kvbiTjRdGN+pSaAEtVL4piPljsMdUbgWK10o+siLsCZpBD
         dt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcLGSgV6/NSps52EShuns7K7yBcmStDgIhJiXXEDqLA=;
        b=vWzi0FGjy0vlwIkzcbeOpQ2W7h5PHblUtGoviHLl8ABBP9QeyyUImapnMPWcQ6O/nA
         p9P9F8vbRkrdBI5I1uuyYvZh1PduQER8dW3GN2OwH7k6g97yDpf1a4LeCbwuXDZwTfST
         Y31Hvqscc+70JP6Jb3Z/eDtBblHlzvMcx6yeNvt/A/vy1Xv5TDg3DIGB9nKpiHlGm5kA
         hN5F7oRjlCgaj8HkwK5+hXclARwf7I00qkbC5xPg/oc7OI+Zbkda7mwVaUodU+AsqzbL
         WriGjEx65QWHe2f61RcR3Z7et8blc6pqxrysn0LwyuF/vj9pDwr7SP+F6V4RDpxqdxpm
         CyBw==
X-Gm-Message-State: AOAM532EorX1PpO87DoZ9i0B38zyId0MOfdGopcwfx7GfrZQQCPVWvhr
        nkiJaJ0HQzysqPhKaqTE6CTmLQ==
X-Google-Smtp-Source: ABdhPJzq55H+PxOli9A5MPidjCbrvGksaEn8lXcFujTLV0gKbSPpqogVMOILGkXbr9q/jnnGd/+JgQ==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr742594ljg.13.1639705581030;
        Thu, 16 Dec 2021 17:46:21 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m9sm1428853ljp.79.2021.12.16.17.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:20 -0800 (PST)
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
Subject: [PATCH v3 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Fri, 17 Dec 2021 03:46:10 +0200
Message-Id: <20211217014613.15203-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding for the WinLink E850-96 board, which is based on Samsung
Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - (none)

Changes in v2:
  - Moved Exynos850/E850-96 binding before Exynos Auto V9 entry
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d88571202713..052cd94113d4 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -205,6 +205,12 @@ properties:
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
 
+      - description: Exynos850 based boards
+        items:
+          - enum:
+              - winlink,e850-96                 # WinLink E850-96
+          - const: samsung,exynos850
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.30.2

