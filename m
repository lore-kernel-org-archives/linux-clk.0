Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC184C19F21
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jul 2022 14:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239253AbiGZOX5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jul 2022 10:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239254AbiGZOXx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 10:23:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8F928E3A
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:51 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n185so8847086wmn.4
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fHR/l5JjlFTe5U+9TeLfCPWi7acg+LGM6AX/fISUQlA=;
        b=JxggSDwyUfxpBz8xwSy/CRdus25ymovTe92jJ8H+Ic+mUr7eTFMfPc6FyrFDW+0leg
         d/ZLVB75hhUK15+1ejVt/xbaixbVE6QdwYGe5SqoZ/2OLdONBot+jcXGwd08fS7jEHCV
         ro8JiUDcW9URuOEzOigDVFvaNs18GhapOxkx5rWjQQ4CHqGsZxLRw12FGfCl+Lsb8ynZ
         2fX9j8eeJmwJIBU9SlqsmMSWRTv7+VyeCxjhdMu4B/N+lvEWrIg1YDR9v92Nzar1PtCC
         BPteo6eCco5lwHmaqGrMzT1I9dQ9VV6YkuOnUoVvxgSes8kgaZTPw7UkTA/LcLTUQi+J
         M6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fHR/l5JjlFTe5U+9TeLfCPWi7acg+LGM6AX/fISUQlA=;
        b=GBTqLBd+jq9yj4f4Q5CuJ/BccBvzxHYS8tjXAVqkuZtoCql4rWgWrT2v3B4W0kaksB
         zHHkA1fwOWybzigMUrWVjzTujF6zA44jTUH1YKfBLqbLEWDuxwsayuuzhpyxGHZ/7vjQ
         KG50ePrZnA9gw2zhiV1jC1dELVpi7YlYdqjxVX2Jeg/gIAzqqz3kWJre5WhG1m6+LH/3
         ytg/sOP3j3Rcp2KvFnCT5S4FLRTKik4vtpk7oInPG5Xw7PrLxL/21ux7//D7hCGtvoE9
         1ta2ZGfjuhFnoo5v33lW7ejlr9nHgqMYf+9uinp/fIcpC7+cOmLMG5wv2Ww/F85nlCAL
         H8yQ==
X-Gm-Message-State: AJIora+lgGg5hZI+dpy6eRVl/9aPSuxXBZHSzM3+W7RDcpXW/uHABIun
        i9zeCfjmHf/Zj/m31hGOH/o9+Q==
X-Google-Smtp-Source: AGRyM1vM5xsph9+g+W1imOstU4XWX/lRpFrpsheUulR6X4yJLXPfUS/p9F4UwOUrJED37w/8hstyeQ==
X-Received: by 2002:a05:600c:1911:b0:3a3:2933:a1cf with SMTP id j17-20020a05600c191100b003a32933a1cfmr12693921wmq.118.1658845430513;
        Tue, 26 Jul 2022 07:23:50 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003a331c6bffdsm17017119wmi.47.2022.07.26.07.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:23:49 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 6/9] clk: qcom: common: Add macro wrapper for all clock types
Date:   Tue, 26 Jul 2022 17:23:00 +0300
Message-Id: <20220726142303.4126434-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220726142303.4126434-1-abel.vesa@linaro.org>
References: <20220726142303.4126434-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a generic macro that uses the clk_type to figure out which
clock type specific macro to call.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9c8f7b798d9f..475febd19dba 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -19,6 +19,9 @@ struct clk_hw;
 #define PLL_VOTE_FSM_ENA	BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
 
+#define DEFINE_QCOM_CC_CLK(clk_type, ...)	\
+	DEFINE_QCOM_CC_CLK_##clk_type(__VA_ARGS__)
+
 struct qcom_cc_desc {
 	const struct regmap_config *config;
 	struct clk_regmap **clks;
-- 
2.34.3

