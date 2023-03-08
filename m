Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD31C74A44
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 21:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjCHVfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjCHVft (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 16:35:49 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBC8D13DB
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 13:35:42 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so23153729lfb.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 13:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=vKrNdtp74XinQeNY4eMDGuSmvkyKQGDqeQBhsMhjY4fdPFriJ/A/gnKkP1o1Rj5hGd
         d17LdIQDyFuSpT2Vfj7n7jHcMdiuoTW/TlXkk2saJZraSak8jwZ4Q24GswuNvxiAG74y
         UIkMljkp3U+T6aBAVWMxiZCBNWyRgmu0YLRi9L8sGgJwaKegUSS8EDgULQ+IQ03gMFx6
         l2fjXcX3reu/Cu0ptyee4UayN1EImRLVAhamofdEb9uEo3zSaVG7Ko97sziZIay7InL2
         XuZXMX/aRgxC28XHPPNGYfZej9i+JhM/Hg2bsCWhnKvmC0bkRYhNQuyOSLjeTRXqhT5r
         tcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMJaPWZzvgr1zZRk25pniV8MNs32JGnZ0ctQITcox7M=;
        b=4G3ZW46K+SiHxKSLNNh0hG4XRMoGD2HxtCbJTt7b1j18yA6VJcA2tiUm502ma5hfI1
         1RQg+32wnaHwhDX/UatiKr1bLr1pwAgrHoxNjT4FUCcJYeyXCgs2wWpl0jOolqXrwmI7
         8zyq4qPy3Op/acu8IH7/AoUGVPyfWlOuPwIQ9aKdcB1zHAOn5iBXlNsu5vmbAZ0BXQAE
         ICVRt8CSd/laCUAVRc/SyieSrs8tGJTJRcIOLU4464FT5VmXynW3iutASpSLfJKSoKPK
         h5hU5SS9la1wv6PSRyoJBk4nrA086qqwtdMQetY/qEPMEGFfsvlN2NFKgUeluBjCzsFy
         TObQ==
X-Gm-Message-State: AO0yUKXRXTy7qE78bL4qlM2yI/D71I1PicbO6AYr2bXsrtlajeWJAC1b
        4c025ZDHq78khyi9Hg9ZGcFN6g==
X-Google-Smtp-Source: AK7set/JPTntxaKTZcLdE5KqdvSF5AcoXwGRJn/HF6O72/daeXJyZEV1ZobxCAwgpbYkndOGpkFLRA==
X-Received: by 2002:ac2:533c:0:b0:4dd:a7fb:1e7c with SMTP id f28-20020ac2533c000000b004dda7fb1e7cmr6210843lfh.3.1678311341007;
        Wed, 08 Mar 2023 13:35:41 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:19 +0100
Subject: [PATCH RFT v2 03/14] clk: qcom: smd-rpm: Add .is_prepared hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-3-ae80a325fe94@linaro.org>
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
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1482;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IcjgjHunD3zMZaFeCfHoL5cnPI0PmUW34gmf6fJPVyQ=;
 b=XRRU/aPY7IT5XMd/T58u1InRETQd/B3Yhxj0yGAMrEQOfmdVugwndUVxyE9RQFkJpxKP4wWNbu/N
 yGcVWciwAl1WH/YY2FamRSLaf5lO4N4wNpnx5oA33Np6wonJwq7K
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

The RPM clocks are enabled/disabled through clk framework prepare/unprepare
hooks.  Without .is_prepared hook, those unused RPM clocks will not be
disabled by core function clk_unprepare_unused_subtree(), because
clk_core_is_prepared() always returns 0.

Add .is_prepared hook to clk_ops and return the clock prepare (enable)
state, so that those unused RPM clocks can be disabled by clk framework.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
[Konrad: rebase, don't duplicate the enable func]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ecacfbc4a16c..cce7daa97c1e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -438,6 +438,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
 static const struct clk_ops clk_smd_rpm_branch_ops = {
@@ -445,6 +446,7 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_enabled,
 };
 
 DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);

-- 
2.39.2

