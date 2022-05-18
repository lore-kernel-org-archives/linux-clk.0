Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4B7C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 17:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241082AbiERR2e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241081AbiERR2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 13:28:34 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7AF1B092B
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:28:33 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id f4so3083475iov.2
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKolOlzzwnZ7+8eELQXskFMIvOTP7lX/YwA+iJBQY4=;
        b=L3XVYyOQzSOkyyakBykuHe2f+T35o9DcLyQB/B00jC1Odl2Xw7aHVgfeLKWkFyKj+T
         g9GMQ9yzg+0cMi1cMbb3EXUCeNCzhCAxFJXf+rZPwX6AQlToTO4c6uTfQXWOIAY9O2Bb
         zaOswkiC/CBKTtMyZ++GdrbUstx2GIOhu08EHG30VJKEdmne3FCnLd/aLEhIVj6bN+GH
         WhAj0gZqoVD/MGdJVbRp3JdsPbDpgOwCosqD/euUs4RUMtvwMuaARunbetUQ8sgalqZ2
         yjzuVU9jLUS6D51QgmrxUHROF0l/PdGcIcTuRoBBl4ptOpqU5riWnV2xj2iJdvsKqCvu
         IuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKolOlzzwnZ7+8eELQXskFMIvOTP7lX/YwA+iJBQY4=;
        b=ue+NH4e1cxS85FviollBvT/uoAAugx7DTvwLgBQa07a/fmELuw+2ruMafjSdsFSs8R
         56mXm2w8VS3sdAMIMyG4CZfX7nWOJ3rCE6+Y7Cpcf1RTbfvpfmic//0wCVRf1IUPCRTT
         bSgIT06pF+x4AfddeY1F8MYD+iFDbAxPE7QqTmGwCs8jz6qi64euYdPqBfsgNG2FE020
         1FQRLdNbGesUnVYw2WYorsnmtYosSyNYsQVBUq1tfr15jDmxofZG7YTzBznUeEJsI35+
         7HZptiqY6+S8h4KdimJIKm3Vkzmdz+4VaEDlUPlOy/TvHurHBu7GGuV/122H26agwVTC
         YO+w==
X-Gm-Message-State: AOAM531Oq6eMV+5uX00etLHV5jqhAh/6SeQQ5wHV8VigxURxEmOPyeR4
        wiDZP1wmXF+TeHXcvjM5bSKjIGxthJxa2Q==
X-Google-Smtp-Source: ABdhPJySGBsjt6QuVeV1RImGuXtBAAbxw/OwHGbMLJ56AyjiA3bw9wf9Kv5xxhyqVjEQuxIgTJE8WA==
X-Received: by 2002:a05:6602:3290:b0:657:73af:c385 with SMTP id d16-20020a056602329000b0065773afc385mr365253ioz.58.1652894912494;
        Wed, 18 May 2022 10:28:32 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:28:31 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Date:   Wed, 18 May 2022 13:27:15 -0400
Message-Id: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are two UART clock groups, each having a mux to select its
upstream clock source. The register/bit definitions for accessing these
two muxes appear to have been reversed since introduction. Correct them
so as to match the hardware manual.

Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c99942f0e4d4..0baa6a06ada8 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -287,7 +287,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_UART,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
-		.dual.sel = ((0xec / 4) << 5) | 24,
+		.dual.sel = ((0x34 / 4) << 5) | 30,
 		.dual.group = 0,
 	},
 	{
@@ -296,7 +296,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_P2_PG,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
-		.dual.sel = ((0x34 / 4) << 5) | 30,
+		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
 	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-- 
2.25.1

