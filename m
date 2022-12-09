Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB237C25B04
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiLIQtB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiLIQtA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:00 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6493294184
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:48:59 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s10so5521152ljg.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHOsQvXR3hakSFSmtqr6ZnE8Sp59mrLg73lyyGTu7WE=;
        b=EedMFybdjDgyC2qmrrxjHi95X/hbVzlwnXEkl7H8uZFxrExOn0ZD6A/jfJMsTRb5SU
         D74sKE/i2yEi8O48Mkje7IpC6GyIgd17JJb5gX7rSxo71b+ZCWoueYIEXsy5mvsxOM3q
         32XPGId/v5vHs/Wyr64sv35Z+mXuhb6FAoCI3vjNkG1AA6Bpj9hdgKC9TJd97yQ9/gOb
         xnziuf7DnepAJej6m0eGxT/hdmV421FEVPVBcks+qym8hyV5kffuUavuViIfIXqOe3X+
         fQjtEWa/eaoPP442bHQHjqMDvuExIC57mnl+LjfI00X615zFRTqNK6qX+jGgFOH5QPCv
         X62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHOsQvXR3hakSFSmtqr6ZnE8Sp59mrLg73lyyGTu7WE=;
        b=MFbuHjPOhrUveBWFxVOkKXlcfxKMAFuvE0kWHaqjsM4elcnr5iNLWVf97M0hqyZXyX
         epSIABWY7TRLSlibrkD5UMi/HIIvTIfmrva7gS3cc+y1v0D5VuAOUY860hNb+Pe9PyOP
         a6+WvSyDDBciXbpabZ3axSbBH4ifBLSsGPwnW6vlcxR0JmYjdR+2doOaYrWzo7s+J10m
         Di46Wstu2jwNnHH44NF4nXjqlDyQtANhfbxGqB8isZ9Fix6tGSb45ouil1MNPMYU5iJw
         iRjNKbtG+C7BmnNHGRDJcb8YYHibT+Dh4O4cuZmIVFJ8VnzvHU8WopLRtsJmq8l6Mjfu
         dj2w==
X-Gm-Message-State: ANoB5pm8uPVdUpsvmyaxKbyxxLL49115mWYhHMQIsON6QL+AK5TOb1+u
        wKm7ujntXa20lqgHF4+TEHMvAw==
X-Google-Smtp-Source: AA0mqf511Y3cnon+M1mh4oCJiaUtKB0Z+KpwbRykcxtLSPAIE/C41dshN+gl/Rz6KDReE/PyJfGQ8w==
X-Received: by 2002:a2e:300a:0:b0:27a:3d9d:81f5 with SMTP id w10-20020a2e300a000000b0027a3d9d81f5mr240439ljw.5.1670604537829;
        Fri, 09 Dec 2022 08:48:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 02/19] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
Date:   Fri,  9 Dec 2022 18:48:38 +0200
Message-Id: <20221209164855.128798-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fea505876855..3082f38513fa 100644
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
-- 
2.35.1

