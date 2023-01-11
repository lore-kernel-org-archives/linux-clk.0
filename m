Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A48C46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 06:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbjAKGEO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 01:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjAKGEH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 01:04:07 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3596544
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so21901823lfb.13
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHl5SfoZQbvI7DtBiiyiLAoOusFjCWEpOBIgr9zH2lg=;
        b=tzGh6fGREmFUX2KNwQvKh6mQF6Dvg4Yq3y0GyIIhF6qnpiShzZ3cMnUJX/2qRwuQOP
         +dOzGRCFXjw5N/vwjpqT6MQ6PJJ2KH8VR+sI8v9VzjuCaWnn+m7/qzStB+j8cBqLElXu
         mX7MngxKiQfa4AfNaTNDwnT7GowgVl/P56Togd1ozs2o/BmtqaR6QhX/ahWaBNWsgBjA
         7d1M4uHwwE7JA6mM1tKI2yVyFnRPwfynVLjX3SaWe+Y5aqinfYXwqk7l+sBKYa2etFFt
         M5otFSGWBNd7DlWMc+TXf12bVyoxjta2q+LTf8W/jZsK/bXu3q1DTkySapw7cP8pFPis
         XASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHl5SfoZQbvI7DtBiiyiLAoOusFjCWEpOBIgr9zH2lg=;
        b=rypMCZYk15mcFC2Z2rgyMTTimZ7DfwC0SWCR4TkZ9/hniIMaIseYOXZoAc2u9sNyTv
         +khgkduIRkAqJQjZr6L7Iz04+kY4H1ATJNs/VEySRh3XRzmay5SjCzD6pygL2PDQwJiy
         /FvYsMKdtL9zVZFRaoXmDZVPXaF8ZF/b2Hhe3ti/MBMwkymcUElIazum4RBO9xXUhR8n
         VSM1WuwMJ05FOVLvABB1Y454Mjtv0HtRYmB3rUnul8c8bWd9/AlPyyP+RCT9Pyqu4aYD
         y6boPDI/Bn9BUSF9PMjFHjAd6jYuAv4VWLP4cfYeUNPYTZ/tzbXk8QTk++bPa0cDrDcB
         q5Mw==
X-Gm-Message-State: AFqh2krUgTV0W85bs2WP7NBruk9ULqix18QUfDhhO1I88IyowdPcV4gh
        RTRpx9UzBP8fzjMIqpD3187wVQ==
X-Google-Smtp-Source: AMrXdXsOGoy10rVcWY4dzGd+ch3VP+cyDENpviSErpObCkSv/t2ogBp0g9zXpEtjNXm4YdHZw3/Ntw==
X-Received: by 2002:a05:6512:31cc:b0:4b5:5caf:9d62 with SMTP id j12-20020a05651231cc00b004b55caf9d62mr22441134lfe.61.1673417043863;
        Tue, 10 Jan 2023 22:04:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:03 -0800 (PST)
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
Subject: [PATCH v3 00/12] clock: qcom: apq8084: convert to parent_data/_hws
Date:   Wed, 11 Jan 2023 08:03:50 +0200
Message-Id: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework apq8084 gcc and mmcc drivers to use parent_data and parent_hws
instead of parent_names.

Changes since v2:
- Reverted the qcom,gcc-apq8084 example to use numbers for ufsphy clock
  indices rather than defining them right in the example.

Changes since RFC:
- Fixed clock/clock-names's maxItems in qcom,mmcc.yaml
- Expanded qcom,gcc-apq8084 example to include an example of UFS symbol
  clock bindings


Dmitry Baryshkov (12):
  dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
  dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
  clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-apq8084: move PLL clocks up
  clk: qcom: gcc-apq8084: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-apq8084: move clock parent tables down
  clk: qcom: mmcc-apq8084: remove spdm clocks
  clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device

 .../bindings/clock/qcom,gcc-apq8084.yaml      |   44 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   44 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi           |   18 +
 drivers/clk/qcom/gcc-apq8084.c                | 1024 +++++++-------
 drivers/clk/qcom/mmcc-apq8084.c               | 1189 +++++++----------
 include/dt-bindings/clock/qcom,gcc-apq8084.h  |    1 +
 6 files changed, 1098 insertions(+), 1222 deletions(-)

-- 
2.39.0

