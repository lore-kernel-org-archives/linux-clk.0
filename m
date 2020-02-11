Return-Path: <SRS0=edwH=37=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1D4C352A4
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 03:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A51962082F
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 03:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKXZv/7y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbgBKDIp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Feb 2020 22:08:45 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34212 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgBKDIp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Feb 2020 22:08:45 -0500
Received: by mail-qk1-f194.google.com with SMTP id c20so2803696qkm.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2020 19:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bg8WGWFiNlP/c2kLxlwNG4J49V1wsso+2muB3C1AW9c=;
        b=DKXZv/7ymzCe7lWR2nuYKaFhN0CvQPiBVLKdywBkaD9Mc8y06uZ7LJzBYeHcdwzRVu
         iTi/CblpfuDt4yDEOdzC25FAjjiBEzXy4ZGxj5vgZnFmr0ceomoPDDbRYxu8+ajFQJhN
         c/8n6HNrrCGpAhH12+/b592OXEtADYWx1nb6h9NEffFfGQLo1t4TdrQb1XFU0R/43cy1
         bqtTEWrP6gHNdCTqw78gtDKeTnPMKV8K0K7mD2ovYgzyLlYrLc2Oajazt7v3ZqRIHiD2
         50Z9w7Nks/TahzrHzejURNxveDbSQjFCzqa4zFD672Ks1pxdQj4uhoDM3YP1lRenHV9i
         pVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bg8WGWFiNlP/c2kLxlwNG4J49V1wsso+2muB3C1AW9c=;
        b=T5SAhjklNakQvLJFNeEdK82fmpniPK/Bw9ZW4E4OOPNid0m7HBX6RojWHc0YJ8O5vD
         4S3LLE8wVkVKIWrSsh6UD36xyLHUCudqGML4n/skNMhEcoJOdEJswGHQMPKCk/i1piSI
         8jpex4Slbj8vEV5Sp+uc9ZW0EXWCWlPt18QzdBK/0T2bpuW7gA3jqhkms6ryt6xj7dn1
         LeBiCQ56KdgXE9sdBat7AAMJmlSY7LXXJQj4fRaytR56ynLAuqpj2Lqlvk51P8ajpEPI
         Y/ab6LwF5LjaKEePrQkwIqidSnASc84qZ7468Y+CqYjon8E93FBNoMBHz8ogPWYujzHb
         XUJg==
X-Gm-Message-State: APjAAAViauzFoM1D/RRg7YBdoNVP0rUMZz/amCsVLKGLHQdEYikBRWC/
        IqeBIPn6a6va023CaX8AP04=
X-Google-Smtp-Source: APXvYqxmeoHuS2wt0ms22icYBK4flqPZxbg5eqglY/c3VTu6tZNOcrevbp3eEvJ/BLCsdPxpr0bzfg==
X-Received: by 2002:a37:4808:: with SMTP id v8mr4031673qka.263.1581390523759;
        Mon, 10 Feb 2020 19:08:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:5bb::1])
        by smtp.gmail.com with ESMTPSA id x41sm1345893qtj.52.2020.02.10.19.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 19:08:42 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] clk: imx8mm: Fix the CLKO1 source select list
Date:   Tue, 11 Feb 2020 00:08:12 -0300
Message-Id: <20200211030813.13992-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CLKO1 clock source select list is the following as per the i.MX8MM
Reference Manual (put in increasing order):

000 - 24M_REF_CLK
001 - SYSTEM_PLL1_CLK
010 - None
011 - SYSTEM_PLL1_DIV4
100 - AUDIO_PLL2_CLK
101 - SYSTEM_PLL2_DIV2
110 - VPU_PLL_CLK
111 - SYSTEM_PLL1_DIV10

Fix it accordingly.

Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx8mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 2ed93fc25087..770cf2ae58aa 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -283,8 +283,8 @@ static const char *imx8mm_vpu_h1_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
 
 static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "osc_27m", "sys_pll1_200m", "audio_pll2_out",
-					 "vpu_pll", "sys_pll1_80m", };
+static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
+					  "audio_pll2_out", "sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
 
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
-- 
2.17.1

