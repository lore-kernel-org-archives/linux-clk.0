Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30930C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 10:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbiERKgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 06:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235187AbiERKgJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 06:36:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B921102
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 03:35:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so2846347lfa.6
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OPZaa8O8nK6v81/n/W6XSRLaD0EMUHd0/YyP/r4uTE=;
        b=Xr+N2L8ytMOPljbWrdRGsgthSUXEgPaGCcJaMJOupz7NasJgFDHsid4EfinnrtGjkc
         GIIeSF1G7yFICTnTw5iuX+yJv7mr9F/1SfWMn3VnXGPoE4TeYXt6Tu78p2s92TKIiiWK
         XCgzhZckc1mf5BGyaFMpBLKORfk+x3bA9iSzV3kF36earJNCyAYnTzpzbeyh/74unnI7
         CFXo6i0TsjlM3/WT03C3iHwG2GsJqGsLMxHKJQxQYJBcTkYj0eEaTMveHSn80dJnymwV
         P4TeavcDaty8JrmsUM6lPOwsX2A4RPBRVmONh3Xq3ph/Cr5FxlnjC/oY0aF/JuzMUi7Q
         xxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OPZaa8O8nK6v81/n/W6XSRLaD0EMUHd0/YyP/r4uTE=;
        b=dV8R1BVvogcLtOrVP9OwPPdtVxHZ0TKpySvR170bWA5PzrvI2bGolY6UpBre5s+9m+
         M0Y5iXDz2lN+nK5wKPLGdH6JenyXY8ArvxJca4A9Xz8O8CV4Qv3+Nq1s4IG+RzVzUnnW
         YfNPJ30XfS6adVxh4JgkNAgF1NOavTR3UmPXYayygKQ0Y/0PG8GMXPszpBe2EPw55WoI
         R2a1Z9FufVNuyTiuxiQYOMisrCFR3lIpzJXc5sh8VWUtxIEORpY1zthJzaMTbV5YWzzk
         FnW2kZNx2ReRSGFvQOdhjwqD/B4wrn4+C6QIibvrt3zkZ/0s3xeoGmqFswIBkHEsjJqF
         XJjg==
X-Gm-Message-State: AOAM531bCn5sbaUAbyb6lm2x2MnybX1MRTTMl53CS52yUUMqhjGDeAMP
        b9BLIFt5xUVQ3j5MdNmilkRDPQ==
X-Google-Smtp-Source: ABdhPJzJB3QjrssIFShXSHHsIPfuN0JZhHmQ03dlU2SMWxKIwygisaGxtL8YPE30Fng9DbBPF8TEQg==
X-Received: by 2002:a19:a402:0:b0:477:baf1:1983 with SMTP id q2-20020a19a402000000b00477baf11983mr1277725lfc.222.1652870157999;
        Wed, 18 May 2022 03:35:57 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id v16-20020a056512097000b0047255d210f8sm171629lft.39.2022.05.18.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:35:57 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
Date:   Wed, 18 May 2022 13:35:54 +0300
Message-Id: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Access to I/O of SM8250 camera clock controller IP depends on enabled
GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
one is inited on subsys level, so, to satisfy the dependency, it would
make sense to deprive the init level of camcc-sm8250 driver.

If both drivers are compiled as built-in, there is a change that a board
won't boot up due to a race, which happens on the same init level.

Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 439eaafdcc86..ae4e9774f36e 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
 	},
 };
 
-static int __init cam_cc_sm8250_init(void)
-{
-	return platform_driver_register(&cam_cc_sm8250_driver);
-}
-subsys_initcall(cam_cc_sm8250_init);
-
-static void __exit cam_cc_sm8250_exit(void)
-{
-	platform_driver_unregister(&cam_cc_sm8250_driver);
-}
-module_exit(cam_cc_sm8250_exit);
+module_platform_driver(cam_cc_sm8250_driver);
 
 MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.33.0

