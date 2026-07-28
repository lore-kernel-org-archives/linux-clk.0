Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA13B7765;
	Tue, 28 Jul 2026 06:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219055; cv=fail; b=RV2WgGKiSHIq1aB+dCVHhzljOsSwd+RP4reOtDRLu1zcbItgwMphqZjp/nKZWs4fKDvASwYx2fjXw6e1bbYxMWNJA0SPSFvmyS3XXTS5N7icOItrzaQABoVfqBBQHb/xkPEHxBRRfrWZHbQ5xfglDz/mpqBzgXDkNJD2VfHDWk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219055; c=relaxed/simple;
	bh=3+N/ktPJKZc3xh4flxH1onaBoILK7hL8XuNy02/Zinw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SjiYUrnGRaA8jAYAkXypQtrHMWmajNX2IJREBXhLvuZphNeb7gghj8jqTdWrAM5aCgX7fsCi6yvJo/UizhEV9lqhB1C6WZt4NgcTxNcNnBEOvd7p5Re3SmK5K0dMnTJByhh1Zqw9p5IkQq5KKb1wjj4i/vLiP3875tmMbSleHx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BWK2OtKB; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BWK2OtKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDMXf33dUJ7415acsmLxdWfhPaGMvRi6FeVRiAlPYkobqZq46gyDPn/YYnwwdAjwTxtztk92uzr6nTDxywr1TucXvwOHjPANc/jFG/fkrubQmjJ3BbmC5kees4LCDwAynoqqmLkGZnRez/z0cQ5ezCB5AZYbTaSh0zYe+1PoHgSU9xkdAMdWMzpucn3Bq1cx82BM1ggiRSi49y8Tffwj5rqueXjce91evC7FbV2ZlZuPSbZR7+p4pzBrP6DcKS3NzeEXZCQR6cwen57PLVNJiT0JViSnI/IdQCkfMwIb5iBcRamHJ61WRxniaZVqL7F7/uzq1+oqRrCftY4syPobZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoO/0jtkC39XRePruhJ48iiRG+R8/MuoMceQTLhBCC8=;
 b=lyfZFC3SNKesvpKQJA6JMn18UQ9mUTFcC5IrFmGz7Fd/27gBzvnmx29s/o9CWrb6nXNHGw0GUexeIU8qQlaDBUNb4ZpSHC/T34VTi0whL5I3F9OBJamj04Hfc0RrWEDpZYZ+43Vnx89zfT6/v1iGokxiEDK8NtNjguLewuhu7al0GsSqYGSg1DN87GizNHk6rc6mHAigg7+2IxB6kJXuvjNEmCXfrl/ib++2PgNIMxIucB6/XAD2ZjTWkUHy1txA/rOtlnTKMbvJrBdOqtv7WcrJbwI3OguhKY2MSZu2RQ01TsVLhvpxy/lMVwop79F8PRbd4PJBC3fWvszzvTZ/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoO/0jtkC39XRePruhJ48iiRG+R8/MuoMceQTLhBCC8=;
 b=BWK2OtKBgigKcBi9lpQcXlEgRPW9cKU03VWOFS/tweXkEuP7oR8raIkxgrUEeZVar71LcxDjxMLDoJjlOktP0de8mShgRniDWxp0/yxJhKUuQoKO6eGkbLkNdP+uC12iHJyHeVw11+6JoceYnzULVg0wD1JFJcPxNoIw/R20/StWNTyeUEqwDHRv8yyj1UzEXKVXYZmJHaZ4vqpVySek6/oi+0qSXiFOm+pW34yMo2lu5tI4DB+y6clEu4zG1VXPiky9k6/N5bYyBPqigXGF+yJ8XCHYbxe3B9SjSDLlAc+wQ4fVR3T+x9EGwh2xn0f5L1dZrCJVfh5IKZxgqBlCxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA1PR04MB10400.eurprd04.prod.outlook.com (2603:10a6:102:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:10:49 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:10:49 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 28 Jul 2026 14:14:16 +0800
Subject: [PATCH v16 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-csi_formatter-v16-3-1065ba47530a@oss.nxp.com>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
In-Reply-To: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785219254; l=31619;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=4Zkv+oAJXVp8ssSYGQDYPRji6tGCjB5+DZz1ZX21W7M=;
 b=CkcIxYLSUJC/4FDOeZQ6mb9ww+gSWTWznJU0GASrepXN+AxA99vzb575r3wu4j3NvvvtO0Lju
 ikMtT5VJbFJCexQdh/MfK0e4f/hYCvRub0uHc4JMWaBkPnGu4IIoIsw
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA1PR04MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eefabf-e5b2-4713-68a2-08deec6ef817
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 dOat/QNmMSBh8QgyFEQE7RWsoy6V9gboj7FcKwa60R9yXbT4gMSDIoV7AQ8byZ/AJJPJb6Rfy2GnDkVTneuPQ3guIceQk0M2OfwaNhJo8jpJ49X0XKTmYCnwvONrt86QB4JNmUAwvTT0BizQZyre4IQXsxQV4MjfJ2h0KR7pgRU6c+TV0WRZhO76weroQLBrU7SK7fIPlc7zoWCnxUE+pZ0l2pClHRL/n6Kw073AImb/bUwi5TdxuMCKf7YIexCFdXcFRIUMoADNJNQlQAeaqefOvsdpwrTq6dBqIeEtxea37ks15xJUC9zVhu/lRVnd4ARhy1cKdbbTqwR8dWhOqML/P1ry2F0D4ONqfMGE4OQ5MFYt2ZEAmUj9XCqOsUT1XR7Qgeu7KN68b9IhjMIhbZXvGa6qNBRb9AalQgzs9s6iI4z1qTjA/mp7PaqhCIVtuEwDv8DTQ9L8/6EppTfw7w41Wng+eFaNnyKFN1dpCykh7jVlGzR0L7MuS0UzX7oddpKAUmngZF7TgIZGL2j6jqFbd9Z4FHN5tq5qUcbCTGfdUO6wnQMgTQO3tO49iskMoaJLTX2uBRH774qJn+PiQbn2pWDAVsTt23NS5zOIUApSArD8+x3ty1JwHq3C4pvr5fiO6GnhZJex8hB1Ge+857r4QvAXedPQKMC3779Q4KS6qViZULkslFvcjbn54XYL7FHUindoHFmFKKeiKaQo4w==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aFNuTnpUTjl4MHU3dTdZM29xR3FFZEVESHFoZkRCL3c3LzJ3TWNrNXl0M25J?=
 =?utf-8?B?WWczTnQxdEZyS1dDRFM0aU9ucDk5bXZGUVNnSlRJSitMUCtmTXlLYnhuUktK?=
 =?utf-8?B?SER5WFlxUklEQ1kzN05xdXgwTjZUUWJPcFZQZzI1QmpSTUpBSklCWmpMVnRJ?=
 =?utf-8?B?bGlKdEpCWFFBTTllRjJ6b29rRTI3Um5mbHFIVW1SNC9wd2taVFNsZ3NYQzNF?=
 =?utf-8?B?RFVDVDlPb0k1cDZTbHEvRW1RZ0ttL3FqTndWY1Q3YjNmK3JBdHl4dy9OUGM4?=
 =?utf-8?B?bWZBcWc5ZThTYThWT0ZqUkhKaXpZYkNVb3l4OU84TzJyeFY5cUhhc0lodlBo?=
 =?utf-8?B?QSswclZqN25ubEVEVit2bXp5SzJnQTVvNHRxTWdad0JLR3RJVExGRDU2Y2JV?=
 =?utf-8?B?WXZrandxNWZSbE9UNmZVUmdRdnlwdkdPZ1ZVVUJsWHp4RWRGRnZsc1kxWHUv?=
 =?utf-8?B?NS9tL3RBUEt3ejR5SWZadCtub0VkKzJEVXlZUHB5VUZvS1RFQkVpZkM0OFF3?=
 =?utf-8?B?MnB4b1Q3MHdKL1dMVTYyZGl6QVZZcEY0ZEV2TlIyTWphb3VhdzJLR3pHa1Y5?=
 =?utf-8?B?b3k4NHdRWElkTmtPRmVCdGZhL2s4aFdqRmxYMkhZUFMrT0xGNWsrOG1CaVN3?=
 =?utf-8?B?cHM1ZGxud215OXY2Sk93Y0JWYVh4N1d1V01HalZnU0tYWjdLNi9EL1drZFRP?=
 =?utf-8?B?VkZGOTA4WlFkRnFGb2ppUEpWZitoS1FkL3JBRDNlcW9lUWpYTmI2dVdsT2U5?=
 =?utf-8?B?VXJIdkpKaUcwd3AzQ0dwdndac1U4QURUZ1A4TlFvNXUxTkdaYnRvTjQ3dzlo?=
 =?utf-8?B?SXFTaVRLaEhXRDZJbnJSTGRMM0JJWERZWXV3ZjZrOWNsWTZrdWVGSVQxWlg1?=
 =?utf-8?B?MXRDOVd6V2pGRk8vWjZNUnpYdHl2RzZ6eHZ5dkE4enRDZ0pDMTBOWTVGS24y?=
 =?utf-8?B?VkZoeTdGQmV2ekdna2dNZUUvYTBzaEtxSnVxaTJmdmpzcXZhRjlkMVJibkJ4?=
 =?utf-8?B?S2Nkc1lHckdtN3dKQzRjWlRTQVdZdTZ1cVlXYU5mVy90dUc4MXdDOWh4OWJ2?=
 =?utf-8?B?cFE3VVh6UHJjQVFUemZuNnN5eTNFZmlvRVFvdXB0TDF1SGFpZFpqTXZVWXp3?=
 =?utf-8?B?OWwrdVFwNC93bjhybFE4VzVqWmZISlFEWmtWN1FQZFlLdkNabWYvaWdONytm?=
 =?utf-8?B?UWJXM0MrVGdTYTBYeGpTZ3ptTFF4eXpnOHRIY1JCQ2NXVDJDWHdFMGlTZ3JB?=
 =?utf-8?B?ZklLaWxlbW1xV2ttS2ZhZ05FS1Fkcmp3d1VkRFhmNm1uSnoxblBFUDM4d2VQ?=
 =?utf-8?B?dmhBOEtoNXlBMjlydlFBSkJtQThKKzJHeElPL1NJb3lWY04rMERpTU5JalRl?=
 =?utf-8?B?VUlkbjFrTzJ4ZGk0dTZLUWYzeWJ6ai9nbjlsd096cDRMaWlsWjBxdzR5aDBF?=
 =?utf-8?B?aUxra1FEUUxvaTlvVm5rNkZoeWpaTjZEY1dxTHJYc3RycmdORVFxOUxFRm9m?=
 =?utf-8?B?dEpqaDJKK20wa21qS3hjczJpbUdodWZ6akI4bG5jMDQ1cEwwS2R6S3FJTHlr?=
 =?utf-8?B?RW9FL2ZycjA3U2JRWld5c05BSjhmU0ExME8yaXVvOGpJTGh0a09HZU5rTmNF?=
 =?utf-8?B?WTVSOVd1SXQ2QkFqMzZzVkhKTE95UEtBRytoSzRNcHpIUGExNEI1bVlFOVVF?=
 =?utf-8?B?SlFUMFZoRWdXdnBmS3ZoS2JEQTAvYUJwWStTeU1HUm1GWWU2VFltZ1E4QVV2?=
 =?utf-8?B?VzhTc2NOQzlrV3cwSHlVRm1mN2l4QXp5aXFScnJBeTd4S0xwbG5zWEFhRG9S?=
 =?utf-8?B?bUlma1NmaXI2YThZaG5aRDlHRmJ5aVAxQnlnc0tCVWVUSS9IdjJZbjBMYWth?=
 =?utf-8?B?bkF4Q1NvdXV0S2pUYi9tVEVEcUJqSnZBeVM2MEx1cm1idUxWNEd1dFNoUFZ5?=
 =?utf-8?B?SVNlRHRZM3pTYkQyZEJuUmNSMXpnV3JvT01UV3VrdE1uSEd0N2NTU1FZS2Vq?=
 =?utf-8?B?RWdCelA1MFUvWEdjTmJmUlgzZG5GRThIVkdlWHNrTjVrZjdlRDBQTnRIRUFP?=
 =?utf-8?B?OUpOdGF1Zk5KZUh5MnZpdFFyRnZFOUZ6bW9OUk9yY2E5UkpGWmlZTjE5b2pS?=
 =?utf-8?B?RlZYQVRCcS9hTEVHNzBzWDR0RmxiVkJDQmFhN0RmNjhSUEVjY0YyN0xYdVEv?=
 =?utf-8?B?K1hpcGpZaWdnOXl4cDV5QklrM0tBM0t1WUxLaGJRanQ0VXVvcDRQOXhieFlR?=
 =?utf-8?B?ZDJvcUlUUmRkSkY5RU1adFZjRW9rblRFNmFqMG5kOWE5dlRCUDlXK3VKZXli?=
 =?utf-8?B?RmRobVlqWHVpMUtMb2NRaUtjaFBVb3k3OENEV3VENUp3U05DeVdzdytPVXFj?=
 =?utf-8?Q?fzeONKppdtDpiHn2tdb7VMCMWmsHLmHU0Ab8y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eefabf-e5b2-4713-68a2-08deec6ef817
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:10:48.9832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lM4lapjFNl3+d4g913zdewoI9AkNRS/3nY4vy6IIgLMOZGrmNahOqQq6JWg8MaZ6yuwv6VpiOlaD+d5JSyR6CrgE+0BiO+2mSN/WHQ/t97I8VZgURHcBfqjVfSodM5nz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10400

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v16:
- Use depends on PM_CLK instead of select PM_CLK to avoid Kconfig warnings
  when building with COMPILE_TEST without PM enabled (Sashiko)
- Add err_pm_disable label and call pm_runtime_dont_use_autosuspend() on
  csi_formatter_async_register() failure to fix PM state leak (Sashiko)
- Add pm_runtime_dont_use_autosuspend() and pm_runtime_suspend() in remove
  to ensure clocks are disabled when driver is unbound (Sashiko)

Changes in v15:
- Add pm_runtime_dont_use_autosuspend() on devm_pm_runtime_enable() failure (Laurent)
- Extract csi_formatter_get_frame_desc() helper for start/stop_stream (Laurent)
- Use dev_WARN() instead of dev_warn() + WARN_ON(1) (Laurent)
- Use pm_runtime_put_autosuspend() instead of pm_runtime_put() (Laurent)
- Add Reviewed-by tag from Laurent

Changes in v14:
- Use select MFD_SYSCON instead of depends on MFD_SYSCON (Laurent)
- Remove unused v4l2-ctrls.h and v4l2-event.h includes (Laurent)
- Rename csi_sd to remote_sd and group with remote_pad (Laurent)
- Move reg_offset after clk to group generic resources (Laurent)
- Remove mutex lock as enable/disable_streams hold state lock (Laurent)
- Rename formatter_dt_to_index_map to csi_formatter_dt_to_index_map (Laurent)
- Rename formats to csi_formatter_formats (Laurent)
- Declare loop variables in for-loop and add braces (Laurent)
- Simplify set_fmt, rename sdformat to format, drop NULL check (Laurent)
- Set field to V4L2_FIELD_NONE as interlaced not yet supported (Laurent)
- Add streaming check in set_fmt to match set_routing (Laurent)
- Add WARN_ON for unsupported data type as it indicates driver bug (Laurent)
- Return -EPIPE instead of -EINVAL for invalid VC (Laurent)
- Refactor ENOIOCTLCMD handling and remove redundant pad check (Laurent)
- Use strscpy instead of snprintf for sd->name (Laurent)
- Remove redundant dev_dbg in notify_bound (Laurent)
- Simplify remote_pad assignment and drop NULL check (Laurent)
- Read reg property directly into formatter->reg_offset (Laurent)
- Store formatter pointer in drvdata to avoid sd_to_formatter calls (Laurent)
- Enable runtime PM autosuspend with 1s delay (Laurent)
- Use PM clock framework instead of manual clock handling (Loic)
- Add Reviewed-by tag from Loic Poulain

Changes in v13:
- Replace pr_warn_once() with dev_warn() in csi_formatter_get_index_by_dt()
  to provide device context and warn on every occurrence (Loic)
- Add WARN_ON() check for csi_formatter_find_format() return value in
  start/stop_stream functions to catch unexpected NULL (Loic)
- Use regmap_set_bits()/regmap_clear_bits() instead of read-modify-write
  pattern and remove unused csi_formatter_read/write helper functions (Loic)
- Add Reviewed-by tag from Frank Li

Changes in v12:
- Fix stream ID handling: iterate routing table instead of assuming
  stream ID equals loop index (0-7)
- Remove stream_to_vc[] array: derive VC from routing table and frame
  descriptor on each start/stop operation
- Remove V4L2_SUBDEV_FL_HAS_EVENTS flag since driver does not generate events
- Support stream IDs 0-63 by using BIT_ULL() for stream masks
- Add get_frame_desc call in stop_stream with proper error handling
- Add csi_formatter_read() helper function for register reads
- Use read-modify-write for CSI_VC_PIXEL_DATA_TYPE register to support
  multiplexed streams sharing the same virtual channel
- Use route->sink_pad instead of hardcoded CSI_FORMATTER_PAD_SINK
- Write back coerced format in set_fmt before propagating to source stream
- Drop Frank's Reviewed-by tag due to significant changes, requesting re-review

Changes in v10:
- Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
- Add MFD_SYSCON dependency to Kconfig
- Fix stream/VC mapping potential mismatch in start_stop_stream functions

Changes in v8:
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Fix typo: Formater -> Formatter in Kconfig help text
- Improve grammar in data type index mapping comment

Changes in v7:
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration

Changes in v6:
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
---
 MAINTAINERS                                      |   8 +
 drivers/media/platform/nxp/Kconfig               |  16 +
 drivers/media/platform/nxp/Makefile              |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c | 758 +++++++++++++++++++++++
 4 files changed, 783 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efbf808063e5..05009228b162 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19275,6 +19275,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx95-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..5ff263fe7c6f 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,22 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX95_CSI_FORMATTER
+	tristate "NXP i.MX95 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on PM_CLK
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select MFD_SYSCON
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX95 series SoCs. This module unpacks the pixels received from the
+	  CSI-2 interface and reformats them to meet pixel link requirements.
+
+	  Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..6410115d870e 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) += imx95-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
new file mode 100644
index 000000000000..9d4107b0ba20
--- /dev/null
+++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
@@ -0,0 +1,758 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VC_INTERLACED_LINE_CNT(vc)		(0x00 + (vc) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VC_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VC_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_CTRL			0x34
+#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_STS			0x38
+#define CSI_STREAM_FENCING_STS_MASK		GENMASK(7, 0)
+
+#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(vc)				FIELD_PREP(GENMASK(3, 1), vc)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_VC_NUM			8 /* Number of virtual channels */
+
+struct csi_formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	u32 reg_offset;
+
+	struct v4l2_subdev sd;
+	struct v4l2_async_notifier notifier;
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+
+	struct v4l2_subdev *remote_sd;
+	u32 remote_pad;
+
+	u64 enabled_streams;
+};
+
+struct csi_formatter_dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+/*
+ * The index corresponds to the bit index in the register that enables
+ * the data type of pixel data transported by the Formatter.
+ */
+static const struct csi_formatter_dt_index csi_formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct csi_formatter_pix_format csi_formatter_formats[] = {
+	/* YUV formats */
+	{ MEDIA_BUS_FMT_UYVY8_1X16,	MIPI_CSI2_DT_YUV422_8B },
+	/* RGB formats */
+	{ MEDIA_BUS_FMT_RGB565_1X16,	MIPI_CSI2_DT_RGB565 },
+	{ MEDIA_BUS_FMT_RGB888_1X24,	MIPI_CSI2_DT_RGB888 },
+	/* RAW (Bayer and greyscale) formats */
+	{ MEDIA_BUS_FMT_SBGGR8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_Y8_1X8,		MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_Y10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_Y12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SBGGR16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGBRG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGRBG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SRGGB16_1X16,	MIPI_CSI2_DT_RAW16 },
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920U,
+	.height = 1080U,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct csi_formatter_pix_format *csi_formatter_find_format(u32 code)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(csi_formatter_formats); i++) {
+		if (code == csi_formatter_formats[i].code)
+			return &csi_formatter_formats[i];
+	}
+
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					      struct v4l2_subdev_state *state,
+					      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __csi_formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *sd_state,
+					       struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(csi_formatter_formats))
+		return -EINVAL;
+
+	code->code = csi_formatter_formats[code->index].code;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *sd_state,
+					struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	if (format->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, format);
+
+	if (!csi_formatter_find_format(format->format.code))
+		format->format.code = csi_formatter_formats[0].code;
+
+	v4l_bound_align_image(&format->format.width, 1, 0xffff, 2,
+			      &format->format.height, 1, 0xffff, 0, 0);
+
+	/* TODO: Add interlaced format support */
+	format->format.field = V4L2_FIELD_NONE;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, format->pad,
+					   format->stream);
+	*fmt = format->format;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, format->pad,
+							   format->stream);
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    enum v4l2_subdev_format_whence which,
+					    struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __csi_formatter_subdev_set_routing(sd, state, routing);
+}
+
+static u8 csi_formatter_get_index_by_dt(struct csi_formatter *formatter,
+					u8 data_type)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(csi_formatter_dt_to_index_map); ++i) {
+		const struct csi_formatter_dt_index *entry =
+			&csi_formatter_dt_to_index_map[i];
+
+		if (data_type == entry->dtype)
+			return entry->index;
+	}
+
+	dev_WARN(formatter->dev, "Unsupported data type 0x%x, using default\n",
+		 data_type);
+
+	return csi_formatter_dt_to_index_map[0].index;
+}
+
+static int csi_formatter_get_vc(struct csi_formatter *formatter,
+				struct v4l2_mbus_frame_desc *fd,
+				unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	u8 vc;
+
+	for (unsigned int i = 0; i < fd->num_entries; ++i) {
+		if (fd->entry[i].stream == stream) {
+			entry = &fd->entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"No frame desc entry for stream %u\n", stream);
+		return -EPIPE;
+	}
+
+	vc = entry->bus.csi2.vc;
+
+	if (vc >= CSI_FORMATTER_VC_NUM) {
+		dev_err(formatter->dev, "Invalid virtual channel %u\n", vc);
+		return -EPIPE;
+	}
+
+	return vc;
+}
+
+static int csi_formatter_get_frame_desc(struct csi_formatter *formatter,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	int ret;
+
+	ret = v4l2_subdev_call(formatter->remote_sd, pad, get_frame_desc,
+			       formatter->remote_pad, fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * If the source doesn't implement .get_frame_desc(), assume a single
+	 * stream on VC 0. fd is zero-initialized, only set the fields that have
+	 * a non-zero value.
+	 */
+	if (ret == -ENOIOCTLCMD) {
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->num_entries = 1;
+	}
+
+	return 0;
+}
+
+static void csi_formatter_stop_stream(struct csi_formatter *formatter,
+				      struct v4l2_subdev_state *state,
+				      u64 stream_mask)
+{
+	const struct csi_formatter_pix_format *pix_fmt;
+	struct v4l2_mbus_frame_desc fd = {};
+	struct v4l2_subdev_route *route;
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int reg;
+	unsigned int mask;
+	int vc;
+	int ret;
+
+	ret = csi_formatter_get_frame_desc(formatter, &fd);
+	if (ret)
+		return;
+
+	for_each_active_route(&state->routing, route) {
+		if (!(stream_mask & BIT_ULL(route->source_stream)))
+			continue;
+
+		vc = csi_formatter_get_vc(formatter, &fd, route->sink_stream);
+		if (vc < 0)
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+
+		pix_fmt = csi_formatter_find_format(fmt->code);
+		if (WARN_ON(!pix_fmt))
+			continue;
+
+		reg = CSI_VC_PIXEL_DATA_TYPE(vc) + formatter->reg_offset;
+		mask = BIT(csi_formatter_get_index_by_dt(formatter,
+							 pix_fmt->data_type));
+
+		/* Clear the data type bit to disable this VC */
+		regmap_clear_bits(formatter->regs, reg, mask);
+	}
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      struct v4l2_subdev_state *state,
+				      u64 stream_mask)
+{
+	const struct csi_formatter_pix_format *pix_fmt;
+	struct v4l2_subdev_route *route;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_frame_desc fd = {};
+	u64 configured_streams = 0;
+	unsigned int reg;
+	unsigned int mask;
+	int vc;
+	int ret;
+
+	ret = csi_formatter_get_frame_desc(formatter, &fd);
+	if (ret)
+		return ret;
+
+	for_each_active_route(&state->routing, route) {
+		if (!(stream_mask & BIT_ULL(route->source_stream)))
+			continue;
+
+		vc = csi_formatter_get_vc(formatter, &fd, route->sink_stream);
+		if (vc < 0) {
+			ret = vc;
+			goto err_cleanup;
+		}
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+
+		pix_fmt = csi_formatter_find_format(fmt->code);
+		if (WARN_ON(!pix_fmt)) {
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
+		reg = CSI_VC_PIXEL_DATA_TYPE(vc) + formatter->reg_offset;
+		mask = BIT(csi_formatter_get_index_by_dt(formatter,
+							 pix_fmt->data_type));
+
+		/* Set the data type bit to enable this VC */
+		regmap_set_bits(formatter->regs, reg, mask);
+
+		configured_streams |= BIT_ULL(route->source_stream);
+	}
+
+	return 0;
+
+err_cleanup:
+	csi_formatter_stop_stream(formatter, state, configured_streams);
+	return ret;
+}
+
+static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *state,
+					       u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, state, streams_mask);
+	if (ret)
+		goto err_runtime_put;
+
+	ret = v4l2_subdev_enable_streams(formatter->remote_sd,
+					 formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto err_stop_stream;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+err_stop_stream:
+	csi_formatter_stop_stream(formatter, state, streams_mask);
+err_runtime_put:
+	if (!formatter->enabled_streams)
+		pm_runtime_put_autosuspend(formatter->dev);
+	return ret;
+}
+
+static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+						struct v4l2_subdev_state *state,
+						u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	ret = v4l2_subdev_disable_streams(formatter->remote_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
+
+	csi_formatter_stop_stream(formatter, state, streams_mask);
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put_autosuspend(formatter->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi_formatter_subdev_set_fmt,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing		= csi_formatter_subdev_set_routing,
+	.enable_streams		= csi_formatter_subdev_enable_streams,
+	.disable_streams	= csi_formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = csi_formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	strscpy(sd->name, dev_name(formatter->dev), sizeof(sd->name));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+						      | MEDIA_PAD_FL_MUST_CONNECT;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_csi_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_csi_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	int ret;
+
+	formatter->remote_sd = sd;
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	formatter->remote_pad = media_pad_remote_pad_first(sink)->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto err_cleanup_notifier;
+	}
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		goto err_cleanup_notifier;
+
+	ret = v4l2_async_register_subdev(&formatter->sd);
+	if (ret)
+		goto err_unregister_notifier;
+
+	return 0;
+
+err_unregister_notifier:
+	v4l2_async_nf_unregister(&formatter->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	return ret;
+}
+
+static void csi_formatter_async_unregister(struct csi_formatter *formatter)
+{
+	v4l2_async_unregister_subdev(&formatter->sd);
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
+				 pm_clk_suspend, pm_clk_resume, NULL);
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs))
+		return dev_err_probe(dev, PTR_ERR(formatter->regs),
+				     "Failed to get csi formatter regmap\n");
+
+	ret = of_property_read_u32(dev->of_node, "reg", &formatter->reg_offset);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get csi formatter reg property\n");
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to add clocks\n");
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to initialize formatter subdev\n");
+
+	platform_set_drvdata(pdev, formatter);
+
+	/* Enable runtime PM with autosuspend. */
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_pm_disable;
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
+		goto err_pm_disable;
+	}
+
+	return 0;
+
+err_pm_disable:
+	pm_runtime_dont_use_autosuspend(dev);
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+	return ret;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct csi_formatter *formatter = platform_get_drvdata(pdev);
+
+	csi_formatter_async_unregister(formatter);
+
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_suspend(&pdev->dev);
+
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx95-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.name           = "csi-pixel-formatter",
+		.of_match_table = csi_formatter_of_match,
+		.pm             = pm_ptr(&csi_formatter_pm_ops),
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

