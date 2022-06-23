Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF9DCCA480
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiFWME0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiFWME0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:26 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7401849274
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g12so16969083ljk.11
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7et27IRUk2k+HUEgIcsFLwxxHmQwI7l6JUUzLDBsDc=;
        b=KcpHCRcWvm/ulz+wpkoaC/geinThaUQRFjuod5igkXPGrK8EqLXaIaDn4me6JA26ec
         I9BqJdWShqXlH8RaZuZ+7kfVpYVw9Rip/gbacrfiueJ0yfCsNvqZN4yzGfh4WpxSTNZX
         WJpAwlIQC38Jv+kCNbgkFFVIm1IlB0QPlfOd0/C+uOcw50tlIKJetryRq6ytqy+ibaCd
         +tp38l1d/0DllEF6aHPzxai11+sVT8qs+5kJLSRjObewxGr6fjiVh04zjQwm3lXbb3Xz
         zfuyw7+iR7X8qZuV5Bhy1CubvRbNsYfYYLkOKZt0r2x21CZFb1tyEhLc3Myop9CSFIDM
         Gx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7et27IRUk2k+HUEgIcsFLwxxHmQwI7l6JUUzLDBsDc=;
        b=6/Ol+vHicFxIcaYPB6vbZzS2rezAntCvw9Pz54pPKn3n/l54xR2IVm9Fun3TqTNTst
         TMFrHJn92b7yL7ALjwCBgJlA8TQOU6CEfwmpN/r97NdG6eMF02P0ekDbKFvZfKfoXJpW
         j381ysiPP8r3Aybnpo3coCXj0eSY5uJ1Wsx1It8HXhDBXQRzeRfapm/eb5pmOxGlBj3/
         cLxYHRcX6L2NMp6xNnhQmC8GFj5KyWJT5nR+k//l7dFbigNVAxw6XBnFjyZftZlGtWul
         d5kdI2AxCHCw6hiOToIGimpJzvVWM4kT/dObyUv9nkSDjm8hHg7rr5a0vWVde60/YLRK
         Wqig==
X-Gm-Message-State: AJIora8ruREn86ACDO+FbWFhP3Xb25BWyGr/uwiHD3SHhiV9/BcweaTN
        JMcNEOP1LpyP1sl/9gJRcFGEWQ==
X-Google-Smtp-Source: AGRyM1uvNJlETkOr1+KEwsow/xxOEGDhK1iETUdJqRGLPjMPSi5IzK7uPBF7PG0aVymgUDK0AvWf8g==
X-Received: by 2002:a05:651c:510:b0:255:9d3a:b0c3 with SMTP id o16-20020a05651c051000b002559d3ab0c3mr4535350ljp.18.1655985859386;
        Thu, 23 Jun 2022 05:04:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:18 -0700 (PDT)
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
Subject: [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Date:   Thu, 23 Jun 2022 15:04:03 +0300
Message-Id: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series converts the APQ8064/MSM8960 clock drivers, bindings and DTs
to use parent_hws/_data and excplicit clock binding in DT.

Dependencies: [1] (whole series), [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20220521151437.1489111-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-3-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (15):
  dt-bindings: clocks: qcom,gcc-apq8064: define clocks/-names properties
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
  clk: qcom: gcc-msm8960: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8960: use parent_hws/_data instead of parent_names
  clk: qcom: lcc-msm8960: use macros to implement mi2s clocks
  clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
  clk: qcom: mmcc-msm8960: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8960: move clock parent tables down
  clk: qcom: mmcc-msm8960: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: apq8064: add clocks to the LCC device node
  ARM: dts: qcom: msm8960: add clocks to the LCC device node
  ARM: dts: qcom: apq8064: add clocks to the GCC device node
  ARM: dts: qcom: msm8960: add clocks to the GCC device node
  ARM: dts: qcom: apq8064: add clocks to the MMCC device node
  ARM: dts: qcom: msm8960: add clocks to the MMCC device node

 .../bindings/clock/qcom,gcc-apq8064.yaml      |   9 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  31 ++
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  35 ++
 arch/arm/boot/dts/qcom-msm8960.dtsi           |  39 +-
 drivers/clk/qcom/gcc-msm8960.c                | 436 ++++++++++-------
 drivers/clk/qcom/lcc-msm8960.c                | 211 +++-----
 drivers/clk/qcom/mmcc-msm8960.c               | 454 +++++++++++-------
 7 files changed, 713 insertions(+), 502 deletions(-)

-- 
2.35.1

