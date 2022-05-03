Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF08C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 13:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbiECNIb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 09:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbiECNIa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 09:08:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8863838D80
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 06:04:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m20so33277983ejj.10
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HE6TEqKzjpF8P/f3OJMTxhJhd4luPXA1XQ5KDUdPOFw=;
        b=PRYSWSDLwarb+uV1LsWrJ/SgZraudviNmpgi1zgU34YNcaXjTdU1zxyWgoGR/l4aFl
         ZucjbOOi9Acwly4mFtzN29qcarpEHs4Lde3O5aUYXp4vU7HtGD/Q3YzDHtkjOyrsDJRo
         MPXqiMZnNVMVg+QCRFiy31h6foMdbUfMyDOiscCBOWCuqpY5gUAs4lsbqhbd/80OGVJ7
         Fke9VI8lvNWjmQ9KYdKzDbQDd8ZbSJAQBkrAd3W2Bcmjl9SRyDrKm3agyZO+waGIOLn3
         3fWiTLTGM+76HWGZ73E4yTx+NcPVXw3edX7yZ5CXmSR52WSsxL3T65nv9h9U5HqbGP94
         brrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HE6TEqKzjpF8P/f3OJMTxhJhd4luPXA1XQ5KDUdPOFw=;
        b=o3Y1R9WfQN3DVUIxWfDaPrvmWDXfQn1AnaBJyyFl6xHxcsThtg30WO8b+9aIhcJIbr
         sP5YRrOdtJdatAmquxWp4oNn4W9+4U8JpTvrgc0e4fXlKIrb27+Nnb/CKxqPFWh7ApFz
         BGZu7WWbm7fUnz40ulVPqmBTmLz1g6QnjJ1IqcWsWwuPuDhNALOF3bThi7tKFJz5kLhv
         yeNPylESrBUHZZ69tapqljtB1QQHbzoeYXZZgWcA7NOvnC6GdoG7U6k+KJyTKGtd0xyR
         2do05rDkYUG9yHep19StFpW+64IP3VQytDhAMosz+eZRzAokBrMPVZ9XzBU9+8Ja9bFD
         5MWw==
X-Gm-Message-State: AOAM532up4mgc+dSBS+6gDnI7gTEwnUz4TW7RjioZdejZ1MCalSWs2z5
        nZkdJN02IRiIoiaWNas6lbKiKg==
X-Google-Smtp-Source: ABdhPJwihD4Mx73DK2RWg8vq9oDDyCbCGuFL7KsHAJIKdDxw5ZxPnSo6PW0X4IyEPiH768CR2cXbHg==
X-Received: by 2002:a17:907:62a2:b0:6e0:e201:b94e with SMTP id nd34-20020a17090762a200b006e0e201b94emr15667761ejc.730.1651583094922;
        Tue, 03 May 2022 06:04:54 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7cccd000000b0042617ba639asm7868782edt.36.2022.05.03.06.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:04:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/8] clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED
Date:   Tue,  3 May 2022 15:04:42 +0200
Message-Id: <20220503130448.520470-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503130448.520470-1-robert.foss@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Some clock implementations doesn't provide means of implementing
is_enabled(), but still requires to be explicitly disabled when found
unused as part of clk_disable_unused().

One such set of clocks are Qualcomm's display RCGs. These can be enabled
and disabled automatically by the hardware, so it's not possible to
reliably query their configuration. Further more, these clocks need to
be disabled when unused, to allow them to be "parked" onto a safe
parent. Failure to disable the RCG results in the hardware locking up as
clk_disable_unused() traverses up the tree and turns off its source
clocks.

Add a new flag, CLK_ASSUME_ENABLED_BOOT, which clock drivers can use to
signal that these clocks should be disabled even if they don't implement
the is_enabled() ops.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1
 - Removed Vinods r-b


 drivers/clk/clk.c            | 2 +-
 include/linux/clk-provider.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ed119182aa1b..9789ec137219 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1284,7 +1284,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(core)) {
+	if (clk_core_is_enabled(core) || core->flags & CLK_ASSUME_ENABLED_WHEN_UNUSED) {
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..9038022ffebd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* assume clock is enabled if found unused in late init */
+#define CLK_ASSUME_ENABLED_WHEN_UNUSED	BIT(14)
 
 struct clk;
 struct clk_hw;
-- 
2.34.1

