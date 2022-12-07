Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A12C6370A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiLGAP1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiLGAPV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:21 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF964C26A
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:13 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id c1so26219108lfi.7
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COIwOpR3AFBIRvfDbD4zcFvWKfpmHLetCDIWQdTm83I=;
        b=fdI6DDiXDys8UMoHcfTggzWoPdqQa544Ggas2v5H+CbjRuDsZsIeaXaWXRHbh9h/K5
         c/L80//MHthxaXIb+4MsNBqZMFBpAhKWYIoQqpS1bnaY7F+qrPqxUzPhVegKeQG5dpyH
         ZmD8hNWumieYmOGU8f9FGxOiP4oTyNsVMAEFpp0fNzyFbblj0DUSzqOtT6Yi5qoURDN/
         7UYLW/r8V2ez6xy7gtH4w6VGX+eAkRQGaHSTQgac3FnZWjAWthGFvEQFd9n2zR4nXRfj
         Ea1+DdMGeculVKmXMvwmMCogDHGQ62Vc3emi3IpLaKJWc84pDnB+XZSQKPbwPdflbFup
         mbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COIwOpR3AFBIRvfDbD4zcFvWKfpmHLetCDIWQdTm83I=;
        b=n+If7hiW6ZtUHe4sjMREza55SE1qX6oIVWq7m4CaPCLlhGCby4LFlLXgOSbfgR7feX
         fHtPlp4mCauNvjaA7Jx2z7OBUggG2wO0ojcKKajQdJOTadacRxM/zgwjJ0kpalmZszRu
         MzHVoQaMQym7enSohUMEjLUz3LtuQZSw+EVOQzIMmvSLARCRZB1DXVcTCN2v2M1Nlenm
         crRPGIaBA65AjGmdg4KdIexxic1hpEGNqAHQ7WAqdXa4ZnK4sMZw5DiOBZS5+d13q3q6
         SvbpG1KiIVY0iceFL4HPEb0uit/OhyghTrDRRfBsGTCOcLLh5CHebTawAHL8WoxD9NXO
         0wxA==
X-Gm-Message-State: ANoB5pmu0mLNNHo9tdW0UUYZGmMs5eA0lYxzdXVWP1YYtgf6BYWoy9jR
        7yj84Yok/KvckLAcV7B8aHj0kA==
X-Google-Smtp-Source: AA0mqf77OsSnbhTeP4BwkqA/zzklZ0AtQ27MA7RDKUlxw99ss5WcE6an/GrnyhJblk+y0aiYj7ce/A==
X-Received: by 2002:ac2:5dfa:0:b0:4b5:7b91:54ca with SMTP id z26-20020ac25dfa000000b004b57b9154camr2957873lfq.234.1670372111542;
        Tue, 06 Dec 2022 16:15:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 10/18] clk: qcom: smd-rpm: fix alignment of line breaking backslashes
Date:   Wed,  7 Dec 2022 02:14:55 +0200
Message-Id: <20221207001503.93790-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit 52a436e0b7fe ("clk: qcom: smd-rpm: Switch to parent_data")
introduced ragged right alignment for the line breaking backslash. Fix
it to make the code look consistently.

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

