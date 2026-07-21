Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703633BB9F3;
	Tue, 21 Jul 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623043; cv=fail; b=sY9bgauMTbKRgudi2Czkq2pfWO7pdrazTkBHsl6d6SdgxkblMnVhhWrNcYVNvT1jq0A/+wbxiE1mAOPlswykcrr0Dz254IgjpVIcFD3YhRYj3FnVWU+O6jLJYr52Ajt4+iLsI8FzDV78yCv4y7Ir2iCovWKrHquxV/lENwGtGm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623043; c=relaxed/simple;
	bh=SBsD52RhB8VwNiMfSROdOX77X0Mf0Bsm4EEcN+dwD2Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MyguUKjRhS+0xjaTFkSQfT9cf/319+CKY5T711rf9yupCuVdX/9vNeSGFCG6E5sEX/LcyNIj7S2M9YftCdStZwM5e/l4kircdfFm8JM/17cHfYvQ2Ljx/JS5YuENAwtLJOelwu763Ug1xnV6JMrSP/zPomQ/AN8s8EX87EmB7h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CcIB4Ut2; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CcIB4Ut2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dd5Q/jB7EaQMmwXyCpabQ+Fuwn4SIbY0kZBCq630K9kE92aPkKa6Cvv14hdipV/Oo0A49AaWmivvdDlKrS5XWl4nl3tmInMBrcJmavMJvKF3PWNd+LUpgf5tmuJlWtQ2M1cfQ6GOuMiI7FKxguseLL+GUaMa6KpBJTMEyjdJjk0ImS4NecIdEu1wMWP4Ucc4/SasvMdzWYzZQNktLY1ujx5JpU3eJM075R2r8UvDX6D9eDE1HsLGcrke8yZKHIQ92ZeANdXkwAMmNz4fMB4w834v0dOU+/t4Npk8TtB+gCA5Y11LsqOin9O4oDk92f+wTIbrxmTsuslqwvN1mMTeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIgSpKCNdUKPw4Zs8Up+y6hFhxGERiog0SRzgGQf5H0=;
 b=GxfizYc59QYe1lyzIdJ7kcg99wp95j913LvHqgEP+rZKyRANccCDBlGNwMswMHsSdTnFS93zoYKkFEuxMAran2NyotaE2wQtqJcw3rBsUE+OO++HOcKHM+NY2YP6LifkXBPhOdY0zxWuc1dsCqSJiurJZk919QylHlt1gYi7bBPa/HKxd5K2mLsS5I9T4KGpzDz8E6waso7ZGPYxUlsmFMOLqJ6Gmr8s3MbwKTpOMGfbugk9O5XcUMvwe/np/+TubX9Vu1NWr5NNozt/OgivGDRvdwrbRXOz1RdSweAFquOebaD5IDpIQR9wSyuVCCALofbyZaqtBS86NCcYM4M9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIgSpKCNdUKPw4Zs8Up+y6hFhxGERiog0SRzgGQf5H0=;
 b=CcIB4Ut2cfKggfSdy6lJOWUX/Rd+M2W3RM2Vyl/mS/bs3EFWk9GlynATOztAXb3wFA05w8wG75Bq39G8fazTQQ9/pEfymyl3HidTjJiEz+sC8s/3z4CjQAb5PesA0g/dLj7TADJiD08f+2Vv63iCFYfRVD0U/pP1eSyZ0noJmvtC1DkuXTIMpZVbfvp5Z1wgSWTbdoNOWzT4iuNdqxdlkyE/MQi66aUsw+ocd/3nfnO797BnCl6PVWE7jASkOxaMBdQoqtBa8PEcvP/660ExaYucAt6g+6oOCv0vIO43vFxIbLheJnHhh1jw82QqQVGJQTB8/tOMsj9OQe/nAMKxjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:37:16 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:37:16 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v14 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Tue, 21 Jul 2026 16:40:20 +0800
