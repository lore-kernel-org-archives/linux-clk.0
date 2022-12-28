Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3F7C54EBD
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbiL1Ndb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232931AbiL1NdA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:33:00 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC32101F9
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:58 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g13so23619820lfv.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4VI0RKyC4i19bmmFd2zarFFWUn7YkcIMcmRxWBEBg8=;
        b=gnBdx5zNMZ6rgOFjStkyNh0joFdpt2Hw1bBmyVAAbU0Tbhy2p4WUQokEv9YXbcXpr3
         IUffz3LkxoWOujS09z0WvpOQA3l9aTKSxeeLlI7k9JzC+8pi1NHcXnxIXI6e+UgXy2wz
         KWZ4+83TIDu/hOna166JbZaQIguBZRMuogaEldFp5amSrdZzR7b2fSU5X4MF82g0Rw/X
         M8pJWKSFRNpEAk8gGbCfzXbtaxzGSyqUOdh28WV4Z1j+j7pbd+kuKVEFu2DyB5rdRfc6
         uFbtdHqbSZ8C92SmLA7YuX2bL4Wy8xx6ieZBfAY7bMSciXFWOBfB/j+UzVl7Yjnb06Sg
         n5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4VI0RKyC4i19bmmFd2zarFFWUn7YkcIMcmRxWBEBg8=;
        b=3aln8IerfFH3JGJmC0cRvFOC70Jojk9WST1s5mhLlVvqJPOO0cLAOfeJIrbhqL8xev
         SsH5YBfn2UsOndxl9ju01rU1GRqdKexY9HSP2D2F37T+UYhKXcQTZhqyoYWogOV9CvtU
         jWFxoZ/HotoylvH1G5VWUSf8g4D0f6pKobK5hEqnsHTF2ihd10obFJigHg6Ozr+admEp
         vAMB4c4Blq8Rh3uXfoVLX08mo7LPf4kgyp5aSI4N6FIHrdNS7MT2LKNCDiiPDo6Q269h
         zl5JcBHm+LvJBQ4EMOQ1M2dkUdLlo2l90jO7E6KIOsv7/5jEcZBJiFbbQCJk7g3IvVR9
         ZWCQ==
X-Gm-Message-State: AFqh2kpBTskQRE4vEt95SfkXv3cf2/F4j5lEPA/szcvgJCPLWKZ+42Ct
        TypbUj/hoe7GYwYVSMB42Iqp6Q==
X-Google-Smtp-Source: AMrXdXtdRKZduxoD8dVzhkRsSVJUzir6A9NQJGLZSddByJ8FZJbApgrNZpTI8+zZzRvBKADaPlsAhg==
X-Received: by 2002:a05:6512:10d6:b0:4b5:834b:9f75 with SMTP id k22-20020a05651210d600b004b5834b9f75mr7818564lfg.33.1672234378221;
        Wed, 28 Dec 2022 05:32:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:57 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH 16/16] arm64: dts: qcom: msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:43 +0200
Message-Id: <20221228133243.3052132-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 18cc149b6be4..6d69dce14dba 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2398,8 +2398,7 @@ mmcc: clock-controller@c8c0000 {
 				      "dsi1byte",
 				      "hdmipll",
 				      "dplink",
-				      "dpvco",
-				      "core_bi_pll_test_se";
+				      "dpvco";
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_MMSS_GPLL0_CLK>,
 				 <0>,
@@ -2408,7 +2407,6 @@ mmcc: clock-controller@c8c0000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
 				 <0>;
 		};
 
-- 
2.35.1

