Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58708C678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 21:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCHVf7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCHVfy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 16:35:54 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E718D2394
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 13:35:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g17so23135436lfv.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 13:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov5RMn4u4UzKJ3B2Go2X9BkWY6GJei++Q812Yrin8NQ=;
        b=AxhmL4HahGAmk4iXonM1WZnW6wfLggY8ACu1c7y/UUUX50xPNa6ZMfCFXIdx9ySf9B
         Kp4CHTl5eVmBoqaiegAqMDHPGeA2jm281La5XN8hGZVQvfGFZPsXi/2R8Wx4Xqg8pSTL
         7x2cD7elmtx62OdCkJA1uYcgy3YzpiMjMbAoD7eT5EpYnM5eBkIHm0gzGtFmbICOGZwc
         /pAJESYHr5wN7jd9vh8sNHflicgIO3Nt+KatIewTqS178ZSiBiquaBGAIsgUtUlZlLFf
         q4blRWTFq9zvFxeNLz39okmM+Fa7hlQK3WL5qijMd7pjfdcoe6xh2RrcbbRP+7fMpq2S
         SUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov5RMn4u4UzKJ3B2Go2X9BkWY6GJei++Q812Yrin8NQ=;
        b=VwE+7+hv030l5KIy4zFxdqhJuksPSVuwgCQwlBfmFEMiXg6j6x3uWu+kZQJk5tZ6TV
         2QDJnF1od2YgrF/wE4whZcyVlaqZL3jdgdgJeal+VdmQLTvFSSwurNfa4DljhS+f82rn
         QcZtzftQs43f/YHlPyGUVExMEkx7hbrarBhZW92nsJMy48wAWz9EFrCZlpdE7CjNkvZ+
         43WvAMw4vxpHbP1oCVbO2hzecqYOEkqwPR/BD2taeALbVpcprfHMOqqkLqf2EKYiQoo7
         FNK0gBen/6CQOs2xIu5WeM8uW6JSQgPGiX+h+OG7OmQzh5DR8Li1qZCr+BfhKD17qSez
         B+Qg==
X-Gm-Message-State: AO0yUKXJYEXxs8gPJMbQWvoHMETVkKD25atBxwKfERttDWIdWT8BGESQ
        7SEkwKRKNGsp8A8Jn16zajo/Dw==
X-Google-Smtp-Source: AK7set9dma1j6Hpgq09B0UyfOJ4VTgSFw6jduwHFeZviyO9dnKsNOae9xfK14OlgNweaqopTCKXu7g==
X-Received: by 2002:a05:6512:38c6:b0:4db:387f:a3af with SMTP id p6-20020a05651238c600b004db387fa3afmr4619602lft.4.1678311343950;
        Wed, 08 Mar 2023 13:35:43 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:43 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:21 +0100
Subject: [PATCH RFT v2 05/14] clk: qcom: smd-rpm: Make
 DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-5-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1812;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=svZJYxWNeuanDoOsLpbm2ZL4k08Cxtikg953kjcomQI=;
 b=sWofPdTB+S2gmrrLLUFIgZQAJ2Dpw8GiAIqWBFrlUA0dFPLwJP/f1iFMOzWa5eP3iGN9mRFIVl6i
 PnKA34jlACMIaRLdI7hJ6pz6gH95zN0ugXHXujjpvItq48fx3w8B
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for supporting keepalive clocks which can never be shut off
(as the platform would fall apart otherwise), make the
DEFINE_CLK_SMD_RPM_BRANCH_A macro accept clock flags for the active-only
clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 72b1f010509b..fec6ae4a8989 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -129,10 +129,10 @@
 		_name##_clk, _name##_a_clk,				      \
 		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
 
-#define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r)		      \
+#define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r, ao_flags)	      \
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name, _name##_a, type,					      \
-		r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE, ao_flags)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_name, type, r_id)			      \
 		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
@@ -450,10 +450,10 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(qdss, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1, 0);
 
 DEFINE_CLK_SMD_RPM_BRANCH(mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
 

-- 
2.39.2

