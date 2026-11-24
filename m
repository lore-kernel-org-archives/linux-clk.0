Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492602;
	b=5YuQOEQH7C4sYsjicgWIcF14Mn2ZFfPelSDLnteSNZhzs0J5HiJJzzb+Qw0G9I8J4agU
	 YYVSLupoGz3ZBe8RXlnSzTsZvhejzkHfwbeaDgyLb52SiPps8LxJhcDeKpOBLEbBJxCya
	 uc0uxdW1SAQisHjJP2NHx+Rsyoo+a+YwcDn4rO1sdedEoPscQEJyJj4gquhaPFxiVpw/p
	 P+Sro317Mqn88+81kahgKO2hEKKMzz7o9TIcGbK3Slx0/hLz8wRaIRV7WrUhj6F3fJyRl
	 ojETxYwMONrnBYrobXcFWPHMmjMu0Y7gisnGmnrzTlqZ6y2PBd35te2WVkdbqDPRajA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492602;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fP0Xi9TUrWS6+yMhRMmSiip1gyvi0go3hUvgrFEqMLE=;
	b=xWPBdqBlXFDW5sF/HWrfZOcrjBJS7y++jCfh9NkGVN6tUZjWrSf25biYUpG/sjWsD5af
	 TLBdQ68WtZsfjfWlr5UXAb2L3OmifLo5Y+bwzo9Uli3Tt1BHkkQjBIa09628k6lqpfT10
	 H19L4j8MyGrwkSM6D9CTQLJPR+LQQTmAdaKRtDdHEaHg8v5+FCVZPKhHKYcdD6q37rE4c
	 HXSUqn8SROoiQksWULoh2vTID1riHwfFdZKO/C7TxYRuYNJ3r6C2PSwph4BoBtZlzxsoI
	 k/zCxuA1cwC7yhMUZCCumf8e7orSrCkidn71d0HRUaDuI5Vf0jT3hmdFDAcQf9wuomA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UdFwojZ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33384606A338;
	Tue, 24 Nov 2026 03:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33384606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UdFwojZ4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KroO8DmpaRGdsgImY+wVfa2hZxQ7yfH996QbJ5D+Cbd0qOJLs2LPM6e89uA/zw+3+vH7NfTEHkeDHmBZsYNjK5JXuQC/ATRgQW/vHOtnaRaOz0u0g2T9hwvYVPMrvqVLZYMJwT/SMlGUIpFmOTV8ysV6k3hKDzmGlY3xnQA2oXQXfYrp1m5stM372JmyQGsknq2fQCuwBf/6rrUs9l/xGzwL1dskHCNu8aw1cjgBPwbgo5HDQJ6P1xkWXXCTXc7SkhBCeO/Y+0/FI0LgsAhwsvF36bP8mppIX0sB1k4WDSr3viyAxg6omG4VFIewEkcsgHPqi0XtMjCzKvNsTMMMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP0Xi9TUrWS6+yMhRMmSiip1gyvi0go3hUvgrFEqMLE=;
 b=GrpJeKMLvGW56JrfwWyN0F4YmLPoBNHii5cKBC+baKIvLlbGLWdM//FfBxGn9t8yR//rKLF6b/IiVds+Igb7KyOVFwAfo+TDFA0VSk0fmtPtqTyEy5gVDCEAY5uTQoyN86HkMResuj4vgs+evzBzDtXdt8FS8SfN2MYHGB1bHKkfBPzUR5ImbTcCzaugcEU9TbtbrKVH3D4qTDNJ2q2VQJxZ3bcwgiwRWHWABAg6DjZauXsCLAMOXXKGAT5GA6/P20jaoG7sTsAqGYP3St4kmaaUgIKPmElQGoyNBw87s4PI8d5LGF6Yx/v7KxEjunZHMNmJbTpwOtDuVZe3/uC1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP0Xi9TUrWS6+yMhRMmSiip1gyvi0go3hUvgrFEqMLE=;
 b=UdFwojZ4BIfqchV/t+a7RBdWqU3mcxXrZL/p/lNzcMsJbrllnRy1WsogU539nGN/8REyBZuCBJdKRUbCm5bYgSYzU6HRR94KacQcmz6V/qyBY5cPwjM54tVKvyESf/URCvsDqdphr+jAJlKAfPDBYtphgpp/jg9fLUxvV/OCNSk=
