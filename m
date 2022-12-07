Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1853BC6370A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiLGAPd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiLGAPX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:23 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC044D5D6
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so26254128lfv.5
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTUHSd+dK3oL65N0aldIWfCf2r00nealel9s81takxY=;
        b=PUCPeCiJ2Sp2mEBVVuH2LuvUxI9GdT69bLUjatdZX/cntbQtU16c5l9Q+16x2uup76
         TDC4j4P/NrtM8qPFdCSSgw3ZA2Zx2V4T9wjAVT2ivZVKD/LOMbIjwhBnrMvZwfC2Ju24
         E6PzpwBjiQ20lWm9NRMYrTKbMl6OdhBzoAhHS+FsVB5nRljF+ijmQlVgs+GS/Pcn/i3s
         Qv1URSqxI2Re6dmuQGt7QnpntvQbLjvU8Rq3YUMQgXJmD6uR78HvY6gGCzreJXQKVJwS
         1vlwnaN/62iW9dbndKD07tOXpxCuFmLUIAuWMRi+f9+jRvieHzchViLuJXRg/2DxaRDy
         NIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTUHSd+dK3oL65N0aldIWfCf2r00nealel9s81takxY=;
        b=DEREacAXHUo9Zy0N2mAOSxfW8GLoRWupIbvWG5mQsQHJTndnw6S0qpA3UERXPIBzFs
         z7pYIX+pUomgAhwNDX0OV0iqcJLW6ZlGzAO355jBJT/h1ATvFhd7Yr66u2xGS1TZbm49
         jLh0avw8YHbDSAyzoUQWctnCPV3iG8hGFIwIAhDsE3eTg0rBpMneJP0O5gJ/5uYUYotX
         2Q8Jn34MyfAoOv5LXDJ4od5tAVxhBM7btqLsA7gvVQhNAqBxmszVGqLzcIMistojxrAV
         XX+r5MPo2xmx7GJwCowJmjhT4uOaHo3rrTnrB3CL8Ks12Y3ueshy3hBrw7l45Vdi5F7B
         3W1g==
X-Gm-Message-State: ANoB5pnDQxWRn062WHyuqxgsH+MXKCZGQnM7GSUd1Xgyyen8mMYq6qvg
        pjoyVA/maQq6j9oECZyBWUeftw==
X-Google-Smtp-Source: AA0mqf7WUqRaVYp3RH5hnc3OOaHtXQ29VDUp2TLN8qB/tn9Y/UZUqt8lSeIZqPe1OiPZqWcZ7mytgQ==
X-Received: by 2002:a05:6512:3dac:b0:4b0:38df:e825 with SMTP id k44-20020a0565123dac00b004b038dfe825mr28978009lfv.471.1670372115306;
        Tue, 06 Dec 2022 16:15:15 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 15/18] clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
Date:   Wed,  7 Dec 2022 02:15:00 +0200
Message-Id: <20221207001503.93790-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To ease distinguishing between branch and non-branch clocks (e.g.
aggre1_noc, aggre2_noc and qdss) add '_branch' to all SMD_RPM_BRANCH*
clocks. The system (and userspace) name of these clocks remains intact.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 102 +++++++++++++++++----------------
 1 file changed, 54 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a3f08ebcae4e..8963ade901ea 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -61,15 +61,15 @@
 		},							      \
 	}
 
-#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    r, key)				      \
-	static struct clk_smd_rpm _platform##_##_active;		      \
-	static struct clk_smd_rpm _platform##_##_name = {		      \
+#define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix, _name, _active,\
+					   type, r_id, r, key)		      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
+	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_active,				      \
+		.peer = &_platform##_##_prefix##_active,		      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -81,13 +81,13 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
-	static struct clk_smd_rpm _platform##_##_active = {		      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_name,				      \
+		.peer = &_platform##_##_prefix##_name,			      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -100,6 +100,11 @@
 		},							      \
 	}
 
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
+				    r, key)				      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, /* empty */,    \
+		_name, _active, type, r_id, r, key)
+
 #define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
 		type, r_id, QCOM_RPM_SMD_KEY_RATE)
@@ -110,12 +115,13 @@
 		type, r_id, QCOM_RPM_SMD_KEY_RATE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform,			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, branch_,	      \
 		_name##_clk, _name##_a_clk,				      \
 		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, branch_,	      \
+		_name, _name##_a, type,					      \
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
@@ -638,8 +644,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 };
 
 static struct clk_smd_rpm *msm8976_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
@@ -672,8 +678,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 static struct clk_smd_rpm *msm8992_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
@@ -706,8 +712,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_mss_cfg_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
@@ -730,8 +736,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 };
 
 static struct clk_smd_rpm *msm8994_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
@@ -764,8 +770,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_mss_cfg_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
@@ -804,10 +810,10 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_aggre1_noc_clk,
-	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_aggre1_noc_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_aggre2_noc_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_branch_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_branch_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_branch_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_branch_aggre2_noc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
@@ -870,8 +876,8 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 static struct clk_smd_rpm *msm8998_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
@@ -930,8 +936,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 };
 
 static struct clk_smd_rpm *sdm660_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
@@ -976,8 +982,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static struct clk_smd_rpm *mdm9607_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
@@ -998,8 +1004,8 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
 };
 
 static struct clk_smd_rpm *msm8953_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
@@ -1034,14 +1040,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 };
 
 static struct clk_smd_rpm *sm6125_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
@@ -1077,14 +1083,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
 
 /* SM6115 */
 static struct clk_smd_rpm *sm6115_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
@@ -1117,14 +1123,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 static struct clk_smd_rpm *sm6375_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
 	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -1145,7 +1151,7 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
 	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
 	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_FREQ_LOG] = &sm6375_bimc_freq_log,
+	[RPM_SMD_BIMC_FREQ_LOG] = &sm6375_branch_bimc_freq_log,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
@@ -1154,14 +1160,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 };
 
 static struct clk_smd_rpm *qcm2290_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
-- 
2.35.1

