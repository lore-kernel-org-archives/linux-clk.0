Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5D34E766;
	Tue, 21 Jul 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623062; cv=fail; b=e6HB5iOXeXkKvVqt+2D/woXNllfIHJOYYU+zLRnb52ikOgK7SSVMUR7rj2RZVBL3ONfKXcUiAzIP3V5+f153+z3DZ5HNbcAQnTV2B+p8HzqCtySFszQvtbNdrOkeXTcwP+MqBUaZbOaVjI+Dl9AYRS6voevF9Wx4myqf+qKJ9wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623062; c=relaxed/simple;
	bh=TCX7A2oiu7gtBo6TlBFxkAxWa8FFVur51ew3sEC9jZ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i7+5tUtj420m6wzHrZ6JhHzRpsrPEh8qP+8zhv3bu+UvOimqUL2B1R43Q+zDD+raNZABYWv03h5CgjEwjQsjA/EuzmziqQ6s6ldXy3HFPb3yrnQrovWRhDuZ9J9nVZOFs9yINE0uffP3Vcu9ja1mcf5WmYAd/KlXBcERoquUS+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cmwJddjs; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cmwJddjs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snr+kJwduIRYbvFI5rakS4kN2HKsOh0ya/aueT9Fidtwy+OCrlyPaO6zdm6HvUE3VhEajQhjWf3OK8hUSwORkiDyz5Q9MWDQz8SAxblzLVnytRPl6au9GB/JMpVjijQO2YpWT1z+p/sxU4FFAn7VOmOz9SOn5II8Q60jrByUTAl7pbbiezu2oiq8ZKZp/W+pO6t/uud24RkNm6YYJRjc6reIC5lRYsYa3mxrr7aWU5G2cUMWIusIVuzB6QYCARew1cHMymwltrWvrcder5IF8makCO1TASN5xdLpqutDcXdmvziFfBipQeakSixIlHg+5x0jwA/kbBszPBdUBn8dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J7NI2E46GpfRKinBjDtZ3aeOdKwAhJRjICk+7a6j5s=;
 b=k2HAukzhARRHcAXt8h/18a4gdBurTPtwGQDOVWN4XPeUMRr2qn/Inwu3yEazPN5XmYv1ZA77L+v8CsnH8822w8vaLMb9tXtDi+0/9CPUHhixEByArUGBKHCs3zlnM4yDi7CD6i61Uvbfw95dlmR7ecc+35bUIrE6CwuwtiKpg2h/s9mlJGCeZ09WaNjjJnkYZj5vnEFLn1PGRVfJ0jRncnvEqC9BTziNWYKle+295+QsGo0i5evtUujgrHYa9aiXf95kSRoDtphhNDgVATjhxs4JQyBbnjghp3p/Sj7f7dob2ZCYTuV93gaYJBLTnZL8zOgkn0w/Ekcs6P8lB+teSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J7NI2E46GpfRKinBjDtZ3aeOdKwAhJRjICk+7a6j5s=;
 b=cmwJddjsLre3NfSF83z/QhthF+SvOMdDIOje2wbiewQMi8XwK0UAAw5lgDib5ie79POLqXp6n3O6Jg7ydkvoctzkyHj5dFSg24cp4R/eZe4X9Igz7LCld6W0zARmd/njdC50DhBe9tUxHk/XJsDKbYuQsUGr9kqSQ99nuqEs0H3iRyuxBsxuSVEVwVMEzbGmc4sy64X1w0BmaWGCbZwVYAwwQuKw4eD8mO5cYEXn7rgcPlCb7wyEfGeWMK7ryq31py67JbOhGwf5wz8eHjEcCigh8lsqIE0y1/g8U9WnL6FVhRTYSRdgTp3YFVxW/0s42pdUVF4Mel1lFyqneTx4hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:37:35 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:37:35 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 21 Jul 2026 16:40:23 +0800
