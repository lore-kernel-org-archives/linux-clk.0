Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793475761;
	b=b6c3l8pruarv3ZtvRj2ipbIkMiGXf66NDHHn9z4OZe0DNE9f98aioiVpYEZctiackaCs
	 rW+PA3H2axM+COn1ZodM8MCyeDu2I+kpBDL2qYnostIbM+vQjpZi3hB5mXYRkS9+hWXSO
	 NPASyLI++OLW/eUUKWEpV0p829G5PYGZY0zQz3IxHtyYFzZ/3RVs027u22qw75IWrifXH
	 Tr7sivlKcC4vMGgO7cngwcYdFqHji9e1eONUsikiLQCEurYW1NAr06B+SjXeKy5I1TiQE
	 VaRvi4I/ULXg7tEJ+PvlZ5Oq7hEzUI6JxzF5rtySxtdDmsoMLO0PEnMNn4CkKdIFb0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475761;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TW7kqcPB3BfILXZhKawq6rorbJ4adlT4OO/lYuxi8RY=;
	b=BjG8geMVA2RWbRyZHaO66wghHph7nHIx04ZDtSU7thXD9+2l8tDu86R1wnhW7IMKmOjB
	 rPOTKRFikyIzobFJl7704/YAZ1XrYTMfKetsTwlnqLJv5Vpl9Yb6F8JNu7FLLV820Keld
	 Wyyfbqe3A+QuTefidOgTqdWFKihLAXoQvTRFOXE9bZXX14iPiMq84NX9NxE2c2CXi+MCf
	 e7EQH4zGrjXasfKbIVEbaN9FLr2QpgU4W91d28HNZzYnJ5QX1E0X54JHS6gnlc42/S+/w
	 KkU4N/GcfFk4U3JoV+0tsWpishhKnZzGO6cls5AJvPudGZL7aEhxQawG462u/tGW5vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=O+HssT3f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.10
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B177606A31A;
	Sat, 31 Oct 2026 19:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B177606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=O+HssT3f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqczbHHjCqBgh4glWWB2L5am37kg4uBzzteWRvLFYxVNtX+pyNFxNpRGQ+RfTNo/I3bHr5OnkPP4bBg0xm3w74dUjocJ/3wYbDXiUI/43XcxcVpyjC7BnBy6nsDCRujqP6z5liWGEZrNPpKqMvV7iXCkmB63icMyLF4ROfQOupSI14BkY+U6g/cgmDZQhgc9vaAQvMTYAN487a65UK1PdaK0ExtB+U3ye1i5QpcEYPJCQhm/btDatO64fM1NEZNLEVMofeteQine+CMsDT5M3mLnYjkqwY5rg6k1OUStrSg6Go3qzpcSZbhtxFH5aRt0M9ugB3pemg/La1YVywR8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW7kqcPB3BfILXZhKawq6rorbJ4adlT4OO/lYuxi8RY=;
 b=P7w9Hx5lUfH6A9j0cMtHfEvUTS1dTkymkPW7/BFGxQ8eQCxZXMACyuROAvrTMm5BVRvUEHQlzWB8uUU2r1AF3gytjkiyLh12Sh3Ik+vXO+38bo4P+Ij+4+z2qOFvW7pAZ9x589M1EmliTrQVHBvA8owyx/j052fEfXx2sEbZ4ZBk5G/M3Vx0yH/Tt+ZrXz5KOXOuxlqGC7Gjjz/0bq5KKcGWUZUGpEu47mEmw0FV0BlxKUz/VkK7NlffY7ugnEXFQTicCxcPwSj2m9h5fnjfSfBxLD4tPLG7q4/Lch39Df26o0ECyT1b1uTXOxxDuFBv4SoMtDrKg2MkutSXkZHm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW7kqcPB3BfILXZhKawq6rorbJ4adlT4OO/lYuxi8RY=;
 b=O+HssT3fV3stKiW2MuAorJ208d2ryUv6bZhplDUw08YVTLKFsI+5YUGDi6Yj4TAX7UFT35qf5Lkd+UZ4kOOo4mQ5brAUYzwue57rM8xp+kMxvCizx/KR5Nun9Bc9Uk4Dg1rVe5Mqp+CThGQ/xCkGlu7wRhfeE/zc/Qq5eaJz/Us=
