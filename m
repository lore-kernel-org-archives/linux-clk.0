Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A46C6379F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 15:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbjAIPsF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 10:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237211AbjAIPr3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 10:47:29 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C6F16488
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 07:47:25 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso4256147wmq.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxRux3nm0gOqVR3jIQ7t+bypbcUlPNns6Z9B8M0EfvU=;
        b=qBJxtbB/xnrjVFosn9TLZ4jfg2D5UKYoJo4S8PkHltDQA7Euvyx47BxSzo5hyMww2I
         rSWvno+86C775FgPP+82a8/GRL48aWiu79c/KgYMsMylwho/yyr18lqs3ftrJr+XJOE9
         n42swZSQxbxb28CYCk98t+Jrghbjxrs3d4w2ep/+TlzY/ev5wt61p0n9qnvj7RgIoqmm
         h9n/eQhOwdIj2UE30y5rl3F5I4eSYTNj22Ybm1wM1sJY1ejJnsE1Hnfa7lhNgQE9ki/F
         P4q7NGxGwDQnKvUWgtYkZ6NrLDGWEORo7nOh9P1BlLy2xc1ER4eLkpcyYSPXUS+go6cA
         fWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxRux3nm0gOqVR3jIQ7t+bypbcUlPNns6Z9B8M0EfvU=;
        b=VJTsOp+BByGTDlWrsaelUPlgm4coINGXO4k//fO1bv4BqXDmQyOrO31IGuixymlgJi
         bogIuKTKu/Sm/9MIFCyRu0LOT41fo+UBDHqxokzKrU4EZ8rUWUJpblPjICTTHX/Oop+I
         GrOgLNS4CBoqk4EEVtmVSfHI8miEXHC2MiUUVxvGVMkdqGQoC60oig7i6AE9LJhmp0ks
         pMnxGJO05Y6YLXO/7mNohfqO5Mp1+xDIqn25J5LJo3eFEdU40TCoithdChuw0WChmoNM
         YtrNKnlJwlldKLCEyC271hivYHjJQ33lkCj33utg0F5ocL35RakwhdqyRAMai0hw8lOt
         breQ==
X-Gm-Message-State: AFqh2koacxf+ksteUu/SZMVbemq81oV0NYczU5HYYY4JOzB9FNwJI9Y3
        RfXPtZDrnI7h3XY0IbI9Ntz41g==
X-Google-Smtp-Source: AMrXdXtPfE7/PbM9wPt9OMTTD17lc4ylpNd6XvEXVk7CJQ8CSaGBx+J76qZNa0mPPuJIic0SBlYtyQ==
X-Received: by 2002:a05:600c:4e07:b0:3d3:5319:b6d3 with SMTP id b7-20020a05600c4e0700b003d35319b6d3mr46958252wmq.38.1673279244032;
        Mon, 09 Jan 2023 07:47:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003b3307fb98fsm11479928wmc.24.2023.01.09.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 07:47:23 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] clk: qcom: Add DISPCC driver for SM8550
Date:   Mon, 09 Jan 2023 16:47:21 +0100
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v3-0-8a03d348c572@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAk3vGMC/5XOTQ7CIBAF4Ks0rB0D9I+48h7GBQxoJ2mBQG00p
 neXdudON5O8t/jevFl2iVxmp+rNklsoU/Al1IeK4aD93QHZkpnksuaC1zCHSAh5Um3L4RHznJye
 wFKOiNAIYeoGy+E9K4TR2YFJ2uNQEP8Yx1LG5G703Dcv15IHynNIr/2FRWztj2uLAA5KmBui7Iy
 0eB7J6xSOId3ZJi/yH00WrVedtVb1qtXyS1vX9QPu+sSrLAEAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the Display Clock Controller controller based on
downstream and upstream SM8450 driver.

To: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Changes in v3:
- Fixed copyright year (dropped 2022)
- Link to v2: https://lore.kernel.org/r/20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org

Changes in v2:
- Removed clocks minItems
- Added Konrad's Reviewed-by on patch 2 & 3
- Switched to parent_hws & devm_pm_runtime_enable()
- Link to v1: https://lore.kernel.org/r/20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org

---
Neil Armstrong (3):
      dt-bindings: clock: document SM8550 DISPCC clock controller
      clk: qcom: clk-alpha-pll: define alias of LUCID OLE reset ops to EVO reset ops
      clk: qcom: add SM8550 DISPCC driver

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  105 ++
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-sm8550.c                   | 1807 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-dispcc.h     |  101 ++
 6 files changed, 2024 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230103-topic-sm8550-upstream-dispcc-411b34c1b307

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
