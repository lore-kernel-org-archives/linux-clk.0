Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2142315A86D;
	Tue, 28 Jul 2026 06:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219042; cv=fail; b=cWjD5WBg6oRDoVRh9XJEhD+7SVPYrQouhYx2+3ug+Uav9eNIpoAhELNLQySwTnK2rZKXG6HN8/XO8Vw3qcJJbQ+cP+q+8cFmk+elh262mPLI7BuhAF2gE1XptoT7ChV2/aSyIZxbWxUKV7kfkOCONm9FRy3WMb4AOcE2wDCZHSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219042; c=relaxed/simple;
	bh=H/TAk2D9RwCn7uBj+jw6IdS/CYOjt9KD+bKg/uoY+NQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kWPtSAZgaB56hHN0CrALt/iXqDmFuXgpfPZXhRznyHx+G6SfynvABKizUK7E5Plr2D3Avj16EF3Y9SQ6I9g3iXXbt80BhRmTS5gasGqKnHs/3aNiDQJ1vU2wJdGJuAmhmInJu1+B2JB5z049t4cGffLDO2OdNFLZxblLiPOZixI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UD9L1wYZ; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UD9L1wYZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neWzjTfIGZGIXUlgkVhjICtp1ELOge8jioHDU/D5ti9Hr5aoXUmrc4JiIYyBg+JwOzHmcL3qAXf0UdCkXlQw369cPgN6qd91jWmm70iamnTxVgbaJm7+wJQYqcSSpYb/ovkD8+CdbIVOvcUSnn7kqlE4tE+m70MHV88EcpUVxGL0xoy0U1Hf2shVWBM5xKNsUMrzjPe09sE0rV2cLjee1YY6IsjdyG5e3AEXgUnk6y3xkIBNdlER5zJK4rlLL3Trh4x/DwFdrTQUGNzZRYMTSmDIugl60XRNkHnRYep8fHRa71nEyU5rVTvTlDmE74TN+iIuVmoMWyB/lwu+lfEWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=YFQNBkZpyRveEeYe2mIYP8R+06GwP4o7o54TaMKWCuRFGJpwmqAFxcqyMajAa6pRqDUeOAeahdgqnBLpQAtb8Z4DjPP4xX66K5k4NwX8Ela7bG6NTER74EgQqJoL57kccBRjYUSKDl4sb+T9gv9u5492jWt7oboYd1p4bdBzQTTBDmVf7hL8CLpw5cFfo5WAQj1tADSnqvxGysjq9rK9FAkiXkmlpIZVRPiXG5qGMKpFK8ucatwzb2akvbWcLSi3kcJ5WV8yGvRoqS1OiHCiLXrd2yTwGJy6f0D59UVVEQw1dHOGO28PnYxHvu25/Y/1FewzqVlUqv0ODwxubR8r6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=UD9L1wYZr5N1IUDF1nF7oUFshQFBdn8s/a4j1cLTWmh75SwJGVuwu6w+6hbjIPks/O2nGwrlTJm+75MR4vF2toMq9SnQJw48GRSoRev3xYKs38a1J4zvlV1Bydh828+erdXfvHtSUZwm5Nuh5hjLmZrUZVSKnB9n+CQSPaWEhg4zl3m57xRHGA4OoNXzHAcjRTM9pvTHLtci+Werae/7OB1FzI5uomI+6uzqoxo/uHKN+qFMFgqoA8Co3r7o68VHtERAcblBeuYu5i26iRAAwDUEvIzxlzaTd/vTx28plCsu4I27x7+lcZi8lUu7MwwCuYwvNAp53+4wTEDIPgDWnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA1PR04MB10400.eurprd04.prod.outlook.com (2603:10a6:102:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:10:37 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:10:37 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 28 Jul 2026 14:14:14 +0800
Subject: [PATCH v16 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-csi_formatter-v16-1-1065ba47530a@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785219254; l=3999;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1KxD4fu9BB5daIhnJsRaUVCtE6uczPiLVZmekvQD2LU=;
 b=abdgzD1D3OpBXkIjkTCwxMbtDaRRfYf4fU+qu/OvvbyhDC1bQJ6HwMf8YDHMm4JRFdLPw6K+0
 r2c7R6uEAJXC7PWdg0hnMhk3g52evDUTtj7lCuUG0JFsc2fsG5VtS61
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA1PR04MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9c7f3d-3764-4948-4762-08deec6ef134
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|921020|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 mUNkmLNoRN3TS5JJgwzTqfbzqKoglm9UGqyb32Yer2vTIWGrKx7uu+FJnExabFMSSKKxAr/z33/0/UjpjIfWBs2+G6wCGlracPmmIcZ9bVkpSIbq68/1AF1NLg4dsCjUfW8XWMr4rqtdvz9f4YdxRL0/Zf84sYI3B8gkFJrGuxmox0vQtrug1TYH3/jro0j/Kg2TnpuFepCsqIIB6lavmKnYE4EP7Foybq026qYbrX7pkE14Bab8bDHbVgfBD/KNz7fXiXQV0peFP00gmcMXlmYuI7qSLeoMkqpoYHt8IOAIBslC85BNDvRjZYYKIwgOkwxix3RJJXgLj63PI2XAftO0iD+tA3YGbKGQlASAv9O2XtAL/OcJcIQUe3rk5TvKoVG3hFinPhh3WTVTkDxULjvmJoVxJ4aBAPtA/GztRMrdq7C4ZcwXPcYupaD9liVh0/gIcvGNwpJydO+YOgVe1Q6U7XvmGUoN1Krzwcx4MlVaD/UWkhJGfLsMoJKu9E1I7de6YjOL49FUXiKkthptqiy7SKXXtYwQWUkmvwohRJvqsLAgkAU1rKVemCSepBzL2g2kySp1ZdLxHzLO+Qp9fae/hx5VssfUeacO6rLizaMd9B38ASnDJ7TajufuUGBCu6K8QriylGTWVCA0awVS848fNhn4AJ6+aZhmpeGXQN4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SmZlMGk5a0JWRFArZ0Rib1FtYXlTcm5LZVdCblNwcFF1ZlpkU2pxNXJHeWh5?=
 =?utf-8?B?TXBEM0hSRU4ySW5jNENFZmg2Zm9QZVJzWHJJUzBucXVNVkF4VHNNNzl0bkFU?=
 =?utf-8?B?Vjh2WUhCd29FU0d2cHBIditsVHVYcTVYc3J4alNRamtqUmRQV21oZ3pwcmNx?=
 =?utf-8?B?ZE1nZ2NvYm9XU2k5eTREd2JBdjU4TmlZZTVNV2tCSUU0VWdOMWtwK2VFQ3BJ?=
 =?utf-8?B?Wm53N0tmRWFNbjNYNTlUcE9kdmRPTGpSZEdSWVUvZVhwSzgyYUxSUDdRTVFK?=
 =?utf-8?B?NjBISDI2MGozcVNFeng5Vm50ejFhRERhME05dFc0dGsrMitBVjNCOVJZZmJp?=
 =?utf-8?B?cVc0czlvWW1ZM3JXTG9RbHBoTUM1V0UvdUpCMGNxUWtXRTdRNXR1SFVIOWlu?=
 =?utf-8?B?blRwWVJibmRQcUMzWU50Y3VUOW9ac2xaUzk1YmdaN2hzdXlHUTI2anhFLzRH?=
 =?utf-8?B?SjRETEw5WFd3dWtoMkxNVjBBMVNWQVMxVURjb3ZHNm4xMnNHZURMc3RLUmNO?=
 =?utf-8?B?NEgyUnROVTdJYWxGOUQxeC9zcnU2R2JkSk40a1BqNkllSGNpQUhOM1JtbHE1?=
 =?utf-8?B?Q21pS1g3c1ArTEdYZ09lYmZIVXNxQTFKVWZzY0NHS2xldzRqSng4TUNTS2pQ?=
 =?utf-8?B?MDF2dG9DcDN4K045bDZCWENrbXpXT1Y2a0h5SzYrTm9qQVNXNzB3d3hsbmVs?=
 =?utf-8?B?UXJ5RzVMbVVrTVJGMVZlOGphZ0NpTWY5MjkzZkNMUlJJVit0R3dQK09LVUJl?=
 =?utf-8?B?eXdwRVA1TGMrV0YwWjhVWExLTHNPQzExSmxXQlpqVXFSUytRdjlaUTUySlJw?=
 =?utf-8?B?SUF6YmxVK1RlQWNHOUlLV1hrWDFia0RCZnZza09FclpjbnZlOE9welIvdVBt?=
 =?utf-8?B?aEdaQTh1R0ZnY2ZpSmwyVWNZbUgvb2ZYaDBXZkpVa0VtaXVUZkJmUHRUMWVu?=
 =?utf-8?B?elJwWGtudmF5KzY3UDN1cnNCenJXNGpNM2dVanZFcm04aW80c2tadGhvMmZk?=
 =?utf-8?B?aFVHd1ZZQmFGSDArQm4zMzZwVFpCZDNuNy9VT01BMGJoaTRTYnFsQm5rY2Vr?=
 =?utf-8?B?Und3bEdxNjVVNjlXUGhGWU92TUtBMUhyeG5iRTRMSFVuTVhrMmY2ZEsvQmVP?=
 =?utf-8?B?Wm5WcEUzYzFKUHU0TndvbTdRTUhJK2xXVGJBMHRNMENIOWlEZ3pCODVvTGRQ?=
 =?utf-8?B?NkdqUEhjVnNieWdIaUZQY2FNNEk5UWhRaFA2bXZKTWpjZjRBRE1EdEZZS3pL?=
 =?utf-8?B?eHlvdTF3OXhYTXdRSmRLb3pjQUZoa1pZSlFjdTMrZjgvVVBobVUvUGtrUE1C?=
 =?utf-8?B?V1RtdCtxMzllNXlvc1ZWclRRbDV3clV3WW1reFREZ1JpNk1YRFlMTzJtUHpS?=
 =?utf-8?B?VjZOanZLNHNVZ1JYajg0dzUzYStWZCsxc1VabEwzaVJqQWRNR0l6V0pPT2E5?=
 =?utf-8?B?NW5EVFZiRWNBSS8xTFJHUVBwQzZPSEdnY1ZINzNVcG5UNmZYTW5ET1RMYXda?=
 =?utf-8?B?am5jOFJuTi9WMnZGYU1LSmdiQnkxWHpZUG1kNmlDTUlRRXBRV2cyM28yYUsw?=
 =?utf-8?B?cnFMWkR1S1E4SGpFRitvZ2R4UEdFQm1mczJ1S3I3d1psVEJxdFVaNW9GL2g1?=
 =?utf-8?B?cnEveWtiOW15TXdHd0FJby9KMnVBaUYyL1huemxnUkJaclJMMVNTSkp5SHEz?=
 =?utf-8?B?WXAzUWs0VE13dW83UGhwWnFZZlFVajhjTlh4RXhBZGh1azZuVzVJZk9DL3RD?=
 =?utf-8?B?aUNpOUE2cDNKNnhScFQ3VE5EQzJVODQwRGNubGlXTTVTOVB2bGpqWXNLTm13?=
 =?utf-8?B?dmQzcnY0TVpUZHo1Vnh5TmRWV0FRUmhvM01rOHorMmo5SVY2MUlaaGh1ZEpX?=
 =?utf-8?B?L1lyS1pPQ1JBT01qVUc2NUhucEhoMzZBbVFTbkhpVGREMDduNFZOdktvVFU2?=
 =?utf-8?B?d0NLSHpvamVDbU1KYkhQWXJBQ3UxUzhod0piUjhmSFFTakNtZzR3MEhJdHpx?=
 =?utf-8?B?LzYvalIvVXoxL2lualhIM1JIajEyS3Mwa0JKczdiVFBWMExoaFpTYVdVdVVh?=
 =?utf-8?B?WkRHalhzcWZaUXdxZWxSUm5xT2tNclpMdkR3dFBIcDBNbXYxQnVCYkdWWUhZ?=
 =?utf-8?B?TForWCt6K3o4MEg4eDVlcXJMMHBhcnFBNWtUQjUySzZWMDBEK1QvckFUYklh?=
 =?utf-8?B?ZXRuOHd0QXN2Q2N1MjFSSkhCMnNiblZNZjlIU1V3Wkxad3E5WUJkeFAxWG1r?=
 =?utf-8?B?bktPNzNTNytadGZ6bk5ZblZwWGJjajFtYWd6Wlh3bU5ENTdEMnNYbFBTRUIw?=
 =?utf-8?B?TktpVEFRUmxHVHZJWFBDVk8xUE1ZU1RyLzJ3alBwdDJzY3ludTNJUnhEdUt2?=
 =?utf-8?Q?RH26xxNYvUOueHzu9aJnaHAHkd28lz0qQbJJM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9c7f3d-3764-4948-4762-08deec6ef134
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:10:37.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYiZruMUd1EyW5xDWHl8Gv4+FkEp/ITYRHX1DSFk/YxNZCiftUv+qvCr7G44b6xTZSWhiV34mUzR1+Pyy14BR7c1zw6tqQpWaVnyKydbX6KYDijTbJ5Qz7dSBP0640aU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10400

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v14:
- Add Rb tag from Laurent pinchart

Changes in v11:
- Add Rb tags from Frank Li and Krzysztof Kozlowski

Changes in v10:
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example

Changes in v9:
- Use direct node instead of syscon wrapper in example

Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..58c4e1cc056b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+    description: Register offset and size within the parent syscon
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port, connects to ISI input via Pixel Link (PL)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1

