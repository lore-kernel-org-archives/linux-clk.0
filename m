Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1F1A256B;
	Thu, 22 Jan 2026 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072550; cv=fail; b=ueBLmNXEE8StDsXXnSwtUboElSRmCsp4GcSO8GMJHZCnFJLyjhwUS3rekHHSO4Y+bCD8Rry2PAuswsTcqBGMGh9u90KXNZ4uNTpsHCj2fAfFANkRvw1+LorjbLihydX5zflpuWPgVcxppQaJq34S0bAn9/NpZdfVlCRgSJJmjIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072550; c=relaxed/simple;
	bh=gp9t0lds0TrtDzJlewNvJLQ6CexTLSlhJPUj2YbL7j4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J5PSfGg8i8Zg/kj3KzMorHu2Ve2NDM5DDR7FZKo61C6OFIMHZ8cbUGxAWp2r9o2VuUQsQp4hWqTqKLSHocQ7g3hbPBY/bpKMRiKqtf5LerR3S5jyfkpv/O0q9GKMcgQAWdS3PnZDHJAIogTDce8sAUfjLHhfCLBe1kgB/2unRNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xqe0reBc; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xqe0reBc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHGxKYHTVqAtsN5/Hv8J37PJxo5zu7CBViYvzgg+sgDvQ8Jb5IZ239lQAXy8ydaej5eyeT+aaggwYzMMd+zXyLYDOLdJRANx7bvaiUNudIyxPQpyxLEVR/Yn6Mw9z0au58QI1pk9wrNM8EPK2BMpyI4utxFcA5xnkVEtZ8Pz9iw17hIButzB+yq6WWxQ91H3G1BXGel5k/wHx7T1Q9B9H2N9QNTqPWhMVuEuj6WYSI99YNo5QX+0B5cuW8m4IJ2ps76GEmrOM1W3hStMhMNIPpAApEAJg8XEuZVZy/PxeTj2ifAtJSrew+UmmB2AefK7IH3wz62MInmPoPjqh6bf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7bZmHmFod1bwMAQetuklc354zinfBg79B3F6mEZtNk=;
 b=RZL8PATxc0ILMkUs41GuzJ5s2wTm8yyl5IPiMhgdmUF/R6rnGjUzBKXkN964l9baPI5xACbyS/n5I20quOnHDX6hY0H8Gse1xPV2Bz+VHbCmprE007ew+Lmm5pr0ova/xacHfUFsLhSktzj0Hlz2W2TeTgSza5QQtdIASxl2fTrz4byNPIf8SdjEqXwck3f9Kxt3IDAM3ktoX+SE+iCt0KYglqLfor5AMqM7vRFzOS9kpTyKmD5wxRZ1OhtF5boyRF32zgfdA1hoa5sDZkcnF2+3T/4RzJbgevy/eOdouRXUbnm5I1JyUbAG7t5gEDqtDSy4mo1Cy0gVjlmA3H5VVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7bZmHmFod1bwMAQetuklc354zinfBg79B3F6mEZtNk=;
 b=Xqe0reBcebOmArpos16cFCLLkAXbBPAX6vUXzHxXANi6AbPY2mJQsZk3+7xSQtPCJ+yi6aWhx7hKs9NlXiZMcP2MZoOrBcBrWbxWPsuEIQyOnRmuzCcG53NlvGIdZ1Fd0K2PC5s90YnCdJZZb7z+4ZeHV3vy3VEfeMlbffVhp3YSTVJwCv6l0F5hVkdKySsayPAy7khe/715cceLXLc+1k8UDn+0gNEVSyPFgAI/R/KRsdza6rgfoMiBLOU6m2JmQnryGs+90wiK/oWPIyXHZluZkPyi4zurNj4/kHGY313+6ZKVFQOkmW4lr4mPGFjq16ZBEGyuQCThKP7FxKKzog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS8PR04MB7751.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:02:19 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:19 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Abel Vesa <abelvesa@kernel.org>,
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
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Frank Li <Frank.Li@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Francesco Valla <francesco@valla.it>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/9] Add support for i.MX94 DCIF
Date: Thu, 22 Jan 2026 09:01:38 +0000
Message-ID: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250911-dcif-upstreaming-3e16d89c3385
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS8PR04MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 1182acb0-2901-449c-0a10-08de5994f261
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MVFqOUFpWXJZUlNHV2pqWk8xK0FSczhUNnZSckNmTGt4TmRaYVMreXh5dFF3?=
 =?utf-8?B?UDY5OG1sa1VpMTlmY3B5TTMxZmpYeFdXa0IrVEswOWkraGVqOEJOMWF6UzlR?=
 =?utf-8?B?K0ljU2l3VUFNZ2pFTE9XeWp0Tjd5VjZUL09wSW54cng1WTA5VW9ZRnNIUmsr?=
 =?utf-8?B?cFpVYmo2YjhTeVdZSVYvNk01TFNZdytGcjNWeGh4a09XK2RCUjRhQ1FsUjgv?=
 =?utf-8?B?WjBlM0Ivc0RQMFZ0ZVhsZEUvUE9pcHZ3blZZQ2g5U09jcDBPalBJVEo3TWMz?=
 =?utf-8?B?ai9QN1BRMXpWN3Vaek9zTllOVGRBVTdLd0xaWndFNGQwOHBTb21KM3RYOFN5?=
 =?utf-8?B?cmhoS2w0MGhjSzZuSzlsNzNVeUlYY3dyM1U4aFMwc2dQR2FoZ3RMc2RMMFhp?=
 =?utf-8?B?TEpoNThHZVFHbWlva1dqSWd3QmdrZVJTRGoyUjh1UjRIaFRhV1N2STNJYTkx?=
 =?utf-8?B?Vm4vN3NUOXFqM3crb2Z1RFFEWEJBdGdkKzRxVWZkaHNqVldSMVFMME45cGJM?=
 =?utf-8?B?Nmg4STdaS3N3TmRyOEZ4OURVS244UCtUbWcvT0lQYXFZTmkwejllcjZod0U0?=
 =?utf-8?B?aDV1cldqS1VJcjNMZ0hzWTByT25QYm9WckFxNmxBbnJNa1ZlSHNzYWtIQWp0?=
 =?utf-8?B?ME54WnhkN3B4dHZWb0xoRGRrNzRSbWpYQmJTaWNoT1VkSlZERm41YkFmOTFT?=
 =?utf-8?B?OTBPbWpNeWhIRXpaTzRianl3TlJiKzQrbUxib1p6TjhDRGNXQXl0dTNMN1Bn?=
 =?utf-8?B?ZjN3TGdQL1Q4anl4S2hqc1hnQUsvbE5Pc1lFMXRPalhNZHRrSmx2eWthZXl4?=
 =?utf-8?B?ZWYyTVo0Tk9LZ2VkWDloNU5halA4cU5MRjZQMHBDWXVUQmVnMkEvZnZCK0xn?=
 =?utf-8?B?aG1BUUthb3hmNDZpNGR3ZFdoQVRLSGdhRVlGUGFvcUxSNlM1SmNQelVwS0Zw?=
 =?utf-8?B?TVd3bjY4WW1VMS9ERFR2dWw1YlZCRlIxL2hXNHh1dUxDWDAzN3NGUXUvZlBT?=
 =?utf-8?B?VzM2QWFsSUgybEFQTW9mVDh1WDQwSWtHdmt3MzdteGdmSnh5UmRqUko4NFg1?=
 =?utf-8?B?WE9aTHBCR2ZjaGg0T0d4TTlvY1N6NTJBMmJaN3Naa1o5ampJTmNZaTNpeGhO?=
 =?utf-8?B?ekV1RUpjVWZSNGlTQzFEcUJNaGtJdzAvaThsNkxMM3ZEc2lPNnk0cW1xTFln?=
 =?utf-8?B?NHN0LzBMb25yWm5nNDFab3o2RVRzQ2U1dW53TDJhalh1c0lqU21SY3NUVWJw?=
 =?utf-8?B?eHh4L2p5UDJuTzhqbkJBUFcyRWxyZXd3U0FzTWZRbFEyTzhJMjJ5bFEvQ0to?=
 =?utf-8?B?eG1TeGk1K1ZsZDNqc1c5NFRaMDBiYmdiZTFSUHdmYTRYMmx0QW1Gci9oUUkr?=
 =?utf-8?B?RXhqT1ExdSs4T3ZvM1N5MVEwRmpzanRoVnJLZjlTUGxwc0pwNXdDR2hBSmF1?=
 =?utf-8?B?WTZnRlo4aVBpYzRvWkRML3FmalRHQ3cvQ2grMUFZWGN1Z0hESGlPS1ozS2ZR?=
 =?utf-8?B?ME0rcERibmN0d0FERlhDL3plSTJNWGtmVkNRcGh1Rm5LS1dLSFJ6SS9aaVBh?=
 =?utf-8?B?VnpVWkNLcW4yZVVrcUdRNzZ5bVZaV1U5YTE4c0tJcE50QVJlRFZWWmdzK0RT?=
 =?utf-8?B?TXlIaWJxYUpEZitUQnFDd2xsR2RrWjZzMUhqSFJSNGt1RWtSeGtFMjluWUZW?=
 =?utf-8?B?K0Nwd0svMHI0VTZrWllBalFGYTVnN21QdFJSeXFkakJJRWlJVTlEdkZCV0hL?=
 =?utf-8?B?dDFwdnVXMHFMWEVqM2FHTkgyWHlyeGhwS09UanRlenlpZHhkWDNPNlFUWjB5?=
 =?utf-8?B?YlJlcjZhRk54NHlqdWoycFBHTXJDQ2h2QnhxZ2JPR1VLYytLUVlnR2lnMnpL?=
 =?utf-8?B?S29DVVBtTUxTbUt6d3FZWFRDNWVDNzJMeUZFN3hQM1VEOGhVUndQYkVCb0hm?=
 =?utf-8?B?cGhxTllvMUZZcWFtV3ZSVjFIZ2ZhTmQ0OGdBZGgwUGlxWHZ4R250eXEzUTV2?=
 =?utf-8?B?OUNlT0ZqcFp5eFFnR3hpb0MxL1JiYldySEt1b1lPSXY1YTJXK2t5dzVwMDQx?=
 =?utf-8?B?YUkzTjJMMnJJS3VycXdHR0NtOWltZGRZdGlxUGNYRVFSbDVWMHAwNzZXNm9n?=
 =?utf-8?B?bEUxZS94MC8zZk1qRkM3RVNzSjFVektyOHpURFdDRDZ3S3ZjaktGcWxLcDlN?=
 =?utf-8?Q?L94JfSEYP0keEVfG2mlUXHs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aDF3aWdpektGdWY4Nys4c2VOTytEVnpVcUxubXQ1Zms2d2szNFkvTW42U1NP?=
 =?utf-8?B?eEI2eld3V3pSTjJaZmg1VjRPR1lBbi9tdDJVMGVUNkdrUWE2Q2VKa0tzTEF6?=
 =?utf-8?B?SStHaEZzTHA5ais5SFowRU5VOWJCMXpXNjZwc1kyd1pkY1VUT3lZaEE0aXFW?=
 =?utf-8?B?R3MyN01lbHdhLzdJQ1BVamM3dlk3M0d0SGtrQUwzeFhKTmllNHh1UGVtazkv?=
 =?utf-8?B?Sk9HWG9ETmg1RlhlTGg0U2xQU0ZlMWtIejd1Z01YMjlTVytpaklZaHB0RCtx?=
 =?utf-8?B?L2dKczFGVzN5VVdyRXM0U1grV2F2TUNxWDZoY0JDYk5VVEdGS1liUjc4dGdu?=
 =?utf-8?B?dkVQNHNaUmYwbFhPVjdpS1UzeWJPb0F1ZUFRa2NPU2VIbHF0QmVKTUVhMDFl?=
 =?utf-8?B?cTcvb3gvdVlET0hkQW9meWRaUUZBU294T0J2SWo5YU5UZWsrWElVRE5kdEwy?=
 =?utf-8?B?c1dDa2tIek1kRmVKNlZHV3FQZlpmUmJQSVdMOWN6RHlYQktNaWcwTXBsL25w?=
 =?utf-8?B?QnM3a3pDQ1RiWWlTTVZoZUlXOEFFN1JSQ3Bia2p0eHhZZmFlREcwOXM2Qk1M?=
 =?utf-8?B?NmxGdVBHUjM5ck0zTnNoUllhdGc4QjZmWHFySWp3bldpWTBzZjVZNURhVVo1?=
 =?utf-8?B?MU95VGpaWk81cUtWS2lyL0krYkx1VHNBcDQvb2lJWmlIalNkMFQ5aDhzT2lD?=
 =?utf-8?B?cFI0Yk93MDBMei8vVE4yckRNTUFQL3VnbTd0anV6RFJ3czVIbDl0UXB1UHBR?=
 =?utf-8?B?S1JoSmFjWDFReVhaS2YrMkNGcG02WWtaZkFVenFHb0RKNHk1SmJpTHpQeWx3?=
 =?utf-8?B?KzFScVlqc29YNmJadG12aERkNlpNNmZxM2ZzajY5MjJNT2s5dVFSaXJRVEsy?=
 =?utf-8?B?dmxxUWI2KzZDZGREVTZiQVdxcG1nTDRJd2IzZk5mdklqMVJsL2lEamUrRVla?=
 =?utf-8?B?MElrbDFzby9DbEVaWWpsbU5iTUlQVlpYYkk5UG9LTUFTRCs5aFgxUm5pdG8y?=
 =?utf-8?B?MWN2Ui9ZN2Z3eCtyeXVSYUp5Yjg0SFVVY1FxMlhjNHY3bklyeFhIRUJ0ZGlY?=
 =?utf-8?B?aXFIdlErNjI5Vk93UjY4Kzk5cnBaNGFUZlVFeGYyb1Yybm9kaDV5OVhUSCtP?=
 =?utf-8?B?YjN6a2wyNTRWVzRTQjIyQ1lwaWg5aHBnWHhZSzRiaHNZNGwwY2R5WnJZdDRu?=
 =?utf-8?B?dEJHSDBNZlZnNzlRd2VVVk9peXZnQnErWWoxUk9LMVdoL2lNMk9hS2ZpVkw1?=
 =?utf-8?B?QmRxMkxRSXd0OFlRZkp4STlhSWU2SWFQY0FCeDJHNVZPOVFadnVLTGRzWUZ3?=
 =?utf-8?B?aE1RTVZzOGxaYzJHclhpZVQyRW1pRmFYTzRDR0pBYUlBWDJmbnJBbFN2bm5L?=
 =?utf-8?B?WXJkUjJaS0gzbVF5MVFEK3hYeU5ubGk3NTU0eXFVL0d5WTIyL00zT1V2SVUw?=
 =?utf-8?B?ZUR4RU1VV3VaVnMyZnp4L3d3WVdJYkNQZVBzcS9TQWtGL0k2WjArR1dkSFZq?=
 =?utf-8?B?Z0V1Rlh1eFBSSWVFNE91YkN4aDNGaGJLeFdINzhpM01aK2ZwRDd4dW4zdE9S?=
 =?utf-8?B?WVR5Kzk5TnoxQ1hPU0g0ZTY2eHBHN0xnWWkwa28vcDFWMVFGeVdwVlRGR21m?=
 =?utf-8?B?T1pKcTl2M1BFQUt3d3VpbHQydldnN1FYelQ5NFNtaVB2RVd0cUEyYmVMdDU5?=
 =?utf-8?B?ZVdEOFVWZUhzTkloaHpyd0xJYWxCbjg5M1cwbHJ6ZUp2S28rdlQyb2RlN0N5?=
 =?utf-8?B?eW1RaXZCdE4yNGVKTVF5RGdMWERKL2tIS2tudHM1dWFkdjFOeHlyTTdLT0ha?=
 =?utf-8?B?NnFDbytacnI2UWZvZ2tpUXBPdm80UW9jd2FNcklKUzloMWUwVW0rOFFYNzRS?=
 =?utf-8?B?QXNBWFAyQzZJQ0RsUkFiK3Y4bXVMMEpMNVRyQzJCVXF0aXowQ2dMS3pMb0Zq?=
 =?utf-8?B?eGxnZ2hxNFhTcWhhNTl3eEUxNXlKeE1yK0YvT0h2azNuOG5kN0QrWEpoZnJy?=
 =?utf-8?B?WTFpVnFBN0lMOHlvSGxEQ2EydStZcGQrZVFXTnBtdDlBZURXc2YwMHVKSi9S?=
 =?utf-8?B?TVF0WEp0K0NRVHpYYkZIWXFPU1BBbnJadVpWbWsvTzdQUXRVc1lHREVCaCti?=
 =?utf-8?B?ZkExNWdBYWhnYWJCR0hxSWtvdUxXanZPc3h2VHJMRVIrREQrSHU5RVRhVjJD?=
 =?utf-8?B?QWU2STQxRU9OcnMvQkQ2ams0YmVZUkVqQlNxNVlGUUl4c0JMZTNMTmVjZTEy?=
 =?utf-8?B?MExrVmZNZGhuSHNDUC9ZdnZFZkdDdzUvYWhIQzZqUmo5NzRLVTNMSllnRGtB?=
 =?utf-8?B?VmdtWExteU4yV2U0K05HVS92c3BFMEVSM3hKUTdQQVVrckdTODVIVVFML1Zs?=
 =?utf-8?Q?cKbaCmULguPFQzNQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1182acb0-2901-449c-0a10-08de5994f261
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:19.2870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuTXj7W3rHzMVURzRcLINLzkIQpk0qHrSv09Kwe7ZMnyx2Hwq74YJsEUnQcf0jsuMSsCb9V7ce2skFaWZtlyFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7751

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
               contains a patch (2/9) from Liu Ying that was already reviewed
               and was part of another patch-set ([2]), but was never merged;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://lkml.org/lkml/2024/11/14/262

