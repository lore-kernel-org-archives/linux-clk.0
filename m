Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6553BC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 10:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbiGNKD5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 06:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237452AbiGNKD4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 06:03:56 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1FAB51
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bn33so1533881ljb.13
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8ABWZUPcCCucQG+UKNQYiG1U5/O0BpXZdBZ0xGUW7w=;
        b=LLd5RM9DM3b2SwePhXMoNB36/BcC0Mvms1Fu9K61/lEMHpf/lY+Q+VJNHGtqgam/F1
         CuZAefLZnkXZCLI4xZMzDGqdaAhgodBrmr1BETJ3QXUzC8eR5KqAA19OJ+YKbmk/Hdva
         m0sMeG+kAdstp/r2W/YUqJOUSFgIunjsh53qiMrNviMRMNbqQVbfNWAyeHyyZQxhixDE
         +Jhxz2+FMHHlQgRANeEjV86XEM494zJogB3fn8iVQUI8uos5fVEg37oRyJGhBeZVxDyI
         V8cUGfZb35qDL33foDXzHGCIG66/aSr8U+9Xp3fbMh43p3KNjiciaTXIXEuSK3lU4INM
         T4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8ABWZUPcCCucQG+UKNQYiG1U5/O0BpXZdBZ0xGUW7w=;
        b=Dn7op+291+uZujQs5ft7vkcCb+80gGzrKzMO0anyUpvQRWW3o/frhVugQ7jCC/C8Ly
         OZeKGSevKtu8VNdgO/vnNR6XSrKKz3sVCBF5CIbm+K9q2BscCV4foUHzzeDpCTM1tp1s
         KnyoJPJ7ANhtibI2/dy3JOiBj9AKesiv0kr+d77HPao6SA1Jxg/cXlG9uTb0+dw5E5Sl
         66qy9tq2FBPhCSK6pSSseeJqqSK4aWJkyv4pi6nsJA+WGdIdO/jwzopkxJ28tOlwOnTc
         OsY8Ci+hgGVdRS5tLumExBBwesAD7REzEGommc8R/vaEIq7mRve/zvs9AJbeajte5Vu/
         sSRg==
X-Gm-Message-State: AJIora9u7SZUgAx5empoU3ffkHX5ltgVn07pX9TV6zsZXGvarw6MIeLo
        gSRXYXpXHh+q2c7i0TRLtAZ0sQ==
X-Google-Smtp-Source: AGRyM1tpxZqvRmYWqaIQxqarDQKiqS5dUyFS5PQuL/A5N4FyUAxFit9g/ShVtInE70ch790Wb3aXbA==
X-Received: by 2002:a05:651c:1207:b0:25d:4eba:e247 with SMTP id i7-20020a05651c120700b0025d4ebae247mr4026584lja.100.1657793032827;
        Thu, 14 Jul 2022 03:03:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:52 -0700 (PDT)
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
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the driver
Date:   Thu, 14 Jul 2022 13:03:45 +0300
Message-Id: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series depends on patches 1-5 from [1].

Path 1 is slightly fixed version of patch 6 from the mentioned
patch series (fixed to use parent_hws where applicable). The rest is
minor cleanup of the driver.

[1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/


Dmitry Baryshkov (5):
  clk: qcom: cpu-8996: switch to devm_clk_notifier_register
  clk: qcom: cpu-8996: declare ACD clocks
  clk: qcom: cpu-8996: move ACD logic to
    clk_cpu_8996_pmux_determine_rate
  clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
  clk: qcom: cpu-8996: use constant mask for pmux

Yassine Oudjana (1):
  clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks

 drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
 1 file changed, 100 insertions(+), 91 deletions(-)


base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9
-- 
2.35.1

