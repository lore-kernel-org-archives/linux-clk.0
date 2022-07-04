Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DC0C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 17:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiGDRY6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGDRY5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 13:24:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39AA101E4
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 10:24:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z13so16732933lfj.13
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9t/oQcvRmz3WhGtE4QkZvx/Vuhm1DbGGfq7PacKjWM=;
        b=MnWXVBEp2cvjbGwfa5IDCxynvA+suhFxknrdtt1J08RRgy6S6HuHm8Zld3VNAsQYvQ
         RFGT9xQj2yJ2uyK/qUiY0HE9z82CK4ZFHwn00M8OWW9QQPnLrvRdbnoJV/8dYCg29i7K
         7H8zGZJ1m8dI6FZMwIRQBN3b3OhTgp6/ZV2rOYy9Vtwl0+8pJc+wnkgFs1IGNQazL38S
         714pSk/pqFqSXe0Z+LF5UmbE2ZGMnaL7mmBRrHGh3jOoZzJ/UVuMiacchiPHqdd/79gr
         pgVPxfcgWqMNQozs4ASYOz18dtdhd3Hackw4+gF6h6cTVDTteaPaZn5+vMivqTKAvC8x
         R2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9t/oQcvRmz3WhGtE4QkZvx/Vuhm1DbGGfq7PacKjWM=;
        b=DELPmqm6jud5VD3mjlaoCI/vuXjU9Klss6dbccj6D552eyyugo4gooPHGTnuCkB9Cv
         8hWHXdChEWJPwvjPzMOlMwq3WfK3xIwiZHwlNEhgLg2AKl78vTlW4ZkEMLIeBbs0eLdQ
         qYCwFNrl5N6/uWM/PNq0Dua8iMBn+wykskjz9rl7kdgwvYa0PPBvX085xg5Cl4iaqZYq
         gLAUsNZEc0AQWNFCThTw0RkJxP4qdg856pkqN0+iFnfjobT2ze0p9bpPXLbbzcMpUzJa
         5g5Btnyh8e2hS6SqVsNsAnBpjmiCBDDM7vtbkryTeiYvR2koYxhnAcjmQ4gWQVxCcK+x
         v9JA==
X-Gm-Message-State: AJIora8OhtwXfP7UUYNFTdhSHEvJ6UelpNhX+jWTbEzXMhu5HEe5OKq+
        zfG/u2k27GCFgtAI3TrQbQmYqA==
X-Google-Smtp-Source: AGRyM1vWOr4pN6T6pY74ffz2lTptrH4RLT8Z/4DZztsPmdlNFPrtYi6D7NudEdM4XhNOBtbqnrMV2w==
X-Received: by 2002:a05:6512:c21:b0:47f:6392:dcf5 with SMTP id z33-20020a0565120c2100b0047f6392dcf5mr20362693lfu.117.1656955494368;
        Mon, 04 Jul 2022 10:24:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:24:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Mon,  4 Jul 2022 20:24:46 +0300
Message-Id: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Changes since v3:
 - Describe that ARRAY_SIZE conversion fixes the issue in the driver
   (noted by Marijn),
 - Rephrase commit message for the move of GPLL/parent tables patch
   (suggested by Marijn),
 - Fixed the placement of gcc_mss_q6_bimc_axi_clk clock (again, Marijn).

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
  clk: qcom: gcc-msm8916: move GPLL definitions up
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

