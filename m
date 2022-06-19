Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E19C43334
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbiFSVZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbiFSVZx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:25:53 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F385A47D
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:25:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g4so2024741lfv.9
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zlAa2SWNMoRJH1c7WAthq/UzszdFwU8tPB6Lp7wWIQ=;
        b=krYtalHCMaijY5A20eeXQnIq+UdobC9l7NMechDpAfBKFn8+btIp6yIHzqG4NJQaRH
         eCKpJCMdHIN55vAepPbiB/uNGclyBa6J9kGxOzwkGBpO2UWzRIHwyFJxvdpv3rmRGu6u
         hWj+eLQ6767pzQnwNNPlV3QHthvrMlseReqdpNur0lGlUTIHNQun8Uqni/1/AzYBftcj
         2BVJC8rH3i2vXNj3Lidi63/Gt/vgpmwlFe7Mz/XvJNgirf7Y0WXA6nxem2oWIzE8pWpV
         P96WgttHGoc4iFvXtdTXSIohs5cJ1AN2V+uIMTkds/noXJg1Cdchc9lwssghof8JhkX0
         eETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zlAa2SWNMoRJH1c7WAthq/UzszdFwU8tPB6Lp7wWIQ=;
        b=W0f3ExzSWokotS/eIbULgskPQ+bsYayb4EaG33zqCoiY4HXrYnRbXSvnmgeYVD3A4w
         fzZVet8cx3SoNSCJ0cFfeMA2OuMfS1IwOICWwsDHd2Zhfx5yOhFT765Mh4OQKqwnarnK
         isoCtd5vUZZ1s3e5D2zciUZhLnULkFE1IPwIoa9bRfyIS7d0pgOUoSPIIl29Uh2aIpTQ
         fOAXh22XIKgxIbL/JbC+lFB6iJcnmCPHh2WME/fxNTwybk91pXWMTDDNr/GH8bA0jUmY
         Vt98aavm5akdwpjvYtfvALrU2awjEOh1Psf8Gt79vdF83D3iUYeA1CwSO0g2ok79RBGq
         UUQw==
X-Gm-Message-State: AJIora9r6FK6lpNZKCXQpbnE2GoD9kVt6BWIL0ItRCdpK8ax4xPyjTY7
        yV9Ay70b7VuiVsX03q5AnANlsw==
X-Google-Smtp-Source: AGRyM1uoqtIQV8P34OqljwXWU3dlGXEQgVLVA2FhIgJhf7DN0EzgDdKV5kTWBYvHjrutce+XfqbTRw==
X-Received: by 2002:a05:6512:3f1e:b0:47f:40e2:9fd8 with SMTP id y30-20020a0565123f1e00b0047f40e29fd8mr12060717lfa.110.1655673950403;
        Sun, 19 Jun 2022 14:25:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Mon, 20 Jun 2022 00:25:42 +0300
Message-Id: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Changes since v1:
 - Use xo-board for the XO rather than RPM clock. This will be sorted
   out separately (requested by Stephan Gerhold).

Dmitry Baryshkov (7):
  dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
  dt-bindings: clock: separate bindings for MSM8916 GCC device
  clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8916: move clock parent tables down
  clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
  clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
  arm64: dts: qcom: msm8916: add clocks to the GCC device node

 .../bindings/clock/qcom,gcc-msm8916.yaml      |   61 +
 .../bindings/clock/qcom,gcc-msm8976.yaml      |   21 +-
 .../bindings/clock/qcom,gcc-msm8994.yaml      |   21 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-other.yaml        |    1 -
 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-sc7180.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sc7280.yaml       |   21 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml     |   21 +-
 .../bindings/clock/qcom,gcc-sdm845.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sdx55.yaml        |   21 +-
 .../bindings/clock/qcom,gcc-sdx65.yaml        |   21 +-
 .../bindings/clock/qcom,gcc-sm6115.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm6125.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm6350.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8150.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8250.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8350.yaml       |   21 +-
 .../bindings/clock/qcom,gcc-sm8450.yaml       |   21 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   14 +
 drivers/clk/qcom/gcc-msm8916.c                | 1020 +++++++++--------
 23 files changed, 669 insertions(+), 870 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml

-- 
2.35.1

