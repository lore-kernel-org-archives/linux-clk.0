Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A44C352A1
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiLGAPK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiLGAPI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:08 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6421B4B991
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:07 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f20so5919822lja.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOcXBHzPaQhy0fwsmnckvcizCAWhntI4mIBoXMhytOw=;
        b=WpDsur3btGOj4DHDNyCmFOhUeUMKvdUHEm6q6KNw31cCREY2lXkepPe8t7ofDBi/Vs
         shACs6lAM0aTg8kj/6mS7GoZay30LQPhfGfx+VfoC/YoiSiIZi0q5nbAh1OCiMvNGX0y
         H1VqZyhv/WqQF4Zj1Hq/b6hiaGSYHHnKG13lQZMBkQxLIhRk8LCA62QIXD0XI/RjPOkJ
         DYJAbkm0V4VkS+nITMZEBT2yX5sNcbz9LvWeWKe4WgGFHmFZFzHQmoBv76X+406vw1rL
         WtxNMRpNn9T/q3g+QufBAg8kGwQhGFC/hslcDHSlTS1rlPWwanMbC/7tl/yLcCDXqb1r
         Ulnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOcXBHzPaQhy0fwsmnckvcizCAWhntI4mIBoXMhytOw=;
        b=DpPOtpifZ8w0lxBrjytFxiwFtshQyBd0VTHnFURr5vg4PeQJN5i1aF197T1EXRaMIP
         IgMZ2kg9W1ZmLpMj+IYyb2Nwz0MJqp43gpojY3inqy4jWu746/RSJ6AHyXcWbJBMCme8
         jp1iV+cc0G0tMoqo5jEh8+IfWdW8i7/fthjLqle9zgzLMtl5L35TiZ2wAqhep8dbbq1r
         NbyJscD2PIonmrIQ7VKA8zoHb2cmVqpOQGlXQnXhsg1bZKNY92D3pJAwEn6vBK6LXuLs
         VbWKBHg9gOvLgVhRwFmfXLDxBNZtqBLCMw1Wi5jztdarwFTdiHy7+OBB8Q7v9vWIAez/
         6DjA==
X-Gm-Message-State: ANoB5pmNTTlkmpJNWWLe7WsOTzY/xH5xvrOBvnpwQqoh4Kh+Z1iSK4HA
        k8D//NLY7wkJ3nQnDrJnQ0lBew==
X-Google-Smtp-Source: AA0mqf5JCCvehDiSp88ITyyaEadczHeySAJXPQ7sLnSsu/r6QGsuGVxUjSfh9z8aq2hhYLCguPisAw==
X-Received: by 2002:a2e:9b4b:0:b0:27a:b66:aa7b with SMTP id o11-20020a2e9b4b000000b0027a0b66aa7bmr2011746ljj.246.1670372105760;
        Tue, 06 Dec 2022 16:15:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
Date:   Wed,  7 Dec 2022 02:14:47 +0200
Message-Id: <20221207001503.93790-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
them to the qcs404_clks array. Add them to make these clocks usable to
platform devices.

Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
Reviewed-by: Alex Elder <elder@linaro.org?
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 4947d5eab591..ccc54913eca5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -843,6 +843,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
+	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index c0ad624e930e..46309c9953b2 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -168,5 +168,7 @@
 #define RPM_SMD_MSS_CFG_AHB_CLK		122
 #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
 #define RPM_SMD_BIMC_FREQ_LOG			124
+#define RPM_SMD_LN_BB_CLK_PIN			125
+#define RPM_SMD_LN_BB_A_CLK_PIN			126
 
 #endif
-- 
2.35.1