Received: from MN2PR06CA0018.namprd06.prod.outlook.com (2603:10b6:208:23d::23)
 by DM4PR12MB6613.namprd12.prod.outlook.com (2603:10b6:8:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 03:56:38 +0000
Received: from BN7PEPF000000A2.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::4c) by MN2PR06CA0018.outlook.office365.com
 (2603:10b6:208:23d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A2.mail.protection.outlook.com (10.167.248.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:36 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:33 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 5/8] clk: clocking-wizard: Skip s_axi_aclk for static-config
Date: Tue, 24 Nov 2026 09:25:50 +0530
Message-ID: <20261124035613.1968260-6-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A2:EE_|DM4PR12MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d6a559-85e6-4dce-cef0-08df49def0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|22082099003|18002099003|3023799007|11063799006|5023799004|56012099006|261022105027099003|261026140227099003|261102123227099003|261021121427099003|261028144727099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	g0n/L/83sKF70OVcqfRvfLLLl1RJOMtVD8LO/4HtiVAnL8Aba66j91Fvr0BgsngKZ6ng7mW1Y54VCSCSbEqRBOFLWlRkUphrG201vSJWjqPwAI3zM7S8glVgCslqAOcep5hQr3hRqwgN96Qf1XbgIB3EMXJL6oxsm7zvtF7OVCr3r4mZIP11sheIvWzvYlnmUp6ecloyer4ZyDH1t7j+Z3o0IWIgGpIDt2NpIK89gSHQt/0uBQq18P4bEjToNi8jk2rY0SI0yHX+yLNe5We4XMfLm4CH3w+b4Mv54vh1EOSn8uTIohqff6V0ImfkwLChA/Jp4SOLvYchgadeDWA4QQgtWDMKMgZ/gi63x/1eaRu09FmYg3B4+DgSq2vDcrxUGTt4f/rsuKF77tf1HYNM55HUcHzp4wD22lYT032cdBZoAzDUYjM7V6/7L3hVJpzenWuQsBXJbepPbaZ77NDd/uhNQaOtq3tdQgeDDJRHgKfI6hLnxmhwBjbGwgYI6HkJ3kFEU/o2tvfs0kgIL02wRN3bwrm0REmlX9NWPy3kfp6ssvmH7sNZzzbCkDkODfxszCyY/Ml5EbrMZOj0xAe2v0jFehPkqvCFw37FmUmvSADHzWBTrbvHJUoV+0ZKsrawVx9sJ65bzkT3z4B9johDC39xz0xG1p0BwOCqkLr5GZpedc0fL9J1dbhPDLYSrWGXuro5qUoMyzr2hAWXFI+hIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261021121427099003)(261028144727099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	weaydbmyMsbBNlPtR879kgiy0cVLKSf2QLTs/kIoTGRvbUYW9d9bExVKE/xm3lTHU2L0oX8KaZgCI75OOY4EZwdw/FyDB+iaYGQ7LS2iXgYXg0BxEiPwPbIxFwKYsYCjpkOwsOEvyvhA2tB+5GMilrsmnOI0wVJMX/u9lC7+kHwhGE63LVD3u1nQvv4nJyyZ/VoaGTYSny3XJJkqO+VueETnCe/WE+4Ih3xO3pIHsePSlE67cORuUVfBK4FJ/BcUInj1KQlBLIMkr1vu1WZ8mB02WpWJdEH6/y/jqr93o5oUxA8lH62VWdliAT2Gyu771GnLsV3dzqw303/WSbUg+foxcGI9FEmE14VMUXuwExwInWaQHb/k/Fpq+Oz/pUqzjLeJ/tWIXqUCiyMlF8cIS90JJMrvL7C4Nsw0CImPByUy3gafq1zXyP7AOVEHHAWN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:37.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d6a559-85e6-4dce-cef0-08df49def0a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6613

For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 31fed0e1ed30..a3f4c5d6495e 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1379,7 +1379,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
 	const char *clk_name;
-	unsigned long rate;
 	struct clk_hw *hw;
 	int nr_outputs;
 	int ret, i;
@@ -1395,22 +1394,24 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	clk_wzrd->clk_data.num = nr_outputs;
 	platform_set_drvdata(pdev, clk_wzrd);
 
-	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
-	if (IS_ERR(clk_wzrd->axi_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
-				     "s_axi_aclk not found\n");
-	rate = clk_get_rate(clk_wzrd->axi_clk);
-	if (rate > WZRD_ACLK_MAX_FREQ) {
-		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
-		return -EINVAL;
-	}
-
 	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
 	if (IS_ERR(clk_wzrd->clk_in1))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
 				     "failed to get clk_in1\n");
 
 	if (!of_property_present(np, "xlnx,static-config")) {
+		unsigned long rate;
+
+		clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
+		if (IS_ERR(clk_wzrd->axi_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
+					     "s_axi_aclk not found\n");
+		rate = clk_get_rate(clk_wzrd->axi_clk);
+		if (rate > WZRD_ACLK_MAX_FREQ) {
+			dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
+			return -EINVAL;
+		}
+
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
 			return PTR_ERR(clk_wzrd->base);
-- 
2.34.1

