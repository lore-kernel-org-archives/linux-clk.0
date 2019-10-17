Return-Path: <SRS0=WJPE=YK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A844ECE58E
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 10:31:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 239FA21D7A
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 10:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iC2Af2Y4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501993AbfJQKbQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Oct 2019 06:31:16 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45546 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501989AbfJQKbQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Oct 2019 06:31:16 -0400
Received: by mail-pl1-f196.google.com with SMTP id u12so907822pls.12
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2019 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=yAYxsDoF1xODxjQtRc8reB4aVCGjGyEgdApmFBnl6Wc=;
        b=iC2Af2Y46Q48FdvGdaNCTJQWCORwnw78D049tRe8+wBCpljt9U7Qn95yg0fi6nJ24v
         HRH1hHOymiUJtnG/81nWV1WdomOj9Vb5eo+tknLXOXhbCPWwSJ1O85eOb6ZLWBfxZx73
         nm6axiRp9TDykYVuVJT1+hVIe9CWVmg4T2pn7qlImdrTFS/00QfgYALSKkffpn3OebN4
         lRBjq1HBr7CvUfdKaUTJnsEwJwCkZtDjPSpUt6I5Qclgo2OoGIEqD83dOUQDpiI2KEtm
         Gpo34FDCc4VGpwC73SzpFoFB3PgrToTo5wPbgo2tW7x4MD9ZE0RrD9GMRN+ad20Tg1gR
         sA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=yAYxsDoF1xODxjQtRc8reB4aVCGjGyEgdApmFBnl6Wc=;
        b=Z7mI00KXX1zENDeAfYwAcFwZo2sycYw2AggZaYxHwCUe6GVlB2JxvM4D15SrsqJsON
         J3URwP7+X0DxUfFyvmui6QV/OYN55ak2RAF1FDjk8MuDyopWKO2SmPIdngSJm8VT7z8Y
         WMC0pPJSzTRDWUdPXiSLCzLc+yucXcT3TpxEdojj4pCYgvU6Ob6h7EnmU2e7PbzH92su
         Ul56HQ2KlwA6/4xxPB8WgoOliGT8mDn4EuR2I4Ewt8WYpVge/+jjxD+PiYz+4Fuf2/UL
         eNkemRemRL4LyUqLhhAgALcjhnWrV32KIGMcdXRSOBumx4wu1wXUIhvAfmCh0goL6vtb
         Ax3w==
X-Gm-Message-State: APjAAAW8BSNWQVgcEZlBdPvtyM4/Mf+eIqedDPWwKdDwbK1fnC4U6dA7
        4YDnYrKf7znm0ecg+qrgwi5Kqw==
X-Google-Smtp-Source: APXvYqyNIoDQlqqbRpfGllvxFaO8itQeEnNEO04t0hj2VGtP81j+uZneDao+xFrh7G83yp4YDjih9g==
X-Received: by 2002:a17:902:222:: with SMTP id 31mr3300158plc.169.1571308274634;
        Thu, 17 Oct 2019 03:31:14 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id ep10sm14892051pjb.2.2019.10.17.03.31.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 03:31:14 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org
Subject: [PATCH v2 4/5] clk: qcom: Initialise clock drivers earlier
Date:   Thu, 17 Oct 2019 16:00:53 +0530
Message-Id: <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571307382.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571307382.git.amit.kucheria@linaro.org>
References: <cover.1571307382.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571307382.git.amit.kucheria@linaro.org>
References: <cover.1571307382.git.amit.kucheria@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
can have earlier access to cpufreq during booting.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c   | 2 +-
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 drivers/clk/qcom/gcc-sdm845.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 96a36f6ff667..20d4258f125b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -487,7 +487,7 @@ static int __init clk_rpmh_init(void)
 {
 	return platform_driver_register(&clk_rpmh_driver);
 }
-subsys_initcall(clk_rpmh_init);
+core_initcall(clk_rpmh_init);
 
 static void __exit clk_rpmh_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index bd32212f37e6..9b0c4ce2ef4e 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2855,7 +2855,7 @@ static int __init gcc_qcs404_init(void)
 {
 	return platform_driver_register(&gcc_qcs404_driver);
 }
-subsys_initcall(gcc_qcs404_init);
+core_initcall(gcc_qcs404_init);
 
 static void __exit gcc_qcs404_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bdd..49dcff1af2db 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3628,7 +3628,7 @@ static int __init gcc_sdm845_init(void)
 {
 	return platform_driver_register(&gcc_sdm845_driver);
 }
-subsys_initcall(gcc_sdm845_init);
+core_initcall(gcc_sdm845_init);
 
 static void __exit gcc_sdm845_exit(void)
 {
-- 
2.17.1

