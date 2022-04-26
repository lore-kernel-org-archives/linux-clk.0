Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3F4C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 26 Apr 2022 23:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356055AbiDZXZ6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Apr 2022 19:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356041AbiDZXZ5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2022 19:25:57 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A482F36E0A
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 16:22:48 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso14112192otf.12
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYejGanUUZmJvZ2w05Ao6DgRupGl4lL6Qt7fE+MxKI4=;
        b=RKzjXG8LHJYjtLTBu1AG5FKNpKuXNbma5GQ/URC7EDsjuYp9+RMq5pKyRrnDsl8CMP
         0xW/ukNJNQ2qXAs9jAC6qDxIb/FrotGQB2Iq2tURl1JUhZpWX7jb0Vnhgja+scyPuIjd
         6QY91pslLff7CmBeWSFWHRjnwol4hRSHa8iHgQSpX/FDO6uGt+85vkXAirQ78SQkwFr3
         3By2patjIiz7mxDNQfGaxD0b2BpcCjcK2VSyQD0vqVqqLbtVDJypkTVXJonf+0bxaN9+
         yRKfbGJwuzpuOIz4Oulxwu+vpLjbznXtcXjS6drrMMNuUIhTf3X4Nmo9OT7j4+giLa1k
         OLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYejGanUUZmJvZ2w05Ao6DgRupGl4lL6Qt7fE+MxKI4=;
        b=HXY4yugPWPEG2DbwcxBRDxDp+m2UaE39m6s5Npa+3Q5D8zcnAQ6W6Jl9bC6SnwQrT1
         pFxAmdnGNTP33p4OgYjNqEucvjXiYF7Cac9AeZGIWbmeniNwIjbRUWyukSQlFEXfRHP5
         c2azgdsbjMwTFMEqaaFTlMRbDtmDSfNmDu/PGYR6PmXEzDrrpHtwRXW9rseb0Hj8+lJu
         3hvxKBsGgL/4WqW9T6LuFZF+He1lxmD77pkK7SI2Sx7Vp5yN/p820002fXwhWwMbGsoi
         gxvG207JIo78CRMosRnP1O6ysia8WroLM52Bv7B2txY1UhTBgo5Ir7PP7Kvx8jRpNFfE
         RJnw==
X-Gm-Message-State: AOAM531EVXobiXGP/HdiQ4zMf8p2nv5xPpXJJuCd+jC0tdJSC+ysOeYE
        WdrrpdosHNveE1WzD53t1C92NA==
X-Google-Smtp-Source: ABdhPJyjewHB6NMvvEatTOA4sf1nstaF+5jYRdbM69SIxzsjWm3f3tkm4rPBv+x92t1GXyJda9pn2A==
X-Received: by 2002:a9d:731a:0:b0:605:4e21:cb15 with SMTP id e26-20020a9d731a000000b006054e21cb15mr8984101otk.225.1651015367854;
        Tue, 26 Apr 2022 16:22:47 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n28-20020a0568080a1c00b0032578b7e377sm253000oij.26.2022.04.26.16.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:22:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] clk: qcom: Add SC8280XP global clock controller
Date:   Tue, 26 Apr 2022 16:24:42 -0700
Message-Id: <20220426232444.1761869-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds binding and driver for the global clock controller found in the
Qualcomm SC8280XP platform.

Bjorn Andersson (2):
  dt-bindings: clock: Add Qualcomm SC8280XP GCC bindings
  clk: qcom: add sc8280xp GCC driver

 .../bindings/clock/qcom,gcc-sc8280xp.yaml     |  129 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sc8280xp.c               | 7488 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  496 ++
 5 files changed, 8123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
 create mode 100644 drivers/clk/qcom/gcc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8280xp.h

-- 
2.35.1

