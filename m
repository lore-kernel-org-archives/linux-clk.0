Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D41CCA480
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 21:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiFTVvz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 17:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236325AbiFTVvy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 17:51:54 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE2D1A3A0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 14:51:52 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c30so13343124ljr.9
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VB+OjNM0FgonA9OHE0Kg6JQZj4dnCquoYDOQxZe7mo=;
        b=cSQ/oyUJ0l8bbipEuGZvIJbKdKDyUZMNlwVg8LRafAdPRUa9D0djloP235lZUMRwDw
         jkwaAYtU8t3g8YuYJdS2FZQrwcyVIJgxS6yZ227PYhN3yWad1AqT6BpZ1YFeqRIM+ASv
         1DyE29iwPK17YCir+i3cl2T8kumxk9VIfX8hsMl7YD9PrMWrXB+5n36815k+usCQFwsJ
         MthIcOk+TC8tuata+ssCePg0xWkbggqN7EJ8Ejj55/4XDWNwPN/jNXD0BDjXMJByJCLY
         jXzIABNP1yLrVbVaDiEU2LdU0UiWWtfRM0gypEMQaFl3sqsi5eRICLOqzKzgcLoUo2sU
         yZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VB+OjNM0FgonA9OHE0Kg6JQZj4dnCquoYDOQxZe7mo=;
        b=JiY18V5NW5t5kq+rkjAs/lLAyUXOREWLmgUg98ay6iO1wJgzBH8WE3dZXMFCN1lffy
         heMYIbBUC6fROCoOX7lZYXvI+DUXpYq2pFm++br/3Ae5rhn1wgG4II3rmtk8XORzLpeX
         u/Gnb/oLHOZ+wksw/Johi/YHxHKH4IBADe3qFwdaLUJrhWb7lguL+4znA1q6jCiNHhrr
         Sz2o6l7qv2+oCWZMoV8pKmBPGJTS6OdTfWDH/zmESVhnSTiPhR0i5BwH3PyfzkZ4nYOm
         DT1OR1ItHfSBgYRmXEwEJlbOtujemb/8KNgggihLmb8FffaQkyEw+Tq0J73fSZxyXrXX
         hKdg==
X-Gm-Message-State: AJIora+mIWhmWxKHo+Amm0Ps3br0ImcfExhuyCD+/otOCXqN6vJHFGzr
        rBFUtnC+DaDCvCW8e1buuGDt7EF0kIBsRuBV
X-Google-Smtp-Source: AGRyM1vMoxB1T2TWeP+vflMBzhmgPmXF5Lj32pDYPWXE9f/D85wvLBD/f/9hzHWJX5L/IGNQX5slig==
X-Received: by 2002:a2e:bf02:0:b0:25a:6348:95c6 with SMTP id c2-20020a2ebf02000000b0025a634895c6mr6553256ljr.183.1655761911351;
        Mon, 20 Jun 2022 14:51:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s30-20020a195e1e000000b00479307e4a1bsm1897989lfb.135.2022.06.20.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:51:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
Date:   Tue, 21 Jun 2022 00:51:50 +0300
Message-Id: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use parent_data for the last remaining entry (pll4). This clock is
provided by the lcc device.

Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 718de17a1e60..6447f3e81b55 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll4_vote",
-		.parent_names = (const char *[]){ "pll4" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pll4", .name = "pll4",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.35.1

