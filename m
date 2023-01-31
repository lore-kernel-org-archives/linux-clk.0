Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8313AC636CD
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 09:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjAaJYj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 04:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjAaJYh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 04:24:37 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68DB420F
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:24:36 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id k4so2995721edo.12
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYcNGVRGbKvF1Kz2a8/niRAnUQJ33SC+hNf9Bt1i/nk=;
        b=A4+selVb+SU8uj4VbWW/KF+30EVjg1kP+jxLrA+k4od8Oza/oykPDWeKVuVfOJ8pGS
         qGoOLfMHnOJvE+uwQuoIIm5PaJ5u4gSgyuRpxCYpV7i+V9PFa4dwYK9JdMWQh85h11vg
         I3M+sUVE0FuD9Ql5PYlw/zwjQ6DhAJyk5ir9yPd0B0JDvNbAdrnR9EHg8/CqpbEV6NEK
         E1yHRovnPVFjEFEY7VHaDsBU+VcxrMBSm2QaDuR0IrZZ0lZI21vgNGSfq0hauA9YQHW1
         H8arwih30vcRqdEv4/7xGLxAW1mjAa6qFZPDhc7fzMAUILI06FejJbq59rQgHJrPxcPa
         Qkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYcNGVRGbKvF1Kz2a8/niRAnUQJ33SC+hNf9Bt1i/nk=;
        b=DmArvRDMxnGg0wM9Ca72HOfQAIlY9+7YD59aplKrKtQVC00VSTP4Tk9bVlUPnyecpq
         Y3A65bDWqOWdUheiU05HnYbuMtrDmavqyNGMjUxtHKSLXRne4G/3ey0QSFFG2mm1o22n
         pEhqTQMM/I8FGJs3zKipj6RPZmAqMH+EhJXqjBWPaK4+QFJupMV98wUwt7Y/iHjfP9g6
         AqSO2jNjyyAl/OWfL7E7Ts7fbGiYVIQmoG2SlSld82xmW3G8YMt2gQxDcHSDRHtY1HBh
         iNCDXmmXGKbeClLhcugDStaqZAOosESkje+32OkdOrXRXLllqiiK+FpOkKaugsJJfUhn
         gzyg==
X-Gm-Message-State: AO0yUKWF5rrcY7wcrCVeByX2RD+zPkeKECstTCcqzB2yZACmHPA/wLNH
        YchF6b6rlaMg2nuEMcWG8IaNIQ==
X-Google-Smtp-Source: AK7set9y6lTD51mLZcUsXx1buhsZhQcxfYD32N+QZR9bUJynZR0UQBhQeAD1CoyNEvUVdY8FPCKrDQ==
X-Received: by 2002:a05:6402:6d4:b0:4a1:2ed2:7822 with SMTP id n20-20020a05640206d400b004a12ed27822mr2383236edy.5.1675157075383;
        Tue, 31 Jan 2023 01:24:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0084c7029b24dsm8205198ejb.151.2023.01.31.01.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:24:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
Date:   Tue, 31 Jan 2023 11:24:32 +0200
Message-Id: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131092432.122711-1-dmitry.baryshkov@linaro.org>
References: <20230131092432.122711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for SDM845")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 622a54a67d32..c51feb556f41 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -22,8 +22,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xf
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -121,6 +119,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -193,10 +192,6 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
 }
 
-- 
2.39.0

