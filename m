Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A817C04FDE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiLIQtP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiLIQtJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:09 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6A793A7E
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:06 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id cf42so7966994lfb.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H1k74eEwNIes4zhpugDvMOS8oazyo5CwnJwStBHtrs=;
        b=sIkLYzLJT5KSkeJVL/Gj8h7+PuaTsyEPccqsZk4E7CIneHmbD6NEDi12wdA1FK16Ei
         9BnP8+njf8Rues43m6aUwm8waCwuklNlENsnMus7FXJEUe7zkvJI7fl9j+jPo0+URdCW
         3DWcMkQt5s52xLz6nysWnVJOzhY7ZFoDdO61/la+/6B24Y9Kk54403JuLyo8jOycZLm2
         rpqxh8ZPOLi1WibQC88gMJMR+q5KIn00tQGKREuL6XUIrnokT3msiSM0RYeqi9aj6mml
         fPhEb8kqe5wvCuuhAZBOJ6mXNi94Tg/phzI87Bl8fcrmsshvyZBCLPyoKnnuZRHITSoe
         LbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H1k74eEwNIes4zhpugDvMOS8oazyo5CwnJwStBHtrs=;
        b=cynpAmx2K3fcTuJVPrHlGDyf1LLuiZbjUWkwkIvTHhkkSEvcv2P668uNTcPymwvFVH
         lWSJveH1vnKZ3Jvy8drDFlwlCu73pcDWqXfjcP7l7CfPDQpptosNFUDmRxFM7jH7VU0l
         xNn1Hdd5+0Up/WIzzxZc2tfoQRcasc1DZJi4kbWNLzvC5NWkcSS0uN0LRRv6PcNnd8zD
         R3afjsxxKwVgpYr3/hr5YAzP/bjg6bMMuq45fywXxPIRBhh4XJGPfjizUpaYBUHWsyN5
         rwHUy6DhBHGsY8dF30QCa7gnY+4XXNQc0nVTnzwDMVTUWz5BRyZ7VeyLVwU78y57RLMR
         zL0w==
X-Gm-Message-State: ANoB5pnrI0gIaJD1mAQGwxgNkDb9wN3HQy8hCQFK27qaerDOYL+JlFAx
        SWp9ZRdch1jNNFNLsgHrLEcf5g==
X-Google-Smtp-Source: AA0mqf55C2ibSPUGAGegt8PBQpWJWTnLhBlQWs99xBuMf3Q16DY/iDbVJTV0+OFxUAROcLu2PW/qvg==
X-Received: by 2002:a05:6512:358d:b0:4b5:6c00:429b with SMTP id m13-20020a056512358d00b004b56c00429bmr1789471lfr.26.1670604545243;
        Fri, 09 Dec 2022 08:49:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:04 -0800 (PST)
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
Subject: [PATCH v3 11/19] clk: qcom: smd-rpm: fix alignment of line breaking backslashes
Date:   Fri,  9 Dec 2022 18:48:47 +0200
Message-Id: <20221209164855.128798-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit 52a436e0b7fe ("clk: qcom: smd-rpm: Switch to parent_data")
introduced ragged right alignment for the line breaking backslash. Fix
it to make the code look consistently.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 2075cfd34f99..7e43ecdda763 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -36,10 +36,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_name,					      \
-			.parent_data =  &(const struct clk_parent_data){ \
-					.fw_name = "xo",		\
-					.name = "xo_board",		\
-			},						\
+			.parent_data =  &(const struct clk_parent_data){      \
+					.fw_name = "xo",		      \
+					.name = "xo_board",		      \
+			},						      \
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
@@ -53,10 +53,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_active,				      \
-			.parent_data =  &(const struct clk_parent_data){ \
-					.fw_name = "xo",		\
-					.name = "xo_board",		\
-			},						\
+			.parent_data =  &(const struct clk_parent_data){      \
+					.fw_name = "xo",		      \
+					.name = "xo_board",		      \
+			},						      \
 			.num_parents = 1,				      \
 		},							      \
 	}
@@ -74,10 +74,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_name,					      \
-			.parent_data =  &(const struct clk_parent_data){ \
-					.fw_name = "xo",		\
-					.name = "xo_board",		\
-			},						\
+			.parent_data =  &(const struct clk_parent_data){      \
+					.fw_name = "xo",		      \
+					.name = "xo_board",		      \
+			},						      \
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
@@ -92,10 +92,10 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_active,				      \
-			.parent_data =  &(const struct clk_parent_data){ \
-					.fw_name = "xo",		\
-					.name = "xo_board",		\
-			},						\
+			.parent_data =  &(const struct clk_parent_data){      \
+					.fw_name = "xo",		      \
+					.name = "xo_board",		      \
+			},						      \
 			.num_parents = 1,				      \
 		},							      \
 	}
-- 
2.35.1