Received: from OS7PR01CA0265.jpnprd01.prod.outlook.com (2603:1096:604:255::15)
 by OS9PR01MB12421.jpnprd01.prod.outlook.com (2603:1096:604:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sat, 31 Oct
 2026 19:42:37 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:255:cafe::6a) by OS7PR01CA0265.outlook.office365.com
 (2603:1096:604:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sat,
 31 Oct 2026 19:42:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Sat, 31 Oct 2026 19:42:36 +0000
Received: from biju-VirtualBox.adwin.renesas.com (GRC-5CG2381LP2.adwin.renesas.com [10.226.92.8])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id A7DF83000249;
	Sun,  1 Nov 2026 04:42:33 +0900 (JST)
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
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: renesas: rzg2l: Use str_enable_disable() helper
Date: Sat, 31 Oct 2026 19:42:21 +0000
Message-ID: <20261031194225.118516-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|OS9PR01MB12421:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f965290-f586-47e4-88cd-08df37871dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|13003099007|56012099006|11063799006|261021123027099003|261021121427099003|261028144727099003|261022075727099003|261022105027099003|261009221227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	+iuyOCXI8UJDEtsknpFBYUJRTfHLMPulcin9TSmBU/pqMxt818s/QT5oHUHCheZ+AdwHN9YR0swywr1TQP07ukaERUfhymbCa1u+UYLyqrH3/aBz2MjLCUPAFBrX16h+fJi7UVskNfJuTYVHM1FIK5xj2wVIdQEmBTV8xhpFKaJdViNe24LfebJOlUY7Kn/3j6uK5vMt3LQ6P2A89mwftUQw6G8RJ/5CSTuPAY4fcP4XKLBBlDur7FRF28R/16E1F62I6HC5/VoNxxYv7YnI1UxbvP8JLACFq5yc5ntqiiTVhVJrHurpyYPNerdoIXoeNLvVO8tn2w+zP+Ks53Z2PVDVQ7bw6+kc015mWCMVoU03ngsGinWH28qs7e+shB50pgstsepY7LVnmbDUWdRCggjJbTk9DbNbYP+toRGeAF608dIGUNGbRsmPGWgPF93s3Af/mc2JMJnh+0c+YEyCaLmJ5At3PK3ILb91/ZT6SXrB/a0SDICLgdyn+KF03NiYOH3ljRO11ic/LeqmFCClpWenrExIrE3n+J3UuAVkkU8a0NwpVLnwjyxg9pldJMMBGIpnYh+/5tZbBLotoU0sK43EKb0GzarnTCXFZrwZ2MA/TVWp8DilF/+fKi2WWdDZrNzIMue9Gg5Edxo2cTOJqHQEzq+/X0YozNfDU+Sazfw=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(13003099007)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261028144727099003)(261022075727099003)(261022105027099003)(261009221227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rBSqcqN7o4lpYRL+XdgNRzGIcKi32dLcJcdI68hE4KsOWBec2ZbHEO2eKOnmTWth5rM30h+n5V5of+hkwpJeWapGS1hDuD04WA0q9XONJFFRbAlsjnzODMlgCGM+obDkEIOCrtXU4fRf4sMELQqTFZAuYx4CeO0XiK68RJ3GiO2Qa+xco+3lYQL/nHOIHfiyiXfiXgFWvTF2Eq8Vrk4QEknnkGH3plHfwJerdrmDgMGh8HcuTsGVbCiOJUsbPRAnc6IJyCcJRhI5KN7n8m1v0DAw2MQBziLXNaSdXZjxML87NW9gGYbQuRm6U97A5Mbg0laWpa3NybACwSV0KV0j5eZtnu9YeIkP3bWK57nVeCO55Fh5zWlbTsAQsUFPIbAtkFs332E8Y/9iICEhbwbx8qFilouHEHX7+CHK0nuMn0R5OEM8avLwtS67nnPjz1Qk
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 19:42:36.9520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f965290-f586-47e4-88cd-08df37871dcf
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Replace the open-coded "enable" : "disable" ternary in
rzg3l_cpg_pll_clk_endisable() with the str_enable_disable() helper from
<linux/string_choices.h>. This keeps the strings consistent across the
kernel and avoids duplicating the literals.

No functional change intended.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202610301526.XkacnSyK-lkp@intel.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f6293c968bcf..ef94f03afffa 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1452,8 +1452,8 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
 	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val,
 					mon_val == (val & mon_mask), 10, 100);
 	if (ret)
-		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
-			"enable" : "disable", stby_offset, hw->clk);
+		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n",
+			str_enable_disable(enable), stby_offset, hw->clk);
 
 	return ret;
 }
-- 
2.43.0

