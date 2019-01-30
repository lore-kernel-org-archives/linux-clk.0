Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42838C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 20:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09D8B2184D
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 20:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wz4S6W6Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbfA3URe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 15:17:34 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53212 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbfA3URe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 15:17:34 -0500
Received: by mail-wm1-f67.google.com with SMTP id m1so208164wml.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jan 2019 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rcmBiNckGBL8JgpePhychms4DP2WGCi+OpJzN+vu+EQ=;
        b=wz4S6W6Ypwwf/BkuuB39TKUdqnk0sNrblBwiC+okge6YJ2klBvyG08bIwhgus7IKbQ
         dZD+4PrlYFZtIQTjO1vcOrkA/TcCwC6AacXL2MyDTIpPtB9VcctvAhV/sv8p2lcgqr+3
         Y0aZaZUzvaRvC2QUa4SdnFfNta3+dS9tFJ+AVMoPlMpXIeeCmzsXSQlPPfqBjqIqgo6V
         zE+qavcSZEi+VuSRQR33wUaGqbToc62p1xQaUPb2sSr3IAx95EnOiXSfYw1kkD5mDlJZ
         nig8dKmCDjFMTGnnFdBThQWEQ5BH0ACmxoOAzfKIk4Zjmone/tk2iJiJqNIDDtMo5Ra1
         7PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rcmBiNckGBL8JgpePhychms4DP2WGCi+OpJzN+vu+EQ=;
        b=Icxze8IHkGWZ69EIKxronqrCSE2IXhpBB9PL+OZ5vC3uX0wNim1F5J7BuEK8kIZ6p9
         98LiCjJ/OuIdqsuu5eMY5uE7C6LiIC/xoLVwvaqvSpxWrjbLcSzX3HWBfTUkcLETfunw
         mGnCTxxaGmt36TPQQsBwSjSGYSlpHkDPZRBgGT2vqOq71FWseldImhUI35pJjNHMTnTi
         81pSCQHCLLRhkVCR+78dyPWrpymN1ju/V2s88KxKbkV5O3h0KLvYseMvfEio+7CcqKKb
         oQspMzSnPyKGHywod50SA+JmsooA4Vk333ibRq4+nDip6jkU2IuHKRETxBgad5dh1XFg
         QK+w==
X-Gm-Message-State: AJcUukcAnv9eUKjw/YplGLTqMfGyloHW+rYNdgbmSlQtNMdqSoHggvjs
        311juEITr2kq+n/h/jl2R6Hmgg==
X-Google-Smtp-Source: ALg8bN7veqAZAdiqOfxs55xokh+L/FYIQ/coXDY4PjnZwA9SbDBVdTdJkGdTIKTMpYQKe78XIu2Wpw==
X-Received: by 2002:a1c:70b:: with SMTP id 11mr27789670wmh.74.1548879451677;
        Wed, 30 Jan 2019 12:17:31 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:f7a1:ce00:5105:4b7b:c922:7c6])
        by smtp.gmail.com with ESMTPSA id b12sm1438016wmj.3.2019.01.30.12.17.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 12:17:30 -0800 (PST)
From:   Carlo Caione <ccaione@baylibre.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, l.stach@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH] clk: imx8mq: Add missing M4 clocks
Date:   Wed, 30 Jan 2019 20:17:25 +0000
Message-Id: <20190130201725.18961-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clocks list is missing the clocks for the the M4 core.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/imx/clk-imx8mq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 398ab0bcd9de..c02c43fcb892 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -48,6 +48,9 @@ static const char * const dram_pll2_out_sels[] = {"dram_pll2_div", "dram_pll1_re
 static const char * const imx8mq_a53_sels[] = {"osc_25m", "arm_pll_out", "sys2_pll_500m", "sys2_pll_1000m",
 					"sys1_pll_800m", "sys1_pll_400m", "audio_pll1_out", "sys3_pll2_out", };
 
+static const char * const imx8mq_arm_m4_sels[] = {"osc_25m", "sys2_pll_200m", "sys2_pll_250m", "sys1_pll_266m",
+					"sys1_pll_800m", "audio_pll1_out", "video_pll1_out", "sys3_pll2_out", };
+
 static const char * const imx8mq_vpu_sels[] = {"osc_25m", "arm_pll_out", "sys2_pll_500m", "sys2_pll_1000m",
 					"sys1_pll_800m", "sys1_pll_400m", "audio_pll1_out", "vpu_pll_out", };
 
@@ -396,15 +399,19 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 
 	/* CORE */
 	clks[IMX8MQ_CLK_A53_SRC] = imx_clk_mux2("arm_a53_src", base + 0x8000, 24, 3, imx8mq_a53_sels, ARRAY_SIZE(imx8mq_a53_sels));
+	clks[IMX8MQ_CLK_M4_SRC] = imx_clk_mux2("arm_m4_src", base + 0x8080, 24, 3, imx8mq_arm_m4_sels, ARRAY_SIZE(imx8mq_arm_m4_sels));
 	clks[IMX8MQ_CLK_VPU_SRC] = imx_clk_mux2("vpu_src", base + 0x8100, 24, 3, imx8mq_vpu_sels, ARRAY_SIZE(imx8mq_vpu_sels));
 	clks[IMX8MQ_CLK_GPU_CORE_SRC] = imx_clk_mux2("gpu_core_src", base + 0x8180, 24, 3,  imx8mq_gpu_core_sels, ARRAY_SIZE(imx8mq_gpu_core_sels));
 	clks[IMX8MQ_CLK_GPU_SHADER_SRC] = imx_clk_mux2("gpu_shader_src", base + 0x8200, 24, 3, imx8mq_gpu_shader_sels,  ARRAY_SIZE(imx8mq_gpu_shader_sels));
+
 	clks[IMX8MQ_CLK_A53_CG] = imx_clk_gate3_flags("arm_a53_cg", "arm_a53_src", base + 0x8000, 28, CLK_IS_CRITICAL);
+	clks[IMX8MQ_CLK_M4_CG] = imx_clk_gate3("arm_m4_cg", "arm_m4_src", base + 0x8080, 28);
 	clks[IMX8MQ_CLK_VPU_CG] = imx_clk_gate3("vpu_cg", "vpu_src", base + 0x8100, 28);
 	clks[IMX8MQ_CLK_GPU_CORE_CG] = imx_clk_gate3("gpu_core_cg", "gpu_core_src", base + 0x8180, 28);
 	clks[IMX8MQ_CLK_GPU_SHADER_CG] = imx_clk_gate3("gpu_shader_cg", "gpu_shader_src", base + 0x8200, 28);
 
 	clks[IMX8MQ_CLK_A53_DIV] = imx_clk_divider2("arm_a53_div", "arm_a53_cg", base + 0x8000, 0, 3);
+	clks[IMX8MQ_CLK_M4_DIV] = imx_clk_divider2("arm_m4_div", "arm_m4_cg", base + 0x8080, 0, 3);
 	clks[IMX8MQ_CLK_VPU_DIV] = imx_clk_divider2("vpu_div", "vpu_cg", base + 0x8100, 0, 3);
 	clks[IMX8MQ_CLK_GPU_CORE_DIV] = imx_clk_divider2("gpu_core_div", "gpu_core_cg", base + 0x8180, 0, 3);
 	clks[IMX8MQ_CLK_GPU_SHADER_DIV] = imx_clk_divider2("gpu_shader_div", "gpu_shader_cg", base + 0x8200, 0, 3);
-- 
2.19.1

