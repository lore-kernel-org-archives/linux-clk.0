Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E52C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 01:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbhLQBaT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhLQBaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:30:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C1DC061401
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d10so1442044lfg.6
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QM6f47ayHPQt/5IdQ/xMhOSTbh2OemqUyIwCi0r5BpE=;
        b=RgsTKdDzcBwtCxrfX4AqOv4ybgC5se3ZM3CHliwW1pHlvEb0unBiII0kD9nverEGEt
         ykPgkVB+/pv4Iqo4VnrSRcDgwzQxTAGEuJ0F72dyeOdDOO93m6gv7rtw5Fq3nlh6t6EY
         Io1ctoYvxa6g0Qpc503Nba7FwkZqYjzLz4feCNRbDaNgUjiIPWcu2tUySFXf3VTqELWu
         waw8aEu85sjfGpPzL5vfyo2E3j5fGdeD9UGvSwv9wxWSaY/oLsdX0whOAARl2MZOI/ja
         VgyKBPnm1X7S+3ykhovCSA4qrarozdv1WH6iWws62xLkIUNV0S5eqHQGP4FIp14myWDA
         RsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QM6f47ayHPQt/5IdQ/xMhOSTbh2OemqUyIwCi0r5BpE=;
        b=IgSpSl4fCYRBOqtfm+imy6wArkv7biQuczpRQvX7vNUQqejXoMlAwxii+iEMt1nDfg
         nTTwkOSj8qm51MVic9Y87ROkJbcs+PXSD3E3XBFJoYY4mcSLR438SavW7ApjT/YuzikF
         LJ8ikaRK5Pf+dgt9E/4xSSH6vJcycoG+/LCLFM02IUy9Duy2WjwxftZLeJCOrO2LkL49
         Cj4P4JDG1XNpoRPVr5yeF4/X+LiTeILg9fq76I/AdiJgMdspX5P6L0lbJQSoMfgjD56i
         wGAHphE6T+qdCERvA506H2X0On9CrXAjc99vNQ+GfbTu95fsEOG9fTsdCU+gY9BRd1dr
         2Y4A==
X-Gm-Message-State: AOAM530pEfBk6wVgzzI/xW+TtMWKBPtGIuqcYoJpw285faeNVHtrR3sC
        WXghQl1k90strURMnvdFTQJrWw==
X-Google-Smtp-Source: ABdhPJzjUfwEoYesZqEjPi0VMxKoi6uMmfpS1eDv461HjtDZO3NaH9w7JiiomyHszxF5NgDgY6xQuQ==
X-Received: by 2002:ac2:5930:: with SMTP id v16mr748999lfi.327.1639704612792;
        Thu, 16 Dec 2021 17:30:12 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z8sm1132468lfu.128.2021.12.16.17.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:12 -0800 (PST)
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
Subject: [PATCH v2 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Fri, 17 Dec 2021 03:30:02 +0200
Message-Id: <20211217013005.16646-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217013005.16646-1-semen.protsenko@linaro.org>
References: <20211217013005.16646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding for the WinLink E850-96 board, which is based on Samsung
Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