Subject: [PATCH v14 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-csi_formatter-v14-3-ca239fbb441f@oss.nxp.com>
References: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
In-Reply-To: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784623255; l=30637;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=9Oyv5AqJTQR6TCnb+lYz3UEDorccgQGIyteSvEN00Us=;
 b=lnZ3+liXZT6I2SyR83Ob+IzpvBsS6FVVsNeo6GHG6kYFhCvx/8htkjpUF9o/TTvR9VkQF9z6u
 T8g80OUCklYCqumy11Bh1mOSAROYoSjMgN9jAWJVwY8++kC13V5GcYN
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d801da7-c4c0-4188-9632-08dee7035023
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|921020|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 jElXWb5Z88CWz2eyAiyWBY7NGd65Ll8P1YdnF7dEMYkJr9exYGkjZnzKd19zFFkI48KM63Inn1AwcbbO26rliiLf2121G4tHovXFQAqU6UyLYYglzXjGDKTG4h+3PmlgsmDhiREvhqXjYFGQZN1aN5JgZlnsZFeXVMTPhLHYftaRpJLszsn+5oXRDgDrNgYQp1pNiXawiY5b40RQyTWDDBPMjHLusIXus1ix35hTkhrSfICbaVgLYBmvw+hFkM8k2ILWvDBHSr9qLh+jhKHdUk7YSChrt5oYn3x/F0XXWwMPxo9AQHmZDX9X/IWcSjormZt+X2TM8ODG7mx/IsIm9J3jaXBKxyadPjvfqLyyORkqemXblGs+cYDjf+fh5W/oI/zmHXfB5veQL3uwI3JZ1c4ZDdIvwM3Ia0tgw0XCWs80jROvjd+i3613TmY+5hKhfY1XdKkXKmfYmwLS0PeLb8YvLrJgsQrLdTWu2WsxLK99uyMr7twVsxJPA+6GrusQU0amcBvGBXguKaxKurL8r0igPdPGv8RcMkGN19Ej7D9KzXnE9mP8GwNPJ2dn+dVoNONfTlUrboXiAXcJ6mEPbS02iNc4UY6CJaL5frjW3EwAcklBMs1Cwz3qJAOmBM8In2t4GfQzjyYlbiVPOJ5VBNs3ogWdarwacpk8KOZJRwueZUywQjdpR6glgT7tmteWICKe62iPFsMebEDfpbumaQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QU9aYTkvRkhGYUxLMURta0RDeHBVVnpPc2hvUGlyNWpvKy9YelBockw2RVNp?=
 =?utf-8?B?ZWg4S2xIR2pibHIwOER0NXRSZ2dGL0Q4VHJhdzBsazJtbzE4ajB1Z3NvUURR?=
 =?utf-8?B?RFM1a0I0ZnhvV2FTVzRCVUpsc2xuL3B2ek5HTnd3b2FnaGVBbGJPbXZ4c3N6?=
 =?utf-8?B?QjBvYnFibWV3OGZkb2V2STV5a0tCMXZ4M1pTZUNYYXdnU0xRNWJPaS9PeCtt?=
 =?utf-8?B?NndxMm1JZjhLUlNXalJuSDd4Y1RSdE9iYW9jYVJCczBBM0JpckllbTcwTGNp?=
 =?utf-8?B?TmV4V0hTdGFLNTBTQXJIT2pvQVd3YWZaM2wzdW9GeFlGU2Q5WWorOE16VlRD?=
 =?utf-8?B?Z1JCczlWSzBFUFI5YUZ6amRqYmdpQy9RWlBMQnZDK3I3Y1N3V2hxUm1qYlZG?=
 =?utf-8?B?NGwxOXg4NVBSRnpTTk55WTBQTGdCbzV3aElFZFY5RUo5TlFVdVgyeGprdkZ6?=
 =?utf-8?B?NncrY1FiRDZqSlhvaTNFSGpqTTJ2VWZDbzlaeHhST0NUNnNxOWF0a3JDeTVz?=
 =?utf-8?B?UzlhblU5TFBPT0JJTjlWaVd1aTUzSDJpNS9GcUdHNkZqUnRBaEhXcHQ0aTdO?=
 =?utf-8?B?eFVaekxpR1BpMWtwcm1VbEthQzlpNjJhS3cyYnJpN2I0dE5VdVZnVVVPNk5s?=
 =?utf-8?B?R0phc2lYRVVIRlZwTnJFU25WZ3p3Y2pYUUFTbmFZeGdoYVVhamJ0NUpuL3cr?=
 =?utf-8?B?SE0yZlZremRoaGlEMWlWNmZZWG80N2luT0ZhNS9kZTJUNFA3WDQ4VjFHY1d5?=
 =?utf-8?B?a05NemxtUFZBQmJRbnpCVGd1bmE3MHVHS2crVmplNVgwZmNyZFdpcnNwVjNF?=
 =?utf-8?B?VXdCdWs2VS9OZXlzZzBvdnN3cXFuVXpYRmFOMGN2M2pMQ1REMmIwVWJCYi9S?=
 =?utf-8?B?dG5CaXZhcTNITU9OQWphQVE5ZjZ4Y1FCREI1UGlqV1pNbTFMK0N0Zm9tMUNZ?=
 =?utf-8?B?R1doQVk5V1lOYlFtZEIwWmh4RTQ1Sk5ZYmhGekIrZ3BFOC91RGR3YVBRSGJQ?=
 =?utf-8?B?a0d5ZmNOZllqZUhoWjJuUTVLZUdnRkQvMjllelJJZ280aFIxQWozZENkdGxw?=
 =?utf-8?B?dUFSZElMblRLT1F2bW1QTEhPTE05MzVObG5xZlJCcVUxbGgzaFYycHlacjFG?=
 =?utf-8?B?ZUNWUWtaaDJXaklRMVNXRjlmd0g1TmttQVM1U0w0Qk02a0h6YVpkOEo5dlpY?=
 =?utf-8?B?MmxRcXRoK0VtMXpJTldmeGtaeWsrK2diRk5zSnR5R2Rodks0WS8wMTF3ZlVV?=
 =?utf-8?B?RWdEVHdGeW43dzV4dCtRR2VxT3NYSkpSTzA4SnNBeGFRSkYxZ0JSYUVlWkQ3?=
 =?utf-8?B?WkFkQjlyeWZrc2s3Q29Yano3SWc0T2JMMDhGMXhsakV1b1JaeVYzUm9GTXln?=
 =?utf-8?B?eGw0OW9sdS9SZ3JXK0RPRXppcG5lSVlBcFdoUEcxZFFmaEoyWmlHdlFMNm85?=
 =?utf-8?B?SEppYzJ2TzVnOXQ2NWJON1RwWFJaekI1Y0NBc1pwWmFXSExxbnlrUU83KzVk?=
 =?utf-8?B?Y2tvUkRteTFaQ2pSMWs2dmRpTmJyYjdqWVYzbzRCc3dDN3pZeC9RZVE5aFpS?=
 =?utf-8?B?VGFrN2wvOUNIVnZCVHFXRjZhaTRKeXY3Y2x1bmZGL3dJQWQ4c0c3RTRYUUV2?=
 =?utf-8?B?N0g5c1JMbWFETEt4ZDl6STU2YVdMOGlpd2VEcU15MEhmUnZSWkEyL2lBOTh5?=
 =?utf-8?B?UU84ZTEzaUZ5bzRMRDU5bXhtYWlSZHFTc0JFenVIdnZJaGFsSSt3SlRkNWkv?=
 =?utf-8?B?bGcvbjcxU2kyam5BZTZYMXZPUjZXaWt6Y1g0eVZhMU5ZN3RaUU1UbE1ydW15?=
 =?utf-8?B?MmNjcGZMOHYvRzNDbms5QUtZU1JsaXQveHZnbXhMdEdyYnBDS1EyeHdGeEdu?=
 =?utf-8?B?SUFOT1RURVF4SVJPVHdVa1hlclVPajB6MTI2R0grT0RRWXNqRnpLaWFGT1U2?=
 =?utf-8?B?MUtzYWJWSy91ZzlnSDM4TWxyQ3h1UTJnWVFsd2hEenRPOTR0V0Q1cHo5YUZL?=
 =?utf-8?B?YXRDcUR1bjlMRzdyb05KbFFYY3FDSHV1RkZORnF2b05OZnROSWVxeXFIWlY4?=
 =?utf-8?B?TW1kakxwWDBXZnNkQmlQUE5jZGNVRlpNYkNOaUkvbW43UHpxYlBMNlJmcHEy?=
 =?utf-8?B?UmZVYjV5dzNReWthU056M0thTDlibGdVeW5vYUxzN0pJdEd3SzRUdmMrWUxv?=
 =?utf-8?B?SFBSdEJLUStlaFVBczFPREx4R0YzcGdLSjIxV0hMSXhuNTFiUlRTclY4YXlv?=
 =?utf-8?B?YUdRY2E1a01zSWtJNXlzTVp5c3VsNHJEdkpWcGt5RTJramE0UkpJK3k0dkFx?=
 =?utf-8?B?OTZ5NmRheXNtSFFxQUlwMGRmcTZ3YUtQU1R4aDM5YWU2dm1wQXFxM21Ca0Zm?=
 =?utf-8?Q?oZAUbS7k6O3svf5Hcdl+nWFZZgbJyMrWf55kP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d801da7-c4c0-4188-9632-08dee7035023
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:37:35.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoWuVjGRZi+F69VCPwSTNFG95D8TcMwZI1soBalxaCT268TT9EEvBEebLynT8AD7tZE7Tkn/aOtrgruxRLe66XuI/TvYCr3QRCFCbkbH+zTwfMYOj2k7nCrV5ZtWOapS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
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
 drivers/media/platform/nxp/imx95-csi-formatter.c | 751 +++++++++++++++++++++++
 4 files changed, 776 insertions(+)

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
index 40e3436669e2..e714bdaf65c9 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,22 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX95_CSI_FORMATTER
+	tristate "NXP i.MX95 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select MFD_SYSCON
+	select PM_CLK
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
index 000000000000..7ccb3eee3a5e
--- /dev/null
+++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
@@ -0,0 +1,751 @@
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
+	dev_warn(formatter->dev, "Unsupported data type 0x%x, using default\n",
+		 data_type);
+	WARN_ON(1);
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
+	ret = v4l2_subdev_call(formatter->remote_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
+		return;
+	}
+
+	if (ret == -ENOIOCTLCMD) {
+		fd.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd.num_entries = 1;
+	}
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
+	ret = v4l2_subdev_call(formatter->remote_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &fd);
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
+		fd.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd.num_entries = 1;
+	}
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
+		pm_runtime_put(formatter->dev);
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
+		pm_runtime_put(formatter->dev);
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
+		goto err_cleanup_subdev;
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
+		goto err_cleanup_subdev;
+	}
+
+	return 0;
+
+err_cleanup_subdev:
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

