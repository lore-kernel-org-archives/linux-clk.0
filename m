Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5058372EEF;
	Tue,  3 Mar 2026 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581826; cv=fail; b=BhnBXZ5SpGScsIAh7ZY4GtVyDCMwylOr7lJLQuviSr44uasA3P78+7J1ipdRw1nit3bGgkTXmpmYgF4tu354/eb0UV0eR0KyeECSAe8AjmpMrW0lc/n/vTwVPz9jrvD83ppFqj71N4esQorzEEGhym9VrAb7UBKZ3z6mqgL5kvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581826; c=relaxed/simple;
	bh=EirQylgJA8DP25MAJciefp7Dfut3rqmWFOazHqlR+a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uk9ZVmP7IUzm2GJC+r1YlnBZDh8QWnHcrVvidH/UQ7IccPgpTtCYa6IWJSkkihjCgwksizlSDgXYJn20izW0fUnYKLft3JPuLT7nONpSM9WNaFS2SCG1a5UCcuI7zmtLwEgfHxB+tVwoM/y8jZ7vdI078jGzgVW4fLboyzfWLiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MUG3zRIi; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MUG3zRIi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNjKq7Xz/eG4NlrCV+Qgo5jW50DEOmbdXO00YImsVimpPpnUU+Qta0XHVxfCWPqh5n40e5uX+QOLzrzTdmjAy7Aw7xBi7sFolDArPIpzctm3lsR2dobTi/Vc+mIx9imsVCEh4q/nKenE6S6FdySY01Aqebxp1LjO6pBvXEqtAmKptGR/q7qtHxdWRQwItlF8llUF3B7at12EfAukfZ4npAusnu+K6AcR7K2A+M6T4QaJhpj6aok0r3/zx9a6w1zrdcNmnCSmguUH8WDH5w/zYHMl2YsiOfNZ9k+2WLIx8y2r3OWgFaGnB6lPEZnrVD6cs9cqLXT1w0WTBcM3rILBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEE69A5b7Jfxw3HXqFOuiiPn3J18wT/gVe6uD39bKb8=;
 b=faZBxg3Y5lMspivKlZNXkJrr4YZUKYuRpm8BmlCj+i0yxyGUYsy3cXK1c+2e2zmzKMseF0ZzNBqmW5gw/zOWUYard2+U22hZCFeB/3Zie5Q19N3YWQgrKBlQzK98LBJ+z5VcLZc4UMmrKxpF3KJH8RwtcaGTi4sMXDL0E46HUFWOnqspb5r5EB6GKvUhKVIb3lSRjou8ZCFb65yYErJN208fL3T4uYKxJqhlJBZDsPRSFJ3wMxH208MJaNyIOAHHN9M0PvdmYZUYWuEZps2P9uwbanZvxWelW+B3UF96Qhz1i1KPHr/aGkvV4/P3TJcpRZxMa8WJFdJHM5Zf+llYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEE69A5b7Jfxw3HXqFOuiiPn3J18wT/gVe6uD39bKb8=;
 b=MUG3zRIiU5TQsfKGP1VB54DsVtAK7Ve6lAnAQ6Ly+RPkX4FBYGuyZ28kRafw2cANKMlY1aEiwiNokDTcNfjJEYb+N5j3hxfPgw0SdiGJgp5JswgUROnJN7QqrLk+5UXCUGwhMgRQ8w2j0qw+rX1HaUXb5rLEb8kFY23b+m5OIrQ0ykS2m6LSkIL/PZCptofMvDgnTvbx+xZd4XBtLCl0MuIDQ2XgPgyZdwXbEJZmF4e7fdnPTM7hF0Gfg+bLvGwcTQa6lGB0eTerffbQypgGfdF/ZEX8lA6pxxyrCDXpes7V1ei9w8BpefD0O1Wgupp6KCEsQX/ZM5nWKfO/vgVUXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:50:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 23:50:22 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related CHECK_DTBS warnings
