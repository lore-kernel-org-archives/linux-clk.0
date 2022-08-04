Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C32CC3F6B0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Aug 2022 10:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiHDKfQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Aug 2022 06:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiHDKfM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2022 06:35:12 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD60128
        for <linux-clk@vger.kernel.org>; Thu,  4 Aug 2022 03:35:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id k26so20388786ejx.5
        for <linux-clk@vger.kernel.org>; Thu, 04 Aug 2022 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO69IERChew3U/2LIgFG877Cl2jcoIbTGwSLhUjnHKk=;
        b=Iu0xP1aU7znwFVzxmB2PZJvg0RLyfR7h2XMZiMJLQ4ZGPSsaK//FucXq4dceqmmQag
         EPzjbwk6MguBLLTXlUhznPou89KB4p4aL3dckW1A2WItB4MbVKwN7qwwLLlje85sE8lV
         ACnhH9SnLTuvI775gQlNJ6mPLYWDcnojfS1BHDJMbTP7YGlNMFCkSR85Ajv8mPaEVcwW
         rq2l9ynSbU7pJRlksGRRHngGAKycZVze1bksFV7p5iSi4jP07loUs2HbG6VD4PgQdtLw
         pnbHQri8pwD41LNGxjkrE0/om0ixyCfERDyNL/uNMUvFaoHIdEUlHZoqv+95DfZanlfz
         WtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO69IERChew3U/2LIgFG877Cl2jcoIbTGwSLhUjnHKk=;
        b=zZ9MjEAuURwZehcnDTnAQqiiXr/+oyclDnOl6CF/5fzmIU3aZyVMXP7Vpc2tTRku0o
         KP/cvx6YN2lpfnKLIZyPuL2+yZPfU5dLut0W/NSNKoB902iP/8tpWkzdB+2yXcbcwE/9
         qlm1Nhk2h9GYC9FX/kHnyB/F6JDhODCNmccWu/16GIDtyz3amzpan2ZI9JGxWQcRYQDN
         6B7GVDE70BcC1t1YBSTcF0zc8K176Vyddv544EsE0oj3nlxzWDebCBhaL8/OPG526c8F
         zoquRV3EuGNS1Ks9ONK8iU81IbQuUfUpW3KOYIJ5vHxm/nWDhD2L/IsIK4H4xBS73abI
         /a7g==
X-Gm-Message-State: ACgBeo0Z44R2ZjvPiNV/9TsALVfFxg8azgrLsJ69nSEO9D3qBZVqALmF
        zh1k2ezWTpo329xpdZ4t8gU2Ug==
X-Google-Smtp-Source: AA6agR61mri8ZQqatzgNBCVU7gG688DD8hOMdp8btLkv2tLbBgwD1Qtcb7B1hl4hqcvrMSplwJnaQw==
X-Received: by 2002:a17:907:738a:b0:730:7537:848c with SMTP id er10-20020a170907738a00b007307537848cmr957728ejc.488.1659609308894;
        Thu, 04 Aug 2022 03:35:08 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7de8a000000b0043577da51f1sm443760edv.81.2022.08.04.03.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 03:35:08 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC] clk: qcom: common: Detach the power domain at the end of probe
Date:   Thu,  4 Aug 2022 13:34:56 +0300
Message-Id: <20220804103456.3176943-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

None of the CCs actually need the PD attached to their device,
but rather some GDSCs registered by those CCs need that PD as a parent
in order to propagate power gating and the performance state.

So lets detach the PD from the CC right at the end of probe, after
everything has been successfully set up.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..c918c91775ae 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -303,6 +303,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	dev_pm_domain_detach(dev, true);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
-- 
2.34.1

