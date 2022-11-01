Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033C2C4332F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Nov 2022 17:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiKAReY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Nov 2022 13:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbiKAReL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2022 13:34:11 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F421C91F
        for <linux-clk@vger.kernel.org>; Tue,  1 Nov 2022 10:34:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so19498287pji.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Nov 2022 10:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6I3W5iz5oKsw7fuRbgEDYeDmXhDRKQPgqXFKZPwJ7I=;
        b=bOIleHIeQBQX1Tz/VCpSiJjhzgp3eLDDe06G7ZxLe/M/UhKhsq4fiPB4YbwXNc0J/3
         NM8dv4sgYmP5V8kvsVDN3qi9krRuDX/zwH3h4+inctLsKO/lHs2HK8drNA2/IBrma38/
         Kr2Z7DoVsHheghXMJg2PtLNDhGkt7Uo4UcL1NYY87xqwJyoeRBSqCXp3VDynX9LGbRdR
         unp/GYjzFR5O7lG1nbvy7xjs6bwumle7p9vuZu9AH3EFwy5ZiBMS5JklSWrSnf+86Sga
         NLO8YwJ3txUqOPtml/YTVZRNUf1PBzOxZlbWb73OblTLl4gacOX9nzd1xmehuFk0EUN8
         nO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6I3W5iz5oKsw7fuRbgEDYeDmXhDRKQPgqXFKZPwJ7I=;
        b=GcMP6Py27IXhIO0uysj+bL1KBmHXY8CL8quY55zLoK/XERNg8BTG9FDLv44HKHp8bn
         nTs/QhML5/gMZtrCGiFwzJF7DAyvo8Qv8uWZs/VKPaX8Wqjnr1sDnlOAshuF21dDjUD5
         d6N4rAn1YWZfwCGBnrpjEhTFPlGzGKOLq41KCxGOZty34fJgKV8alJ9VmFjA0CzaELls
         8Sj35dfdvfqFzOi6RVrlRfLw+KRrSsDxgTu+RfZGU8PNC5uh05mCxHSIO0nWfk/BrUSi
         esSJKcwd6COr40kML3hSzEyK+lQqaaHA5Vq4sQ27yZBV+Rutj/bmy+Q/yqA2Ig/3qWEi
         K4WQ==
X-Gm-Message-State: ACrzQf3IIj1Si9WZxbPLcnq4f/cF3v4/Pl+NGQZK9y9rDwWBXCWN2X9N
        wiPR4M/0eCzbsw27jHDsCbVZKfDQ0s5u
X-Google-Smtp-Source: AMsMyM67u0Ks8SV2gK6c35+YOWZI5aqcUdzG/H1PLrHSf/K7O/o7L18cFEVz7nA/zo/PdBhK0dT3aw==
X-Received: by 2002:a17:902:b90b:b0:186:8a4d:d4b7 with SMTP id bf11-20020a170902b90b00b001868a4dd4b7mr20246858plb.129.1667324049792;
        Tue, 01 Nov 2022 10:34:09 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id f27-20020aa7969b000000b0056cea9530b6sm6725415pfk.202.2022.11.01.10.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 10:34:08 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
Date:   Tue,  1 Nov 2022 23:03:55 +0530
Message-Id: <20221101173355.339573-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

USB controllers on SM8250 doesn't work after coming back from suspend.
This can be fixed by keeping the USB GDSCs in retention mode so that
hardware can keep them ON and put into rentention mode once the parent
domain goes to a low power state.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 9755ef4888c1..a0ba37656b07 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3267,7 +3267,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc usb30_sec_gdsc = {
@@ -3275,7 +3275,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
-- 
2.25.1