Message-Id: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQwX2oC/23SS2rDMBCA4asEr+swM5JGUle5RylFz8aLxMEOJ
 iXk7pVTSvxaWvD98ki6V33qmtRX77t71aWh6Zv2XD5Qvu2qcHTn71Q3sSxUBKQQSdWhb75y253
 c9Zq6OnEkK5BjSFwVc+lSbm7P4Mdn+T42/bXtfp79AcfVvxKBWJQGrKFO3iZEqb206XC+XfahP
 VVjZ6CJRb20VCwTsnHZACHMrZhau7SiWMMGIkejweLcyn/LgERLK8d9M+fgIgYh3NyqqV3Nq4q
 NyhsQ2bD2eW75Zcu5Ly0XCwhkkkBK5A9t3+9nXk+9WXpdvGLyWoFSOom1NxO/uvXBjHN7lkxlf
 5Ib+9up56W3xQcnoimHJoOwa4/wCvB6ACzz15mEEVD+wDu1UcBJYX38OL43py3lZAMqoI0CvQo
 aV0Pg+OrGu42oc5AubxTEpECwKoxvT8ZgnYEkQ47zwuPx+AWBRIGhoQMAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784623255; l=14798;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=SBsD52RhB8VwNiMfSROdOX77X0Mf0Bsm4EEcN+dwD2Y=;
 b=EFdFK3tqKaswTyPQJZ7J9aAu7MteHQ2tLFv/8IpKE4YSAbizKr55jJZBtAF2PUvZ1dcnZHNp7
 817isWA27WeD0J5I8YCl4kbr/4Sr6E73MSHSZdprRdancXjySW6SQ+F
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b962205-874f-43b9-f515-08dee70344e5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|921020|6133799003|7136999003|56012099006|10067099003|11063799006|5023799004|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 mfoclkSvA728Enq6o9snwHP/Y4afNTvGNNzH6869+dEBxOSujfLoez0XwvmP8LSg1wLSPE7GO4iBRzaAl7XzrsDBS9PpibwZznK5cjTpOvxYkqKhscj8LY1lwUdrg/znxGAZ/cBQmhkjPtaBnTcAGp+Y+ZvV46/vvwZxVdzD0lYeTEFb0pQsQGmTTyUagjhYMivxkXtKzxcB5VCfCB79E2Jx7/H/9Y1AB0EUtoiZBgV9ZGqFnvlXYRevWUz67ddIVK2OW4m2uJX04JsCyH8kQJ3S3z/MM+QLSej9iFdJ6oyJGLUVOzRPV+6rWb/JEldMbxeNFJuA4Z1kD39M71DyzsyeHJqw8WtZ+JDEK5n2osE41djZzjijI0ERSHKOANAZ3oKq5OoLuxcB84qwJH6FVNCbpXvuHY4vk9yW/Ngp0blFxKxQ9Eflk/NY1PcvS1GPW3dZW8m2Gp+VnmKnYUZK4vDAASKzKE4zd+R1zCgj28oB6kvmJbpmCeilh9IkLJuw3Xw2JpgCom1swh37w1RPfzSRJpe6q+/XXQ+KU7Ci34dBvzi7r4BTm8Zdf3zoboGUmSVaJaG21d9uBBqsozvcCg+hQrAXKfolUBZSf/+t0+acDYYmfyNzaHQqbWVjcFRz+khqOSE3dK2JXp9W7iSkfb3aRNgzc9zWGWFyaRwlErI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(921020)(6133799003)(7136999003)(56012099006)(10067099003)(11063799006)(5023799004)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RTZVQ1JRMW9iMUFKU1UzRkEvb3BWdEovRE9QdXJJRlJEckg4ZzZ0Y2lmQXh5?=
 =?utf-8?B?NldMSisxTzBwQW5kdk5xemdjTnNsenJtZjM0aFczc29Dcm4vZUZ5cGFQbW0x?=
 =?utf-8?B?dTZCZ1NYOGlzd2tjajFpeGlhdlRuNncxcnU5S2E1M3VWMXhlSndwT2RzTU4x?=
 =?utf-8?B?WExyUTIrUTdpalJMMXNjUmx2MFdmTzdjUFFUaXd0WWhNQWxnQnlzVmFSWkNq?=
 =?utf-8?B?NXFxcVcyaW5hbHFEc0MwOXF1WXJ4UnpHRkRTa1p1RkdwTVJ0b21UaWFURy9u?=
 =?utf-8?B?RUR1bDlQMTYrK1hScTRwZVdQVVBVeUU1citEbmFmbGJ3cEhOeGM4QXgzQm5o?=
 =?utf-8?B?RWVjeS9DNnRtaEJQNEEvUnU0WmdiYXFGZXhLai8yTWhEWlY0K0xhdE9XSW9q?=
 =?utf-8?B?RS85Ly9FcTZudkJzVEhMemVFWDFMQUVZYmxxbWhXZnRXbzR3aENYM2hSMnRm?=
 =?utf-8?B?VytyVUtyVnpDeU5RUmxjWHRrZEJEeUJuMGU1aDVuaTFlbFVTbFRJMm1IOS9K?=
 =?utf-8?B?UWRQUXJPNzRzWHhGbXpsOElPaE5IbDBvdXRqamUwemV4QzJkUmFScEtJdmF2?=
 =?utf-8?B?d21NRGozaVlHYytZOStyc3VudEMyaS9LUUxEZklPSzN2eXZuZEZHQUwxa3A4?=
 =?utf-8?B?SU5uNXN3NFZWTU1GeG5IRkRJV08vbzJzVVV1UVFNSmRobnpucEVrQ0Z1Zkla?=
 =?utf-8?B?RjhXM3pzQmUwaFkxOGZkSTZ2em94SWZ5aDUrK2o4Sk03UUhuaDRKclJMeFpq?=
 =?utf-8?B?ZVdtZUVxQ3BjYUxXTkplWUZNKzZOSFN3SjVUck1hVTRidUs0YUp0RXM2cDVC?=
 =?utf-8?B?TmhXQXM0MjYyb2FMY3VvRTZHUUMvbHUwbE92TFpLcms3QU1tTjNIMEFybE9K?=
 =?utf-8?B?QUJHMlBmbUpwWW5RYTRHM3FWTktMZzExRGg3YjV0cWlIL05rS2RYT0xJRS93?=
 =?utf-8?B?Q2piZ0NNR1IzY0tpUFhzQTBuUjk0eldtNE43QjljYjVyZC9hVGdVR2pwZ0xo?=
 =?utf-8?B?UmxPeW05c1lmUkg5akpGTmcreWsvdGoySFQ1dTl2VVh6MUEvd2thTDExVVgx?=
 =?utf-8?B?T1BoR1UzVWpLS1N1OHZxU3RBUnMvMUoxTUNKMDM3SExQdlZEcE9uK1ZNNVVj?=
 =?utf-8?B?c0pNQXBsSmZONEhseG1SK0NXQ1FLclh5aHkyYk9DTXR3Z0EwWlJtamUyZHFj?=
 =?utf-8?B?c0ZKUTFRUDJ2bUdVVzB5R0kzL29xT3lTcCtUQTZrVXViUTVyVW1aOTlCaGtr?=
 =?utf-8?B?cG9QS0labDZGcGp2RFJFeHZHbmpvSWYzOEdqd3NsZmhhNW9PTEdyM29sdElD?=
 =?utf-8?B?Sk5DUmlEc05kcGk5cUxIUkRwVTVwSFJSY3BqekF1MWt3L3lPOWpjTDlYV3Ji?=
 =?utf-8?B?WTZNQzlEREgydHN1akNsZXd0d1RnajRxQituMU9yMlBDQnpYNHg1Q2FtelUy?=
 =?utf-8?B?akpndnpseVJQa2tEc3N0amRDL2dKYjdLMm5FRlNnNTlvaGc5Y1EvNGt5Q2ta?=
 =?utf-8?B?cW0rOXF6N1daYVVKc2M1THJ5YnRnaTZ0cjJhdWN6eE5ST0VZTEVqaUplQXdL?=
 =?utf-8?B?MW1jeDV3ZU9xb3piWnVTdHJhRGJCYjZuNHRkL0lEZHBVYWEwTTlhaXFIODFV?=
 =?utf-8?B?dzI4bVdwL0dUb2FMM0RFTkRUMS9LTjR3eXdtRDNsZVp3blQ0dmY2ODNCZmFM?=
 =?utf-8?B?N3huNEhYSnRNMXVCVDJOOSsxby9IeVpCWTBmM2taZWxMOUE4b2lXTjA3THQr?=
 =?utf-8?B?OHl3UFlONWJaL3RKNjhWWWIvRVEwL2FPZTU4ZStDOVNGb2NDTnkrWjUzbFZC?=
 =?utf-8?B?UkQ3bUYyMmppbWwyNHpuRkNvaE9iaVN5VHlVS0YyaWgyL1VHTzBrN0gvOTgv?=
 =?utf-8?B?N29mclFmR0xGUVRSaGVmZDIvdmVnNkIzRytQRVkxNmVPWHEzY1JHSlhMcVBh?=
 =?utf-8?B?NzhSUnRyVDdiOHV5TEpqaXd2NXlqVnQrd3dnMkZKOHVpMWtqQm9LYkNzZVkr?=
 =?utf-8?B?MnRNSDFMaVpMWVlKTjc4UVFoWnBudllLMGtZQVJlRFJMTW5BeEZDVTluZUZv?=
 =?utf-8?B?WGRnbjlyb0FXL0dNcjNqRlBUc2VJTmU1Vmh1NnZJY1VjMWlLZ2EvZzF2RUtJ?=
 =?utf-8?B?bGhnSVNYZGM4bEgrOWZhODB4VEVCSmE5U2pEcXVWaGVZbVFZb0Z5M1RuUU5L?=
 =?utf-8?B?bjdQNm5mOXVQSStHNi82TnJjMGlaWnBKR2ZNQ213WU9RT3JvbXFxQTNST0Nx?=
 =?utf-8?B?ckU0OWNncVE4dnRWQ1QzZDZ5WUNaaWtEVGJNbjlvYjcyaWtZbVl5ZG9kU21s?=
 =?utf-8?B?Q1VDSk5aQVlPa1QrdHRIY1hFN3J1b010K0c2cG5hTEU4cEptK3c3ZDkvUmxZ?=
 =?utf-8?Q?pNDinXrNzoc3r/IG6BtHZJY1/h8tYi4Im5nUX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b962205-874f-43b9-f515-08dee70344e5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:37:16.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPlR+8MWKsKXQh7rlpaTnoQI4IfuSiWMmbFmCVUYOMvwoDub3aFQUZqwdpmhmIYEPi8/mzA0hxhYu0QdeYKz/6AFKttcCTymucYa9QZcez9WbQMTlqlELY8FghTf1YBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

