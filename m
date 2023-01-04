Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853F6C46467
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 09:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbjADJfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 04:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239122AbjADJf3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 04:35:29 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AB21BE91
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 01:35:04 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso378280wmb.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bn35MCymS4jefAOtB8LpHRl6V3chqeTKM4An0AeJQ8Q=;
        b=rug8cHT3SMg1Zi5j+BhP5N7pPAd1Fv0zoxcy5+Wfd/4hoI7jy7PmTwcj7pw20vVwoI
         F48LcmbtOqhmVa2sjulZ0qTEBd/YpTf8HW83k8vLCN1R3fqTGUpZayZreN38HoL7BaTO
         ducmaxN7/sTgk3S06c6yYxCm5tidP7VEhh+Nr3FkEKyalZpw2v6Vr5q1v1oq4f4iUZ2I
         RRWeJIyBs1j1DOT61dbtNngDUIGXUXLV+MRDErM8imtZlxZJANQkhM/B4MNMOiXEPmE7
         1ss8IPG0EGGENxMgN8ejSIr0TYpZRTkafYTXKliRlraAIscw4zpD85U1bcsCVBKwe8Vu
         BVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn35MCymS4jefAOtB8LpHRl6V3chqeTKM4An0AeJQ8Q=;
        b=4bhYoU/HS+eMBaUldxhC6HF6/KjOxc5Wu//usftaPRKEs8HTeGYtgxp5goDCur5LV5
         1umMRVKbHpzQgAOb/R0frujGDuPoSlTA43XukPLkha5892hqSOjAHg71RWelzejZmjsO
         qFdwbAsyZLtQAmLxH/9KnO+cSMKjGiL+yUAdlb8NxdnTnC7Gyj06JhDv08LcyJWoLlre
         tU4YOBCyM0dGLkPpPOh7L4xGY8DkBd1d6jH+dok1Ys3CF6nfAzXU/tjD6tx4HLI+O3fe
         Hrgaw9gpD8yP8fBf1V3UT2Lbune8jiINgvumaK3ZXmC29LvZaJpgrzq/35SxfeVaXka7
         6FIw==
X-Gm-Message-State: AFqh2kpiM+WO7Bqcx6LSBMVzrungr7sSVwP8pZCvY1TFwQcECDvQ0tsh
        W1ufDUmnxFJfO2M8Qzy+o9EQPg==
X-Google-Smtp-Source: AMrXdXuqzkSn3rR1xjuy80hePampeT5Cf59w1yG+YqfnwcxBFFloj6msrL55FaBTqOxpmsZizCsspg==
X-Received: by 2002:a05:600c:2e54:b0:3cf:ceac:94d3 with SMTP id q20-20020a05600c2e5400b003cfceac94d3mr32396174wmf.13.1672824902914;
        Wed, 04 Jan 2023 01:35:02 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b22-20020a05600c4e1600b003c6d21a19a0sm45561452wmq.29.2023.01.04.01.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:35:02 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 0/4] clk: qcom: Add support for SM8550
Date:   Wed,  4 Jan 2023 11:34:46 +0200
Message-Id: <20230104093450.3150578-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds more clocks support for the Qualcomm SM8550 SoC,
It adds the TCSR clock controller driver and the rpmh clocks.

Changes since v7:
 * Replaced RPMH_CXO_PAD_CLK with RPMH_CXO_CLK in the TCSR CC binding
   schema example

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (4):
  dt-bindings: clock: Add SM8550 TCSR CC clocks
  dt-bindings: clock: Add RPMHCC for SM8550
  clk: qcom: rpmh: Add support for SM8550 rpmh clocks
  clk: qcom: Add TCSR clock driver for SM8550

 .../bindings/clock/qcom,rpmhcc.yaml           |   1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |  55 +++++
 drivers/clk/qcom/Kconfig                      |   7 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/clk-rpmh.c                   |  36 ++++
 drivers/clk/qcom/tcsrcc-sm8550.c              | 192 ++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  |  18 ++
 7 files changed, 310 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

-- 
2.34.1

