Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178D6C6FA82
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 22:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiIHW2z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 18:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIHW2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 18:28:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BC5E3D62
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 15:28:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bt10so30173952lfb.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 15:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YvAdGykEq7nSKOvPWAG7qubexjgftEKGvB66ejdN5V4=;
        b=jhxpROZ204WKs3eV40WldY4SIqufY/J0PvqLrckl3pJWXVsol/v7jljgDLdDIawyQj
         yMmOYsKl8D7x0iF2ZdBJbMbn7aTB1mXo0OAWkWRLXvsy6b9ZAP+MGQKRtAwlmWyd+k2g
         40rJ2IG2rg5C3a5F1zRWKt3HWfSj2cI10qjyHFGsbcKBaawLniX7la3N5Raw8RNNqy1j
         Ysf0oioUugtE7+kW+vwy66Ikp1iKwj9k/go93bnVrIlA4FW0j+IdGacFhm9+/xv6z881
         z5WPcqfEmPciWA33miuq/HWCXhaiDp53esrki0eJ+93g2tcgbZeVkdjXrveyu7z3zRL7
         6KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YvAdGykEq7nSKOvPWAG7qubexjgftEKGvB66ejdN5V4=;
        b=t5hrvvfc+vKi5D/JJk74CkdvW/WeLX4QbhL1g+JVgwvTRreICz108aAWVjz1YYzV+B
         FLMOGDhzGObWO96/+NpRd0a45zQON3bqI6YSZBtSJtdT6JIdug236pQqVdYsFzOZmuOC
         vgVVxxSPeKGCEo8y8qztkeP3DwKXrxk7C6xnwCDi4wbLq9TURU91u96RQOoNuQKvbMa7
         F29adqvrQbHgV+tJbW0eU8Ds9J1g6JTW+k3oS/0A8g+PcKeFdUgtNMHCZLyxepnn+RnN
         b9sS6b/aRZQlqT890TNWjkBG5IuzsIb/EtLcWWfRUGkSIvSh0F8SwfwuTiWMk6nNsIll
         pqRw==
X-Gm-Message-State: ACgBeo0KzBRgc+rExJ73+1VH06DMTaNcAaUWDKbtO7bgyow16ePmPZCY
        X3TJUwoWsNE8plSJcv0CQShoow==
X-Google-Smtp-Source: AA6agR5gFZd9K+TjJzxW4w/9epOoQAtaBZFTY7CxP7psTafUfRrLOjEvwG3ZK5976Wm4Q9kkzMIjUw==
X-Received: by 2002:a05:6512:68c:b0:492:2f73:6135 with SMTP id t12-20020a056512068c00b004922f736135mr3638882lfe.480.1662676131159;
        Thu, 08 Sep 2022 15:28:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a25-20020ac25e79000000b00497a3e11608sm1389078lfr.303.2022.09.08.15.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:28:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Fri,  9 Sep 2022 01:28:46 +0300
Message-Id: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the Display clock controller found on SM8450 platform.

Changes since v2:
 - bindings: added missing gcc-sm8450.h include

Changes since v1:
 - Rebased on top of 6.0-rc
 - Dropped clk-names in favour of using parent indices (Bjorn)
 - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
 - Changed bindings licence to dual GPL+BSD (Bjorn)
 - Removed zero clocks in dt bindings
 - Fixed syntax issues

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom: add bindings for dispcc on SM8450
  clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
  clk: qcom: Add support for Display Clock Controller on SM8450
  arm64: dts: qcom: sm8450: add display clock controller

 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   98 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   28 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   40 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/dispcc-sm8450.c              | 1829 +++++++++++++++++
 .../dt-bindings/clock/qcom,sm8450-dispcc.h    |  103 +
 8 files changed, 2106 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h

-- 
2.35.1

