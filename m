Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9CFFA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbiJ0MfA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiJ0Me6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:34:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACEE2A26C
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:34:54 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y14so4098660ejd.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58sYynw6bix2RKRPDkbfBnZH4v9198VFqnJiB91dB9c=;
        b=Ty/6hZUJ1X2VyFW1MicXfNUTdObwmpOpub6MQ0LNu19jr0Pl7weLAje8hoT6dKs7MO
         KoWcjlezPL6ZtxyRTBLZim76qPe5c3rLUit4cK5KirwQILB7LZmS8YhvHw28JZS1VkUj
         hTfQPT8pk+xxJtVdoDnuRR5G6cMzv3yoHmDnOD6iQmKq1MLH0JL4bdtKE5DdQuH1Qxsq
         GSkUIQd1Lcst0ybP/vStyBxNsUGyOpQtiaqYPP2ujSA0yMq1ZIWrp/Q/CHxZEwMuVkDf
         aJcK6ynpkDmcFserIj+jiGZ0F12GgxrIblrlD42sA7p+bKQCvyRzubJBzrTza5C4P/8m
         0QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58sYynw6bix2RKRPDkbfBnZH4v9198VFqnJiB91dB9c=;
        b=T2lQBkzBZsasyLPwigySjFf4Jou+lR4UgycuYESgMtzIJVs32/1ijp9GgVDUqirisz
         XsFf8Kj4N9FF5D8GxTepe4NFluMqMmBQ2o/5kLUOiimpziPCb+HOPZQ5vabTHHaTJi1e
         PWja1voYPrX4/JMvmcSJN7gryz/e9AQ9fabNWayRssiP1mS+pJLcISGlsgCyIaoxH5qu
         5hG1j1YVqXLZNtMvTgFd8NQzCC5B2kX0l89R7l1K1dEfG2kR5KzSwwHnF1xlWyv5geun
         0cEvQRJt7fBvur/hNP0cALlOe8CSWuh0m0/SiHLAFrpqAWKHMhVJyztkhv18tPjRjKDz
         F4NA==
X-Gm-Message-State: ACrzQf1prZUCBc+hl2bTsazD848s0Iu/xFJgYBqZ82y8q9H/Kr6Kuyu1
        GsVYqxibpCCCh0nOlwKlqcz+2w==
X-Google-Smtp-Source: AMsMyM7DoKhqR3Dhq01/mKNdjxj0bW8sExFf7e0S3rGOE4W93t2zItOnY1cIYAieejN2cuxGvjSbrA==
X-Received: by 2002:a17:907:7ea6:b0:791:81f4:b0e3 with SMTP id qb38-20020a1709077ea600b0079181f4b0e3mr42578813ejc.164.1666874092720;
        Thu, 27 Oct 2022 05:34:52 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:34:49 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 1/5] clk: qcom: dispcc-sm8250: Disable EDP_GTC for sm8350
Date:   Thu, 27 Oct 2022 14:34:28 +0200
Message-Id: <20221027123432.1818530-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM8350 does not have the EDP_GTC clock, so let's disable it
for this SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 709076f0f9d7..180ac2726f7e 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1330,6 +1330,9 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
 		disp_cc_pll1.vco_table = lucid_5lpe_vco;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
 	}
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-- 
2.34.1

