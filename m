Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EADC71133
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbjAIA3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbjAIA3r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:47 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EC310FD2
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:46 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g13so10616138lfv.7
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb4Hmw0ivnJsVO8PIbi88m0ZabNr+OPDmkSoxgPdTJc=;
        b=kfA0sN/szPqeUnMr6kvcQTrgmwZrO+ZhLuvfLeFgJ4oLmb2U0aEkYE5Yurc6tasULk
         QMfQuWmiJ+QldJ9q0BpE+B6Um0GOOLZG+xsrzTwZlcMnSAiJsq7iESTCSF6yuDLW6Pua
         XJg9yovoBUkaZIx5mfmbHnEr2Wm2LUqot+ogjKeyCa1JJ+EyczUYbUjl31WacyujvUuD
         exzWUiK+XPJEx/1y+IXVHej7c/vAqEU6uHRC76JElNRuIBIAmWHhNPD9Cz9dpN5uRv1Y
         o0+hR9jMKtqxFko/Up6uua2bkklQhIKglSKqPGo3wVwzplFxZyI8TbusBDzoeH8im7+D
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb4Hmw0ivnJsVO8PIbi88m0ZabNr+OPDmkSoxgPdTJc=;
        b=E/bMza1Y6wi1ZM5o2FonfYuutibKan2MOfaT82A2MLtqmk8GpJgPyly0+gx8bQpb6G
         gU2xuWzAgP5ZBIRnYrEGVldhqo6Ql0eB4IHgeLC45R2mXUi3DarJQ2b0pefShitigjkV
         H6L74N7Ob0isOhybvnSFn2fD+z7vuFzX4c0Kicq6b7GPLlMEOKpPtK3DpftSS8+Z76ez
         sEMDKimU2Srw5yvNwV1J7c0GCWz+irZ94b5L31J/8xT9mlxKVQ5Ex3E3nHINedOOxWdt
         YECqhRrUPOTVTBl/Cku0YMnd6weRlI11KWDvhEyBei8SFKubAshwfCvX2l+hFwUBo/H6
         R2eA==
X-Gm-Message-State: AFqh2kqnFrtbR9wWVngN94oHOBFhrlpi3qslTRbJVp5hBziIfz4eF9b7
        aCAXf5a4C1djQHKWm+KL2/QpIg==
X-Google-Smtp-Source: AMrXdXsAMmHtU/nYMUvA+nFtJod6ijOnt2kZOEg0ludb0KI+AXAy0MdF8wCg7iQtuF1/q2wazJpM0A==
X-Received: by 2002:a05:6512:1307:b0:4cb:3d40:93ff with SMTP id x7-20020a056512130700b004cb3d4093ffmr7907463lfu.58.1673224184965;
        Sun, 08 Jan 2023 16:29:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 10/12] clk: qcom: rpmh: define IPA clocks where required
Date:   Mon,  9 Jan 2023 02:29:33 +0200
Message-Id: <20230109002935.244320-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Follow the example of sc7180 and sdx55 and implement IP0 resource as
clocks rather than interconnects.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 7db5a53d73f0..05940e51b261 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -455,6 +455,7 @@ static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -494,6 +495,7 @@ static struct clk_hw *sc8180x_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -514,6 +516,7 @@ static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -556,6 +559,7 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
-- 
2.39.0

