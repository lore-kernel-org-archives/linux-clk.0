Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560C8C63706
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiLGAPX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiLGAPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:20 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0374B4B9A9
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:11 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id bn5so19130829ljb.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8baNdlZOcEa/P1xvM+5WO2chpZyOckq2nTwtl1+5PhE=;
        b=Erzo6PRruMrP/n89Ekv5cnsZ6I7vQ6pZX4ZcSYaVMJ7K5KQWWdk6QFvKr3vVlI3tvM
         HzFbUTvdN84XujEFWEQubQNm28jRM530O5d2xzZA2zirUkaT07uiAxX26qsi0fA4aIIz
         uEwwKwMBg0H5Azh+eXqQCGNlw+uRHsAD5FD/E6Y809PyeAoDqxq24V9fnkr2ozscUyP9
         EbrtZDxn5qIAPR/EP7hqkq6zJ8c0NNRdKVegPcvVf746OoJawUjIJ1XMPMQ7ssIbdYCh
         6L3f02rroe/KM74XE09vF166S6tsBXaH7kP/XOOBJTUwDwlLJnEY3JMyx+Fr2xjEWf1N
         Q9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8baNdlZOcEa/P1xvM+5WO2chpZyOckq2nTwtl1+5PhE=;
        b=yQiF40tOQUGYi7n9gj1OhzKhccpp5FShNj6lizBOuIeBjOAy0piZongknP/E1AZSdu
         nXYZwq2TzGe1pPDTnd1ekK1VORRj/KgzTCiAtgUWjtUkIFHJuPtrTfRX83XYccqbSmMc
         0BZzyuxyYvgGwtVEzrZU0WH6Hh8rD+HDitivfXQwBBK6vhu8F5AMrrpSGJkH24+w0Y6y
         4w/ma5z445nFlKOjaozvLlI+nrmYR5Md8CLB44aYZH9P8mkIErGPYX6VJovwIaI17gET
         Nlv1OyagFW0y914MqEvA5Z6qPCv1qKUD6cMZq6UaJTgs17A3cTsBTbWErhMY2vVXRlUp
         rszA==
X-Gm-Message-State: ANoB5pnLZAtE+0IeI6CDoTAl91nVqAo0DDvbkn0alMfEmngIP7Xi1HoZ
        MoyrsSTysZeTgefwfsv1xov9Rg==
X-Google-Smtp-Source: AA0mqf6gNdD+AnuPghr+Wojbo0T0rF0QiTu6tQlFNohJatmF9bo7CZqGT7QEdVwc003oig7jylNgkA==
X-Received: by 2002:a2e:ab0d:0:b0:279:70c4:1e12 with SMTP id ce13-20020a2eab0d000000b0027970c41e12mr22713130ljb.206.1670372109351;
        Tue, 06 Dec 2022 16:15:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 07/18] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
Date:   Wed,  7 Dec 2022 02:14:52 +0200
Message-Id: <20221207001503.93790-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reuse sm6125's MMAXI clocks for sm6375.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index add92ecd513d..024665438b62 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1126,8 +1126,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
@@ -1146,10 +1144,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
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
-- 
2.35.1

