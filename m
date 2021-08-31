Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2D8C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 13:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55505601FD
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 13:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhHaNHo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Aug 2021 09:07:44 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40746
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233530AbhHaNHo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Aug 2021 09:07:44 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D2C44017E
        for <linux-clk@vger.kernel.org>; Tue, 31 Aug 2021 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630415208;
        bh=jb4Ta6fMMydeh8dJ+siO8U0aOew1wuXL5oWGSgaOpHo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=OiZDTZREj74srvXpKwO1hRmgxDFk74g+LNkkYjyAt0RAIR/tZV+t/hV4bQSrsQLFd
         j+LEMwiK6VjQgd5sv2kG94+9GSXA/tow4ZKKlCdUNIuS0val67ihVkrItlfaK+1zmg
         epBrzgGYEicJREBgKHRJh6SwyG6nn4JqI/JuC7NGajp4UEQqMCTQsgObrzx2u9hDgv
         sf7suMELPaojqarurSP8+DXTCdWOoC/JMD7NMbXCMHnacvQu9LFViTEszLSh+MdfpS
         Trjb4dS0+1uwflfzBlRV5qh6DLtG17wYq4BT8M7zJBAYM7rfNKBuVaUGP5yHQxf8Zp
         sAVvNU//Ql04g==
Received: by mail-wm1-f70.google.com with SMTP id c4-20020a1c9a04000000b002e864b7edd1so5945875wme.6
        for <linux-clk@vger.kernel.org>; Tue, 31 Aug 2021 06:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb4Ta6fMMydeh8dJ+siO8U0aOew1wuXL5oWGSgaOpHo=;
        b=Uz0D/+ERiEGmMOfc+VF595boPISymlemu3dbY+I2JeK4qtcxLeHOAKV+rFwmmE1+ye
         SuEA7MRqAZGTDvVoZvI6y54gNKIVL9r/Gqnl1lxdu7juCZTKDWdTfyG7kkk6xpoS/ixn
         at05VtuUZ3jygTmX4leNB5f8BwVoVU/L/H4lpiJVzJsNq0KZ/RKxiirTMEnnR/Q2vqiW
         dzZ3Fwz3lXPV0siUjWHL/uC0H6NgOlOI2jL+YXNfT+ZeXVV59l+yYjMqgKqX8Sa8v/Wj
         XyDOGNMiJ71EJkDOH7+CjMfDCOHUyjD7BW8jaecsVtp3dps33uE3QDgN8ZS3l6g7szt7
         3s5w==
X-Gm-Message-State: AOAM530mGQQIwqX1B7rB651HCMI6MBdGsRG7Uf5tNYejEQe7/9Ef7fBh
        VefuaNm5Ap2GQk/la7CUIfaRQMJRM4MnrYju3Sa3ZHYD51x7AsZ+1VIGYpCu2XlQ1SOeKYIh9+R
        pt8qMfkfImyHMiYkKQPFNnbObuV5/ZX3fZ+06ow==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr4034759wmd.113.1630415208050;
        Tue, 31 Aug 2021 06:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRzBmZSNKQmsvfdl3PEsodfUa1SAbfBbCTnsvKSPFIvVjQbifNg+VvzvXV88t2ef5XMKkkKA==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr4034739wmd.113.1630415207887;
        Tue, 31 Aug 2021 06:06:47 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id u2sm2450035wmj.29.2021.08.31.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:06:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: samsung: fix header path in example
Date:   Tue, 31 Aug 2021 15:06:43 +0200
Message-Id: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The proper header is exynos4.h:

    samsung,exynos4412-isp-clock.example.dts:19:18: fatal error: dt-bindings/clock/exynos4412.h: No such file or directory

Fixes: 7ac615780926 ("dt-bindings: clock: samsung: convert Exynos4 to dtschema")
Reported-by: Stephen Boyd <sboyd@kernel.org>
Reported-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

The SHA in fixes tag is from linux-next. Might not be stable.
---
 .../devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
index 7b405bcd6fef..1ed64add4355 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
@@ -52,7 +52,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/exynos4412.h>
+    #include <dt-bindings/clock/exynos4.h>
     clock-controller@10048000 {
         compatible = "samsung,exynos4412-isp-clock";
         reg = <0x10048000 0x1000>;
-- 
2.30.2

