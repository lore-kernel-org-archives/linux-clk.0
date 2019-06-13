Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F00C31E4A
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11656208CA
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXcnLITH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732850AbfFMQM3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 12:12:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43132 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731923AbfFMQM2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 12:12:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so11317997wru.10;
        Thu, 13 Jun 2019 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTiPdwEAgHOGKlQkeUgO2qBXD6lEqHC+l7tfRjpfR/o=;
        b=sXcnLITHWXiKaEech4XlXblZFp3F7j8V906RSKFPLB7Za+DUskoL9/Vh1ajkmMXA8/
         algfcxD8R6aeAibeN7+5FatmsDKXCAnyHY/uyZl1HPQREBvVFx9uS49HOUZAt0oFOx28
         xQK3BXohVed1A7Tfng4KWwXs513pJLG1Eg8yhBeLPqYTWqnVtbw1ahbpxxc/VTsjyf5q
         rbb9siOo68V9jq++vDkyloMljvIqKYWvvQadq+gLUr4SGw0k883pgk0OQbtB/OOkZ8vo
         lvM6W2MQs1oeovDpecnoAa3EQwSLtySNLJrksq1B2ERHubsPnFAb+LqFajbQEJoPA7ZZ
         u0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTiPdwEAgHOGKlQkeUgO2qBXD6lEqHC+l7tfRjpfR/o=;
        b=L+Z4sbrPG1Mvz8uCwpg0WlQW2+yGYWerCZ6jejAa+XU5h/RYArp0iYZAWmnZ6fHio8
         lVhFQhB37zuenW5Con27ptb/GzVygy1wooSZdXDc+yvACybTwy3z98MrDrZaMP/xJZqu
         SkC52cjiPs+a0AvjrQnL1D6M0yIfhXrxdGvZWl4i5M15XHRAPEURcpQ0Bnb9WrKQ6YeA
         zz2gFXU2T5gA6tgP7aQ+h59rqbaznfWZ4AYPodZmMjbk0L0FetW4Qg2tVdLn+b/LXqWc
         fTrJhsr8CETFO/qcLWi7OZ5507bWx4DTTsCm9/ZuULZG7UE9f0vNEDcXYlLmY2ARtcXo
         Zk1Q==
X-Gm-Message-State: APjAAAWGyTxCv3dnYCFmYybIf43Qunws5rG5dy1i0VDZRxZqhQQ+ciUs
        Fk46U2JvinBAFZRhWxSVgag=
X-Google-Smtp-Source: APXvYqzCF4+cv2sqxVy4DWHNNvX2XrgbhRmOuEM/C5UlZsAgEp+oKIUlpDJmj7wKbk7ClXUZ8znUKw==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr7047604wrk.121.1560442346713;
        Thu, 13 Jun 2019 09:12:26 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t6sm383671wmb.29.2019.06.13.09.12.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:12:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] clk: tegra: Do not warn unnecessarily
Date:   Thu, 13 Jun 2019 18:12:23 +0200
Message-Id: <20190613161225.2531-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is no need to warn if the reference PLL is enabled with the
correct defaults. Only warn if the boot values don't match the defaults.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index e1ba62d2b1a0..4904ac4a75db 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -984,8 +984,6 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
 	pllre->params->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
-		pr_warn("PLL_RE already enabled. Postponing set full defaults\n");
-
 		/*
 		 * PLL is ON: check if defaults already set, then set those
 		 * that can be updated in flight.
@@ -1012,6 +1010,9 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
 		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);
 		udelay(1);
 
+		if (!pllre->params->defaults_set)
+			pr_warn("PLL_RE already enabled. Postponing set full defaults\n");
+
 		return;
 	}
 
-- 
2.21.0

