Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB466C001DE
	for <linux-clk@archiver.kernel.org>; Fri, 11 Aug 2023 03:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjHKDgz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 23:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjHKDgt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 23:36:49 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A52D66;
        Thu, 10 Aug 2023 20:36:45 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 8385024E282;
        Fri, 11 Aug 2023 11:36:37 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 11:36:37 +0800
Received: from localhost.localdomain (183.27.98.20) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 11:36:36 +0800
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC:     Conor Dooley <conor@kernel.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v1] clk: starfive: jh7110-sys: Set PLL0 rate to 1.5GHz
Date:   Fri, 11 Aug 2023 11:36:31 +0800
Message-ID: <20230811033631.160912-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Set PLL0 rate to 1.5GHz. Change the parent of cpu_root clock
and the divider of cpu_core before setting.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---

Hi Stephen and Emil,

This patch sets PLL0 rate to 1.5GHz. In order not to affect the cpu 
operation, the cpu_root's parent clock should be changed first.
And the divider of the cpu_core clock should be set to 2 so they
won't crash when setting 1.5GHz without voltage regulation.

This patch is based on linux-next which has merge PLL driver on
StarFive JH7110 SoC.

Thanks,
Xingyu Wu

---
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 47 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 3884eff9fe93..b6b9e967dfc7 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -501,7 +501,52 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-sys", 0);
+	ret = jh7110_reset_controller_register(priv, "rst-sys", 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set PLL0 rate to 1.5GHz
+	 * In order to not affect the cpu when the PLL0 rate is changing,
+	 * we need to switch the parent of cpu_root clock to osc clock first,
+	 * and then switch back after setting the PLL0 rate.
+	 */
+	pllclk = clk_get(priv->dev, "pll0_out");
+	if (!IS_ERR(pllclk)) {
+		struct clk *osc = clk_get(&pdev->dev, "osc");
+		struct clk *cpu_root = priv->reg[JH7110_SYSCLK_CPU_ROOT].hw.clk;
+		struct clk *cpu_core = priv->reg[JH7110_SYSCLK_CPU_CORE].hw.clk;
+
+		if (IS_ERR(osc)) {
+			clk_put(pllclk);
+			return PTR_ERR(osc);
+		}
+
+		/*
+		 * CPU need voltage regulation by CPUfreq if set 1.5GHz.
+		 * So in this driver, cpu_core need to be set the divider to be 2 first
+		 * and will be 750M after setting parent.
+		 */
+		ret = clk_set_rate(cpu_core, clk_get_rate(cpu_core) / 2);
+		if (ret)
+			goto failed_set;
+
+		ret = clk_set_parent(cpu_root, osc);
+		if (ret)
+			goto failed_set;
+
+		ret = clk_set_rate(pllclk, 1500000000);
+		if (ret)
+			goto failed_set;
+
+		ret = clk_set_parent(cpu_root, pllclk);
+
+failed_set:
+		clk_put(pllclk);
+		clk_put(osc);
+	}
+
+	return ret;
 }
 
 static const struct of_device_id jh7110_syscrg_match[] = {
-- 
2.25.1

