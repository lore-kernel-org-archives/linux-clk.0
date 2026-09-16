Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63D36A374;
	Wed, 16 Sep 2026 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523661; cv=fail; b=O74/Hcxk0H0SGEuG9RDrVf1HuAxqYFUWfhfXOutOXdyND2V8uBVG/wjUbxZxTRzZcw0HI29Z1+XR59+dwsnH/quKYeFiZYUlelzoljEfV8AVzvDovUAcHc6BRZTZPOVdM2oQWOafmpx1kmWAPy6krCQDxTHiQN4PwmdPTEiS070=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523661; c=relaxed/simple;
	bh=IvahCdOJodMSa5DDezGAmGbkmuf/64bYEwqE21bX5eA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jMJT88N4rqox4AbQ22JX8UUHNpespaWizc18tFDUEHlGstha+y8OsYcBKx/U6OcRU3fev5nxCJGv3OlGvzYqvEHNXpZZ7JpHYWwWcMrvQOTtsFTwYANfv/0Vp4noT1+4FSVM5U16iRpMF21EPv2edXCyPkSy2D9CjsmN9Iff11o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JWBgo5UF; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JWBgo5UF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHVagmB6pN+ObdqtifNfnPSEOtM9gYtbO8GrCDBNRN93x3Nup23b1fK5f3U+qf8OIE0jkgZD32C7XXmHyzox+k1A8BVFgmpIHLSf0PM1ej7bX17YaZPq/075XjuZ5t0T+UGKyMndORVwtK2zvvG7Iixua+J2mHWTxhbz5r7aI+3t05Jxxxu+PhH3CNiYGoaT97dfeB2TPbOPPMdRC1ViZeYHaO3TpoIryHnmnf7sG+Rt3DAYZpn7IQn8QeWiyF7wAkdwcvumlDcZoJvyCZtSKD1iHqiQSM7lfzbZoYAlQbZ/qNoa1zfxFVl2jj74XCdcyVKdAJnYB9zYdA2P5LvQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5QSApQJNP+3PpppDh022i2EA4uO3czxAcXncSjZ3kg=;
 b=Vmy2+xgVjar1z1GqvNK3BDHbVZoPYC72eSbJW9HbX4XYd0UB3vKnH2Iipgocsw1epqwoJ93aS8jXyFqAWUTXtd7OAlJ1HSvTuWxNgnelOooTc2HgllNHPvdnYU9ZAYOIykPiStkOcwUlJUMfxf5b1IvRODcpxHG7phQsKOQMTp9A9kaQwfl4I6IOMaQAMG+wY4tAep0YToK9N4m+6v/VVWNmRXgw0e2LA0am71avzqNymnwN4knerZ4sQriy/M5CoeMk/9z60GSftL2iPNtiH7ISGigaBQArbfCZers7IbZifqol/MGMQDCI8alWfT9b4FlnS5Bb7LUiETfUEvh04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5QSApQJNP+3PpppDh022i2EA4uO3czxAcXncSjZ3kg=;
 b=JWBgo5UF8DEmDFbSfqevdtIGut4xHIBaoZCK62TRLVPV20FKEeZm3OqU/BAVdI8zLoP//qoH80Zp+0A4A/iO7uuUuTjlrrWmyhAjWzgJkZJsV2u9f0McymrorNecaNRWcdgmh1shVDVlcG/30Gf7Rb3bliWawzIokCIwRTlat1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS7PR01MB13701.jpnprd01.prod.outlook.com
 (2603:1096:604:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:53:58 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 01:53:57 +0000
Message-ID: <878q52vu4q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] clk: renesas: r8a779g0: Add ZG clocks
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Brian Masney <bmasney+clk@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
In-Reply-To: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Sep 2026 01:53:57 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS7PR01MB13701:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e35482-23f9-4c6e-6380-08df13955efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|38350700014|11063799006|56012099006|5023799004|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QCw+Owcjfr0npy1dUJcADf33621y4TrJWbWEpSmagUHaB3SCH0eXGjwQiaqZe0vsa7+c3h1YiQaXKmzPYXlL6ZUTgcv43xX9iapMTyD5O9hbSs6AbrZwsRcLwaaK3IgUinbjYQ3SiiAYf4Ot/43FzCVSHYMVoaskTAPkqT6ZzkZYMWx+Tg8rHNnMKiu4y3OEDWPN73ryXFbtAhNs4+m831OBcq+U1HjQhWtF+z0OM6VSM0EtpE1JJeSc9B9Vu/fMf93TjS/P5wLdZiLs1QDjFXOdTRI3J9aaxEM4Gb5MyISqi41WK8a0Cag3iVGPhbMRliyHixv/lc0xTKJrgkrG5EtVQDYHnA+IxXsDEAhtSxGEmso6+2a2EsXGatCp7KwcK0y4z5DLWchLXF5fidOcX6GNH5oh8iDUnnGsLtzrEmEosh9Npo6F5QlnFCTsH8WTGwvWcB5EH/LOZDQ/U6vwNEQL7OB2oBIXdnKNZy3euqWDzuqqCyX+UFzF7dpEKrfY38a57ZUdOeaZZY0HJjZjZq7sd2i2vxC3Yh/BgzozF/aXZICMAl2urhqvOyF7l6UylawW4ttjdEDljErLcjeiUlTIRKNiwffq24OUkWlfS+LzK70nmHKEN0R8nriIYOB7SzO3r2/a9Kv5D9lbp0lkxzrW24kNJa0m1nu9Q4whle6mkHaLluV2cUy8y9u+Mb2xOE5qpz13HC0k8ihUjRYTy+6QmdHmdrrtN1n07dB3IWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(38350700014)(11063799006)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+37Mh8aVttY4EKE/+RNtEuFixRX/K14i/XpHW2/okdC1uAUEOUSHvvCqH2iT?=
 =?us-ascii?Q?40V8DzJW9sv0jYS5FQthWXOYztB6YQU/0g7CxT7OCkUyxlWdNw4xA5HMgr49?=
 =?us-ascii?Q?Sa+OJLEYUvihUa+kyDXXYLKQSD71q/KGZZVResHDW/34NfSJXKrmILqQ8R2+?=
 =?us-ascii?Q?oJ+CNnf2f5qSWtG39NYQW2c8f6Y8CHkdSuIGdxxr2/Yz9g8YzUtQ8K1Xb/f+?=
 =?us-ascii?Q?gE/n0xubyKWNqIZ/oSKo9Hp4tGs1H/EJbRQJMFxqktAB0Ed7ObpXTpqqPQeY?=
 =?us-ascii?Q?VT9ovJ3HilOgT4sVnxQMpBVTpO5vterFFC7jhf2q9fOv7X6xsrcE4EP0hJfn?=
 =?us-ascii?Q?uuweLOtstam/Aii374ZBACML0tm/jFfmh79ZHi7m+zeBORfd7h4cCrsh7FLE?=
 =?us-ascii?Q?P/MVZp9iBpFpYtOHvYex91y3kYpENLc8LWr0JQMpA77sZp5K4+1l+9Nos6qo?=
 =?us-ascii?Q?BJlXeVLmyfA9k6K1LOEQrGBWlPBzQm1fgkxDARlc+Qe4lZlnSYwSsE1K9tkf?=
 =?us-ascii?Q?dEtIqgZxuD1d1tNreIURMpNvRlLzbC8QzzV+U+hlaFpPec3zekNoyCbnzS9g?=
 =?us-ascii?Q?TH/a11Qvlgqk4lc3UdfJp7fF4sqdtPXGAy7Qi72n317KGI6Z4qskdEj/Z5cV?=
 =?us-ascii?Q?gnvWwOFLKeIAyMuVns5MjcmNiFI0OO69zQ3vZR0hF3Vs+iORdB1xOffvH+xS?=
 =?us-ascii?Q?t5t+71W4Vx9+AqwhYRnBYZcojU8YCyVSn5EiyaNGAXh+Uo4Fj3wgcgn1k/Hc?=
 =?us-ascii?Q?/CKQR0jKZ6JiIVXn2YS/oS3YNiEF5TTHxNKmstma0jI1xSZC23kSsZAQ6Rq8?=
 =?us-ascii?Q?eNy/AXJAUXR6wU/h9gK/3vFEiFOLQPs49V47M9twSlbeaitfE0MjgamGernW?=
 =?us-ascii?Q?jlHU2vNyuh2pAueS4kBUlkQyhPozwhJQWh/FYjZ+iAcEdRjOPBZSmNCfKbd2?=
 =?us-ascii?Q?we+OkfWOBGhB38ZbdxV/sgfmrpfitfFQjWcipTb7l3ZzIN0/KiS3TUUAdLn+?=
 =?us-ascii?Q?tbDx65YJhe4v633uHBAPWGN2aXFZ6Ztj58cobfwzVafigbsSfKi4MqGkF4EG?=
 =?us-ascii?Q?dZWwmgK0efC+BROdkrwvrLahki8ldsmx1mpQtkLauMKQkyM6bn/I/zZ6SVjY?=
 =?us-ascii?Q?OT7z1CjSq9mj32iqaxzSCLOLl03i6MLh4AVCJ7IbmWUpF8FigdiHQrEQW80y?=
 =?us-ascii?Q?ck6CRLBNzTMVM1qoCBnU7i8fVJUFe7onfcouxYES/DrkKyTNZRRWSCAAphUz?=
 =?us-ascii?Q?0T+dnumSASJIvaXB5uwg7r7ipV+BdE1z3Iiv6ZFhWPlrVnwaFcAW24Ijl8l4?=
 =?us-ascii?Q?SHE1ijngv2/HbMtK8gHk7FBrXUTEqs/qHZdRblbTspya8uKz6edpS/VhuZyl?=
 =?us-ascii?Q?dBYZXLomDjZbd0FlpZOW7g7e9AqXE5SL5c9ZNmIW5IxYIhJOZxNd/pcnX7Ii?=
 =?us-ascii?Q?UWe7/shp6NRSTPdUdMWc0D1cjVvSUOgHCbOocEsfj+89q360hIA5jNgoh98G?=
 =?us-ascii?Q?0od+r+ogDH4Alrj7vzM3uht0iXARhYNr0YCGzK5Wg6lFhP8DV003mScein4B?=
 =?us-ascii?Q?Fa4rTuo7KwIk78NT8zQgT8BgINn8E6PAHNY3BucPRWmcA2OFclTjnX8ZDaTp?=
 =?us-ascii?Q?Jc7gRzGj+wRuMPUzlHctASU+EIZMl87hoBC32Cdz++4/+kEr59b2TjhCJCIe?=
 =?us-ascii?Q?RwdPRONtmnkwURn/FXq/Uyt72m2DGc1DcB6u1O4sZ2zkmtyNLKDhNl0LnsZG?=
 =?us-ascii?Q?64uDlTivXwafbwAea8XQf9elD23lHdXM+IEBH+3B/nsXD4U89dp2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e35482-23f9-4c6e-6380-08df13955efd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:53:57.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRufi5LsQSEn0bPcIxqgtNmNQRL6sSalB9gWMN1xyF58kWjcMFs1VwWpEgnHXRgVGW1jBkefAjCWxo6Kzo2dkkqOdnTtcYeli7DwXlcTM7iLnRXZXqCX5/iWOwT7EJ50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13701

Add ZG related clocks for GSX

Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index eaa5f930e06fd..9a649f2524d93 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -97,6 +97,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("zg",	R8A779G0_CLK_ZG,	CLK_PLL4,	2, CPG_FRQCRB, 24),
 	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
@@ -163,6 +164,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
+	DEF_MOD("rgx",		  0,	R8A779G0_CLK_ZG),
 	DEF_MOD("isp0",		 16,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("isp1",		 17,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
-- 
2.53.0