Background
----------
The Camera CSR binding was upstreamed during the pre-silicon phase when
the hardware integration details were not fully finalized. At that time,
the syscon binding focused on the CSR's primary role as a shared register
provider for clock gating, QoS, and error handling across Camera domain IPs.

However, the Camera CSR hardware is actually a mixed-function register
container with varying control levels over different IP blocks:
- ISP/CSI: Clock gating only
- ISI: QoS configuration
- CSI: Buffer overflow handling
- LPCAC: Error handling only
- ISP: Pixel link selection
- Formatter: Complete IP control (full register set)

Why Child Nodes Now
-------------------
The CSI formatter is unique among these IPs - it's an independent hardware
block whose complete control registers reside within the CSR address
space, not just a few configuration bits. This architectural detail was
not reflected in the original binding because:

1. The pre-silicon binding focused on simple register-level controls
2. The syscon pattern for complete IP control was not initially considered

Discussion with original CSR author(Peng Fan) confirmed this reflects the
intended hardware design that wasn't fully captured during pre-silicon
upstreaming.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v14:
- [3/3] Use select MFD_SYSCON instead of depends on MFD_SYSCON (Laurent)
- [3/3] Remove unused v4l2-ctrls.h and v4l2-event.h includes (Laurent)
- [3/3] Rename csi_sd to remote_sd and group with remote_pad (Laurent)
- [3/3] Move reg_offset after clk to group generic resources (Laurent)
- [3/3] Remove mutex lock as enable/disable_streams hold state lock (Laurent)
- [3/3] Rename formatter_dt_to_index_map to csi_formatter_dt_to_index_map (Laurent)
- [3/3] Rename formats to csi_formatter_formats (Laurent)
- [3/3] Declare loop variables in for-loop and add braces (Laurent)
- [3/3] Simplify set_fmt, rename sdformat to format, drop NULL check (Laurent)
- [3/3] Set field to V4L2_FIELD_NONE as interlaced not yet supported (Laurent)
- [3/3] Add streaming check in set_fmt to match set_routing (Laurent)
- [3/3] Add WARN_ON for unsupported data type as it indicates driver bug (Laurent)
- [3/3] Return -EPIPE instead of -EINVAL for invalid VC (Laurent)
- [3/3] Refactor ENOIOCTLCMD handling and remove redundant pad check (Laurent)
- [3/3] Use strscpy instead of snprintf for sd->name (Laurent)
- [3/3] Remove redundant dev_dbg in notify_bound (Laurent)
- [3/3] Simplify remote_pad assignment and drop NULL check (Laurent)
- [3/3] Read reg property directly into formatter->reg_offset (Laurent)
- [3/3] Store formatter pointer in drvdata to avoid sd_to_formatter calls (Laurent)
- [3/3] Enable runtime PM autosuspend with 1s delay (Laurent)
- [3/3] Use PM clock framework instead of manual clock handling (Loic)
- [3/3] Add Reviewed-by tag from Loic Poulain
- [3/2] Add Reviewed-by tag from Laurent Pinchart
- [3/1] Add Reviewed-by tag from Laurent Pinchart
- Link to v13: https://lore.kernel.org/r/20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com

