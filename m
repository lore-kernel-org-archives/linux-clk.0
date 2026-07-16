Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619338C40E;
	Thu, 16 Jul 2026 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185830; cv=fail; b=jq1RNFVnPptzRdJk1/NLXgtMNvgRZFk5vNk1xyB1sDhrScprvh0Q5LJ1pIxRmgbJn3kaxIlY2oUOkV++vGjTd/PQrOniWMRtkhol3PTjtdKwVCG03BYuB5/HJRxGFwa12oe9Jtk3zWtEGvebJaDIAi2dg5HRoJ+OLA5Xkazqoww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185830; c=relaxed/simple;
	bh=GurUQJzJvtJT8FF2gPhOa+H7mYaadlr+RdjiABwCVS0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=faQ1RxhZfDqsmin0j4itXFrRi+KEg206B9HyuyHWd9a6N3uCl1txiY2lQYHuVtVmr63TfOdONj8S7eD96DXMt9kegqBYJx/b0zEpcgyzaLGFeFTPN+CpEMKNRDPwSD6PRwekXKlpNE5k1uNUy6XyidiJ8ACX531hoqrMJH93rv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=No1V8Chf; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="No1V8Chf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDUSZ1w8FXugQHQQmhGYBIW7Pn1EHVp822MAPUCmD3UP8s3bU9ytMWSfRftFgt0fAYNq5Xk/7dcCDFL926lqZ+noqtyVgWWFvHDzH72DsJeGHhxRsG1EYNMHF1CzylCnimE3sTyJ+5xxFq9JOevgknTmP9j06ctZLHEuUtFXWKxPetIIEGjvpQ0qzmlZc/DhzZ3LpfRjGWGeSOyeSkZB/I3iAkfU4Wr3MfJZdxFTYNDYfD25p8vdS/eMeJQ4PvC+jJ8MbAlVEEMDJ+KGbzyv5PkwYkJcNJGfHYnfu7xEk2pVFKI3nOFSNiQjhR2/xV6+VpWwE4KKaArxDzBP47opqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=y4tNMAH6bJi8ECNJVV9KT+xzeurUtX1sihdwsCpLWI7LSHk1uPic6lXNkqbDHtt1pnaSEk5YFROsr323VvrOazCGwV4tjCYANELRXDybC46V90VBbMEJO9+xw2mCtss+pufJU4FN5TvwwtTd4/LFfUGw+UawhZ270jGY/stYv60k16qDxc2037F1LuCRw8RhZymbTiFtjs/EPt0tcNNoMob4I3ZtqAb2n/ZyfRlyIe00d0dzwi7flKtMUe14fMXl4ymK2/F7gclpfBuZLd2WTMlmzfRIDT+VqPYa+jKfDpwWYec2SDY7FPXCrhfyF0UF7gytl4smR8OwKdAoSrYs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=No1V8Chf8gBU5uOnJ4r6oEuCEWZxCO0nMfbcJyqd8AHfZGLignQwG0HVz96dThNFynR6+8InJZLVN5gq3NA6JT/uJgcVxs7hczy11zgSKQimwduf00nvM91UCKPRxrYnaFWUHPGx//ekpw44+T2Wh3Pb8T4NbbjHSqeE7OsHmcJok8OHfSd9N+HpGg8b16bWrzdYXN0zveiWldasaBigYsByv3MMX0lwHA6MNiXGE1NQPSXO8LROiTCfatpOEvvVacnAhdNHP+j7RmJqVFbcyWqbUnKNYLW3D9phshiwRlJDqbv48KzhsGLHoREdHhbKqEGD98ICn0VYTLLchXD4Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by MI3PR04MB12440.eurprd04.prod.outlook.com (2603:10a6:290:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Thu, 16 Jul
 2026 07:10:25 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:10:25 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 16 Jul 2026 15:13:49 +0800
