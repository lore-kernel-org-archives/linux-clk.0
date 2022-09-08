Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C23C54EE9
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 19:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiIHTKv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 15:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiIHTKt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 15:10:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092A7EC74B
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 12:10:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p7so29356843lfu.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z1/OP11GlLnDRJmthsHNyWrCSy9RTalgs4TnhcvtaBc=;
        b=zHelYglSfbiBOl/MHigaMxHtV03GXhA+25+cn5kBD96M5f5O9JyCJbv9+sXejH0pCi
         fqM7FQKP7m+WvigjHYPLve7N4juBdMFFeSysL7jJO1Lwma5BeB0M/SQnJeO2YkfeK/7D
         XI0UN9KJA492tgn2UlSyCkw0QALrGpUkj/fjrs7qZ90WdclZfR75AgT3BjdUd9RHqVdX
         vgiphnRGqFFyaRXFOZqQgb10zg04eg4swldr4NPYDxeqljEvA3n9quZ6NfMDC1AUb2aq
         NcqvvfDpMwJ6iVBQLNYr/RAHCjzIR2jS1wYo5Ai1nXKKELG5SohYsZWOeGn/Bbz6Xich
         GvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1/OP11GlLnDRJmthsHNyWrCSy9RTalgs4TnhcvtaBc=;
        b=A/NsCzDDsYDRFnQARsUp7C5zm1Nt7nqo+3zj2MhTxuuYnGzn/iUkhvOaAPZHZ9IO4z
         CZcvDugPMc0lJfV8yUaRQ9KO5vnWZgmW8cj54Ly4N3oYOIQeS6u39UoekNFeTilFkVwu
         xDBldgxaoXeLWlSBKVQ31AM8tO5i4b+/Ds4CQ0a+EIqWG85jerJmrBckVxlwL6s/Ai2f
         pxU7ImY52tGnuCnCKXi8edMd7e/U9eVlPNsb7Pz8K/zDecyGBXfqY4gFEq85zpRRLZud
         jpGZFax9ByghzUdFBGXvF3N0hToRmfsdPqvxbifBwUZNx6kbl3WBwr/X7vAv3KNnAM2M
         0quQ==
X-Gm-Message-State: ACgBeo1e01XKSD6PkY61DeGrJkOgaka3ay2Ly5OkYKEXGPJWPxHiD5Lh
        a9gH6xReYOVHLSuIsub3T1f4Pw==
X-Google-Smtp-Source: AA6agR62sFNq9FTxx9BBA64L192b2EXkbzrVmWXyATTRHjXuI1MJeVCylURlf81YIejbW3g+/P/ryw==
X-Received: by 2002:ac2:4c35:0:b0:497:ae09:11b with SMTP id u21-20020ac24c35000000b00497ae09011bmr1942257lfq.507.1662664245344;
        Thu, 08 Sep 2022 12:10:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm634904lja.38.2022.09.08.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:10:44 -0700 (PDT)
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
Subject: [PATCH v2 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Thu,  8 Sep 2022 22:10:40 +0300
Message-Id: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the Display clock controller found on SM8450 platform.

Changes since v1:
 - Rebased on top of 6.0-rc
 - Dropped clk-names in favour of using parent indices (Bjorn)
 - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
 - Changed bindings licence to dual GPL+BSD (Bjorn)
 - Removed zero clocks in dt bindings
 - Fixed syntax issues

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom: add bindings for dispcc on SM8450
  clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
  clk: qcom: Add support for Display Clock Controller on SM8450
  arm64: dts: qcom: sm8450: add display clock controller

 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   97 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   28 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   40 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/dispcc-sm8450.c              | 1829 +++++++++++++++++
 .../dt-bindings/clock/qcom,sm8450-dispcc.h    |  103 +
 8 files changed, 2105 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h

-- 
2.35.1

