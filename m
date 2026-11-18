Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996350;
	b=t6Onq6y2uQFszAoD/5Jf7bVQtmftaSQMUIGR9OS8AAxx6tGhherwBRObswmelLNmP4vI
	 +3ftIqOZl28esGYb9wOjLDVyKbZjannFpoX9n741Nm2VFWFAzBwTtRQHdyvZb6n6tiUDK
	 xeIdCy+PntUs1Igwq2+dFFEr5ph6o/J5ESMsl/9d11x/Pc73mEWDYp2kZREjn+4OMPfEq
	 +YPaE7CYqtBjXZ4yFo9VEaa//wvZbFXpwnk3K8UcOy4gARn+U+z6vOCU/TTb/8oHqZUJP
	 10vxWXicvcNC90BY1PGwTnIj+PizWA+SIwiFdOpRl3AIE2bPNrtnGHV6HKXDvpQ92fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996350;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LSDGKf+yHzDyIxwOga70U0NRoUTGePFr9ciMMxXuWAg=;
	b=bvQxPxXo2kjLWRD8HIzbRiWkFHoNJrJk1hqcxuQEABkpRNJ6RfutuUoS4+OltlCpWWgh
	 yIIIbSUHSpy6oyPYQWpIVyC1m7M7LYY4E/Z6RWoFjPFfrdT1l4yqGRyqTOooCFiEVKvfD
	 BQH2rBKPw+Ex7lJ/ajn/3u7efVCuLoqF42jssF34UH8s58KPsCo1n3MFoZeJgs5PTyRBk
	 W3aOfQOHJtMJPAeiWudlzzK7sKOf1PojZ3Ok/QxtZ3RetZ25BVOqh6IsVIZ6HdHf4qRJh
	 v4hVxLSWbsQrlq7M3BmEJxUrNutsgQQej9Sk6yCoZ5buJwkcE/ipm4YFcNs9qy/K5nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2117.outbound.protection.partner.outlook.cn [139.219.146.117])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E2606A331;
	Wed, 18 Nov 2026 10:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIghoIWR0uixKlBMSvQnZYNa/OjczF70Q7zpkviDP2nE47aWszaYG9aGGRuYJ8hJ3u9I2mDR23P8MnnPFjb1tB+G1stUNClclZvg4DuIAGLF6chE4Rs9mmrc4rNQLvIb7FzXX4+5/LHgNQ5gYhzx6zVid0wLZJZhE3m3XGPLL0DL/D9kQd3kOvTRMotPHB+qnILa1UaRrIQAX0dA5QK8J7X3vEYNJvCCfIKX1hYL1GDMKRjq0hBiKHHfviJnNKo0q4g2RQbTZsLhS8v5ABXSmAzq+gmBw3pClAJZ9EjckUKgomqpMEXhrbW5BRjTjTzBkVIl6EN0i0ptnRuVhTO9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSDGKf+yHzDyIxwOga70U0NRoUTGePFr9ciMMxXuWAg=;
 b=OIRz0y31bZsk0n194CQ04e02CtUyxqOdtFo0vyrFK+cOsBe3nC1+KXQG51E+l022ArBKEqTVWTnm1Bdw+u26hedaiM2/r/zAAF+hWNoU7ljXF4VAGxCt8PDdxlKnYrS9oPdjRyxMPCQq408Zxc62dAb1dhJTVGChMdHzAfLIy4TJG3s7axRjW0gvXY3WlZdfbzdI2ppI/B0RHcT17RvAk0UkUjN8rvoTCNej5KIqoHwWLBVZU/EC5/Qhpu0a+oIFpWsjoiTukCVjxOta7x60sSU7kl+jhCiznQRnOWTdXeD512LVAZW49gVBfUSm2v4gSleFId6ycIqBs9wRyYjLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
