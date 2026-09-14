Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2689489FA4;
	Mon, 14 Sep 2026 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404661; cv=fail; b=kYXqXNb7xx/PLNOhgHY27WD6Gsmbo3AujTX28E7UU0QMakVyckgAWmHIkFDhnfQBXU7CBQF5PbnBOhFj8bSuzVZ0LfeIGO56T8xwzAQ35Kz+ixd71VhtNwP3Cqk6BZFxLWYNjYaBEWClc3w8zIE/25ZmwFt07yu24ygjV9DVoFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404661; c=relaxed/simple;
	bh=P61S9vUuHhOKWR2bYmXUTxZ1I1DLiz7UR8WzU83SOgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WFP9QsDiPXg6gqgFFbbF/c6sSceLVXV1AAu70vL3sVDa5DnKHRJZJO/EhTHDPfRi3klAc0Ll2zeSlxFQ6IInYudwDG+n8NJtka+nPSFN0R3FZ4Qz2ECa4jazLZX89bym+n179rBkD2e0MKHUBaanKeuVjavr7U8p6XnCUySAF4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tiNEo1b9; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tiNEo1b9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYhgLbcgB2Su3MEqgNnvefptXVFFiW3Qog4viZcz2DvmCL4pLE/k79o6uFlS+AoylOHxRFLtUf3v7/+3B2atN838AvlDRF6Ae1EzC0saSKLkb83f6ceJtywDk2eeyl3kjWnK5q7lta4inJ985KQ2apKq6uoEkHEwcvQRdV5HGzhuKscIlffFITmbpfqg4doc5tLLhD1z20N7j5B2M1vdzSvlqnxC2PL2bRDZ5gfH/cYcvaMijoAv/tXwDANoYIzxlpbTbu+eTj2ZTGcUUdJQENMX+f0icN6o0/ew8OEBD6gJl2PpBglaCSnGFROVZ2R7FmiRjczywdHvXPQwmPRjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK8GAPqwZjRT++axqW2CzjiqF4d/241mpNrnGAbLwOU=;
 b=VevrnIVSoYdXYV2JLCK2cA+daAntpRcDbj5MzN7YxVBAku8RYi7cCJSV+FmIx+ipHafvnO1FPJ8Rik/uk472zqk9x5K1p66ksK2lcZ31mTe/g85Nxx3sDh2q/s0sZaDhlN7oF6CaGwyHKVfi0lCx/ENC6tVpSz30ZRLl1XijTGNRJcXVWWzLcr71rt99N24GvsoX7vg5XUkrWTZ4BtuCwmThf5Knr33pv/0sffyS7of/8V80z+yqloJC10ILa7yYGWduGZV6kLFp5tyhLgfEyhSVkPui5QDcYy4lLiJ0RR4wJea+hhjo8PmzAXDxQM9Ova7pxJFUYt+CHsTjRV13eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK8GAPqwZjRT++axqW2CzjiqF4d/241mpNrnGAbLwOU=;
 b=tiNEo1b9nLGFB7XwPv7Q61izC4woqfBHi/+UEa9mudZXlHRKdqztOarVCc+dBPr7LsNnn+AGYPh14s7Q8yf+cnSsckd9b3NGImpdN7jSlqL8CbBKBpzeFhscxBHLbuU+A9XlblfmfMj1X0sBwFhQwpK+GeT8leh66pVi+fC5QQU=
