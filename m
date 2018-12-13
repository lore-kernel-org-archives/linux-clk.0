Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49FFC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8090820870
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="SVjYnz3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8090820870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbeLMJfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:20 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8169 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbeLMJfT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:19 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227d10001>; Thu, 13 Dec 2018 01:35:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:17 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Dec 2018 01:35:17 -0800
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:17 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:17 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227d40000>; Thu, 13 Dec 2018 01:35:17 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH V2 12/21] cpufreq: tegra124: do not handle the CPU rail
Date:   Thu, 13 Dec 2018 17:34:29 +0800
Message-ID: <20181213093438.29621-13-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693713; bh=cFkhAstfSy6edE2nU4IXZTM12YCmE+CLGBX/yRk0+KM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=SVjYnz3a0Y2QCK2LAde4VURux6fQl+94wCgpe+11rWohRRTOPRqFk6aAseOLHnfqT
         9Rwm4lEGpSMrmK8prj6pgEm1S7zfeqLNrrLsPLf3rif9v6YYGGOCtluH+hh7i4AxT+
         +GS9c2P+BRKusrmhaW3D1blR54ImuzNqFmYOytQeV5hSTRUkKKr6UNPRj2W4L3KRw6
         xd1BHetWN5g/hhxhbdsj2S1FBE8NlAEkxeOm3wfogbn9I/4kHTgveK5BmJ5iyhPujv
         siBWQBnXy05Oa8KG3RlYR8ab0WDt/DIQd/VUMOryBuwHRMIuH0zQYa7PVVXPP5nkKN
         vF6xL4eJx46Dw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
rail. So this driver shouldn't handle for the CPU clock switching from
DFLL to other PLL clocks. It was designed to work on DFLL clock only,
which handle the frequency/voltage scaling in the background.

This patch removes the driver dependency of the CPU rail, as well as not
allow it to be built as a module and remove the removal function. So it
can keep working on DFLL clock.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - update the commit message since we change the driver not able to be
 built as a module and remove the removal function in V2
---
 drivers/cpufreq/Kconfig.arm        |  4 +--
 drivers/cpufreq/tegra124-cpufreq.c | 41 ++----------------------------
 2 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 4e1131ef85ae..1d83b6e81222 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -261,8 +261,8 @@ config ARM_TEGRA20_CPUFREQ
 	  This adds the CPUFreq driver support for Tegra20 SOCs.
=20
 config ARM_TEGRA124_CPUFREQ
-	tristate "Tegra124 CPUFreq support"
-	depends on ARCH_TEGRA && CPUFREQ_DT && REGULATOR
+	bool "Tegra124 CPUFreq support"
+	depends on ARCH_TEGRA && CPUFREQ_DT
 	default y
 	help
 	  This adds the CPUFreq driver support for Tegra124 SOCs.
diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-=
cpufreq.c
index 43530254201a..a1bfde0a7950 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -22,11 +22,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
-#include <linux/regulator/consumer.h>
 #include <linux/types.h>
=20
 struct tegra124_cpufreq_priv {
-	struct regulator *vdd_cpu_reg;
 	struct clk *cpu_clk;
 	struct clk *pllp_clk;
 	struct clk *pllx_clk;
@@ -60,14 +58,6 @@ static int tegra124_cpu_switch_to_dfll(struct tegra124_c=
pufreq_priv *priv)
 	return ret;
 }
=20
-static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv=
)
-{
-	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
-	clk_disable_unprepare(priv->dfll_clk);
-	regulator_sync_voltage(priv->vdd_cpu_reg);
-	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
-}
-
 static int tegra124_cpufreq_probe(struct platform_device *pdev)
 {
 	struct tegra124_cpufreq_priv *priv;
@@ -88,16 +78,10 @@ static int tegra124_cpufreq_probe(struct platform_devic=
e *pdev)
 	if (!np)
 		return -ENODEV;
=20
-	priv->vdd_cpu_reg =3D regulator_get(cpu_dev, "vdd-cpu");
-	if (IS_ERR(priv->vdd_cpu_reg)) {
-		ret =3D PTR_ERR(priv->vdd_cpu_reg);
-		goto out_put_np;
-	}
-
 	priv->cpu_clk =3D of_clk_get_by_name(np, "cpu_g");
 	if (IS_ERR(priv->cpu_clk)) {
 		ret =3D PTR_ERR(priv->cpu_clk);
-		goto out_put_vdd_cpu_reg;
+		goto out_put_np;
 	}
=20
 	priv->dfll_clk =3D of_clk_get_by_name(np, "dfll");
@@ -129,15 +113,13 @@ static int tegra124_cpufreq_probe(struct platform_dev=
ice *pdev)
 		platform_device_register_full(&cpufreq_dt_devinfo);
 	if (IS_ERR(priv->cpufreq_dt_pdev)) {
 		ret =3D PTR_ERR(priv->cpufreq_dt_pdev);
-		goto out_switch_to_pllx;
+		goto out_put_pllp_clk;
 	}
=20
 	platform_set_drvdata(pdev, priv);
=20
 	return 0;
=20
-out_switch_to_pllx:
-	tegra124_cpu_switch_to_pllx(priv);
 out_put_pllp_clk:
 	clk_put(priv->pllp_clk);
 out_put_pllx_clk:
@@ -146,34 +128,15 @@ static int tegra124_cpufreq_probe(struct platform_dev=
ice *pdev)
 	clk_put(priv->dfll_clk);
 out_put_cpu_clk:
 	clk_put(priv->cpu_clk);
-out_put_vdd_cpu_reg:
-	regulator_put(priv->vdd_cpu_reg);
 out_put_np:
 	of_node_put(np);
=20
 	return ret;
 }
=20
-static int tegra124_cpufreq_remove(struct platform_device *pdev)
-{
-	struct tegra124_cpufreq_priv *priv =3D platform_get_drvdata(pdev);
-
-	platform_device_unregister(priv->cpufreq_dt_pdev);
-	tegra124_cpu_switch_to_pllx(priv);
-
-	clk_put(priv->pllp_clk);
-	clk_put(priv->pllx_clk);
-	clk_put(priv->dfll_clk);
-	clk_put(priv->cpu_clk);
-	regulator_put(priv->vdd_cpu_reg);
-
-	return 0;
-}
-
 static struct platform_driver tegra124_cpufreq_platdrv =3D {
 	.driver.name	=3D "cpufreq-tegra124",
 	.probe		=3D tegra124_cpufreq_probe,
-	.remove		=3D tegra124_cpufreq_remove,
 };
=20
 static int __init tegra_cpufreq_init(void)
--=20
2.19.2

