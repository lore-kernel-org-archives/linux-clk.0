Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3667AC04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbiI1PA0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbiI1PAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9DE2E9DD
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so20772183lfb.6
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xCV7rEuLvHI3GvFjoeTBcnFw7+joKM18upgDxMAcDBI=;
        b=weoWm3gBbgKtdbJ0ToHNdVIuY63umcWDbGRkemKSg5Cn91vvsHrrR0JqjI64ndOAqY
         FyBhesHwiboHUIZ6Mh902UQbCH0pXB7HeajjE6zyljovqahI+T3q2oGBZvrwknjt3Qi6
         NNqE5hC0GFYDv2+ccHzg70LtA/mFFiXuPPULF2DScyKGMDIOrrqFECvfVS/qdPSRFQAE
         8QccLz1f9xFmGYQkL3W45snQ75/eO1GyBvcEc843ro65RPgWvwTfWokAMBv0/vkZY8M4
         K6HRBVWrt6btq0HmW4LOrlqTN8TwvwpLpg30ER0iVKHjRSLugQxZwP7kiQiu86TaaqNE
         Rh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xCV7rEuLvHI3GvFjoeTBcnFw7+joKM18upgDxMAcDBI=;
        b=VFKpcKwHnnxud4r+5jqh6SR/A4HDGM3u9nFOa5Kj1bFvbLq15KV7QWLARID5Rq/7IB
         ebHnX1JNDtDlDOwQi+ZLKTAPEMzIvkjiRTN/AQeEIRewHg/k9/4X1V28g0YHC2uE8rJk
         TkyI7TMYyikTHHAGm8pY/6wLTEdKder69faGGcBWQLqAen9BoXr4vxG6zvEFLbcpLuiP
         KDL9S+d092iIeoNrEtN1m5ZjEVsUezgV1B5HOeNxFtvzg7ANho9j+/UzcLlniy5k4ggS
         YsytT4rY5DeSD+MenyFXn4eBEGlA32FI0dWZb8BDPpLhtRWxdnMf0HXDl/b4ob8PzcP+
         /vkQ==
X-Gm-Message-State: ACrzQf2baQkI6cDMABbB5oVmSzCD3gwsu7n8Ik8BczPh3AWaB8XRktI5
        KcM/byRtJvqDnqPb6c2h9fNDfg==
X-Google-Smtp-Source: AMsMyM4vHY45bzx8c51sdS1YYV6hghpZ3NttEYROkG2UbRR952yK4JK1ugFk/y5YCYxYhKLzbDBgHQ==
X-Received: by 2002:a05:6512:2312:b0:499:e67d:1b52 with SMTP id o18-20020a056512231200b00499e67d1b52mr12973951lfu.305.1664377199789;
        Wed, 28 Sep 2022 07:59:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:59:59 -0700 (PDT)
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
Subject: [PATCH 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Wed, 28 Sep 2022 17:59:47 +0300
Message-Id: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Modernize drivers for global and multimedia clock controllers on the
MSM8974 platform. Switch them to using parent_hws/parent_data, use
clocks through the DT links rather than fetching them from the system
clocks list, update schema and platform DT files.

Dmitry Baryshkov (11):
  dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate
    file
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
  clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8974: move clock parent tables down
  clk: qcom: gcc-msm8974: use parent_hws/_data instead of parent_names
  clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8974: move clock parent tables down
  clk: qcom: mmcc-msm8974: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: msm8974: add second DSI host and PHY
  ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
  ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device

 .../bindings/clock/qcom,gcc-msm8974.yaml      |  65 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   9 +-
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  38 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 106 +++
 drivers/clk/qcom/gcc-msm8974.c                | 682 ++++++++--------
 drivers/clk/qcom/mmcc-msm8974.c               | 736 +++++++++---------
 6 files changed, 932 insertions(+), 704 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

-- 
2.35.1

