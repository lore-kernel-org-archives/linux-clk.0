Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDDC54EBD
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjAIA3r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbjAIA3l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:41 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EB7C74F
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:40 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e13so7395677ljn.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxC3nS7QizZnlIOV4bLBN1CHzdnFWYIRIQhLbjYXt6I=;
        b=gRRo9zGaqITJDuJjllWblPN+TsJAgVKjwYcqixSfrWxH/fFrt4Am1hchcE02hkIOZX
         tZ8NP5vJ7COPscB2sF71j7Wn3Nic1mVrTe2n3aBdBpg4I4ORthfSkxPMX+LF0ie0DzEk
         pbpSqymxJz74NBa7ZdYxPzy2KxZoXh0i4mShCQouyKA8QIHI2Qa/g3+XWDIMQ1t7vNQD
         HbRHaxH3l2VHXxsJJtjbbI2sUQN/5gBavGktE+FylkSA13yNx8rpWfvisVP4YHzcTXQd
         BAbI+j1q5vhI7mVchhAA2jWl/cwxF8CnltZX+LEqh+//kSq1LKk2dxvdWUKen4VIcFhU
         cA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxC3nS7QizZnlIOV4bLBN1CHzdnFWYIRIQhLbjYXt6I=;
        b=G/b+HL4+23NbqcYaaJ+RLDTMDY1oDHlq/wz1qLj6WwqCubsCt1zG6EVibTuyQExiK1
         k6ZdqUVxzyd1IDYE/K8+jppA8rj/yeXQ+/GgJ8lKXz5eUfGYBJ76ivp0X5igCL3ewCLG
         2d4EjFciePFoeEupFPl2CzCmoi1/1e0AG7mPBCpErCwhg3DHxeMVMJzyUANPZ8n3F531
         ZATBnEKxaBnkxrrQYmkch4SEOSttX/1xtUp1N9f8/v7F/wceYR7R09oTeV+VnrG58cu4
         D1+NpYq+39UfBOxAGlUrUbhGa3aERtRb8jLm/3RSCfZ+ah40wsRg2ztW1NVtLL26ECVd
         8tUA==
X-Gm-Message-State: AFqh2koiofo1BIWsQ1Lw2GiEkhAfA57X6au4JnpG6fLAKLq4JxaCk0k6
        B7VPx/AdfSR/+bojJFLl9JtDXQ==
X-Google-Smtp-Source: AMrXdXsnkfKZuht0AuuR+x5cPBI8cVqRzT+dU1UCs8maGGWXP/JqnrsSpsSlEhPDDBAHJ1r4S66wAA==
X-Received: by 2002:a05:651c:2103:b0:27a:1535:6277 with SMTP id a3-20020a05651c210300b0027a15356277mr20676314ljq.50.1673224178752;
        Sun, 08 Jan 2023 16:29:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v3 03/12] interconnect: move ignore_list out of of_count_icc_providers()
Date:   Mon,  9 Jan 2023 02:29:26 +0200
Message-Id: <20230109002935.244320-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move the const ignore_list definition out of the
of_count_icc_providers() function. This prevents the following stack
frame size warnings if the list is expanded:

drivers/interconnect/core.c:1082:12: warning: stack frame size (1216) exceeds limit (1024) in 'of_count_icc_providers' [-Wframe-larger-than]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 25debded65a8..df77d2f6215d 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1079,15 +1079,16 @@ void icc_provider_del(struct icc_provider *provider)
 }
 EXPORT_SYMBOL_GPL(icc_provider_del);
 
+static const struct of_device_id __maybe_unused ignore_list[] = {
+	{ .compatible = "qcom,sc7180-ipa-virt" },
+	{ .compatible = "qcom,sdx55-ipa-virt" },
+	{}
+};
+
 static int of_count_icc_providers(struct device_node *np)
 {
 	struct device_node *child;
 	int count = 0;
-	const struct of_device_id __maybe_unused ignore_list[] = {
-		{ .compatible = "qcom,sc7180-ipa-virt" },
-		{ .compatible = "qcom,sdx55-ipa-virt" },
-		{}
-	};
 
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "#interconnect-cells") &&
-- 
2.39.0

