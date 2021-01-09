Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FC9C433E9
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 13:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF58E23A23
	for <linux-clk@archiver.kernel.org>; Sat,  9 Jan 2021 13:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbhAINzw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbhAINzw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 9 Jan 2021 08:55:52 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9086C0617A4
        for <linux-clk@vger.kernel.org>; Sat,  9 Jan 2021 05:54:56 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E18C23EEB9;
        Sat,  9 Jan 2021 14:46:19 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 0/9] Clock fixes for MSM8998 GCC, MMCC, GPUCC
Date:   Sat,  9 Jan 2021 14:46:08 +0100
Message-Id: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series fixes some issues with the MSM8998 clocks and, in
particular, brings a very important fix to the GCC PLLs.

These fixes are enhancing this SoC's stability and also makes it
possible to eventually enable the Adreno GPU (with proper clock
scaling) and other components.

This patch series was tested on:
- Sony Xperia XZ Premium (MSM8998)
- F(x)Tec Pro1 (MSM8998)

AngeloGioacchino Del Regno (9):
  clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
  clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
  clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
  clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
  clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
  clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some
    clks
  clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
  clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
  clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting

 drivers/clk/qcom/gcc-msm8998.c               | 143 ++++++++++++-------
 drivers/clk/qcom/gpucc-msm8998.c             |  18 ++-
 drivers/clk/qcom/mmcc-msm8998.c              |  20 ++-
 include/dt-bindings/clock/qcom,gcc-msm8998.h |   2 +
 4 files changed, 125 insertions(+), 58 deletions(-)

-- 
2.29.2

