Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D48C4708D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 19:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbjACT0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 14:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239025AbjACTZ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 14:25:58 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC5F15F01
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 11:24:09 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l26so22049617wme.5
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlV4V45c8yMejAxcwXlspx6FmQAhAXfePv/niq6cvW4=;
        b=iW0tP6U4j8zgaSNJR/QyYhQ0apHiuAPd3YuC03zfUnpZt1soz3oSRiT5t/9qvvbAQJ
         jZzibiFZzxGJq5eMeJP76Os9+ULSBNE6S8dQfxNZURGt4rNF4v88iU+dESwbRuzuCeIC
         DVcQHQoeGbW3OZecfJR3Yy0UPIMHn4HrcO3KDkYCsMdscYe0ixMSfx2QlloyTzcZT1Sr
         LXXNmMrPM+rE2Yjf6WCHOZFmneu18WbIznqKRyjUlSm/0+pgxifIuLEj/jvxv70EGGfP
         dDUV6H/3yptyj4wJ9dubtbOtqQ9ZJePh61hchuhiJnEMLG8JvzG/9MFECClVuHjKBStA
         u9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlV4V45c8yMejAxcwXlspx6FmQAhAXfePv/niq6cvW4=;
        b=GkciZ7XMpZPicF8OwlQ49daRPAbYIK4zRFrCnLERPmZJrTUgUMnvLcSSNE9f3h5MOV
         n3pq+Rb2FmUetoSWC8X8wphybd1X16CeFRBR6+EkXdk37uhcPb5TmnuqKN19w3+ElVb8
         YIjBbiwEKIX0+qdV32VgeYr0+rk31TbdrtEt8ttAt78vdtS+MiZNLPqAL0z7oDXuxB8q
         DNYAOVJTAUHhhq9XvulmiKwp8sa+o3IbpQBrsvDVFkWQaqU1AI2G1JeVpIpxaCULYhBd
         gB4DMAh4SBxveWQ/l/pCZTYfgSVPZIgqTUzmu0Yr9Y4GYfwy9IjaGXHxozDRbavb+8iE
         g9wg==
X-Gm-Message-State: AFqh2krx6HBG/qjs+XKI74WS7TWVYACjD+hyQ8g/PQocf0XVU7W0zB5b
        rcIe363s1NgKI1sXzUzre6y5ww==
X-Google-Smtp-Source: AMrXdXv9pnniyNCaYeT4Q5DpMz2ZntS6fOSyLoxon5RWiXAwUs32eND58KJnn1MtAwcLhKWmAtlung==
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id fl18-20020a05600c0b9200b003d9779e9788mr22825631wmb.37.1672773847836;
        Tue, 03 Jan 2023 11:24:07 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003cfbbd54178sm70803660wms.2.2023.01.03.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 11:24:07 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: [PATCH v7 0/4] clk: qcom: Add support for SM8550
Date:   Tue,  3 Jan 2023 21:21:54 +0200
Message-Id: <20230103192158.1155197-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds more clocks support for the Qualcomm SM8550 SoC,
It adds the TCSR clock controller driver and the rpmh clocks.

Changes since v7:
 * dropped the first patch which was adding the RPMH_CXO_PAD_CLK and
   RPMH_CXO_PAD_CLK_A IDs
 * dropped the fixed factor divider clocks from RMPh CC, since the
   dividers will be added in devicetree as child nodes of the RPMh CC node.

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

