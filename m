Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BD0C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 12:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30285239FD
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 12:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbhANMmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jan 2021 07:42:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:59372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbhANMmQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Jan 2021 07:42:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E57D223A63;
        Thu, 14 Jan 2021 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610628057;
        bh=p2goXKdP7dSbMv3eBsWpLzg7u1iavJGm+TNYJ0mf8w4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T6GwQgVXVVvQtD0fde83yhXpAaXigCk7PG4YpJpbDM73h8e8MXn8DOMVzOGk+9WkZ
         ISIL7Z5EPiUvlHtv7c8KgWCTRPdYrLCbqrhWG/EM54cjXTHDnU78gT+QprfDlB7Tas
         /FuXlxxXAccvgP5uiaZJpebl4BiFvp5RWtV7QvwFgN9KeYf3IRxvG8mh1hGc4rD7rj
         Aws67Nd7Ed4+aknZHDZOqkBuaLNcC20FWXI7iUuEBntCV+8InUMjdr+Uk6t/ftEMSX
         EhscJ5FrRykagmGB8rR5tHl3+hhqaQl8EL2TKXnHuAYKMgrXgK/G17lFjdfp0EIyWs
         zljwXz1T/Cefw==
Received: by pali.im (Postfix)
        id BAD1E847; Thu, 14 Jan 2021 13:40:54 +0100 (CET)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        "Miquel Raynal" <miquel.raynal@bootlin.com>,
        "Tomasz Maciej Nowak" <tmn505@gmail.com>,
        "Luka Perkov" <luka.perkov@sartura.hr>,
        "Andre Heider" <a.heider@gmail.com>,
        "Vladimir Vid" <vladimir.vid@sartura.hr>,
        "Russell King" <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?q?G=C3=A9rald=20Kerma?= <gerald@gk2.net>,
        "Konstantin Porotchkin" <kostap@marvell.com>
Subject: [PATCH mvebu v2 07/10] cpufreq: armada-37xx: Fix driver cleanup when registration failed
Date:   Thu, 14 Jan 2021 13:40:29 +0100
Message-Id: <20210114124032.12765-8-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114124032.12765-1-pali@kernel.org>
References: <20210114124032.12765-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 8db82563451f ("cpufreq: armada-37xx: fix frequency calculation for
opp") changed calculation of frequency passed to the dev_pm_opp_add()
function call. But the code for dev_pm_opp_remove() function call was not
updated, so the driver cleanup phase does not work when registration fails.

This fixes the issue by using the same frequency in both calls.

Signed-off-by: Pali Rohár <pali@kernel.org>
Fixes: 8db82563451f ("cpufreq: armada-37xx: fix frequency calculation for opp")
Cc: stable@vger.kernel.org
---
 drivers/cpufreq/armada-37xx-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
index 92e531f700f4..002a71775e08 100644
--- a/drivers/cpufreq/armada-37xx-cpufreq.c
+++ b/drivers/cpufreq/armada-37xx-cpufreq.c
@@ -510,7 +510,7 @@ static int __init armada37xx_cpufreq_driver_init(void)
 remove_opp:
 	/* clean-up the already added opp before leaving */
 	while (load_lvl-- > ARMADA_37XX_DVFS_LOAD_0) {
-		freq = cur_frequency / dvfs->divider[load_lvl];
+		freq = base_frequency / dvfs->divider[load_lvl];
 		dev_pm_opp_remove(cpu_dev, freq);
 	}
 
-- 
2.20.1

