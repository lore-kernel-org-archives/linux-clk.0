Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C97C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239625AbjELAcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjELAce (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:34 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB8255AC
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eed764a10cso10421097e87.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6fMf66paZoXqIuo4BxC8AZa8OirHGIMmg66YBgwmro=;
        b=rewfLLJ7ucN3IaQLVDxRzSAp7Gvty+e3ZByWUoRGoLZ6s2Wv9IJXWThGngQ8Oj1Ahn
         zfXVXb+KuWiF9SStSuwjsgyfhF1pIwhB/0sv3tqizZfwhX1jECYlXUHK9buVUEHGPITU
         B3ZfpzitRhx+3WE3P8sDUcakZ0cQNgcWM7YI5bgxybgHunQ69W/Xy5RVDQfp0Yu8h+P9
         WuOmQDPS+6P+9AxUWMkEFvRJ2DwCK7wvaNv09gyWGNlkqtLmKQXbQ79IMLdzKLopBU/F
         zc714YCaq8rsooxmUbJeP6iwY41j39o5uV6nlF9b8v3fAc6voBXT6qdWKh9tc0J7AjQv
         P4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6fMf66paZoXqIuo4BxC8AZa8OirHGIMmg66YBgwmro=;
        b=Xw0oeqADkx/RqdfxO2SkOE1qsTAHovMc0elLNmKMe5gzb+nFIoatKHR6ufFTYRY5jN
         IKu7ojRIC1Lvxk69FLS25e7jVUqLFVMWIAQuxClnoQjWwxDcNLtTrDCxYPvZgui1/pjO
         nmJkgvNuj8oob0PfduJqqQCUTVrshDz9Nw6IA5B+HMlGGMus3yY3XunCm3Ro2/p/1S8R
         e5BJIvTgmCOYpi2IaR5ZOzdXVsxjsC1oSNtMFv4wIyy7Ep21m4KMe+ca4c5tvgOxQqAF
         mGatt7w2xPmyiOuEJ2cCrsbyTp8mfRfNAD2L44vd3gcqkSy1XlA4HjDRrUPq8gxi9KMC
         u5Lg==
X-Gm-Message-State: AC+VfDyXotm3wizMDLhShJJjeccuLVcX091URMoh8wcFr5m8DJvb/6DB
        9lWEzWc+oaUh7ZyZ8YT0uE10eQ==
X-Google-Smtp-Source: ACHHUZ6iLM+caXjJxEsjR9qcucutr+1Ohf5IEEpdRraIHNsOEMprWFQqckumeeYE5h3420wplBsbTw==
X-Received: by 2002:a05:6512:69:b0:4f2:520d:8314 with SMTP id i9-20020a056512006900b004f2520d8314mr2979074lfo.65.1683851551715;
        Thu, 11 May 2023 17:32:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:31 -0700 (PDT)
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
Subject: [PATCH v2 00/10] clk: qcom: convert mdm9615 to parent_hws/_data
Date:   Fri, 12 May 2023 03:32:20 +0300
Message-Id: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series concludes the conversion of Qualcomm clock controller
drivers to using the parent_hws/parent_data and declaring all the used
clocks in DT.

Changes since v1:
- Dropped clock-names property in favour of using the index parent data
- Fixed Taniya's email (Krzysztof)
- Added Cc:stable to the pll8 patch (Konrad)

Dmitry Baryshkov (10):
  dt-bindings: clock: qcom,lcc.yaml: describe clocks for
    lcc,qcom-mdm9615
  dt-bindings: clock: drop qcom,lcc-mdm9615 header file
  dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
  clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: drop lcc-mdm9615 in favour of lcc-msm8960
  clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
  clk: qcom: gcc-mdm9615: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-mdm9615: drop the cxo clock
  ARM: dts: qcom-mdm9615: specify clocks for the lcc device
  ARM: dts: qcom-mdm9615: specify gcc clocks

 .../bindings/clock/qcom,gcc-mdm9615.yaml      |  48 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   3 -
 .../devicetree/bindings/clock/qcom,lcc.yaml   |  34 ++
 arch/arm/boot/dts/qcom-mdm9615.dtsi           |  19 +-
 drivers/clk/qcom/Kconfig                      |  14 +-
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/gcc-mdm9615.c                | 261 ++++----
 drivers/clk/qcom/lcc-mdm9615.c                | 572 ------------------
 drivers/clk/qcom/lcc-msm8960.c                |  19 +-
 include/dt-bindings/clock/qcom,lcc-mdm9615.h  |  44 --
 10 files changed, 261 insertions(+), 754 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
 delete mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h

-- 
2.39.2

