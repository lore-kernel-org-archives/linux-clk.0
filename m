Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7C4E7D0A4
	for <linux-clk@archiver.kernel.org>; Thu, 21 Sep 2023 18:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjIUS4L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Sep 2023 14:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjIUSzy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Sep 2023 14:55:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E63BF13F
        for <linux-clk@vger.kernel.org>; Thu, 21 Sep 2023 11:40:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32155a45957so1320714f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Sep 2023 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695321622; x=1695926422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO07y52ihL4jiW+/YSc6o4oy7K98rV4fDYJiTaFp/cc=;
        b=AFq6lBuMRcdnONo4szVmKjeetk+zN8qEY6PcTEStrEt+1psyc9Dtl227xTdmzSVO0T
         K+9jGQrSICfDhbk1wGwQTqJ5sEgTGkw9h/gzkD7DfAFOlMt4jHDh1KxL78Z97dqrSlkV
         sjm/zanMyShFxTzte1fPTCfjueW5deIT+lr2PQMN9Bw2eK4J1ZU/uIz0Ye4GzFEUkIHy
         ClPf0KV/5J1LsgyL3C0lAzIMYehbHSSIAO2JDtEoR7gj0HsfMQhDtPy0MHoR/SoUBjZ9
         iaSFHO4YGMgKW0vnwdfSWDWdZuGm7GKBJqcJDWFAmu4PStQh/FFanLtI4RiQFUcwvHXK
         hRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321622; x=1695926422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO07y52ihL4jiW+/YSc6o4oy7K98rV4fDYJiTaFp/cc=;
        b=Ri8+37piY2wxwXgRHbizslRtLE9m6ohXLN96bKBTmGFAaOf/Y6dnW1Os+JgRl4fRtU
         u6g2RmYoB2rfT9Yz3Wq1rWOnCP30AvBbUewiNH3SHyX4+m5bjrOHrhq0YA57yZTgKRcQ
         LovIFM0NdP3U3BGZtnkD+n3PMl2QOAfED7/Y5/+t69p6P0CYfQqIifV02ZwtdEtYcDb1
         nvkVHmVN5uAfdPMPhHlLwZi4J4RrHae6zOv0xxCHwpKAC03NAg+tcZpCXxPc9/iXTQi8
         8DgXvo1U3YPzfn2dHYpBQuUnElIXWEqhF/FpVb4gPUYy+5MdgWE9wlJum5jxjvi41AnM
         vUSA==
X-Gm-Message-State: AOJu0YzxC/Gp4Hl72PGy4wW76vbYY9BzeUN4kzjIWg50dDf+YmwoQaTq
        acbuQu+OSxFv6mXSxd4YjXch6UPrhOdfRHgzJBt6GQ==
X-Google-Smtp-Source: AGHT+IGOsPGLaNytNXaesgM8DKeO7lYi8IWldSKE9SkPDnT2UG04FmyFBfLgnPmFbVLicstMGWgsLQ==
X-Received: by 2002:a17:906:ef8c:b0:9ae:4ba4:7983 with SMTP id ze12-20020a170906ef8c00b009ae4ba47983mr3166503ejb.37.1695289020335;
        Thu, 21 Sep 2023 02:37:00 -0700 (PDT)
Received: from hackbox.lan ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b009a5f1d15642sm763085ejb.158.2023.09.21.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 02:36:59 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] clk: imx: Select MXC_CLK for CLK_IMX8QXP
Date:   Thu, 21 Sep 2023 12:36:47 +0300
Message-Id: <20230921093647.3901752-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the i.MX8QXP clock provider is built-in but the MXC_CLK is
built as module, build fails:

aarch64-linux-ld: drivers/clk/imx/clk-imx8-acm.o: in function `imx8_acm_clk_probe':
clk-imx8-acm.c:(.text+0x3d0): undefined reference to `imx_check_clk_hws'

Fix that by selecting MXC_CLK in case of CLK_IMX8QXP.

Fixes: c2cccb6d0b33 ("clk: imx: add imx8qxp clk driver")
Closes: https://lore.kernel.org/all/8b77219e-b59e-40f1-96f1-980a0b2debcf@infradead.org/
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index f6b82e0b9703..db3bca5f4ec9 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -96,6 +96,7 @@ config CLK_IMX8QXP
 	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
 	depends on IMX_SCU && HAVE_ARM_SMCCC
 	select MXC_CLK_SCU
+	select MXC_CLK
 	help
 	  Build the driver for IMX8QXP SCU based clocks.
 
-- 
2.34.1

