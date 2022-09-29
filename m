Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FF6C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 09:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbiI2JVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbiI2JVt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 05:21:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B433812B4AE
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:21:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o2so1314534lfc.10
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9dskQRpUPj5W1ioUWccp/L/Tjbt3VYPexwFmRI0ffDk=;
        b=kX5G87deMyQxetFmP6jescjFeHw6IcRFT/4JhqRVq7XNWFNhuUIxmETx8fbKVs3f9G
         NgXKbIeMJGXrYdmyFVKLteMKJoM10RSqEmNXbrLyNylUXKM7TApNyURGtIgELuJ7phVn
         SWiQXT/bW1D4J1fZJxwXEHW3ywW6jveidTkbHaRDjttI14balMw9AdkjzMO2z9Ig6s73
         OQ5VfBM7iPyripTQhdVnyh4IGtnon063hl/7oSiwBMGS3m9QlxK+ETclaD+J/9iTy/+t
         b8GVp0h5f2SZYVHRM2oFgTjVAUZNm6dEICRTbJuHXQpWUkqeMUmEIHtoqpU6ZY0sh6cI
         b8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9dskQRpUPj5W1ioUWccp/L/Tjbt3VYPexwFmRI0ffDk=;
        b=XIS8hOwuZrTArCW71+m9E86smrBH2WPH23/QTBreHSC3+aUlx0Lg+dv5bx1f4HO5RB
         l8H4sqRUTXaBW6HUE1QrDNY4AXI9O+yduS/O1prjnE5+E4opNSkzI7Vfq0I+Mikjqkml
         6Kt+cX/wfA+j33VcOi07yqNejrQxZvhYZp/uxxBjSccDHra11VYCeJpTLB98X2gH11Q9
         vNhqpa2gZJ0NtWQrZB1AvNvnFFDioRf5hiiXfWJgE3xxfKeFvBLqm7wEdfDWx5L7EmBn
         4CqtLEmvSivD49HMcMprStp3WglMMxInwKj1rWcp00mE4wNflW1HwCNmbtwc9sBHInEs
         G00g==
X-Gm-Message-State: ACrzQf2JmG3xceztkIDJKvr++Gn2gJ2Ph36rskF0MWwA4BlYkOLw1E78
        uNBKF3i/RV8CMpYoUATFysYULg==
X-Google-Smtp-Source: AMsMyM5OUGY14dCBZ5WhOfGOL1Bjoou8bBBm544IiHqIEpwtjW4AGqDMGxU1eIlqIKRCWkkqBg0jwA==
X-Received: by 2002:a05:6512:3f29:b0:4a1:c920:ebad with SMTP id y41-20020a0565123f2900b004a1c920ebadmr970154lfa.574.1664443306111;
        Thu, 29 Sep 2022 02:21:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:45 -0700 (PDT)
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
Subject: [PATCH v2 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Thu, 29 Sep 2022 12:21:34 +0300
Message-Id: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Fix typos in the commit messages (Niel)
- Change bindings license to dual GPL + BSD (Krzysztof)
- Fix issues in gcc bindigns pointed out by Krzysztof
- Fix Taniyas's email (Krzysztof)
- Removed dsi-names and changed dsi-phy node in the patch adding the
  second DSI host+PHY (Krzysztof)

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

 .../bindings/clock/qcom,gcc-msm8974.yaml      |  64 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   9 +-
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  38 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 105 +++
 drivers/clk/qcom/gcc-msm8974.c                | 682 ++++++++--------
 drivers/clk/qcom/mmcc-msm8974.c               | 736 +++++++++---------
 6 files changed, 930 insertions(+), 704 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

-- 
2.35.1