---
Changes in v7:
- Rebased to latest linux-next;
- Addressed some new checkpatch warnings: kzalloc -> kzalloc_obj;
- Fixed a couple of static check warnings in probe();
- Added Luca's r-b tag for bridge refcounting;
- Link to v6: https://lore.kernel.org/r/20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com

Changes in v6:
- 2/9: Collected r-b tag from Francesco;
- 3/9: Removed ch_max_clk_khz variable as suggested by Luca and added
  his r-b tag;
- 4/9: Collected r-b tag;
- 5/9: Call drm_bridge_put() automatically in
  dcif_crtc_query_output_bus_format() by using a cleanup action (Luca);
- 6/9: Moved allOf: block after required: block (Krzysztof). Collected
  r-b tag;
- Link to v5: https://lore.kernel.org/r/20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com

Changes in v5:
- 4/9: Removed "bindings for" from the title, changed the port
  definition and simplified the example;
- 6/9: Fixed the way 'ldb' child node is declared: declare the
  'ldb' child node out of if:then: block and set the property
  to false for compatibles other than nxp,imx94-lvds-csr;
- Link to v4: https://lore.kernel.org/r/20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com

Changes in v4:
- Addressed remaining DCIF driver comments from Frank;
- Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
  in the binding file. Since LVDS CSRs are a minority, I chose to
  use the if:then: construct instead of if:not:then:;
