Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1BD3B47EC;
	Wed,  8 Apr 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643521; cv=none; b=U95t0xqKbVXRiDSLoYdnDKiBUBzXZPDAgLkDVQtoUr7lPOGJFcsAENf17Dwfdn/JmTrsASQcDxvUfoRYrvtKCObhR7gJS0Z9URq+I7E/vjktBfBVcVvOBB7T/RfoHoZK09qeOxKHSW2x0xsyDrt4M1CkLjdTOTNVNgH0c7bF/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643521; c=relaxed/simple;
	bh=Ef2d3CHO22DWPTJ1g2NQXVsi0Lfei0G2rG067GKa8gM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PCfZiG3LHgube41iOyerKvfbwVya71+EelvZaAuTAaCcuo5//YyTNv6DBdRXSLzA26j+b0sliCaGYQYWUbliAmdYsspaXD/59yvOjvst4vIDKVtw9Vto6SA2UM0Y3THM+w7amXyhccvW221lLFKi3/mCSDrMH61Y39qa0ctk/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 12:13:26 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Wed, 8 Apr 2026 12:13:26 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAPuY-008joX-22;
	Wed, 08 Apr 2026 12:13:26 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <shawnguo@kernel.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>, Paul Geurts
	<paul.geurts@prodrive-technologies.com>
Subject: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Date: Wed, 8 Apr 2026 12:13:13 +0200
Message-ID: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The i.MX8MM clock driver is implemented as module_platform_driver();,
which makes it initialize in device_initcall(). This means that all
drivers referencing the clock driver nodes in the device tree are
deferred by fw_devlink, which are most of the i.MX8M platform drivers.

Explicitly initialize the clock driver in arch_initcall(), to make sure
the clock driver is ready when the rest of the drivers are probed.

Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/clk/imx/clk-imx8mm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 319af4deec01..7b2cf867b920 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -636,7 +636,19 @@ static struct platform_driver imx8mm_clk_driver = {
 		.of_match_table = imx8mm_clk_of_match,
 	},
 };
-module_platform_driver(imx8mm_clk_driver);
+
+static int __init imx8mm_clk_init(void)
+{
+	return platform_driver_register(&imx8mm_clk_driver);
+}
+arch_initcall(imx8mm_clk_init);
+
+static void __exit imx8mm_clk_exit(void)
+{
+	platform_driver_unregister(&imx8mm_clk_driver);
+}
+module_exit(imx8mm_clk_exit);
+
 module_param(mcore_booted, bool, S_IRUGO);
 MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
 
-- 
2.39.2

