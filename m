Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB949C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  3 Mar 2022 08:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiCCIti (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiCCItg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:49:36 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7DF175849
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:48:48 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id t11so4974047ioi.7
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSMHKR0pmUBVsu3Vu2wBxwFcKUCdAyp38lru1FeWzYE=;
        b=mNlWeTevAfC6NBCmgAqO7gQgNy0HxOaeX7ypa+R+i8lHm7E6Qxfqktf+3G+1FmnWs+
         FisZv0YRzClLKs3OT/u3rNZViWcMFBkMKWI5jYipSyNSWfdqYUF74IZG4zVqAeSXnN8E
         p+lRi9exYQ3G7hoP3v5jvTdw2TbgtOJB85OfKvCNmp0mZzGsCEXzKYxeYRHU1t2Xf0cy
         JtkSkUVrWrCaDKV+As6AGNtxH1O5nzkHvvcBRl2lN58ZMhJCTiA/VJGBfzBL9fgcDlGg
         Lu6nzgydgwClyT4CoFKgG3XdNkgGIBu+gK8y3XyUAtZ/uTYH0QYxUGnwEpJlAt4aYlLG
         y+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSMHKR0pmUBVsu3Vu2wBxwFcKUCdAyp38lru1FeWzYE=;
        b=XMpKYylfqIxRv9xUH8zEHKVWFt/RsYc9Gj9sM+FyMYsYvQkn7GgPQrAErzdUV8YGvU
         UGbKDauTL/Ykn/ZFla8yI2GzlPdQHd3iJvfyuiqk6g5SCDH0l2ILg7dgFnJvkE5Pyyv8
         RSbmV6QEBKzmyNjoHuk0LL5sg2/TTCOrm539kAnsx3XEEvcMgJL/dH+cvo1y18T2QPmn
         PymCG8eKoeGxbVuueM2+QMf4mmI7bXpN+3ZJNszR2klJMwcAesAoOZFu9xGC8Wb3xd2P
         wV6lfqtq3qHq/+R+iLFSAmBDy4vZiGuh1vwjJ++yUX5bxjbGW8u7VHN37yS7IMrDdtC2
         akvw==
X-Gm-Message-State: AOAM532vwPCT/Db6JPj+b5olJn0CSZp3RgS4Ocr2gf90weSd+SLOk2Xv
        /acvrEfmQS28rcc1lsgZrt8mfA==
X-Google-Smtp-Source: ABdhPJxk4BEn7tYqG9TYEaBYdHLNzALSFZ3qp6vUvK8puPIYmfuW2OoY4zgtrIqQFLL42BG5MiF1Iw==
X-Received: by 2002:a5e:881a:0:b0:640:d0a5:2bfe with SMTP id l26-20020a5e881a000000b00640d0a52bfemr25696913ioj.34.1646297327976;
        Thu, 03 Mar 2022 00:48:47 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:47 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 2/6] clk: qcom: gcc: sm8150: Fix some identation issues
Date:   Thu,  3 Mar 2022 14:18:20 +0530
Message-Id: <20220303084824.284946-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix identation issues with usb30 gdsc structs in gcc-sm8150.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 245794485719..85a431ac417b 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3449,21 +3449,21 @@ static struct clk_branch gcc_video_xo_clk = {
 };
 
 static struct gdsc usb30_prim_gdsc = {
-		.gdscr = 0xf004,
-		.pd = {
-			.name = "usb30_prim_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_sec_gdsc = {
-		.gdscr = 0x10004,
-		.pd = {
-			.name = "usb30_sec_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0x10004,
+	.pd = {
+		.name = "usb30_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *gcc_sm8150_clocks[] = {
-- 
2.35.1

