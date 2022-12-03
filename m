Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344A0C4708E
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiLCR6U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiLCR6N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:13 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B0101E2
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f13so12218352lfa.6
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELXMeQkBiTBKtpg2nqKzHDNFnx2dHjATzNl3W9JLTRk=;
        b=Bw0TpFtPxRjENjmgzDpHg62KJuhsXSf3u3KBc8B57leav7GarWPG8lBE3IVkOCWkVD
         ElrjHKSBWxrkPo+pxI/PAL8GY+hXoK087SCnN6UOoyXclkXcI8wod640huzKEO45iyHQ
         NoW+fkiNdfMLV+UxkIEDQdsdYKlhRUszjhu3UFzzloj07pOhVbDlo8ssZIADgJfQvO2E
         eHzOxCeWEAx+Yp1N4htLvweZU7I7f0kvjAdrvReO0H4irN0LyAFuAjEudOSwlUS0QBB+
         BEqpvZyUC7VdL6o/rzuDlPLkWONHU0fknGLTenUe/iiI9ZAMfNTmqomqBLjoeTPQFpVS
         Kyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELXMeQkBiTBKtpg2nqKzHDNFnx2dHjATzNl3W9JLTRk=;
        b=FPIZoW8qwvjZqCKcgitYaJdgmpb4XI6WEmEpU0NC12VGg8WrlsKiRU6SRiY9vS5Idf
         1V+GkG4TiD+mqoYQTVyn1lYBFRyHcGAgoTnpG7xoQXdSCNIuizkVU4ck17eu73ioKrSy
         on06TbQyEjZcEiCKYhawbMrH/lm395OLxxFYgUb4gvQJYFbA4EN0hXDQRT9DJzCJ6FEs
         aqhNaZy1Hrjq8vV+qwmEoD5IgcUbt/D7imCV1DxXJyCfyERfqvXSLb8MkVjreNo6nUz1
         Y2vs5nUBbMgQwmYCMAatMWYrvgu63uZujQJBnhAkMIBXVXnFTfK74Z1KsYB5K14ulXbL
         NARA==
X-Gm-Message-State: ANoB5pmrL6hTdBhZGWyhueUtFap8dzChrYJP7UXARgdKY1mICfy/Z2cu
        InHHwZYzGhKw2iCA9mxvw+VeGQ==
X-Google-Smtp-Source: AA0mqf42Hrum1uhi4OZiHHdXY2724LZoyxjkjAkFannzjMfqs3vV1bG6/NSqwXX4IqW8ez4lAnr6Tg==
X-Received: by 2002:a05:6512:368c:b0:4b5:611e:ed94 with SMTP id d12-20020a056512368c00b004b5611eed94mr862896lfs.514.1670090290734;
        Sat, 03 Dec 2022 09:58:10 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 01/16] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
Date:   Sat,  3 Dec 2022 19:57:53 +0200
Message-Id: <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reuse sm6125's MMAXI clocks for sm6375. Also drop QCOM_SMD_RPM_MMXI_CLK,
which is equal to QCOM_SMD_RPM_MMAXI_CLK.

Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 10 ++++------
 include/linux/soc/qcom/smd-rpm.h |  1 -
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fea505876855..077875cf0d80 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1120,8 +1120,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
@@ -1140,10 +1138,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
 	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6375_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6375_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6375_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6375_mmnrt_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
 	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
 	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
 	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 3ab8c07f71c0..82c9d489833a 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -41,7 +41,6 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
 #define QCOM_SMD_RPM_PKA_CLK	0x616b70
 #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
-#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.35.1

