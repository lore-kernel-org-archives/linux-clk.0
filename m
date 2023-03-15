Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1D6C6FD1D
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 17:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCORa5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 13:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjCORaz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 13:30:55 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E23457D8
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 10:30:53 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b10so20273877ljr.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678901451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyHC0VUkupsiuWX2pHsL/65xztoUDBBkuNkC20AficQ=;
        b=GJ97q5jYvQR8vrr48icXglGbW7rbJfdUHhHBaxDDPZZlMjuR8MS2JnxvjV8cuStFTt
         6qPpD4iKSjMNHuHp+i9qJ15VUl4IuKII6uZimndhf9u5uDyL4Hm5n9Day/PRXRZDHNm7
         C6YHj0adBrFhpy24nz+Q+2EBEK7c82TPHA7gQpzDGb9O4PnGemNXrk0p8sZoZbnVquM5
         bP54KsuOal0w7AKd8/jnsQM5EirCsBB7/Z2c8C/7YgmrpAn1T9WYh3M28XfSgtHZcyuO
         quvQKTn1rwmVmXlX2gtJQG1Fk4km3eES/RMbwn+KL9WWgPCiypagIjwr4RjYpzuEZe9e
         jfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678901451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyHC0VUkupsiuWX2pHsL/65xztoUDBBkuNkC20AficQ=;
        b=lG+WK8fDfsTBmWiGNTq31tz8F7GeZH5WADUGmM7zM7AEUmnGiXSEbxA1MgKrCAOELH
         RaKwMMW4jLoxj1UL8ljhBCgSdfu/LFGPj627j1FTSvZDW4RVIby0JJmc57TIlkJv9OOE
         czPQ/A5ZYjDQouP6WfAERQ44H/aIbGjK3NKttucFbttC6+IGDpRWkqChmzVtQC5gDn5L
         xV+aF5XPytgyUsKVC+nQ/l/qlKSrd6ZUiFPzwaMtTJNVbTs6XqKbeG4ImxspZi/xJTIM
         nczQj6XBzFdxNypwsDpfIM92Z06OhLzE0VSXW+50lLjl0Nh8xxd+VsL2mPYG5bSi5OHS
         sTiQ==
X-Gm-Message-State: AO0yUKVifLaUlWAatbOhc5Fb00GXPHnaXUPSYSVOkVWNBfR6VboryEfa
        TE5H78JZnDdfiGy08PSQynRKUA==
X-Google-Smtp-Source: AK7set8qdUTG2izjSNf/ErXIPYQfJRIKDjxOhFSDR7Kjx9V/3mxfJTKO2NEma+EDiR6JfZ0/rg41EA==
X-Received: by 2002:a2e:850d:0:b0:290:8289:8cc8 with SMTP id j13-20020a2e850d000000b0029082898cc8mr993566lji.22.1678901451666;
        Wed, 15 Mar 2023 10:30:51 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id d28-20020ac244dc000000b004d85a7e8b17sm887561lfm.269.2023.03.15.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:30:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-qcm2290: Fix up gcc_sdcc2_apps_clk_src
Date:   Wed, 15 Mar 2023 18:30:48 +0100
Message-Id: <20230315173048.3497655-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the PARENT_ENABLE flag to prevent  the clock from getting stuck
at boot and use floor_ops to avoid SDHCI overclocking.

Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-qcm2290.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 7792b8f23704..096deff2ba25 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -1243,7 +1243,8 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parents_12,
 		.num_parents = ARRAY_SIZE(gcc_parents_12),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
+		.flags = CLK_OPS_PARENT_ENABLE,
 	},
 };
 
-- 
2.39.2

