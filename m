Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A31AC43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 11:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiFWLrl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 07:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFWLrl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 07:47:41 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A1F4CD43
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s10so22950416ljh.12
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXWN/aAWxtD3w9NE3pOGzrsnEZnMVaXxzOcQAPZ74oU=;
        b=YGI73uPNsoMGSTZf402rLF7nfaFbdxzuiXGyQ0dsqrO7Aqw16oNJI0OCgtmhCCTrWN
         ik4mFvpxhD1Hhjp/rbvNuL19eHrDw81vxyRv1ALIqJvRADV5e5kwrRUhfZS3IaN5yNPj
         +EIn7w83tTU//E5zI2yLnTZHuCXDajWm15MOmGIxB0vzmCyfS+2STxstTYFFzTtdAkQl
         XWKcgvG9ruQiDgJyoyPn5jcG0sOqNw0/CWNS2ZHz/x2v7VKEEJ7h9eaDpdCD2+ooS2OZ
         r31jA6g6MUDrkh9O/1F7/wY2eBokvCBE4j1sakUWOP8nd9JamWWQp9CSuIZiPJ+FSQmf
         GROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXWN/aAWxtD3w9NE3pOGzrsnEZnMVaXxzOcQAPZ74oU=;
        b=xP9x8T+2H+a1s3ktMy97XK6SGYB8qNDu/C1aKAGFkRmp4jK/HwhiT8sjhVZDSmPmus
         kimAzlNhWKs86A3Coo/Rtg9Zjsrfk2+zpoPbfAoRteJ15HuxYQ7W1KYSiqpxOM9OhvYp
         PFgawA7B3yxqS4laJu9lVpUjIfr/MVv48RX2Hog03frXCCYtgqhxO4LNSTF/Dae5Pk3d
         DeP9qUTr3e+1wqwfRnTpplrYg47Cma6nJBUIeKIOwc/p2mn8Da45mrXTEG1KWtTqt75+
         HAJvsudTXEZmcY/AbKnazZt+CgJ5OgJWifNr7lBRtHhuISSlbCrW30KQaTp2yvYXslfe
         /X1A==
X-Gm-Message-State: AJIora+pSl/TClP0EZBonUwCfB4U8krE64GYvGrZyLis5zSqOhN1uuLc
        TGWgc2dsgIswLOWxrPdF30ZP8w==
X-Google-Smtp-Source: AGRyM1vRzVM7HDL/yz9VEY7DzWu5L60EVe6i2Ft5xUKtJ5nGzT/mqsMq6PVlyp8poSGwYuirHyD0Uw==
X-Received: by 2002:a2e:915a:0:b0:25a:6c3c:859b with SMTP id q26-20020a2e915a000000b0025a6c3c859bmr4487892ljg.452.1655984858216;
        Thu, 23 Jun 2022 04:47:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0047f77729723sm1369968lfr.43.2022.06.23.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:47:37 -0700 (PDT)
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
Subject: [PATCH v1 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Thu, 23 Jun 2022 14:47:33 +0300
Message-Id: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the Display clock controller found on SM8450 platform.
This patchseries depends on [1] for the Lucid EVO PLL support.

[1] https://lore.kernel.org/linux-arm-msm/20220610104951.2296533-1-vladimir.zapolskiy@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom: add bindings for dispcc on SM8450
  clk: qcom: Add support for Display Clock Controller on SM8450
  clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
  arm64: dts: qcom: sm8450: add display clock controller

 .../bindings/clock/qcom,dispcc-sm8450.yaml    |  132 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   35 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   40 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/dispcc-sm8450.c              | 1806 +++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8450.h    |  103 +
 8 files changed, 2124 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8450.h


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
prerequisite-patch-id: 718981be9b1a9aa9a6780c04f8ae305958c133d2
-- 
2.35.1

