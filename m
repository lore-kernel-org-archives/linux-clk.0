Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB81EC4708E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbiL1Ncz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbiL1Ncs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:32:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D26F5BF
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:46 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bq39so15841029lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=itN5bwO5Ir9y7J4fPd6OFJRoaPf8WMBNLHJ7fPCeJbg=;
        b=UI2Gjry+8gVU82+rNtPptlsA9YGmI5XYNX3j6Bx83pc+ESQOsG7gCz8/JUb5BVETgY
         gsi1iRds+Fqns8AnzuYodlmg2twb3vsivF0/dvwwMyAtN52sUzy8H16RcjDfNljxl7HK
         v20psxLh6AhKdEnp3fpcTskEzhw2gkU2cMsnE+8oU2+lCPwEkkK4eCsYghkUqdT7vGRN
         rC4uaB7yZ7ZPITsKckN5UAnjN9+evlqAg2G2SMbZY5R2aKmgUON8Kz25UagptflBOBdR
         CxrVoQ71kO9082O4SGNc5yb2U/oBk0qlGiR3DiTtFUKjMD9XizVZpZej8d8nVdWO/gSY
         okTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itN5bwO5Ir9y7J4fPd6OFJRoaPf8WMBNLHJ7fPCeJbg=;
        b=EqKjla3Q9wEnQmHgYx/68qtDKBs9t9OXrEwBmobI5rBs645OwFtgOrx/Jqxs2xFRo9
         5NYi8WcbIJ5Egc3mpM3humYY5tWlBT93mfGZy3aukvP1nzQko8giilJ+h+ezvsWn9PGw
         gGqXZ7+tZ7agssFU716sig98zynnkqwOtfXL79xS3PtWm8BerA4HH90Cbj/suPpWLW/g
         zPSafEQI/xrP2zkn6EgLaYlA1ROybj381eaCjSLs3t0RsOwn0klqLuBjtIDZjCjUI5ma
         VS05XFILwt3vLPQfNDrAB5ofh4NUUZ0KyKe7fjMGDQMUh7HEBBcSNP6J+KmHqxj5gXUC
         W+jw==
X-Gm-Message-State: AFqh2kpXDSeVtnOmQixf+juk9WP3Znr6EexrM8548x9JDLJfKuBi/7Zu
        lVI63AbeBdK3jYMF9zffESP1ig==
X-Google-Smtp-Source: AMrXdXv0+7/Af63H+JidZqM0DYQgU6IsYrfBrCJ2HKXfkihgvW0Ys0QCxp0li3MEs0XiJtJxpGkKmg==
X-Received: by 2002:a05:6512:2513:b0:4b5:7433:cfe6 with SMTP id be19-20020a056512251300b004b57433cfe6mr7144963lfb.45.1672234365168;
        Wed, 28 Dec 2022 05:32:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 00/16] clk: qcom: get rid of core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 15:32:27 +0200
Message-Id: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop core_bi_pll_test_se from all Qualcomm clock controller's bindings
and drivers. The clock is not used by anyone.

Dmitry Baryshkov (16):
  dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
  dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
  dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
  dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
  dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
  dt-bindings: clock: qcom: gcc-sm8350: drop test clock
  dt-bindings: clock: qcom: gcc-sm8450: drop test clock
  clk: qcom: dispcc-qcm2290: get rid of test clock
  clk: qcom: gcc-msm8998: get rid of test clock
  clk: qcom: gcc-sc7180: get rid of test clock
  clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
  clk: qcom: gcc-sdx55: get rid of test clock
  clk: qcom: gcc-sm8150: get rid of test clock
  clk: qcom: gcc-sm8350: get rid of test clock
  clk: qcom: mmcc-msm8998: get rid of test clock
  arm64: dts: qcom: msm8998: get rid of test clock

 .../bindings/clock/qcom,gcc-msm8998.yaml      |  4 --
 .../bindings/clock/qcom,gcc-sdx55.yaml        |  9 +--
 .../bindings/clock/qcom,gcc-sdx65.yaml        |  8 +--
 .../bindings/clock/qcom,gcc-sm8350.yaml       |  2 -
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  2 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  4 +-
 drivers/clk/qcom/dispcc-qcm2290.c             |  6 --
 drivers/clk/qcom/gcc-msm8998.c                | 13 ----
 drivers/clk/qcom/gcc-sc7180.c                 | 16 -----
 drivers/clk/qcom/gcc-sdx55.c                  | 64 ++++++++-----------
 drivers/clk/qcom/gcc-sm8150.c                 | 17 -----
 drivers/clk/qcom/gcc-sm8350.c                 | 15 -----
 drivers/clk/qcom/mmcc-msm8998.c               | 25 --------
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  1 -
 include/dt-bindings/clock/qcom,gcc-sm8450.h   |  1 -
 15 files changed, 32 insertions(+), 155 deletions(-)

-- 
2.35.1

