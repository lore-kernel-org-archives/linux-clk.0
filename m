Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FF3C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 12:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbiI1Mlp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233860AbiI1Ml1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 08:41:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E7E82863
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:41:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d42so20263895lfv.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Zd06RtS/Nrr3P0Lw0WJBnLGx6z/NA6eV+iimAqCF4Pk=;
        b=L5pMtVVhH35O6FplZUIKnVB4to5VmyCNC5Cc0mTqmawGbjafKRBERWs0Hws3oxvd+8
         oE9eNYYweSkxTsBzu2WVLV7DCXVzB4c5n0gXInXx8xQT1bQrEtRXCsLIqA6T4QJ6xQE2
         8+0i6+7H+SAKY6jm1AVwgo57TvaNxrOJt+uKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Zd06RtS/Nrr3P0Lw0WJBnLGx6z/NA6eV+iimAqCF4Pk=;
        b=NU35tD0XlIfDKpn7gDPfLevHDzzzDg8+vlAx1cn6G4Q4OBPmZDJXnw+ynXwqXDB0ux
         uryoMc6X3g4ZGFt4pCoNL1WOizEXTyjH2f9zlAN+o7iV9YCmiD3wc/NMMXtgp9syPeYA
         QTSC9hK1XZjNEBzn2nWttu+1haxD+tVzEvNpf77duS7XQsP6E6DB5bg5pK4lbm7u3Mzi
         ulDhoCmyQ1WvvP2a5gsywKMbnquQUe30jf5PusQ2mUq4Esu5MWwJWdhpy6Dpu3OnAJAg
         sBGhAWyrlIaGzerAJnU6fvC5hGgn82xYcu0eJeccUVRm20uHFrHf+d+6m92W43CbGxNJ
         2MjQ==
X-Gm-Message-State: ACrzQf3513uey1xCi+bcHQmuhqeEcr0Gb3a5RhNak5DV7rcnelPacu+q
        M2eGT1lHG5LIy91GsdqE96oh8w==
X-Google-Smtp-Source: AMsMyM7Qf8SRtcyNBIQ1t4WtW2fyAZ7oKbZURcwJDSPs2npaQVfx80VVUldkD5mSzJ/Yg02Sxjp1Vg==
X-Received: by 2002:a05:6512:b0d:b0:4a1:baad:8d7a with SMTP id w13-20020a0565120b0d00b004a1baad8d7amr8283472lfu.293.1664368874120;
        Wed, 28 Sep 2022 05:41:14 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b0049b8c0571e5sm467396lfn.113.2022.09.28.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 05:41:13 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] clk: imx8mp: register driver at arch_initcall time
Date:   Wed, 28 Sep 2022 14:41:08 +0200
Message-Id: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We have an imx8mp-based board with an external gpio-triggered
watchdog. Currently, we don't get to handle that in time before it
resets the board.

The probe of the watchdog device gets deferred because the SOC's GPIO
controller is not yet ready, and the probe of that in turn gets deferred
because its clock provider (namely, this driver) is not yet
ready. Altogether, the watchdog does not get handled until the late
initcall deferred_probe_initcall has made sure all leftover devices
have been probed, and that's way too late.

Aside from being necessary for our board, this also reduces total boot
time because fewer device probes get deferred.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
It would probably be reasonable to do the same to the other imx8m* clk
drivers, but I don't have any such hardware to test on.

 drivers/clk/imx/clk-imx8mp.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index e89db568f5a8..9ddd39a664cc 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -734,7 +734,19 @@ static struct platform_driver imx8mp_clk_driver = {
 		.of_match_table = imx8mp_clk_of_match,
 	},
 };
-module_platform_driver(imx8mp_clk_driver);
+
+static int __init imx8mp_clk_init(void)
+{
+	return platform_driver_register(&imx8mp_clk_driver);
+}
+arch_initcall(imx8mp_clk_init);
+
+static void __exit imx8mp_clk_exit(void)
+{
+	platform_driver_unregister(&imx8mp_clk_driver);
+}
+module_exit(imx8mp_clk_exit);
+
 module_param(mcore_booted, bool, S_IRUGO);
 MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
 
-- 
2.37.2