Date: Wed, 18 Nov 2026 02:05:18 -0800
Message-Id: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: a2990723-ef6e-41a6-543f-08df455b7e55
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|56012099006|261022105027099003|261102123227099003|261021123027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2MjVzg5Tr+sAJtu3epor+pZm1OIYZI+Q9XZxLz07PaYnZgOXFRRWvGxoFM0ZE4XcIW35RJfxm5xfbpAGYflSqtirHK//tDhMoMCYJO9JFm/l8KZUNu4M39iBJQtCfQENtmSIB1rBM3+HNDYBrjCM+HFLYX60kGFvVVA0T7Pzd1wild7lHvsX4hxtZA5DmxpGEJvOD8U7Dq9qbLBzTAnQbqElY1ChdVJLcPRVswjJb+dAMDT37+Ukoj9n8PxCwPfcoyj9PirbxjgYnCETB5itLbNcsXwysHziJpJG+mrRunYIDtci8fhmY3QlTnPJVr4rqFBS8MXVTPwmlkND1I+2mlFwUaUXGLofoIS7AsyQQ1dacn/q/LulegDaqlOUzYcnJ8Fd+tdi+LMsG/4vH56jUSVAmqGmhjg8rtj9tu6tEbAtTxAorqfI31JfegeKPKxA8f8npYfBsOI/q/Ms/oYOA7TvK/rPAOV7WKsDjrbf9+StdlM1X9d5E5qjxqxxmsU95rojv/2Vy8bZKgzmr4oylvJu8pac5AbNHczACCR0K5ABCYgfBNNI///DeLMn1pwE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cxFzPQVCf3sFPf80nZ/kka37r11CmpjQcif4u4016Z5sd037yDfeRAI4wQJW?=
 =?us-ascii?Q?bb5bdyaYNsYqjF+ojtiejKcGObh2yL3x7lxhy4C4q/FrcUNXHohkHMWUAynw?=
 =?us-ascii?Q?kr41sPfd7PL8YTMQT8dWxnsm7GP+2yxoEvmBfQIkh2ThMpQ+utr/UP4NYdJb?=
 =?us-ascii?Q?3nN/AWwGG/iBao1wX0t3+p54dre8dmj/lHaesF0LkwDcHP1jWfoshemzv0gc?=
 =?us-ascii?Q?Yv/wVHHovCHQOzRo9onJ8LliEyFwMoZDvud0tiGMXWDLJ1h4Ee6oma5LXwfL?=
 =?us-ascii?Q?G+lmKBm4RMApFfglVEYxMUsigW5FeCSSnFfH1OBuDqWiP6ZRV/7Bm9oByfcO?=
 =?us-ascii?Q?DIUuvLme1AODsm1trM98KQnE6ev0DmHDv2VfjUWpiGDKSIiNkGUo3/4/3TK4?=
 =?us-ascii?Q?v88FQkIGdupfk2GfzVMiZcIGMztDUQRQ4PkU8GHRcgxA7CeTjyRDiFM6D3yc?=
 =?us-ascii?Q?zYdKHU/YtwiEkPJjy0Qv7rrJN5gwrf0OVIzLHRD1L5Foog5L1k+KWw8JBYgo?=
 =?us-ascii?Q?Jt0PUKbXrCgS7rBso8T2/1IznzgOMEbkAnFdT3CYUbgBFG36dWaT0OdCkN/r?=
 =?us-ascii?Q?VYUUU2utoJZsbVNG3EHrZRgAYAehTzzFdrIGmqqEg7a1KRml3hX2mzQTZhM5?=
 =?us-ascii?Q?rL9V9iFKNGXshjT5fLFevUU5hG5A6hK5OQly2hxNoHb3+nktG/TSW8vaY2s0?=
 =?us-ascii?Q?7yK9ngjt9hy1uYe3guSS0De8ATmTjhmJo5EXEv9SehyyNCOD6+t7ztNqhDbp?=
 =?us-ascii?Q?WSKgLNylzlDzzC9mcPU88/KC8M5BY0W3T8MpOMIPsv+NuJGiTZ2DN1pVnhPZ?=
 =?us-ascii?Q?0sJIZbDWlcqH3Zz0o5LjzqxX84o0J15B08Us+HZx4tJrccyxD+oOMJ1msDRY?=
 =?us-ascii?Q?rmQBZzwFDy6FVYL4OpRWAUQCQmZKNja9gds/CyYX1VZc5bYKRipJRA7Dinz6?=
 =?us-ascii?Q?Ju/btljsuICZo07n9SD7sGFzKZ0MvhCGQ+mQ0xN75qa+4BRYsOTdCTFcjjCA?=
 =?us-ascii?Q?hGqUi8xItjyBcHjoOICTiIBcAkUbtXtPrFfQ+RB4sEhHZCFZeste5DeRLTeB?=
 =?us-ascii?Q?AnLOcZ6Og+HM2TyVhI1MfyI/wl4pqcmYEZmNNA/P8Oy6GZZ//iK+KQBh/otK?=
 =?us-ascii?Q?EUDFPoE5+YF5/zP5WiMonNQpTYGamw7ignYdnJb4bNjn++5aiRspjfaHU1Dl?=
 =?us-ascii?Q?Tc8AxIKHFMY4ZQYR09QHggKwJaUohPRVl0q9fXpkT0HwQpqSM6fxfT85UClR?=
 =?us-ascii?Q?k5TqvYS9bgq0m5Q8ycd+8xngppfnxdRjdFI1mtVkD9jsKKq95VIEIPRPgrev?=
 =?us-ascii?Q?6nSFSqBZaPeEDcStiktB0LqVjwYBJSXXV4bE1qn4yfA32dPzyLSGnvERydb6?=
 =?us-ascii?Q?kD8crZxNYSzwGh96u2SaaMAauuQ2hyEoDGp1/DWrxHbD1XHb+X6xWSy7DKIk?=
 =?us-ascii?Q?Qez+rHiPz9GwppVZx5z3ij6UYOiwNwNtBobTyUPz3xJD15ZZgkXay4GG5R7V?=
 =?us-ascii?Q?GcD13RoY6R0Hi7BvarH1BzNJjHJFNIxmojSOvQsMHhOyPVXMqz0azIbli9O+?=
 =?us-ascii?Q?lXDCFNKzHYveELIwnBNXDU0na/CR38Fgwuml5zqNssbgbeQjuv7CvugK2G0T?=
 =?us-ascii?Q?Qk57sNLT2sZe2ogOeIzRqP6XXlcIF1gintaJhagYD9lLKLDX6zC+yAh32Opr?=
 =?us-ascii?Q?oLTkZ/YPiLqTwgUllHumZd11ZQ8eOPI36CD20M6H0MKUEOAoBG7wHFIgqqtq?=
 =?us-ascii?Q?prgX2QqJOR3ezE/HkSd6U8bxSn/YA8q/3gILbwHFjD9gjcTz8fop?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2990723-ef6e-41a6-543f-08df455b7e55
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:37.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DjpvFdzp16MDt3pYkqqA9Iugi4HtVzfKGCet7JbL8l9h6shUBzfBYCyY61pAODKWnDpHlTkLfhcSNV5DcEBY1IJIeONPYWHzr01CuysdDW5w3I2CcB1UvjSnMvaf8Ti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

auxiliary_device_init() returns an error before device_initialize() is
called, so the release callback never runs on this path and the rdev
allocated in jh7110_reset_controller_register() is leaked.

Free rdev when auxiliary_device_init() fails.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 44766b094b60..c938c62a863a 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.25.1

