Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5612C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CF822310E
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392339AbhAZNIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391964AbhAZMsz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:55 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457CAC03542F
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:07 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i9so2664420wmq.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACuhHqUyAOgeit1pJS1MxY6/38vCSWpT3UKaTx8+/JY=;
        b=fM8B1mFx2eVpjNGE3vhWFZC0WnRAysxKHxe+DAlNp0M68o88FbxPu79MK7N6KiE2w6
         9Xz6u4qdahy0LI9WhaFK/lyoXeoeyTIRv3jDEuQ+1axa99t2wwYOv3R4ZYP7Nf33NHcF
         h/ifupziL/bRk8bMH6nIbZRqrxAaPuu8HhFAWxW4P1w0jDAp4QjTtN/sMy8BVDVsBKeJ
         5XqZMH2ZHCMbswWDflwfuj2IwwEkK5sK41ABrUURUYOQM0CqIeNKuZ/QR+TlG/5OyQY4
         UAK2fLKyhInTzveMOSTFN0HX58oaY6FSzzY0nRCsLMpkwG8QaNeop7L+F9Ub+d7NkC/G
         +g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACuhHqUyAOgeit1pJS1MxY6/38vCSWpT3UKaTx8+/JY=;
        b=ublD+m8Lb0h/lQy72hzIV2a2CdZzKbIzOfvSrlYIxtV2EK/nzUarEH8eGkDXCtQyZs
         fkcXFdob0nB5s5V6H71fHLSLnBPNw1k5T3EHHSznVYJ40DRyWPlozCKMil3ksvk2THcs
         KVkCzM4T0EKa1GhuLIWXDGzJWL1tB8cfPmVCV78yzvitJ3yogNlflshwffsSiy/5AfjE
         MlE1H3unSrLNAGg+/+bwVrgR5OtTL9jz5ArsMAknwKQsUg49b665+s72sn6RzFct6mRr
         LJqqautGEz/oI/UiFa/BaazfLe338spAKOOoFkdMRH8k0hDBTEyoTOrdGDvsGel5uDJw
         999A==
X-Gm-Message-State: AOAM532ioqiEMEqoY77IZYJulT+vuCFTJB3a5sxBcVcfsKYmf1qKsW8q
        td4DCMYLD/vuEiAIglCtAWC18g==
X-Google-Smtp-Source: ABdhPJwZRlj953gT/ow/PoTz03HbJCu8kx7ksSmJH59sdocGmJhel18R3yS87cxTtuQ5kIlJ9yN83w==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr4569286wmh.85.1611665166044;
        Tue, 26 Jan 2021 04:46:06 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:46:05 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 18/21] clk: qcom: clk-rpm: Remove a bunch of superfluous code
Date:   Tue, 26 Jan 2021 12:45:37 +0000
Message-Id: <20210126124540.3320214-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/qcom/clk-rpm.c:453:29: warning: ‘clk_rpm_branch_ops’ defined but not used [-Wunused-const-variable=]

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 63 --------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index f71d228fd6bd5..a18811c380187 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -73,62 +73,6 @@
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)	      \
-	static struct clk_rpm _platform##_##_active;			      \
-	static struct clk_rpm _platform##_##_name = {			      \
-		.rpm_clk_id = (r_id),					      \
-		.active_only = true,					      \
-		.peer = &_platform##_##_active,				      \
-		.rate = (r),						      \
-		.branch = true,						      \
-		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_branch_ops,			      \
-			.name = #_name,					      \
-			.parent_names = (const char *[]){ "pxo_board" },      \
-			.num_parents = 1,				      \
-		},							      \
-	};								      \
-	static struct clk_rpm _platform##_##_active = {			      \
-		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_name,				      \
-		.rate = (r),						      \
-		.branch = true,						      \
-		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_branch_ops,			      \
-			.name = #_active,				      \
-			.parent_names = (const char *[]){ "pxo_board" },      \
-			.num_parents = 1,				      \
-		},							      \
-	}
-
-#define DEFINE_CLK_RPM_CXO_BRANCH(_platform, _name, _active, r_id, r)	      \
-	static struct clk_rpm _platform##_##_active;			      \
-	static struct clk_rpm _platform##_##_name = {			      \
-		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_active,				      \
-		.rate = (r),						      \
-		.branch = true,						      \
-		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_branch_ops,			      \
-			.name = #_name,					      \
-			.parent_names = (const char *[]){ "cxo_board" },      \
-			.num_parents = 1,				      \
-		},							      \
-	};								      \
-	static struct clk_rpm _platform##_##_active = {			      \
-		.rpm_clk_id = (r_id),					      \
-		.active_only = true,					      \
-		.peer = &_platform##_##_name,				      \
-		.rate = (r),						      \
-		.branch = true,						      \
-		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_branch_ops,			      \
-			.name = #_active,				      \
-			.parent_names = (const char *[]){ "cxo_board" },      \
-			.num_parents = 1,				      \
-		},							      \
-	}
-
 #define to_clk_rpm(_hw) container_of(_hw, struct clk_rpm, hw)
 
 struct rpm_cc;
@@ -450,13 +394,6 @@ static const struct clk_ops clk_rpm_ops = {
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
-static const struct clk_ops clk_rpm_branch_ops = {
-	.prepare	= clk_rpm_prepare,
-	.unprepare	= clk_rpm_unprepare,
-	.round_rate	= clk_rpm_round_rate,
-	.recalc_rate	= clk_rpm_recalc_rate,
-};
-
 /* MSM8660/APQ8060 */
 DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
 DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-- 
2.25.1