Subject: [PATCH v12 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-csi_formatter-v12-1-2601d17fc4af@oss.nxp.com>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
In-Reply-To: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784186031; l=3877;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/Ko4SnCdgWFQqzXj40GCNla/+xzXD7beCnJKpA2ezSA=;
 b=5pAeGH7C4HGA6HMqorq1RhOhWbmbYs02GwioYqYYx5hRuCCkNFU7BDDGfEkrR0trSDfI36jff
 l8dk1RMDtJlCs0KNkrvEM23bItksv1Le3DxSpTmbDuBYTJh3Tvv0nI5
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|MI3PR04MB12440:EE_
X-MS-Office365-Filtering-Correlation-Id: a31badc3-ca83-4ccd-230f-08dee3094ec4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|11063799006|3023799007|18002099003|56012099006|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
 iEBhgbtaawElCheXPc8Ovu4KQFv93Q5RdUDPmdfbcTyM2GNYhrCP6pqToWVpY5mkBQitAdlq6u39V093MNTXHVM33L2YfhgrsbMVPx+em3DVU2dPNUsm1E2XEYqamTHdDoiqWFrkcx5kCvcqGby8Qu30aYJKUzFvejnC2h8uBAjDnELPaTh/zg2pf2H65q1IQI3yWvrSkFZBJVsFd83IdmenUr5MgMEwl1KChzfeauR9xjz7VUiT1Yl4WJ7/8Zbrt6kFjI4c0CxpzFiaTvXDACKCRxNh7kZL0J+IjwNUOmj7HKgTq+SVTWngU4Jn6cad3a9QmLNzqyXKBMv1Qk8PQpkrachldYPbBr4mtnIzHcTBm4bBCoH23Lu8k6nhHxXCpVvnpXC/r1bWvNgIA257qvfYlWUQM4XCIJlpUvt+mT2LO80W2a+V4wC6Zo5p4ziPHdE0QPCoeP9Au1MqfeFh5HLPd4PL0OBsCi+N5X8qxKSLsyV9YKaGhbgFZjhC5KQ5qYx8rNu58U/dRTn2v457C4jAecwpsr8wGoA0sd3ySBF3vovvGX2mw6FNHOSx5wrhXEVKhgrOe5WzBzAUTP0ewg6BvFVNgUemmXMDmZ2XfMA2mOVgWaLjrpGBDj4v22H8YCy9cFB+5ns8ZtNWEqDurBSK4MAmYkG5wX0FOt3La50=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(11063799006)(3023799007)(18002099003)(56012099006)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YjM2UjJ1NldPeGU4a1BzY1Q0ZWNsYXh6bTFheWlTYUtCdmJIS0JKQnJUdWdv?=
 =?utf-8?B?Z1luZUFUL0U3K3MzcWNyc1o2Z0VkRTBmcFd6UXlwcDAyYnlKeDVkUkdrcnBF?=
 =?utf-8?B?WUppU1JLNTZzVytCK0xYYlhVVGhmVVAvbE1QWW8xMkZheGxXcWFwOWVYbEZt?=
 =?utf-8?B?Y0dyKytvQjNNWnpIUW9yNU1TT2NjZkhCZktEczQ1blNzT1l5eFY3ME5maVI1?=
 =?utf-8?B?cXRvOVZROERDRTYzREswZjJIaHJab0lxaUNVNTd2Y3NMU2xEOTlpMDhyb0w3?=
 =?utf-8?B?V1M4MjJFb2psSnNwaGJGS3U3elB1dVhvdS9xMWpCdTd1ZVNzajEwek5RNVFD?=
 =?utf-8?B?TWNyQUd2QXRlQUg0aDhHSkludjJmM0xNZUxRalFwNks4RGJkblFYemhkYzlk?=
 =?utf-8?B?a2h5VkhFR3I5THRhOVdWckFqZEMveTV2V3loZVkyRi9WeUtRTDg1dGxWaC9u?=
 =?utf-8?B?c3lhdmxxS0QvM2l6Mm03ejRQaWhkTkp1UUVmQW1zZFRFZ1pQVEgzOVR1ZTNM?=
 =?utf-8?B?cFlYam41K1Zxam1nUzBUNjBYK3VXcXhsSVZLaFpCbStnZmhyd1k1NjFGRUlq?=
 =?utf-8?B?T3dDSGw5aTlnNU9tak00andmeXhDVDZmSnlzTTJYams4ZFA1bVZ2TGJOYmJI?=
 =?utf-8?B?ekhuRWxZYjhDTSt6eTd0enRqb3NQbE10UWxHOTZQZFhOQjdGUVliOTYrYTg5?=
 =?utf-8?B?NzJhdEE4WEhReEY1ekU1ZFp5M0J3eXhjRmY5cHZVeXZaRFRIeE5uSi9hUFBr?=
 =?utf-8?B?bHVXTnZsK1pyOGY2c2h2ZzBTNHNGMWM0VlRRb1RZZW92YTF5d0xGWThOTXJ6?=
 =?utf-8?B?T3hIZ2hPT0hMb3AxL05rRWZReHVSMjVSL3J6V2YydmlEbC9KMk9NaklJSXJw?=
 =?utf-8?B?SUtNT2RLQzRDazdxOGhpSERldXlTSlRNRTQ3KzcrSmRwWmRWb1I3NFFpSGdk?=
 =?utf-8?B?QWQzN0FxZ3dicThpRnJJRFJISTZpamlNcy92Q2p2bk5pU25DZVhHaFJKR3pN?=
 =?utf-8?B?cTdTWnFEeUF6NmRaeHVMZkNUa1U4R1pyY0tCLzlIeW80aTZHandwRFNzNTFN?=
 =?utf-8?B?OC9laUxtTUFWUmpZT2RTVG53L2RQVGZkZzJ1YlUxazlLNVhJb0hmRFZCQnBq?=
 =?utf-8?B?Zy95bnlhZWkxdkxjVElLS0xDcDhrbWgxMnpKMG14NFBwRGxrWGhHQVhhVks2?=
 =?utf-8?B?TUwyeHBhMm5hOUdMUTU3RGpobythSnBEM0RXREFwa2swdk1JSDZOWVBXTTIv?=
 =?utf-8?B?blQzUHJCVENOeTBiNnhweXUvMndwYlh3RkcwUWdJTWF0cEpiU2svZC93eGZl?=
 =?utf-8?B?Q0xESzVOWHUxOWZVci9lOVUyclVBNHZJK1pCY2xpbHYrd015ZE1oL0hhRjdq?=
 =?utf-8?B?VVVaNy9rWnJsNjF2OXdjb0NaMDhMSk1ORW9JNWUvcXRhaVJZWS9oRGg5K2w2?=
 =?utf-8?B?QXdJYURBbEFTejRUTklDMURldmFJVWJEOUs5UkppWHNjV1FpVDVLVy8zcUYy?=
 =?utf-8?B?WVFCUzNsRHJoWnpXR0RBVXl0a0RCTDNVdjRqRnFTZzBpei91MFZMdHFwbFZp?=
 =?utf-8?B?YWxOajVBN1l4dmJtU3NrMWRpbzV4SGFQZjJVWGU5UHVnZ0ZGYlhRKzVabGpJ?=
 =?utf-8?B?a0JoMnFHODROL0VmZmxDb1lTZmYrVHljN1hhc3hlRHJzR2ZBR1lNbDN0SDls?=
 =?utf-8?B?QTJDeko3OUJFMmZXWWVXVEJmb09vV29Mc044dnhWcCtsengvRkhXZ3FBZEJJ?=
 =?utf-8?B?eTRXN1hCR0VnakRDaWdlWktkTmQ3QTViT2xKelZXR3ZsWCtEUFRSYitrbXpl?=
 =?utf-8?B?SWg2TTN0M3hrbWJzUXk0SElmM2RCY0l3ekV6NFVwazlnVzBhcmlxbXRoMDBZ?=
 =?utf-8?B?K3BQM1kyMDRQeXAvcmducS84ZHAwc2JyZGdPT2tWcEs1dFRmSkg2Rld0aGt2?=
 =?utf-8?B?dmE1TGNQeVROL3FXTG5EWHJmQm9KMnJ4S1BTTGcwQmVIQ21ESC9iUEMxbHdw?=
 =?utf-8?B?NlcwR2ZCdWdRLzREVldEVWdPeFlUaytCUTJDSFVGNWFjdUp6Q1NhMitsWmF5?=
 =?utf-8?B?b2ExeDVyL1FINDM3RENTdlYzZGs0cWl4T2VVY25HQnNWL3RnVVlrRXg3TS9y?=
 =?utf-8?B?WStiYnNhMmFoZGZNN3M1M21lSUVOV0V6QjNscHJROSticExYNU81ZmVkcTh1?=
 =?utf-8?B?aUFzOHhJOVhaeG1qZlk2ZmpyUW12azVVMi8yeWxCUjlBNUczeThZbzJNZC9Y?=
 =?utf-8?B?U0FaNmlhTDRDTzd5TVRuV1VNZUt2VXh1Z0t2YjA3M1NrOHp4UEdPaS9aS1Jy?=
 =?utf-8?B?YXBvbHRTVUxibGdBekc1WVNhVHYvb0s4aEs0Vk51OGtKb1FUb3AycU5FVS8y?=
 =?utf-8?Q?ErCUwgy/LIzT999da+qij37aVyWuB8OSZsOCw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31badc3-ca83-4ccd-230f-08dee3094ec4
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:10:25.0611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RRrC/9STTvyHhy66Tlb2ffhWbw2joWi7LbE5Sw+PsfhDHLAqibWV9pVPLI6dzMQxwL+JiCk3wY1rWvunLY5h1YYasa5WSsCbO1yklo7coTKJ14f55VBL9D8DRkNEgHj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12440

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
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

