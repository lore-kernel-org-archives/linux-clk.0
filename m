Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA0CC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 20:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B019E60FE8
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 20:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhJUUeM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbhJUUeL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Oct 2021 16:34:11 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACFCC061348
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 13:31:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g8so5579989edb.12
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 13:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AAeT1s5etdXanRn4aSszKNI29PERXQFpDmpMaONVPY=;
        b=XCV+7ls9ymJQESDnoVrKDqw43/z3HmKtMn5kgZkGDkChRBSDIFerDu7SxdASWpHeof
         5+cV3u5rkCAukglJLnxyiWawK/p6JgUWnyB9FmVXutdRGfl/RJHWan8z3DcMmS8D4S6s
         vAL4PlGz8U7dW7ou47v06kIyoGcnQHZlT1zU4mUF0cvXdwcFiYDE4cOaiiNF0gHiernP
         yUS6Lw0lPz7vmUavtVkk5gTvleJDrsTlqbkAmv+eyuIL3LW5L+3kEb9jiewMlcwlE+Ig
         9OBqMN5ZxHTkgzMsYccXVF2x1K9e1KBRCVo24Wa+d9W0izFU0xMt2S9lS9Bl/jFcd/CU
         nUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AAeT1s5etdXanRn4aSszKNI29PERXQFpDmpMaONVPY=;
        b=FkmXer3EUxQMuaH/g+0zymza3rlBuaOvk0Mr6r2lZ9+W3+GKTwguP3khhzWbYBTSWi
         kdEe07VvzfkXXI/1K3zBydDCud816QgZtTp+fAFRQuF9LnKkIcQ/k9tPb4O2liHmJUeh
         eTCJCRmiXSmMAavgHcjSU/1a1tlZ8ooKANuOdZJjbepb1AuieA0EPdkBTvjS+q78tbdA
         vvoBxam4iCtrzRdfIh5DKsQATLWLftf2EXZQmluOlyAg1N6n8+rAxLt3Vn6Bo/3gJ73n
         6BE13YeFtF50O5k60WFfShQ+i8AHR1YEHVDj1ozAb0BSrrz+0v09313DtkIKZe1k7+jm
         vlhQ==
X-Gm-Message-State: AOAM532qW48LYfObQ+j8b7RDLqgfzGHUvRU0WVFSDLLxZcgLtD/8j/xz
        ZA38SK9BdZfGzHBVSkd4s2caavSt60JICA==
X-Google-Smtp-Source: ABdhPJx8Igs3iTlr4qpiVqe1jpwXDeVQlItrxTjJTiKYrz23gen6QSEo6M7blcHlSX3CgR4v2vi5mg==
X-Received: by 2002:a17:906:c205:: with SMTP id d5mr9611265ejz.528.1634848313960;
        Thu, 21 Oct 2021 13:31:53 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f7sm3296171edl.33.2021.10.21.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:31:53 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850 CMU_APM
Date:   Thu, 21 Oct 2021 23:31:51 +0300
Message-Id: <20211021203152.29312-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CMU_APM generates clocks for APM IP-core (Active Power Management). In
particular it generates RTC clocks, which are needed to enable rtc-s3c
driver on Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 7f8c91a29b91..5618cfa62f80 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -32,6 +32,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos850-cmu-top
+      - samsung,exynos850-cmu-apm
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
@@ -68,6 +69,24 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-apm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_APM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_apm_bus
+
   - if:
       properties:
         compatible:
-- 
2.30.2