Changes in v13:
- [2/3] Add Reviewed-by tag from Frank and Krzysztof
- [3/3] Add Reviewed-by tag from Frank
- [3/3] Replace pr_warn_once() with dev_warn() in csi_formatter_get_index_by_dt()
  to provide device context and warn on every occurrence (Loic)
- [3/3] Add WARN_ON() check for csi_formatter_find_format() return value in
  start/stop_stream functions to catch unexpected NULL (Loic)
- [3/3] Use regmap_set_bits()/regmap_clear_bits() instead of read-modify-write
  pattern and remove unused csi_formatter_read/write helper functions (Loic)
- Link to v12: https://lore.kernel.org/r/20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com

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
- Link to v11: https://lore.kernel.org/r/20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com

Changes in v11:
- Drop [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single quotes consistently (Krzysztof)
- Move properties to top-level and use if:then:else (Krzysztof/Frank)
- Link to v10: https://lore.kernel.org/r/20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com

Changes in v10:
- Rebase to latest media/next
- [NEW PATCH] Use single quotes consistently (Krzysztof Kozlowski)
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes,
  requesting re-review
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message
- Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
- Add MFD_SYSCON dependency to Kconfig
- Fix stream/VC mapping potential mismatch in start/stop_stream functions
- Link to v9: https://lore.kernel.org/r/20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com

Changes in v9:
- [NEW PATCH] Fix formatter as syscon child node issue
- Link to v8: https://lore.kernel.org/r/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com

Changes in v8:
- Rebase to latest media/next
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Link to v7: https://lore.kernel.org/r/20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
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
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (3):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  71 ++
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  88 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  16 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 751 +++++++++++++++++++++
 6 files changed, 935 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

