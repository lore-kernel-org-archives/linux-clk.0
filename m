Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0E8E7849A
	for <linux-clk@archiver.kernel.org>; Mon,  2 Oct 2023 07:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjJBHCB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbjJBHCB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 03:02:01 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B7AA4
        for <linux-clk@vger.kernel.org>; Mon,  2 Oct 2023 00:01:57 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so60959605e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Oct 2023 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230116; x=1696834916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=To5Z1ek1ng/bcrw4gcWQYfPUL1tJalZo399lDaaqlbk=;
        b=gjh37sAPabYEUrw8HCwH0189hKj07WBRiWaMzSlsgk+A9vIdWk0xfBx/nUCZqG8WXi
         mJcugLbICX5RPDpfUuRZp66oCbJUB1BQZaOFFLG4fyAl5fkZhNl1So6h5L9p7wMpiAMO
         a7pbs/v1+fbPTHCjU8ZCgWNCcI1WW/TnhE9xCuWQpZ544Qe794c3+ga6JQoYN71IfQBF
         KmWcrFuOwXa+05H3HT+lBc9XxHHrd7txiD0n0NyNtPmFosj/+CCxgHbbFPKVC4h87gHc
         fCr6bwzHEZxEf3JTQoPfQssL6mpE7xmBiRMSgXy3GzB/cnN7JloqH4mnsEubB+wAasgr
         eOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230116; x=1696834916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=To5Z1ek1ng/bcrw4gcWQYfPUL1tJalZo399lDaaqlbk=;
        b=HhX2HwGVM6lCz9Tts7fLNa99oHI2kPq9Z0KHB/rcfkx53tcDJSbAM5RtR42iXCtIBM
         q69ZVd2vwsnR5gYSuYfRlOkwG2X1ejUR79HP2gQPNQxxv/TY0zAuWku4ZDi0oB4CGeoH
         oRjtq9pYaDleRXWUc/Mr0sedyqDWQHCq3VLZMWO/PSLHGjdXPEPTeOsFTTNJtoQEdwxJ
         /7LQ+tLBKDrtXwrbMt0GW4n/l8tALebPTrUXTWDS1rn41fRZdM/HbcpRp6teeVnJVoY/
         VzMyBRXGbakfnnVQyqSA6Yzhy8tJ5+pJc/B4BDbLx27oCFlKeXysnHeZaQ2Bxjh/+lKg
         1fkw==
X-Gm-Message-State: AOJu0YzdY8ktfy3mKHnFN6lYBMI5Zm0M5erBlemHj+32ZYmVDY4Jt0bB
        91dI09tHfBbE6upDZed8PucYVULTFie/RucxiWA=
X-Google-Smtp-Source: AGHT+IFUaESPnID8Bx8Iq2U2O1ScDfATW117K0k6Diplm+aeOUbawH1TDpLk+t5XmonRkAxYLh2RTw==
X-Received: by 2002:a7b:ce8b:0:b0:402:98cd:a3e9 with SMTP id q11-20020a7bce8b000000b0040298cda3e9mr9220533wmj.32.1696230115893;
        Mon, 02 Oct 2023 00:01:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c214300b004063ea92492sm6595641wml.22.2023.10.02.00.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:01:55 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:01:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
 clk_imx_acm_attach_pm_domains()
Message-ID: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The device_link_add() function returns NULL on error.  It doesn't return
error pointers.  Fix the check accordingly.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/imx/clk-imx8-acm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 1e82f72b75c6..83019b986622 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
 							 DL_FLAG_STATELESS |
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(dev_pm->pd_dev_link[i])) {
+		if (!dev_pm->pd_dev_link[i]) {
 			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
-			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
+			ret = -EINVAL;
 			goto detach_pm;
 		}
 	}
-- 
2.39.2

