Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992F0FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbiJ0Mf0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235706AbiJ0MfN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:35:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F320033429
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:35:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y12so2436446edc.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixsyTYSU3qrk9nu6zgLYYDmntPbxw0EqXI+jxfXWgbg=;
        b=eGI+nghoKIXTvxIUbAMX/UGn0FUTy6saar5V+Xm0lbVg8DFfBppUhTHZTI4cZfKwsi
         udcabToxL2QqymNMtZ84C8e+33nabNHXvzXGDoHEwDUP8fzIu7MGXCbCXZAzV7lRE5Rq
         6Bhedbx3qkoMuG54hlwnamXHE+9eQpsUL6MUiBSwidzUYO9IauyfuZdWBzezNr+VvPMl
         2mbko/nxXeXBW+TCxK7o1w5e6UaiDymbLV9lzzCbLzZyPkDo50HDGLsm7lpyuuxp6IPs
         wlGTQj636LIZV/bJE9Tnf3dpch3CCGBeQ+7fJ8A36s+fRTozI/oNKcjxbreKCzsOZbzW
         TxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixsyTYSU3qrk9nu6zgLYYDmntPbxw0EqXI+jxfXWgbg=;
        b=oC+QAj84OtbZsmPXLv+ppSsnLdXNv5zT4x3O5pnJo7bo52QT4IqvJJWM+AcJCD7OWm
         uhmsVgaOQGBXxa51g4n9uHY+2wvz/juY5AgNIE57VPHFEwNLWO+7E8nwOFP1Ox77ZOPu
         pJ2lUp6Mlte5AcyyIMN32CHmUrnM9f8LA6nxhtVUcOSVN/25EW9EA6QTO1SEiG9b1kdG
         NKHm6ypJmdWB6S9kjWg3d52o8I0dYd1NhQyPQr/0he3gOt4hMhF94+UX9zD5PgMHw71j
         5cPb4IpZBCtXngabVF3bg8zdmBvgss2RHSfT7VmNS/rW7ZX+HA8ll5OSdyOCVx74w375
         bhTw==
X-Gm-Message-State: ACrzQf3cKAQKmZM55fkC9be/RETxpxKiZMbUXQKCWuSGL444O71tLNYS
        j1f2JZOdnp6W+VMDEGWqMTx0Ag==
X-Google-Smtp-Source: AMsMyM7NCdoe+eiHzPhUQn0V4ikeEhZgjzF/EuqAC/E5mPZSh7/Os1mIKFocWtifRDJqFs/BoOcjDA==
X-Received: by 2002:aa7:ce09:0:b0:461:5406:20e4 with SMTP id d9-20020aa7ce09000000b00461540620e4mr29636811edv.5.1666874109556;
        Thu, 27 Oct 2022 05:35:09 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:35:07 -0700 (PDT)
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
Subject: [PATCH v1 5/5] clk: qcom: dispcc-sm8250: Disable link_div_clk_src for sm8150
Date:   Thu, 27 Oct 2022 14:34:32 +0200
Message-Id: <20221027123432.1818530-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027123432.1818530-1-robert.foss@linaro.org>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM8150 does not have any of the link_div_clk_src clocks, so
let's disable them for this SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index d2aaa44ed3d4..f6f719616f63 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1289,6 +1289,10 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = NULL;
 	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
 		static struct clk_rcg2 * const rcgs[] = {
 			&disp_cc_mdss_byte0_clk_src,
-- 
2.34.1

