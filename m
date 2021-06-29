Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8036C11F66
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B921561DC5
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhF2GKT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 02:10:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231920AbhF2GKS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 02:10:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFEAD61DC5;
        Tue, 29 Jun 2021 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624946872;
        bh=+bhgKYRLGT/NQ0NVPsujgyGtEr+RrAm/gg93HpgQ1c8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IBRGkF8djaTtF97DhbMZj8HPGQtcxzhl84/3hY5uTaBkkztgjwyhLYVPk9ZmIe21n
         jT1X2R7bUCcIppQ9fsvRU0Y0juKBewa6eN28IFtjMB0Hm1n0ZmoJNmnyQMwEyQaeBB
         RpouqKFApjhOEH9JrjwgSXK7MripsZX7tVwM1NIxmgclXxgfwMtvMrBkr6phWcl4wW
         Zq7y8JiN4wJ+ZW7G7A46e0Cz74ORd4m3hiUDC7o1/gNWFo2tizPRydRgdUA10i8JeG
         Yh/g6BIbM6Ls7aTYtv2ptjuJI3MsuGk5eCnLOgLPPAg52yZJmXev2cZY5bii8N5llS
         aXh0SwhauccZg==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Liam Beguin <lvb@xiphos.com>
Subject: [PATCH 2/2] clk: lmk04832: Use of match table
Date:   Mon, 28 Jun 2021 23:07:51 -0700
Message-Id: <20210629060751.3119453-2-sboyd@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210629060751.3119453-1-sboyd@kernel.org>
References: <20210629060751.3119453-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Presumably we want to use this match table so add a module device table
and set the driver match pointer appropriately.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Liam Beguin <lvb@xiphos.com>
Fixes: 3bc61cfd6f4a ("clk: add support for the lmk04832")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-lmk04832.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 0cd76e626c3d..c1095e733220 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1573,18 +1573,20 @@ static int lmk04832_remove(struct spi_device *spi)
 }
 static const struct spi_device_id lmk04832_id[] = {
 	{ "lmk04832", LMK04832 },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(spi, lmk04832_id);
 
 static const struct of_device_id lmk04832_of_id[] = {
 	{ .compatible = "ti,lmk04832" },
-	{},
+	{}
 };
+MODULE_DEVICE_TABLE(of, lmk04832_of_id);
 
 static struct spi_driver lmk04832_driver = {
 	.driver = {
 		.name	= "lmk04832",
+		.of_match_table = lmk04832_of_id,
 	},
 	.probe		= lmk04832_probe,
 	.remove		= lmk04832_remove,
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

