Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2138DC678DB
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCDN26 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjCDN2d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:33 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E720DE3B9
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:28:02 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id r27so6992336lfe.10
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4W0qLZoGn/Gqn60OVKnf/AngNaZtJaEGiMe1FryGsU=;
        b=t7GDasSGmRW6/G6++NRMQTEai0gAR1Tr/HKAP410D3++4lhe2qTFz/0Js921sgPE86
         oC8LkReLaXxo4D/7hBZdIAT1VojKs6GYqpq17hEwV/mcocn/0Vb9M0WImBWciUBoshG3
         /k6k1kxobJeBjKTKFtUXPrh+vAck42t/YD1fuSdQ2chnx/CMvdIQOMDdSoKvh6z1vjOD
         x1vVjKX5Fy/1fCgB2pYbcOUESNPaY1cK6ooVmurMx4q6foNTuVcL2SXVL2IqVYcZTbCY
         3Oe8vdRezkx5ZUvHqz929Ldq+vt1dbTwNpmuXBD42eKYVqvzujMR21Rp71MCwKN9kncg
         9Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4W0qLZoGn/Gqn60OVKnf/AngNaZtJaEGiMe1FryGsU=;
        b=rUvhi2aZwhXv43Z1ZjdcLe7KVuPoO7AsHlG3cA9zqtrMAauufLlz3cmnL0aRUkx/WC
         4a69DtSt2smW3AB1H/NE2/shOlcEkB8IF3b0J4WGktSz5I11TsAOSOw0wTBZqKkA2UTy
         MxK/3zq7TfzRnHJGV3We7orgFOLM3rwIJfgsp1DsOPzPa1CulKsPiTy3doj55tmgeOzW
         VUXBIpOXf/3Fnf+jLD/iqhj/1Mgqnt1BsBCZgN9ilg3Fhtr3b8ggtL2EcI1JCEIaXhIP
         /IdWHC6Q5zfcYDw9yHwSzkNdNj0EkAdE8ymbbcD4ScDykwCYW/7DCnGGUmQB1AngC8gR
         20rA==
X-Gm-Message-State: AO0yUKW+NPS7Iq9hMEra6EUG+R5d8c3tzT2+tljx2YyQ+3SvFz3FNe7Q
        5EPGz+tBAeeAV9bMkMAwd+5fMg==
X-Google-Smtp-Source: AK7set81KDr49TE95jE4yCGm0fSPxTPiQN2l3n2N907xh/jES2VsuKaVu3ZA9eyQrqcu0Ns0wVtpcw==
X-Received: by 2002:ac2:4ac3:0:b0:4b5:3505:d7f9 with SMTP id m3-20020ac24ac3000000b004b53505d7f9mr1549589lfp.35.1677936480693;
        Sat, 04 Mar 2023 05:28:00 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:28:00 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:51 +0100
Subject: [PATCH RFT 16/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8953
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-16-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=783;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VYT274DWBTR4U05l1ygfBxvGIehUAolvPL5f0i6UxzU=;
 b=ME5iN2KCMx7f1jQnQ2cjWFVyYIXX7qjnWt3zmxT2ptfnWHFEcMZ5d4Lm5AjRC2WozwYUZifqxaMp
 8FKc2cFFCTafSw/z8TtWgclbL6Uo1z0xCyW2/1rih3UpzElMYMDe
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8953 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a098327dc851..dfcb2020b7b1 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1104,6 +1104,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 	.clks = msm8953_clks,
 	.num_clks = ARRAY_SIZE(msm8953_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *sm6125_clks[] = {

-- 
2.39.2

