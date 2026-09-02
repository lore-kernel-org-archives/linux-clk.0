Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2981469830;
	Wed,  2 Sep 2026 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346221; cv=fail; b=mYLfN2eEDmu7M9K08CCE/EUgsfWzf5uL6Ynd7MgxIp3t5C8dqvrH8jPM9sZGuu4vyTTA3/xXp/q35zn+m6XrVPVRmJSKZfRRn1upYghqjpodKcGY4qSQpYGtP63Lu4hmq9acgztbgJehXiLxP9l/zIzRwK2kKvt0qtCs2zTWWrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346221; c=relaxed/simple;
	bh=BjmnOelQKI2Zq9SAUTee5mNYPBfsh5x97nM8LiqyWAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nzqSgZTtdc3RDm4v+tCNRZNA/atxM08kNf3P6z7Wcecal6TX+z3TeMK4Gzi4Zh1rTlQRU+HJi+jdQa2Eh6NumCH+xsB6/4BMhcXkwZSQtBSB1+Vek9TWustoH1ZmhIphQe9keNpUA3SiOkhYHjipemoXvhGbb2bNA746/ALU0Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nA+4zVUN; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nA+4zVUN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYe6Hb3VD0STEGM2hXK/kYxny4Lau5LYDUUvx0qRHNgoGouzta+1W7TD3oQcjEhrR7G4RELbQknqo5X8dLolMVm69jT2Xp80dG87ZjYs7vWUnNAU/5f2hDhLg4q/mWP7Gw2voYjXyks8e9SwpvsE5MwxqcSb5ENGOi3Se9+M4pvDPRyjL0tkbspzLcgkP1xdXFjIMoJ87bZk5dqCFdAfljVbG/e4T5/OuYaXlZDQSVkJNBMEunsr+QyZU2B5WYG+pJbwhEl8ab6/fyFNEE8eIkoiilrHxBM0rG8kWXmZ2aGu6bozIU1e0osPYmIaowzHi9SXJKrBw9E6g+aDYhv9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9p7cyw6CbDmHehQ5LfONpDUsrTcA7D6UYbfR0usBuI=;
 b=HezXRTIgHtvg99t2Hqot0GDZ1mHgeBiHs9NHfjW4T7OalIIAa/Wj2S1WMCamEcjN6Xp76BZWDTK/mIUt9fo/lgyHly2Y4QrSPKFMB/BVvZwkjvFvZm02wApldjLEBfz8KOucjI1zHk6RdTrqQN1SaT8Ou+ihpX7k1b4CLHaZD4Kle0DtxWRgDqwb481dBi2HD628pQy1cdyGwDcUc1PYmI37VaEovcLeTbyAlohZOUGX7SAauBR7J1eGrnUcfG7RoiJzOp8cdQR1dc7x88ncPiVa7V7+ZeUmp9L9gch/71Ld9h96BnV75GVPhuxDCmYy/Bb1xOefFbgWxMD8Czl27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9p7cyw6CbDmHehQ5LfONpDUsrTcA7D6UYbfR0usBuI=;
 b=nA+4zVUNaPZHqvYEy8m0rcXzRjy/KQ5TceCp0SYSAKKp2rx3Or6XqYlMFfECazERu2bKmdM1C4TtuxT83YtnR0UOD+Ku2CMnLogIedQhidOwPfjJ4eWBPhUsjYjl0AJYdwYIjLpZufKJVpAg0/qk/TBwAV4qXOVXZzWuAd6O01g=
Received: from TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:36a::16)
 by TYCPR01MB10167.jpnprd01.prod.outlook.com (2603:1096:400:1ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:50:10 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36a:cafe::78) by TY4P301CA0064.outlook.office365.com
 (2603:1096:405:36a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:50:10 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.24])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id C9871300024A;
	Wed,  2 Sep 2026 19:50:07 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 0/2] clk: renesas: rzv2h: Convert to clk_hw provider API
Date: Wed,  2 Sep 2026 10:49:37 +0000
Message-ID: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|TYCPR01MB10167:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d426a4e-2171-4398-22c7-08df08dff5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Osk5GSgAjT0I4Uk5sllHmn5ax74QrGKRW3jeX35zkDpUvKiKgolm4STN0sjmwDGWJeUqxdRbJ2vM66ALt0UzA1pSsT435pZjdJMQiB9ntR00J5YjoAYlnkj2kmdxi3k685Khabkpn3m6LjaSyGUfO3laX0NDIMRw8eN3//AQf8zimPXnrGujZz/8r8OMAQFnH3faDcS7TBVDc8d1QPbMvzLTcU8mYvuZ0mQ5wdHdBIkpv6ctVDrHkXIZMGhjUP2gvuzHpbgDpopXqwUU/kjCWX1WlhQwyrHG4NkK2jNfYIpbfiPSKRKVA/mB1dAEtmjwqWcZj4p5qM0dhcfMMuJD2dgAXlAqQZKTjbgFHkZTY0ekPvzekON6yBVbpwGJ23oV4WgkSpSouUnMvIUv6XRNyy/nnWQBfyR5Gz8K0ZkS5r66JrdUUJPPV3C7giyDMuhGByGqpltN8TFrSyEUy6wRiCj116/AQo5a9+KWwWsqCOfuNd+sxov/Wn2AFGvbpfkFJXWGB53YvNxYqbmkMvsIeBfMlBf9xVVgMXavhqOAhBOsUvCpy6POZErrvcM5IwIwJzqBOc18ydQoC8APe59K20iIPWQXHfzswE6XXxVA45mszBRMlp45qNDnQ2UkLOEZi+m8clGtECaeMRDQFCnl4YpOODVDJYfu7SHsanXP9slBetMFQRnT5mLEo85WctGFtguYRPdozWjOzdQM8e0+ig==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T5DHrgAkrQ4rNrPNxZYM4hyk0LI6Kx0r4Uu+hcZnPhSkJmjuoenaAFOrYiOWtyZlggMyE4DXB6816hbHoWvzD40L8qf/iYea3uFxQ8ov/zRd56QrVJo2Oq3fZo5C15LTbLGaENNeRglkjm00uv1X33ipU7IB06V7hKke6EgvMGynEA/ct64uAeB/8JKCCmHYo3kS40OvyXIGkeGrQPdct9Y8EKa2+QeLikufX3h++poB9ZfccPSoYVlkZuMFa/cVWZFERMtsnPKA1NHqUeHx8n8vmD18DJwkBruTIz0PvS45Vtk6S/RmujIEps0kLB5Sr3e5zamxiUBYCDXthV3MDRg8sf3GW8QuTT/2ut1lh67evPd5WQT1AqpgwdEXXy9jjP84XlpgU4RsRijYm7+Ung8wbAWTY0p5kUayq/Jstm6mJ0eP+LxUrQ9S4Pz6gJaK
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:50:10.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d426a4e-2171-4398-22c7-08df08dff5cb
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10167

Hi,

The rzv2h-cpg driver stores its clocks as struct clk and uses the consumer
clk API internally, even though it is a clock provider.

This series converts it to use clk_hw, like rzg2l-cpg.c already does.

No functional change intended.

Thanks,
Ovidiu

John Madieu (2):
  clk: renesas: rzv2h: Drop duplicated parent lookup in
    fixed_mod_status_clk_register()
  clk: renesas: rzv2h: Convert to clk_hw based provider API

 drivers/clk/renesas/rzv2h-cpg.c | 154 ++++++++++++++------------------
 1 file changed, 68 insertions(+), 86 deletions(-)

-- 
2.34.1