Received: from TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::19)
 by OS3PR01MB10407.jpnprd01.prod.outlook.com (2603:1096:604:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:50:55 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a:cafe::49) by TYCP286CA0074.outlook.office365.com
 (2603:1096:400:31a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 16:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 16:50:55 +0000
Received: from biju-VirtualBox.adwin.renesas.com (DEU-5CG34966J8.adwin.renesas.com [10.226.92.7])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 9D740300025E;
	Tue, 15 Sep 2026 01:50:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX mux clocks
Date: Mon, 14 Sep 2026 17:50:23 +0100
Message-ID: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|OS3PR01MB10407:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5c3f6b5-2f13-48dd-b75e-08df1280581b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mDMDIYV91WDgF4omGubYjqHwRRv+FMTpI1/NZ4qjYd3pZ4YBZmCvlWURVjOUp+HSpeoWJzSCS+QigdJri2XeoCl50rcHKemmzRe8uPUQXLFpcxu1nyY4dDlzv88ys2jEa5IcmHouKpfK2AGp6pZMXrN5Ry/D8UUQEuwUvy31/8IQ3UH2OQjKqAE2UChpmboAcSm73LobW5yvGT6YlMghHeR2WmTjisaA/y3mW3ax3CdsKuybzUaineEZ84MCUEUKBc2rt4whEfKoINcXgFjRDZm/TCDAN0pbyHuPaBZnzFitfVCuktbFnpMe5RFoSbt+tmN02P+MycSe9xGVXo6BXUEpIxha0odOhHTyJnQw46I11NlsY0Eof9KRkBZN4q7wBltv12zk//nN2UnOz7kcSMLN8mRIYjpsDu6HSLW2xzpbOV1M+qHYShBpYY3Bl1t92ELjpsVK22yU27ljFpkqLaZDCEbqQmb7EKEQMtTGkp4wL3cV99Nt3gvSRA4Ta9JHpvirtfou5lVq2p+U83EUole0A6RoTVjyaCtGlguGzOh6VK7fbj+AUyJxKGhh37G8z8FYeFzAE/GpU1Tl2SYvYGtO2nFptJGhZf1UHCy9knMF4dTZrCzciU6GH4zl3fPikf3Ow5ahbn14hq9YKx+Iy8tFgu5gwrC1pM8DgrcP3JJlbGEtMI0bo+urzliGJ02foLhsQrUB2nP1qr9smJ4KDg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i7l2QEtCCv9JkysJi4W1PAXrc1K/3KcC6aUCW2uhhGOb3QWPV2ZM8nOLDLu4ekeqXIC4HHQM/lfr7G1yxcmk3AVb0sIfecSjcjPP/+CdLaR6elR7cuNgLZh5cTS7sDph88ONkAZjLQw8VqSGNkmH2v0tGrkeOs8ixK7FdT/7/Y8B6xZf2pTg7cMGeLfUlilks2lWHzjmI478Xlo+vFuzFD4xV/mlAsKoAG+2o4nKfpXjmDUgfV5lB9v1rbojr5ytqMm3EntpP7fXU8xKxSuD2mIGrjwK0JmeM9ZAKp3wCDdwMKBZ7Ip0oR/+cPrwOZ85LmYSxEFzP/QNys/SajxhwIfMERNRXH9c8oaeKqeJHf79a3MIV7qJaDg9dXACwxip/Xg8Nz6EKp3Kb91sPAc0NufamBqQf89z9or1Y0vr8a2G2wJSxCR+d6o/PgvCX4qC
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:50:55.2723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c3f6b5-2f13-48dd-b75e-08df1280581b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10407

Add CLK_SET_RATE_PARENT flag to the sel_eth0_tx and sel_eth1_tx mux
clocks so that rate-setting requests on these clocks propagate up to
their parent clocks. Without this flag, a clk_set_rate() call on the
downstream GBETH clocks has no effect on the actual PLL/divider
chain feeding the TX clock, leaving the requested rate unapplied.

Fixes: d55a0dfec40b ("clk: renesas: r9a08g046: Add GBETH clocks and resets")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 2c5ca5ab5f57..92c76c4a1e89 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -307,10 +307,12 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rsci_rspi),
 	DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rsci_rspi),
 	DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rsci_rspi),
-	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
+	DEF_MUX_FLAGS(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx,
+		      CLK_SET_RATE_PARENT),
 	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
 	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
-	DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
+	DEF_MUX_FLAGS(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx,
+		      CLK_SET_RATE_PARENT),
 	DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
 	DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
 	DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
-- 
2.43.0

