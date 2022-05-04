Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728B5C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 16:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353533AbiEDQmQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 12:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbiEDQmP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 12:42:15 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6632DA85
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 09:38:39 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v12so2773218wrv.10
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PA2ONwZQ2aNf3XU05hmmrIW1CKcRJL5Vxbk4O9KxM0U=;
        b=ZVO7iuC3y+8vECZtgXKsSGDXt7vhff57IF29kTm07enoAqdiotnertd/QkXHpyIbIO
         wmJ7bywYCbo41uf7pK766HfRJ4uikbB5X4vs5ZWTyHHfcfYUsvENQUIX4iri+g+l2+YB
         vOdrlZN0QEq17EAoLEWU0i51TT7GLDhWn0QqpwpYGnRY76MSmA3L8suIWEZFIev3c56H
         w1P6z4tpfO1nv3cfqoP3S2xqKDeGMXUn650VWIJyk21h8VjvoM0rSw1JekR6ksgYaVus
         awPIz6Lp+JgLY5D87DETBvKy4FtUMJyFymybVkrEj6c2ksMDLLAJ3kr5Hk3Jo0ufRPDG
         KEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PA2ONwZQ2aNf3XU05hmmrIW1CKcRJL5Vxbk4O9KxM0U=;
        b=lrOUHd8sf11D2EX2zvV8epJW7HQhYD4Xk9N7bfEeMC9EWqHpE1YMhUeU9mRzLY+KKa
         qdXBBbelw+qngrJCBv9iDqJPhqTfLTb3xz6/J0bLV8vozCAc9rWgTO23ftS4eXeonOZV
         y1Wlg7fC5kzWkmefSMatWNPPiF+5NixOuSSwkyHMLgIkx/noS8oxrJMTJtHnc+22kDnF
         kPNgjWFskYVWZKPZqQzsoZbM1+PydMsRjrOqvi8JczB5d59Br0Em7iU+ccGgdQ/cNA4X
         ynPXp/9VXNkf+x9as1ZAMM5i6a0BKMZSVi25ZbCiA1DeuS83Z7yRSMT5gWJLXhT7GXaZ
         5+kA==
X-Gm-Message-State: AOAM530VJQ8umBTq7/wff/fxun/qKz2hF/sWkzZqEdaysYOBllM75JDG
        1DptaIQG5xCpbqxw8U3I/et4/A==
X-Google-Smtp-Source: ABdhPJwiBcGQdxU/eQ8+6BVGeSYguBi2ruvk4NT3NT9jegKSzB2iaHgyNMmRpHNRlNUs1CzE0QRYxw==
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id a16-20020a056000051000b00203e469f0a3mr17276636wrf.710.1651682317410;
        Wed, 04 May 2022 09:38:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 0/4] clk: qcom: msm8939: DDR and system_mm clock fixes
Date:   Wed,  4 May 2022 17:38:31 +0100
Message-Id: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There a few omissions/bugs I found recently which are worth fixing up.
The BIMC_DDR_CLK_SRC command RCGR points to a value off in the wilderness
and should be fixed.

More interestingly a number of Multi-media peripherals are defined as
pointing at the system NOC for their clocks, instead of at the System NOC
MM.

This turns out to be not much of a problem so far because we currently
aren't trying to set any of these clocks and the MM_SNOC clocks are derived
from the same source as regular SNOC clocks, except they can vote for
higher rates.

Bryan O'Donoghue (4):
  clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
  clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
  clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
  clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc
    clock

 drivers/clk/qcom/gcc-msm8939.c               | 31 ++++++++++++++------
 include/dt-bindings/clock/qcom,gcc-msm8939.h |  1 +
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.35.1

