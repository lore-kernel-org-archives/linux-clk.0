Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FA0C4338F
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98D6760FD8
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241343AbhHYNmY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:42:24 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35630
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240057AbhHYNmY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 09:42:24 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB7A93F316
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629898897;
        bh=Lkb6PM27Kco3Iu1MuOjl/JgWnsvlf08P1Raoj+pvz3A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=CK6eYYjDDhgFXAcW2aHpcqKMRSOBZ4UDyxcDjzJPLmtDAtocpeClzZKUA+Es9p7Du
         /ZxfldsrScf0EO1zk0ieClaojgN9T4hE8qvyVtTmXdIcvWY6mmUV7ixWVJwc6kyDeE
         vPe8K5QLMRCjEAdrQfVvuvPEzkVu5EuQczyfNJYq12wyS6t0+v+hF8xp2BtTFm8oZM
         xnbCH4kcLx7oB0jSbV1LhRNY8HkIXx+3B5ZpTXW0wcXRIgKzTZRaLBE/y43r7+2twO
         +CZKXrbGZ/zyTpyily/9r7VOnTQtNRFH8QRexTtgasguQ4g+1MtgP89BkHyvkLMDFx
         eKtNmiaF+fMXw==
Received: by mail-wr1-f69.google.com with SMTP id l1-20020adff481000000b00156e670a09dso6680200wro.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkb6PM27Kco3Iu1MuOjl/JgWnsvlf08P1Raoj+pvz3A=;
        b=gAf5Gvt65/mB7Eh1QyZjcmDVkb6cUzg0G18qnuoQvvz5gjUBQPc+6PqlwThn1Hpjhn
         vUxnGENN6+WsOiTOM1A40rIMxGMLTT9AmG5hZOh1nA+vu2rum4eAE4g9IINV9PxZCnfg
         RN9o7ZKosUaKizAVn7AtwrKvxIEPJjuaf6ijQsgqINlrEJpJ/TQBw5D6kgxvI+iP04lf
         5/JOeWirTAl5IHAmGSJVjRvZoI0J8inRtg2QYStRbmAORRa5vUSQX8x77X6/FPkujrHx
         IAWwQQfoAyKJnvU4ZIz9jrY3VrNci4iVby9yehnBiZpP3Zb1mX8Jxda62LEBn5rbA5ZJ
         rCZA==
X-Gm-Message-State: AOAM5324UBv/j/PqG66bVWdrh+6Pk5SCPS9mm56wdXMhybjjyIZeIPNi
        pHYqx9tL0G1uSTB0lJF8PsZ1Qt4v18mfa2ypkV0o9o3d44eSaunHK7vYipV6XIrRpXi5RCiESfu
        uRxQtemsAX10+9XOr/v8IcQbyNd82um1enwSWow==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr3291302wma.9.1629898897380;
        Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyYRLtspcOY32ZHpe9nvY0ozhgHK+bBdMXVh9m1PO2zTa0PuTosOfEluJhLyloJQ/WFCYypA==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr3291280wma.9.1629898897212;
        Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id g5sm7185861wrq.80.2021.08.25.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:41:36 -0700 (PDT)
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
Subject: [PATCH v3 0/8] dt-bindings: clock: samsung: convert to dtschema
Date:   Wed, 25 Aug 2021 15:40:48 +0200
Message-Id: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Changes since v2:
1. Add reviews.
2. Split Exynos4 ISP into separate schema.
3. Add maxItems to clocks and power-domains (review feedback).
4. Do not allow samsung,exynos5420-clock and samsung,exynos5800-clock
   without syscon. These clock controllers should always use syscon
   to allow DMC bindings access the registers.
5. Drop assigned-clocks.

Changes since v1:
1. Patch 7/8: include header to fix clock IDs error in example.
2. Combined patchset of separate v1 sets:

https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809130935.80565-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809135942.100744-1-krzysztof.kozlowski@canonical.com/T/#t

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: clock: samsung: convert Exynos5250 to dtschema
  dt-bindings: clock: samsung: add bindings for Exynos external clock
  dt-bindings: clock: samsung: convert Exynos542x to dtschema
  dt-bindings: clock: samsung: convert Exynos3250 to dtschema
  dt-bindings: clock: samsung: convert Exynos4 to dtschema
  dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
  dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
  MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry

 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
 .../bindings/clock/exynos3250-clock.txt       |  57 ----------
 .../bindings/clock/exynos4-clock.txt          |  86 ---------------
 .../bindings/clock/exynos5250-clock.txt       |  41 -------
 .../bindings/clock/exynos5420-clock.txt       |  42 -------
 .../clock/samsung,exynos-audss-clock.yaml     |  80 ++++++++++++++
 .../bindings/clock/samsung,exynos-clock.yaml  |  59 ++++++++++
 .../clock/samsung,exynos-ext-clock.yaml       |  46 ++++++++
 .../clock/samsung,exynos4412-isp-clock.yaml   |  64 +++++++++++
 .../clock/samsung,s5pv210-audss-clock.yaml    |  78 +++++++++++++
 MAINTAINERS                                   |   4 +
 12 files changed, 331 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

-- 
2.30.2