- Remove the '#address-cells' and '#size-cells' from the ldb node, in
  imx94.dtsi, as they're not needed;
- Link to v3: https://lore.kernel.org/r/20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com

Changes in v3:
- Removed the BLK CTL patches and created a separate patch set [2] for them;
- Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
- Removed the DCIF QoS functionality until I find a better way to
  implement it through syscon. QoS functionality will be added in
  subsequent patches. Also, used devm_clk_bulk_get_all() and used
  dev_err_probe() as suggested;
- Addressed Frank's and Krzysztof's comments on the DCIF bindings;
- Addressed Frank's comments on dtsi and dts files;
- Added a new binding patch, 6/9, for adding 'ldb' optional property to
  nxp,imx95-blk-ctl.yaml;
- Link to v2: https://lore.kernel.org/r/20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com

Changes in v2:
- reworked the BLK_CTL patch and split in 2 to make it easier for
  review;
- split the dts and dtsi patch in 2 separate ones;
- addressed Frank's comments in DCIF driver;
- addressed Rob's comments for the bindings files;
- addressed a couple of checkpatch issues;
- Link to v1: https://lore.kernel.org/r/20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com

---
Laurentiu Palcu (7):
      dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      drm/bridge: fsl-ldb: Add support for i.MX94
      dt-bindings: display: imx: Add i.MX94 DCIF
      dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
      arm64: dts: imx943: Add display pipeline nodes
      arm64: dts: imx943-evk: Add display support using IT6263
      MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
      drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
      drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  26 +
 .../bindings/display/bridge/fsl,ldb.yaml           |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml       |  82 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  59 ++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  53 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  46 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig                   |  15 +
 drivers/gpu/drm/imx/dcif/Makefile                  |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c                | 211 +++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h                |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c               | 695 +++++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c                | 228 +++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h                |  86 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c                | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c              | 269 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h                | 267 ++++++++
 19 files changed, 2185 insertions(+), 22 deletions(-)
---
base-commit: cd8eb1cf3dad15dad65060f5d18a59ab99485d01
change-id: 20250911-dcif-upstreaming-3e16d89c3385
prerequisite-patch-id: b2acaaf7e92a5c8e377e6b56f3a9ee7409f64b00

Best regards,
-- 
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
