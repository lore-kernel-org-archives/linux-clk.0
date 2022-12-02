Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E37C4708D
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 18:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiLBS7X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234732AbiLBS6t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 13:58:49 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249809D2F8
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 10:58:48 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z24so6393225ljn.4
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJRawyccM6S0fWZhPH+1sw/LHmZ/NDOmA2rsN1oJYqA=;
        b=c/BJpr+XInSpF5t8BtmjWdsdsfYPs4+qmMnS02ZjKTRI72Rf/Opd+F4UA5pv4gSn/I
         8f2hja5/joCS02VgiRLCZaHi/dqRti81VUguZg2qFCVHWG/sR1J7i+ONMfbCZ5lnrGBr
         MLvFXaVWrKhzD9YVqGstcJaMbiZR0HDotO9jIcuZaHy+mb+8j54OOHGTIa29/tGBV+Ej
         ZgvBIfZzn5ovVZHdC+72aQNnsOVPirPe4cBprSxgNOQqU7lU0qOoPB6CuTLSK7XvXfcB
         zPNa3vkmCvI0m+5L4Tg+wLWWSnaYUAdQDOHg0H4/2kzSbsgF86+aXR76wMYwhPhaq+1e
         sIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJRawyccM6S0fWZhPH+1sw/LHmZ/NDOmA2rsN1oJYqA=;
        b=piiFNXsqZvo+B7143JPtywFpx1J5+jefrYdNglZOFHcb9WtXR++0vZk3Rn1txQsO+L
         ru2v6W44b+FLwu84Cc/LZvjJkjVsjucpcYlUchEVc16CyQV9WfNGEGXMO2vXGYqO4Vha
         ZAJ27+lOaTCpdo7sfBU+K3BpdBaU3NaqZq3qD+zLLdMYgVGKvgOAZ0HrnZYCgXbGfC0Y
         rIf01LFmY0/Zq2FMuGWYfkN+nwJdKbC8uqwnozvuZW8Z5Ae2nUHOqR9v08irDFMoWPtW
         qzkKYSmo5NlmyQ7K0Eo5sjslooHo71Bjk0m5JJ1VNWPq2C9o+ZGjZhP+JJzxEZoSD9nA
         np4Q==
X-Gm-Message-State: ANoB5pnDC2xWUKaErKFFQ3CwIcM26amljqROPKqaKpBGNpKKIt8//hxQ
        Brnv0FNIIVUUvcsQ3xPMb+7dqQ==
X-Google-Smtp-Source: AA0mqf4SIXh274lL5OND18cWjV8HiPguaGiV9F9BOA7qUkZZ57b4O10HTITDJFxP2jy1JRLOobzzeA==
X-Received: by 2002:a2e:8706:0:b0:279:e8c8:3c24 with SMTP id m6-20020a2e8706000000b00279e8c83c24mr203630lji.298.1670007526538;
        Fri, 02 Dec 2022 10:58:46 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 3/8] clk: qcom: rpmh: drop all _ao names
Date:   Fri,  2 Dec 2022 20:58:38 +0200
Message-Id: <20221202185843.721673-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for the further cleanup, remove the active only names,
they can be easily generated from the standard ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c4852bbd00bf..00c0c8f851bd 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_name_active;		\
+	static struct clk_rpmh _platform##_##_name##_ao;		\
 	static struct clk_rpmh _platform##_##_name = {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name_active,			\
+		.peer = &_platform##_##_name##_ao,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,7 +92,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_name_active = {		\
+	static struct clk_rpmh _platform##_##_name##_ao= {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
@@ -102,7 +102,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_ops,				\
-			.name = #_name_active,				\
+			.name = #_name "_ao",				\
 			.parent_data =  &(const struct clk_parent_data){ \
 					.fw_name = "xo",		\
 					.name = "xo_board",		\
@@ -111,14 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		},							\
 	}
 
-#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
-			    _res_on, _div)				\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
+	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
-				_div)					\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
+	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
@@ -342,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
-DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
+DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
-- 
2.35.1

