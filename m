Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B8EC678D7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbjAMMMw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241015AbjAMMLq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:11:46 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98657DE08
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o20so876077lfk.5
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmxbEU7yNm32Cz9XwGJP6LlPVKtTRmfgxQ+3IPRboCA=;
        b=RgOWW5w6/FtVAooz9c1Wm+dFGjj/5RU9DrqMWd63dhcOSGts0cqiahNtYvUS4TU39f
         1TS5hGPWncrwTzQ/xK5PmrMTIjFrGe0H5MwCJTlAxUtUxRvtrgQGaAVGO8smOrpKUfch
         y1hI14wgyVr2xJAFOc9Z9TdZJIU4YoUmaKUClu0NC8eiSIZmi/A7D25LUg1pdot0RvZ8
         kklAV8cBL/rDmXWXE/NrLZXufi4JSiOYav2pZKrtcn8zALdqQxQgDZ+wJjlbNfc1z2iY
         gi+MwzhvO7SPpR2Om0Pd2R3jA4sUBKNTAvRCKOM2qvkEUIjDkQhoI6sMWryQ2W8i+El4
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmxbEU7yNm32Cz9XwGJP6LlPVKtTRmfgxQ+3IPRboCA=;
        b=0lnYbOmnS8im8DVWrsO7ZP9v6vmVLjYJzeQN0fK88LNgEgDyfSfAHKTaQubME5sjAv
         uaCFXNhJOUAReBaBS+ATXO8IJ4Z613HPbvfI815T260F7x6QBuXVCapz3GC5+3rNzjEP
         vgfsYHkHacAXI01AqDmyzCt9iUDdpv/nQzsChOAdvTcTbXB2QERd00rex2YBmP1O8bFF
         ofwbLYBLvm2M2sxpQec2lbfMv1jIVYItFx8wCDn/ifim0lo2+PczOAlAW2WOM8ViyVKM
         IKuqdPP6UMyXFzhcSYsVyVwxgFabAIS2xv/pAZ9XsEseAdojxTsyB1kiI3XmfbdYLwv5
         FNZQ==
X-Gm-Message-State: AFqh2kp5TGLmQbLi/XEu4KFGpdeHXGUsHIrRC2v+Gyldr+Yo/w2vIUJK
        1/FxTLug88XMA1t4ZLPvIgVadQ==
X-Google-Smtp-Source: AMrXdXtLYd/k7aJYj73HtecfF31AhEXVeOHWBBDIKrBb2k1+Wjp3Vgedt0G4DHRiJN6FCsRSk97fPw==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id p4-20020a056512234400b004cb090d41b1mr21249865lfu.56.1673611571086;
        Fri, 13 Jan 2023 04:06:11 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:10 -0800 (PST)
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
Subject: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
Date:   Fri, 13 Jan 2023 14:05:32 +0200
Message-Id: <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Program PLL_TEST and PLL_TEST_U registers if required by the pll
configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9e4cfd7261c..e266379427f2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -358,6 +358,11 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+						config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+						config->test_ctl_hi_val);
+
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
-- 
2.39.0

