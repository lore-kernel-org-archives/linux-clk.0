Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8452C4167D
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 11:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239565AbiCNLpC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240459AbiCNLn5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 07:43:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AEC1CFF6
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w27so26597598lfa.5
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8tEzrxdNc4jjoNSfhM1jc3MU9LSemhGmq+z88lCX5o=;
        b=ggqnU4YO/MtIU9SDNvfKkqtI7Ty5stK/oQTMQWB8AHI21Hdk+iTYwcmK3GJwj2R+l0
         tZ7F5HVoEcAvxcQyegUAswfiMsCuBAIY/LA2xxo4BLkT8bPU6T5usDsXiqBf043lS2GF
         NSUlLXfwrgMjNcQbh0tMUpRyd4TZQf6Q1HabBxpWWhDGns+M8Ht5/S6xkxflme7Rn7Xv
         Gg2NpXJdPpJSDssoHlKdRfgz4Un4BI3TZVi7A/tBntbkrVchXMc0cR2udshT+rClIMBn
         063xNfPhfP1v00IbuwsWhgK8iXa1O95E7Mc1bFE+T9h0RJju9GpoLEzj9t0C+RJfD+YY
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8tEzrxdNc4jjoNSfhM1jc3MU9LSemhGmq+z88lCX5o=;
        b=lWsxku33KVwVhKAN6cycdZOZecdcNpQ5CLu7Phi8aMzru2QK0M2IFibzU5HlRoFb+u
         r28GRxA/3IBvjq54QHDMHcMFBa4XInEP6X8MQdGrVVj4yL3MiLUwayZXzpfqOxExCkjz
         qww+4E2CgE9bvoiJCkMELZzPjhR1RP1zf8XhasdI+eGfOOAzoEu4VHflIGO/upGYHh7c
         jxizTkBlMvuXqA1j4hZHqKlFw1b7X6SFio2man1cvqxFq+4UUI1E0MMXbJmb//UK2Bj/
         7zXUsMrxDCoMYrL4tDV4IRSzby6t7uK4lQeZdfLNMGlGWYawQIZ7/Y4rDlxcOGLbZBoV
         z2sA==
X-Gm-Message-State: AOAM532P+bQWm9fx7QNR7taJ44iT1saRdHngWhMNqrEymfnzZDBcXQnl
        7u64XSlaqf5e1ov4yRliohTc2dK+iCm0qett7eM=
X-Google-Smtp-Source: ABdhPJzMrZPGC8buT0pqOE22MRVIe72bNArccD6iWtuauQNVqk1p+xjC26DlMTe82pNybumgK90eJg==
X-Received: by 2002:a05:6512:22d1:b0:447:5fde:a2ee with SMTP id g17-20020a05651222d100b004475fdea2eemr13696335lfu.115.1647258134540;
        Mon, 14 Mar 2022 04:42:14 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id l11-20020a2e834b000000b00246308690e2sm3893333ljh.85.2022.03.14.04.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:14 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Mon, 14 Mar 2022 13:42:09 +0200
Message-Id: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Changes from v1 to v2:
* updated qcom,camcc-sm8450.yaml according to review comments from Rob,
* changed qcom,camcc-sm8450.h licence to dual one,
* disabled camcc device tree node by default,
* added Stephen's tag,
* rebased the series on top of clk-for-5.18

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: export lucid evo PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add rivian evo PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,camcc-sm8450.yaml     |   89 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2869 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,camcc-sm8450.h |  159 +
 8 files changed, 3295 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h

-- 
2.33.0