Date: Tue,  3 Mar 2026 18:50:03 -0500
Message-ID: <177258150850.3034237.15241400248455071370.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:806:23::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: ac416247-e38a-4826-56dc-08de797fa26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	sulZWOVuf/tctYS3EYL1SzKudGKbXY17hYVh1W9LAwRnlG8kiJdaWZCtrydL2wyGDAAAALgp1+kzYy6BNCtvyF/GzPAjGUq73VbyKgDuSRQ00eG42869klgPuY6EBNOl0lGF2jUYDG5f7R0VFJXLXEicN5stEuvR90W5eVbpxhx6/HORI8Ol0b9CqV6xqVIdhcPk+bYS2i3q41cYJUGPuKkjzM5mdN+gLrMcVZXHirl3ZquFv1x2l+IuQUVsbrlEI9cO1NpZCrzDo6JGbC+IHsBiozONUfJ3mvcXlS9wYPnNOtaeTh5gENt2HqTKaquYzhv275/yUNMpqjckQ4kfIUgJMc4LVXElabw7+i2qHm5Gr+uapG2nuytgVYDU+p5Zyc22YSvM3zbtXlFbvmWzCpJP18RPvxbxZV3iMgbh5bwKoCWLr3GEeu3JaBHN1x6p6Bx0WcdEdkDDr0AW/JVlhJ084HhZsy3k8ovGO138BBVrQvlwE8kOXAqf1yzrLlQFzQPZ4qOJtOu4pauwa+rj4g1G+Hi6W8/8OAoyYERwth/yU0YKkD8iaj43NeepTDKHKcUSL+sxmaVMjhTUVZQjXBaS8JZSlswbH9i2h2gj3TCZoCikiyaJKg8m/kdrIQFrwCZJyTP7OIe27fx9BdJ5DHs923vE6vK9zuBAJl8nXGxszPhUjqdOgd24ulm1OnU/fDEuv4jFXmBlFGFHJA/QX4HJudhPG/nBz0JYr6p/jPh8wTDUPULSp3aoUCiqT0AgMNOR+rSw11ARr5z5DmHYI901/aM9gmAl4vT8/44WaxlmGk+PcsV1K2Oox1BeTP94
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFBuSkpESzErYVhNTkJERlpxUTNoNGQ2SmdtUU0zQ0RTTDhKbldvWFRNSDh0?=
 =?utf-8?B?cHJzckt1Rk92Q29NNVdZdjJHYUd5NCtJRmxVanZ0VWFtejRabmJiYmNKKzdH?=
 =?utf-8?B?bFA1d0VPWG5UUnZvSVdxczlIajgxcGhFVXI5VjJNcktCVEVKc1BGTW0xMGo4?=
 =?utf-8?B?bGVkZW1HR0QveFRuWEZ0cFNMQkpFaVlqWmllUDhUSG9acnEwS3VNVm0zSmt2?=
 =?utf-8?B?Y2o1YkRsTWpadUI5eHVlZ29TczBoNnZyYzZTV1BjbEVBMmh4bEIzaVlVc3pw?=
 =?utf-8?B?amhnUm9xVnlxTVZ3cjRXMkNnVkNaSVZSUU0vcVR4aERMeEQya1B0NU9pMUdk?=
 =?utf-8?B?TWU5K3dOY0o4MTIwL2ZWUmlrbGtyUzBhdEowWnIvbzhDSzNUSUkwNy9heEZC?=
 =?utf-8?B?YnlwTkVEY1VRdnZVR2VPdlZYbUllS2NGcTVLdFJ0SXJ2RVVIUnhSY3VQbGlY?=
 =?utf-8?B?WGpFaFB2cFRGRGljbXhONG03dFczUXpvb1VVVk1mTnRBeDJEZGlhZml1Uy96?=
 =?utf-8?B?TUFJYWhqTUFaazlVYkJSL1hUZHVyNlVLZFRGaXVxRHdXMjZ3ZFVIRFU4VWxO?=
 =?utf-8?B?YjhKTWNmdXBrOG9yUS9QQTc4R05IaEdYSnZXQTRxTVVBbnEvdHMvbTVQTmRy?=
 =?utf-8?B?OE1WNmh0bENHMjVQS01Db3dxZnJqNE1ZZlhFcW5KRi91SUdMTmFWclRDMEFn?=
 =?utf-8?B?VUMrRGRkdmpxK0U4cnFqTUR2a1N0TE5peWM5VnB1WkZpRklUcjBURnFnQ3NC?=
 =?utf-8?B?MVFtWE05RG5Zb3pWVGhmOE53eW5wRGVEa1YzZFJDY3BiRzRLQytQdlQzUmRa?=
 =?utf-8?B?SG52UW5WblNINmV0UUZ1V3JWdHh6NFMybWNVejFJaUc5L2dXR2hLaVF6WFha?=
 =?utf-8?B?aUYrUnhQMEwyOTdRUlVtRC9idVR1SzcwdVJWNzBzbFVGRkpHYi94Y3NJYjll?=
 =?utf-8?B?cXc5bytObURhVnhwSXFSUHNaQUI1b0lCbCtDOVJCQ1FQclFqakNwa2xIRDdY?=
 =?utf-8?B?SStjRlpjTXVGamVJcVYrK1NQK2NMeHBncXNrb3VDTHZjTnRJRlF0RmNXSzVH?=
 =?utf-8?B?NlFMU0x4VjBCaGF0QmM2clZhQTcxNEcvTExDT3RqcDZadEFRSTJXVFpoQ0FT?=
 =?utf-8?B?NVRZaEI0ZFBNZlkzY1BjUzBvcjZkYUFJUkpEejRrRG4vSHF1c3FBRGFmS3M5?=
 =?utf-8?B?RDNHaG9rTU5IN0VRa0tuOFFidjdnc00zWTAvSGE2K1dxS0xzRWcwdUl5TWpT?=
 =?utf-8?B?d2duNDlVUTRmNVpjcmlqc3ZSN1ZMNEYyQzEwVVVuVzF3SnFaelpIM21JZFNy?=
 =?utf-8?B?STd1ZW5ZQm5ueU12bW4xZ1Zvd0dUVi92clZOYU13VWp2NDJFRGp5ODYrMUh6?=
 =?utf-8?B?UElJdWY0c1lBaE1mdi9ZcVg3UmxPNW9ZdGJQc2h4VWRwNmRscndiVjhjR0lC?=
 =?utf-8?B?WDNmRkd2ZGpvMzhzbmwrS2paenNkYzBseUMrMS85c2plRW1URXR2K3RodkJ3?=
 =?utf-8?B?cnJjbU0xb1ZGUlFVMGxBalZGaEFWdXlaZnlYRlcwWWgrZktOVDlZQ2NVUmtO?=
 =?utf-8?B?ektuZEg0UjVJODhZTnY4WGFGc2xZYjV2ckJnYXFqRzV3VDVCR2NVb3lDWkNT?=
 =?utf-8?B?TU9uQlppTm5TZTF1aVlJSlJtVW5Cdyt4UEhieHl4V0JMejBFdnhIS0h4a2VW?=
 =?utf-8?B?U2E2bWEwOTJ3WTM4RVY4VlZkWWZvOEFPaFpocGVtazFySkMwclBjUGh0K1Zw?=
 =?utf-8?B?U1Y0V0RCc0VIY25JS0xoOWdQNyt4d0o2UFd0OXpGKytSZ2padTRxd3RqdmdQ?=
 =?utf-8?B?QVdrMDZueFZxWnBJU2FEa25JcHZ4cTZjZHc1RFcxcVNqUnBGakVhVXdVK3ZH?=
 =?utf-8?B?K0x1ZGlDQ3E0OUw4ODRnSjFpdkM4eVBybW5xMnQ4QVJZbzZXTGtHb2pnaVVk?=
 =?utf-8?B?YW9WQk9NSElRVm04WFBoeS95Wk5Jb1FBbTRGNC9vYkZBT29semZuYjN2bUt4?=
 =?utf-8?B?M0pmUWltMjlodmFhUmo0SGxQK1ZnNzdLM21ZbnUxUERIRjdlcFVRNXZ6Q2xv?=
 =?utf-8?B?cHpGcmNvS216a2NKQVhyWGRjaFVyeTVsL0ltREdrVWlSd28yV1d1NS9iSEg2?=
 =?utf-8?B?bWthc1QybzMwV2lDcXZpM0xpd2Q3VG1ZZzJ2ZHZlWGU5UDhKN2Vod3NETFQ2?=
 =?utf-8?B?ektnNUFOd2VnVEZoZXJ5M0dRMms5S09VS3hvajFJZ0lBZS9PczZPeWdHRXdQ?=
 =?utf-8?B?SGZoTXhwNWpjdU1ZWFZZbDJsUm85YStIM1JFcXR1N29seXV5V3pRb28vR1Vo?=
 =?utf-8?B?ZG1GcHd6Mk5SUzhwbFZWSU5VVFJkNTF6TkpGTWpRTS9kL3VQQzh1dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac416247-e38a-4826-56dc-08de797fa26e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:50:22.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxSgN9mILi55+5gR6jc3YJ0EKpTKo6aaYXkJuyw/jbii6s2uifz2iyTlQMBvFjo8SCboOGnSY9ue6W2dCMtbFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255


On Wed, 21 Jan 2026 13:04:14 -0500, Frank Li wrote:
> cleanup imx6/7 CCM related CHECK_DTBS warnings
> 
> 

Applied, thanks!

[2/3] ARM: dts: imx6qdl: add label for system clocks
      commit: e233af50de48803cb8961180f73d61adafd788f7
[3/3] ARM: dts: imx: add required clocks and clock-names for ccm
      commit: d1a4a33c11181cf11e639d4b59bda799cc618e8b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
