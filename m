Return-Path: <SRS0=2J+f=D6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A92DC388F9
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F3B520878
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsD3RCjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464464AbgJWNTr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Oct 2020 09:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464503AbgJWNTq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Oct 2020 09:19:46 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00DCC0613D5
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 77so2072436lfl.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=42/QJnTBpzJfK34Z8I/i86Pa85pWKg6cU4DTrB1R8G0=;
        b=WsD3RCjBU2/gDCOB79XWImHCGbaDA9pH/0eqBfD4sCzHj+1JAxMaNdzaNP8k/KA9rn
         t2pmFfbqqRunMeULfNBVr1WkuRi0qMo8o7guSHaPx80XPDOzne1yKmW22FU9Z6GlKhta
         vBbALKwQWVLdAD/slIMWsiYhIjZrKChouZkNOrVzNh77QPW2pdNTnuSzpM5KZ/espzqa
         gOSKt4AMn5T4zEiNt2Qpx3IDwfuDLcb4iB80CEdrUO5vuNdqAJ3HQqVeXPGtXocFBLE/
         M/KxpyXhyN3WRwtys/GmKWqmpsEXm8pQgYwHrPHZqpbxXqhuQeaneQo2oAjB6B3UzDii
         tH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=42/QJnTBpzJfK34Z8I/i86Pa85pWKg6cU4DTrB1R8G0=;
        b=V916NEo2e6skQmxd5y8u4bAin03prXzLEU5mIb6Qym7IsrCxosP2SVjuuX042jsgPm
         UGjVbZh/HJQQmcLVdEWbigday3GOPgIX8Ry8YvXO/yo4UTb6AJd/HrFPVNK02ELHF2fq
         ytyMAJq1CFdfk3z+snkT1GvPvLmE8rEiFQxCBYap5ndBnlGTUeORkRQTE6ygJLQ14rwn
         nYzA5HUMBtS0nsGeaTQKVY/jcnoCRxS/lmK+mVG6D6r9AeSDpTmVRyMQFj3+vEN9cru9
         LoiRtf2nwITEnJQbbLsECY3ZxQseH37QVFgsAf1uGSZZg5LGUdU9z/CWbZRqpkdHHUOc
         d+8A==
X-Gm-Message-State: AOAM531QntSxbJYfc0VfPpIJs2akz+4dGOmSjcaTcS2bJhVhDnCP2OUN
        jBne52cqbJaShm5sWvZCAPoQ/g==
X-Google-Smtp-Source: ABdhPJx1MpKQkvgHj6D1gAJ1OzdDgkZgE/Fy3vrqCzBYYCELpavWDo54R7yMHsyr6KsZbd6X0scDTQ==
X-Received: by 2002:a19:b14:: with SMTP id 20mr867172lfl.308.1603459183251;
        Fri, 23 Oct 2020 06:19:43 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: handle MMCX power domain
Date:   Fri, 23 Oct 2020 16:19:25 +0300
Message-Id: <20201023131925.334864-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
This power domain is expressed as mmcx-supply regulator property. Use
this regulator as MDSS_GDSC supply.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 07a98d3f882d..588575e1169d 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -963,6 +963,7 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
+	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.28.0

