Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAA6C43334
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 12:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbiFQM30 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 08:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236185AbiFQM3Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 08:29:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D8827B08
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i29so6724974lfp.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wgwVSFZNWDzW3s9VD9D+iOdjRuPlzLI/orUO6Ryi4Vs=;
        b=FJz2G1u3NM5p81ysLd+xbROqiM8O0kzpGgLO8QH6zR2ARcPtrZQ0ljcHQJ1HVOvF7M
         29KEmPNSB7WZkrl8+U/hpyfd1VninxkZY2fD0qpHPZZdLKwwrOt16TkOdSq+i7EEZvVJ
         W1+nglwi43kPNkvlDfrmoh015LS+T4DUkOQGw4SNnrDHu1xKf0ek6yYv5Fc0PdCGxNKs
         /7gA/Ok02LIRl7thX8TmvcBWv6uqT+GyMGMXAIrXff73L3qjKhXlMlZtMB84PKuKxQJa
         yeiEDrJrjZ0AW0MX0ASObXPUJg02dAtTOTi37iOr1JQ1Iq6oL+02i0L1tVgZVb/6GuNz
         c0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wgwVSFZNWDzW3s9VD9D+iOdjRuPlzLI/orUO6Ryi4Vs=;
        b=lLXzBUdDEwJmXMvHLMorOX3y1pkOQi842dMsMNCLxdAhBo0g3wMGCAmqjPE0b16ID8
         eF60krJvM72LsCmAIZw0OnR12zlaP77u7NYnnHzYDmj8WrqgdrhlPPByy/HVHcNhUBXJ
         So41ILmvAziM2rtBNO6BpCugLpoLL1NpdqddQN2cpK9kEttHWhm8vZ1lNHzw5gcmenMM
         jlk7jEibXp7uJ79ugbCvg8Gfj8L5CVRtW/AGnGUzaLcOAQvJhNEXoZ1Q8jlLnh0ikydt
         5nNNsUH5SQ3aJ1SeJi7aaldh0U/52qeNzDHY1uwVzZsMyBj0vrttKgI6sUQ3wtZPZ2Q1
         5+jQ==
X-Gm-Message-State: AJIora8N6IDx5qjZs/LmkYGFmVu3KCrXxxvQqfwcnPeiRhxQbid+fD4i
        pEvRQgf1/Xogyg5GrDUCjAEYow==
X-Google-Smtp-Source: AGRyM1vPt9ctflrXzlwW8dBe0aNeU5tT+MIhZKQvbJpFYBs2Nx0or7NZnhAzDEl2S7a8on8htyZHFg==
X-Received: by 2002:a05:6512:3c9f:b0:479:3077:e34a with SMTP id h31-20020a0565123c9f00b004793077e34amr5359076lfv.395.1655468963303;
        Fri, 17 Jun 2022 05:29:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/6] clk: qcom: mmcc-msm8996: modernize the driver
Date:   Fri, 17 Jun 2022 15:29:16 +0300
Message-Id: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update mmcc-msm8996 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Dmitry Baryshkov (6):
  dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8996
  clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8996: move clock parent tables down
  clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
  arm64: dts: qcom: msm8996: add clocks to the MMCC device node

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  162 ++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   16 +
 drivers/clk/qcom/mmcc-msm8996.c               | 1052 ++++++++++-------
 3 files changed, 808 insertions(+), 422 deletions(-)

-- 
2.35.1

