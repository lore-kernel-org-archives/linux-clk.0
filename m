Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FECC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6DDE2080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="nOFrlPkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DDE2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbeLMJfX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:23 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1376 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbeLMJfP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:15 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227cf0000>; Thu, 13 Dec 2018 01:35:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:15 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 01:35:15 -0800
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:14 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:14 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227d10003>; Thu, 13 Dec 2018 01:35:14 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 11/21] clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
Date:   Thu, 13 Dec 2018 17:34:28 +0800
Message-ID: <20181213093438.29621-12-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693711; bh=O8qY48plryfAsXAJe1QgKJ87zKBQsOdRcsJ7i69qLJ8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=nOFrlPkQ3n/zuq3zKNYJ4fojfXEwfW1arB9+e4520JgMl/UM0tgcMJI9XuxOOS+Vs
         Phnf/0BCFyzAERuDT0zdTce8nN9Rq3BY1db3gjFfrSZXR1p7ARl4bN47gGSfkndVHN
         t27NUzSvrLkITm1dPeM2BMK6wcbxsOrAzxc9DUnX4kS2ZVYM6ffPeNvcQRwM+dE+6y
         pF9xPXIHW0oMOPVQMRY5eU3C/4rCB3N1VeA11IxQ8fFzUB3bKRRSam+NpjFjUTKZFy
         HMIcRKfGVWAqJUirt01BBgXQbTja+JBODWmujf3GStBIjQJMJ2HqA8UEB5Wh+R2bZb
         PZ4c2lCmxvVrw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Tegra210 has a DFLL as well and can share the majority of the code with
the Tegra124 implementation. So build the same code for both platforms.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V2:
 - add ack tag
---
 drivers/clk/tegra/Kconfig  | 5 +++++
 drivers/clk/tegra/Makefile | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
index 7ddacae5d0b1..57902ab43f4a 100644
--- a/drivers/clk/tegra/Kconfig
+++ b/drivers/clk/tegra/Kconfig
@@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
 config CLK_TEGRA_BPMP
 	def_bool y
 	depends on TEGRA_BPMP
+
+config TEGRA_CLK_DFLL
+	depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)
+	select PM_OPP
+	def_bool y
diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 6507acc843c7..4812e45c2214 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         +=3D clk-tegra20.=
o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         +=3D clk-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124.o
-obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124-dfll-fcpu.o
+obj-$(CONFIG_TEGRA_CLK_DFLL)		+=3D clk-tegra124-dfll-fcpu.o
 obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+=3D clk-tegra124.o
 obj-y					+=3D cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210.o
--=20
2.19.2

