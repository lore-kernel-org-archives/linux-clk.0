Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F35C4708D
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiLIQtA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiLIQs7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:48:59 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E613B93A6A
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:48:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y25so7910629lfa.9
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J30FnQ0XiYOkHjVMLeIVpKVykgV1Qs0n+YPAOVIOpV4=;
        b=b2D2uGJ8VV2as0TF1iNkhi3Q/zjaAfpIkf9XcqE8w9rpm8q7up3YA5WxPVwjsrahZH
         LHPxphF3tauv7GfBtCx+k7iMQmR85VR0jbOAIeBBoUcwSOmp9B+v964HnrIFQJArDsqs
         sGiW2VREDwkxJoz2iJc8qnCR9BRfNJinyYlyQY4MJEz/BfloTsvI3mrYoskO+YqGu5Mr
         TmWQ0PTlYqC7yDdA2q52PuVvXo+uCcuvkRfsjQGZDLs5MDk8vpMAL8KVOGNds6lQ0X4P
         qLaJfe0mHDoe22frX4AznQG/cuqryHPti8ECBfTmrDcQFWQynDLUT5IxoTafTHsvikGe
         s77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J30FnQ0XiYOkHjVMLeIVpKVykgV1Qs0n+YPAOVIOpV4=;
        b=GZkFeB20deJsxcwqnNfAqcOhb7QotO1/1wYafGqq+lLnNghXMGF0OmxoikfOiKP/dn
         H4Y3uLaePpeUDOFxJI/8bSBT+w+tQ/zCNokfUB6tmU3BTe1wBuBvXuO+bO6NKKc8FCkF
         VwPUtppDpxPwJ6MioGGRV+OE2xyvlEQI02ffbtFM0PCPoZ2b1FZNnOekwhn4w7xR/8z5
         KJqd6fQsqSMpFUvrzfN8nQvT6kzgNDu5Xt8tlFcfDXnomSekEiddRXH9mwk+7BU8ZRs1
         4mC4z3KMZWC/KHEAjGcu6K2Qlqbol8wqi9lM5F6Y24w1SaBKv7Ogi64th6224McY9IAK
         LTqA==
X-Gm-Message-State: ANoB5pm5oyL48LP6Ywlbovbr4krPmdVc3rMYTrt4rgKzCYgt6bB6Tmkw
        j+UwdA3Nag/PZasgMsMoJ56bXQ==
X-Google-Smtp-Source: AA0mqf6QHZX7sydljwe+pLb3NkfHGfOKw8Be2gecYqlnlnkhxnyLI7iY4fQjrJ3kufXVJrNts406fQ==
X-Received: by 2002:ac2:4c4f:0:b0:4a4:68b8:f4f4 with SMTP id o15-20020ac24c4f000000b004a468b8f4f4mr3021215lfk.58.1670604536319;
        Fri, 09 Dec 2022 08:48:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 00/19] clk: qcom: smd-rpm: drop platform names
Date:   Fri,  9 Dec 2022 18:48:36 +0200
Message-Id: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series concludes the previous work on Qualcomm RPM and RPMH clock
drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
clock symbol name, as the clock definitions are shared between different
SoCs (platforms). Having an SoC name in the clock definition can lead to
all sources of confusion and/or errors.

Changes since v2:
 - Split bindings into a separate patch

Changes since v1:
 - Split the MMXI/MMAXI and sm6375 vs sm6125 changes into two different
   patches
 - Reworked macro definitions and usage to remove empty arguments
 - Dropped qcm2290_bimc_gpu_clk definition in the corresponding patch
 - Alignment fixes


Dmitry Baryshkov (19):
  dt-bindings: clocks: qcom: rpmcc: add LN_BB_CLK_PIN clocks
  clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
  clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
  clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
    clocks
  clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
  clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
  clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
  clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
    clocks
  clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
    clock
  clk: qcom: smd-rpm: drop the rpm_status_id field
  clk: qcom: smd-rpm: fix alignment of line breaking backslashes
  clk: qcom: smd-rpm: move clock definitions together
  clk: qcom: smd-rpm: rename some msm8974 active-only clocks
  clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
  clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
  clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
  clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
  clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
  clk: qcom: smd-rpm: remove usage of platform name

 drivers/clk/qcom/clk-smd-rpm.c         | 1441 ++++++++++++------------
 include/dt-bindings/clock/qcom,rpmcc.h |    2 +
 include/linux/soc/qcom/smd-rpm.h       |    1 -
 3 files changed, 723 insertions(+), 721 deletions(-)

-- 
2.35.1

