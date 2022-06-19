Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21978C43334
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbiFSV1k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbiFSV1j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:27:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31924AE5F
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w20so14369438lfa.11
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJLe278N4mRl3E1vVE4w4t5r41H7ei/+ymPNgrkUtZg=;
        b=NbWFoE75zlAPNIrVYEgvAK4lPxQsTJQENiGPBbakhRgSrS+e+GjzRqguwBdUDPJJEN
         vKqQQZQAhEhLXj2z+4K17S4pV4VVvmNEepZmgFOtcI1zjufnub9sWRldoGJzZ/tlJBpY
         yfjLgQopzej0TNMq1saMHgUczt90jMP5tM3oSZDCk3wFbKtmWpwv80aXqDgC7bRk+mfL
         ZABJWUz1+xlvlMlkOnTzuC+zO2wX3n+z+9aGUjwhQ1+VKyRDrT0hWUS0sqe5GDt8iexs
         oAS9+QXu9rP0vyftqppCiG5mZWNHqzqoLdQfHbxsGCVYiHbvRNkUlCzJnduLYehVJJl1
         iWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJLe278N4mRl3E1vVE4w4t5r41H7ei/+ymPNgrkUtZg=;
        b=C+xCcQuiv7oncIgOh+Y7xAUJD8bLetvmdeyGCSckH4jSI2f55EtxUPO2H3i5KMYHJC
         trXxXI1LurDgP5DYdU0r858S6y5sChE+6wnditqxzQ3dv2B9qNQDc4Am2RrJv9nDmEPA
         GtXOWf4hDWyVVQSX2y9qYQe6+vu5h6QZZWdsoHbeu3XJJmNdpnSX+a/CogrIoGT3/1aw
         IeFJl1k75c/qhJFjuDbWJGUiQRazY8fGNEPFqYeU/xOr0n64FgA16m8sH2CffUt50Ost
         TsIiuSshDMZzRSXJW4jlbRXCIpVTEk6GjVLgfPHdMypxaZvXdXZlnNnPIVom+fkhqakQ
         JBEQ==
X-Gm-Message-State: AJIora+vzPeMt7Yy5aSEy6t4Y+bKeOQWh8WNMd/WgsakF7PJYO1IgC2a
        h69cprnnA5Qqx0Q9j7ggRikf+A==
X-Google-Smtp-Source: AGRyM1ucbMFjdw2URvElL0AsC7Ua+u+MCHSIC47vbXYscRzPTWBlB/Rg48T4u7a8j9sYjqS2fEfmWg==
X-Received: by 2002:a05:6512:224b:b0:47f:68cf:e697 with SMTP id i11-20020a056512224b00b0047f68cfe697mr3011924lfu.233.1655674056504;
        Sun, 19 Jun 2022 14:27:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:36 -0700 (PDT)
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
Subject: [PATCH v3 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Mon, 20 Jun 2022 00:27:28 +0300
Message-Id: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Please excuse me for the spam, I've erroneously sent v2 without the
requested change.

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Changes since v2:
 - Use xo-board for the XO rather than RPM clock. This will be sorted
   out separately (requested by Stephan Gerhold).

Changes since v1:
 - None.

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

