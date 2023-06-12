Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38101C88CB2
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 17:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbjFLR7R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 13:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235816AbjFLR7Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 13:59:16 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50F0E53
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 10:59:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-970028cfb6cso841289166b.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686592754; x=1689184754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kja3SgwesCI8mivV99SZPOWE2UVpV1r0v4iU8FZZkk=;
        b=pjXh9aVZiXOJFFCjCmr7A4oawfygz/Bd4NeTlZUT122McbGv90yOB+QM7dRZkDguAv
         pdaR2/52/J28BpsZXW2d/aXQp5afOWtnMULnJAA0qqQV45bw4S5T/NSxthNA4O9c1zxT
         kHgVYauEPJLkTmV/A2kDbDwcAU3OMfwAPURH80CfFtpa9U6RhOKqtoZGAD1PiQ60D4fo
         /iTKt8B1C8srtP/qazc3X1d4osO/IGZgeZZxxS/DqB+lVkwAQga5SwnCSF/v0YiX5xFg
         kpUk5xOQ43xbHKqQvw8DxLPX0fMXjXqkkxhQ+be5X4o/S2AFpH9/jODYkwcFDQyOPLdG
         6b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592754; x=1689184754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kja3SgwesCI8mivV99SZPOWE2UVpV1r0v4iU8FZZkk=;
        b=MvhLXf75gRJso3z385DZVKmoTaUSlTM0SQHRzUOc8kFwRZMZbI2n9iAtStNDUup9Rr
         ivkOiWYiMmu2K9HPcBm2iKb1HLr6jsa/JnmMAnHTVggTtVu6AheeKSxGj4jkGKv0+B56
         8mj5Tm8Jsel2nlhmEwB43i02CAv4KH7K0X9g78/vlqEF7KLV0SZ7AQw3oSjGqGZNm6im
         XF2TTa4gcOByXRmt9lXPpOPgz5R0s9PIYX/PZKhHGw4nG2Xk3yzW0MsrpPBOnHufip5X
         /AcbFeia+973IYootdyljKwyyBtVoKTz4Zp+AtvSnHiN4/LFCsZZgobQIPq7cWyzlKmN
         r2FA==
X-Gm-Message-State: AC+VfDzUHOpXO/TNDp9MO3ZV2/XFKtxKPK3JFU5yCPMEhMliLyqOjWve
        u3q0xFdrj06ZzgA5/fLEBbVsEQ==
X-Google-Smtp-Source: ACHHUZ6oEp6zQOXL+EEOKj1+6lJ1O0RK86/UNGZco7BEnX9YCFuXS+nIiKnIbUHujOwR9mw2Knukxw==
X-Received: by 2002:a17:907:7202:b0:96f:cb13:8715 with SMTP id dr2-20020a170907720200b0096fcb138715mr10521958ejc.69.1686592754157;
        Mon, 12 Jun 2023 10:59:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id dx22-20020a170906a85600b009745e1065f1sm5396790ejb.206.2023.06.12.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 10:59:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.5
Date:   Mon, 12 Jun 2023 19:59:10 +0200
Message-Id: <20230612175910.289428-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.5

for you to fetch changes up to 2aac2d8b95923203e683c60124877ab434133679:

  clk: samsung: add CONFIG_OF dependency (2023-06-12 11:45:20 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.5

1. Re-add support for Exynos4212 clock controller because we are
   re-introducing the SoC in the mainline.

2. Add CONFIG_OF dependency to solve some objtool warnings.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: add CONFIG_OF dependency

Artur Weber (3):
      dt-bindings: clock: samsung,exynos: add Exynos4212 clock compatible
      clk: samsung: Add Exynos4212 compatible to CLKOUT driver
      clk: samsung: Re-add support for Exynos4212 CPU clock

 .../bindings/clock/samsung,exynos-clock.yaml       |  1 +
 drivers/clk/samsung/Kconfig                        |  1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |  3 ++
 drivers/clk/samsung/clk-exynos4.c                  | 44 +++++++++++++++++++---
 4 files changed, 44 insertions(+), 5 deletions(-)
