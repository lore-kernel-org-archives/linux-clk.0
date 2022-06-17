Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1E7C43334
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 14:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382895AbiFQOrV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382880AbiFQOrU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 10:47:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC94554BEF
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y32so7300757lfa.6
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7IyyWcogW6tzD/uS39NdaxdXjnV0hMVXgONOdwNoQI=;
        b=iGJFN/+WVtIXDzPKRmw43NyFfYfiKVIkVvkY3vISZDB67HLGS37o0WlFGGtigKjSwA
         xPf10AL6B9vqB1gO0sqIxh6r8RhrDoWcmIPXWib1nDq45SfnlkL1rpNNPKciOfhJ5fvS
         ucpGTQgjgKvG3iuLzMO8fYYNjRLa8q2WTOLjELoeldGI/fPrCWiz2eiCukfF22A10Gkq
         daYI4J1UkBUjggEheVSZEjtJcqZogw+bJPLvYeJkdgw557ZqQxfcJrd4l51Kb+ZsmLfW
         DRYl/ztLHZ0DPryZASx+ejmjqLh8yYBquH24OeRCMLSGpUCIcBYVEDGDrr1PmvJFVW11
         PuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7IyyWcogW6tzD/uS39NdaxdXjnV0hMVXgONOdwNoQI=;
        b=LV1M97NnxGHB6dbXeE79t8pBK5EbHMUzR50COuw3VUlswUGaGjzYoR3lRl6ZYOMtv9
         Ij1A+FKDKmDei+YYQg8sR5rQHgZEPJuc692JjYj1PKjdZIJity7v4c2tk6Lltrp1vWuH
         +kZEdMrpkazy8/aknb3XRxAsRd4GYLRDnqBuZpSI2VxrKfmZE4q3wOba1VrMlfNBjDGD
         //bSUqi1Zg3tyuCs4rseOfzFal0A0zfj6pY3N4jrIZ6yfMn34w1msMtaDYtZV7lwCOAR
         Bdu1KRfkC75kZJc5QSN6i+MPe5san1yH94LvmCCuInSywjt1lJc5IoH7HlXg4rQNIcj6
         Mdig==
X-Gm-Message-State: AJIora8kI9gGwTZXOWR+9Lha2if2RIhEbkk+CCabvqVD/S94Zwm4Ox1T
        fVZ7Z/84/SIJrVQc6YMZPYoVag==
X-Google-Smtp-Source: AGRyM1uYWX+CX2LWivh0Oae4UjqnwJb4t4TlULauVCsJ0YPqcusd6ubt2RGg5Vh3NiZpWbUOL1Xv0w==
X-Received: by 2002:a05:6512:2983:b0:47d:a3ac:3574 with SMTP id du3-20020a056512298300b0047da3ac3574mr5814842lfb.343.1655477236204;
        Fri, 17 Jun 2022 07:47:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Fri, 17 Jun 2022 17:47:07 +0300
Message-Id: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

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

