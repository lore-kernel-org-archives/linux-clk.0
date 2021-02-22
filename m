Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D782C433E6
	for <linux-clk@archiver.kernel.org>; Mon, 22 Feb 2021 19:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F65A64E3F
	for <linux-clk@archiver.kernel.org>; Mon, 22 Feb 2021 19:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhBVTno (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Feb 2021 14:43:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:55066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233274AbhBVTnk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Feb 2021 14:43:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E68C264E77;
        Mon, 22 Feb 2021 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614022941;
        bh=01MxcmLrabdc8FEG08f/1GCdu8iEiJXD04j/6rQ8KDU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TQdxZNlt82acKOAaeQBsEmWJ6dSXW+HirLW7O8f9tUVmsc44fH7t5BUPc+FruQQuZ
         gRJa45nhjamp716vOgDWYW5yTuspoB8KK8rX170wF2ybqPCDmDouIk0rkjRoDws3ks
         KoGCi7sPcSCc4Txgm9H7bVtnb/TW36dqrGSfOuRHEyOQ1y3PSE3xL7rYm6RZRBZvxL
         LEB9vWzMuf4/+wRPDfOvYNewQ+Hv03PgbfBN/ph9rTRiuTqwHN21j5TSh5ETU51YU0
         QsrlFEaoOzMHvnE4tYENn9JZn32bks1eRqHXigWpKEZdB1k5USiZzFKD2GgbA6yNOR
         Dr6pmJprbx8gA==
Received: by pali.im (Postfix)
        id 7DB1E10D1; Mon, 22 Feb 2021 20:42:18 +0100 (CET)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andre Heider <a.heider@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?q?G=C3=A9rald=20Kerma?= <gerald@gk2.net>,
        Konstantin Porotchkin <kostap@marvell.com>
Subject: [PATCH mvebu v3 09/10] cpufreq: armada-37xx: Remove cur_frequency variable
Date:   Mon, 22 Feb 2021 20:41:57 +0100
Message-Id: <20210222194158.12342-10-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222194158.12342-1-pali@kernel.org>
References: <20210114124032.12765-1-pali@kernel.org>
 <20210222194158.12342-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Variable cur_frequency in armada37xx_cpufreq_driver_init() is unused.

Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>
Tested-by: Anders Trier Olesen <anders.trier.olesen@gmail.com>
Tested-by: Philip Soares <philips@netisense.com>
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index e4782f562e7a..050abff18308 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -400,7 +400,7 @@ static int __init armada37xx_cpufreq_driver_init(void)
 	struct armada_37xx_dvfs *dvfs;
 	struct platform_device *pdev;
 	unsigned long freq;
-	unsigned int cur_frequency, base_frequency;
+	unsigned int base_frequency;
 	struct regmap *nb_clk_base, *nb_pm_base, *avs_base;
 	struct device *cpu_dev;
 	int load_lvl, ret;
@@ -461,14 +461,6 @@ static int __init armada37xx_cpufreq_driver_init(void)
 		return -EINVAL;
 	}
 
-	/* Get nominal (current) CPU frequency */
-	cur_frequency = clk_get_rate(clk);
-	if (!cur_frequency) {
-		dev_err(cpu_dev, "Failed to get clock rate for CPU\n");
-		clk_put(clk);
-		return -EINVAL;
-	}
-
 	dvfs = armada_37xx_cpu_freq_info_get(base_frequency);
 	if (!dvfs) {
 		clk_put(clk);
-- 
2.20.1

