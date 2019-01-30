Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ABFC282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 19:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 233D62086C
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 19:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGqaOnhS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbfA3TVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 14:21:20 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44916 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387448AbfA3TVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 14:21:20 -0500
Received: by mail-qt1-f194.google.com with SMTP id n32so771208qte.11
        for <linux-clk@vger.kernel.org>; Wed, 30 Jan 2019 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mk61zDWO2rvng3ldRiuYr9AGIieZwSLJylIjdFkyVUk=;
        b=EGqaOnhSGpp1MlChw7SgI7j/RK0eaCHvVySBt8KQZgq9Z1hK5IslH0NddJEbV/+rjf
         6AbrkvGCrsGF1NS3D4xhc7jfZGHfYbexmyekApWpTNl1BzFwNnKOR0JUrNoIzjnlq1NX
         rX4NPlCF1mwbc5+YckE/E5XccuVn00Vi+dD0yFaIfMAwufMdurog2qNS28uOPRwdnXdq
         uTwKqnsOO5IzjKxkCE7uso2pGgqiVZ0JV9UzR738vE6n4JLI7EbH4MJjm3cTTwoEj0tG
         CCVR8EVUWYbJ8PrCXo14Y7x+Q6QPiqauk2pSycdD0mVDyKy67vUmlZtuvU4LMhJVeJgs
         1Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mk61zDWO2rvng3ldRiuYr9AGIieZwSLJylIjdFkyVUk=;
        b=AuKdmdEnmxcDyeo3MHJ7I4OJLP339HhJzW6sjwYtHypMRMEo/lSZrrGeF81bBd8lZu
         WMrcUirldV5bBzeEWHQ6JXqcbDuykphosVSo/T4XnyRILTArmKPqPwlRGQVmofOpcBPh
         D7N6abnsWSbuTBJJGYVZ23D84kYErIrbI7TcA8xixfBzUaz8+1lBohgQsq4X/8trdHdh
         hVNl5vmvAIterIzZmqmI83gj1FBjPbI4a3f8kAn5oAYHEkNgdH9T06WDijmsm0/3Fq10
         N8nQQaGmR/zFaBVSjSRPgWLhNTQAWNBuUSgUgCBASUYCtkRjV3luhZJtHuLJqXoM5zjz
         CNmQ==
X-Gm-Message-State: AJcUukcTtLup37t3k3bTz3Chjh6A3QPGt9FdGFJcSrLWBeQkHRb/Y902
        qqZIfIx3lFxWhTKBxnkZM4I=
X-Google-Smtp-Source: ALg8bN7LibS16BiFY7knoDAJcdbQjGjmEDdhOXa8n5XGevRvSnYoYz2Wbv2qUmCftEYv4384xjagkQ==
X-Received: by 2002:a0c:95e8:: with SMTP id t37mr29847126qvt.163.1548876079085;
        Wed, 30 Jan 2019 11:21:19 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:a73::1])
        by smtp.gmail.com with ESMTPSA id u4sm1775456qkk.51.2019.01.30.11.21.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 11:21:18 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rogerio.silva@nxp.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
Date:   Wed, 30 Jan 2019 17:21:02 -0200
Message-Id: <20190130192102.7065-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CLKO2 clock source select list is the following as per the i.MX8M
Reference Manual:

000 - 25M_REF_CLK
001 - SYSTEM_PLL2_DIV5
010 - SYSTEM_PLL1_DIV2
011 - SYSTEM_PLL2_DIV6
100 - SYSTEM_PLL3_CLK
101 - AUDIO_PLL1_CLK
110 - VIDEO_PLL1_CLK
111 - 32K_REF_CLK

However, in imx8mq_clko2_sels[] only the first four entries are correct.

Fix it by adding the missing "sys3_pll2_out" entry in order to match
the description from the manual.

Fixes: b80522040cd3f ("clk: imx: Add clock driver for i.MX8MQ CCM")
Reported-by: Rogerio Pimentel <rogerio.silva@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx8mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 398ab0bcd9de..63001bc891d4 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -264,8 +264,8 @@ static const char * const imx8mq_ecspi3_sels[] = {"osc_25m", "sys2_pll_200m", "s
 					   "sys1_pll_800m", "sys3_pll2_out", "sys2_pll_250m", "audio_pll2_out", };
 static const char * const imx8mq_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char * const imx8mq_clko2_sels[] = {"osc_25m", "sys2_pll_200m", "sys1_pll_400m", "sys2_pll_166m", "audio_pll1_out",
-					 "video_pll1_out", "ckil", };
+static const char * const imx8mq_clko2_sels[] = {"osc_25m", "sys2_pll_200m", "sys1_pll_400m", "sys2_pll_166m",
+					  "sys3_pll2_out", "audio_pll1_out", "video_pll1_out", "ckil", };
 
 static struct clk_onecell_data clk_data;
 
-- 
2.17.1

