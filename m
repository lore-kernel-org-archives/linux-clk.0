Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E536920C;
	Thu, 16 Jul 2026 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185823; cv=fail; b=IcjVu19hsc9SfWkMUoSDSqtrnU5GIg7HNfaafsU2tiYsjAtqHyeuaJpZVBXn1Sb2x5t5N5065V6iP5Js+LcyA0Ep9SUiBKdUmxzjpjMQDS6Xw0GEwDcSePbYUapHMW1o4SkNzCOKMrn0yhgEGZMxT3IknvN1T5QnKrdiwVTwSg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185823; c=relaxed/simple;
	bh=yWXcKWDwzjGqFqA8nNA76jy/e4qk5NXKxRtj2CdSAcs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MeU9TVq4GAY0k/N5FiqqMh0vJgUMbv09fjNu0F/yDDC0DoRuBrdFRij0zZQff1iC5BIdxcM4DezY3pskTtz0nHCF2tv/jA/4lmnADg+o07eLNuPqHH93EQTztaAptINcR1EDF+gSuDnKjKyP+USSXPlH+baRQVMdlHI6I5TI6Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DCU3GXvA; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DCU3GXvA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMM//7YtyhiAiPYEBgSmb2/Ws6jfC4p8Zg35/Di19RVKZEt/YEPo2+Et8zl4W3PAGXR2bWXHa3T7H3DXykdchLJVhdn0qs7XbnrVPg3hkgvSyz3eTYk+tGkfMUT5Faux1lP4lgPZFoFLUt4UkG+r8glilgE+xQ129gAXDvqlCNE99+6PtY1f9NfLZa7RJmxgSGjnze5cnwnVnv+p2wyKxvCtCkRa+gNQfAhaQeVv8zEVfaYrCGD+FyT2jxYXCjXNgAUiJK3BkuF9Jxc16JL3EyyYlkfnpFllhK0RlaMcuGdvUdtGlX/B5wt9D58ujQsKFB3L26JbK8yg9vSkn4q0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nJY02tEr49NOhAWpmUYEjwEHuGItqphomvwL9h8gvE=;
 b=DQUy2Mb2z6ZaIKylDqKNhDiT0of+4ufnUARLYbnhYMSHSD8ounLAWNapHryHB6flRCGLvpI/EczSkS3Aj9boUC/KP63fmBq7vznbxy1qt4S10i/f/hKWW0Vz7srQrmDYhbW+p5SHGott6ABN7oddJ+0f2m3z+GtcnEEgTX6jHPnqEXcdOIjDITIXYIILGcdaz7mNqhstUulrDgAGXSk4MMBhNU6N7hJirzTB+kIXOFWYeMmuLv4dS2QPhzqNKEhVq/lxxIQe/tJBofnUkduaEZzZzjEBj+vT8npIH+piH4XN5Sl/eeIkDY9nN2bIvDtmnqXyfbw/bD02yVXukYdiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nJY02tEr49NOhAWpmUYEjwEHuGItqphomvwL9h8gvE=;
 b=DCU3GXvA20/oXcoIK4FX/bUpO38cAcoA6L5DQlqfMzheVR/JMJ1IMhUamDqKMYDlMPJpiNGdmPNtRSxlyb1ifS6/1W2ZpOBPDG9RSkeFv81bDSw3A45lgrHabQHlECgPW53eiUJiy0Ipaomg+wV0Bvu1M2myZUZwVrDMOnFB3jr4I3TSY9yL9HgckYHTYU+cteV9SwndGcq5gQ2AeSUC49RSdJWj86o2sdxtJLzcOzltpi6hk7QybUY8AghTyQJiTIlplusfQmHfmaFcj3HGbG2hJp1aL7odTZhIInyACbCwTJlYRhrMegz9kTXt4umsLFm5zB8lw5sCaYlrgCunIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by MI3PR04MB12440.eurprd04.prod.outlook.com (2603:10a6:290:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Thu, 16 Jul
 2026 07:10:17 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:10:17 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v12 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Thu, 16 Jul 2026 15:13:48 +0800
Message-Id: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKyEWGoC/23S22rDMAwG4FcZuV6KJMeyvau+xxjDB3nNRZuSl
 NBR+u5zOkZz2KUF3y9L9q0apG9lqN5eblUvYzu03akckF5fqnjwpy+p21QKFQFpRNJ1HNrP3PV
 Hf7lIXwsncgo5ReGqmHMvub0+At8/yvnQDpeu/37kjzhVf5MI1CppxBpqCU4QGxMaJ/vT9byL3
 bGackaaWTRrS8UyIVufLRDC0qq5dWurirVsIXGyBhwubfNnGZBobZupb+YcfcKolF9aPbebeXW
 xSQcLKls2IS8tP23Z+9pysYBAVhSSUNh3w7BbeDP3du1N8ZopGA1aG1Fbb2d+8+qjneYO3DCV/
 tT809/NPa+9Kz56lWxZWhOV23qEZwBvB8Ayf51JWQXlBsHrfxJwlrBdP07/zRtHWVxEDbRMuN/
 vPy+FK7MdAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784186031; l=12348;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=yWXcKWDwzjGqFqA8nNA76jy/e4qk5NXKxRtj2CdSAcs=;
 b=nxjx8ygmuYTq6uM3MGR9RBr/kQ/rIcw8mcuGujj8/shnyc/JNClGAqzfx7UjYf0AfUF441KiY
 plno2k7Sfl3Ba1PhaP45ehHM9fdE2UL1/eqAcLU2cgAI6NBd11puaWc
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0268.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::6) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|MI3PR04MB12440:EE_
X-MS-Office365-Filtering-Correlation-Id: 14763885-5b29-4759-19af-08dee3094a59
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|7136999003|5023799004|11063799006|3023799007|18002099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
 DlUHjF7VTAjPxO04qWEVeqZLEBPjY5sZCT7dBtBtSVTeNdp6sesvm+zNq1FVo+M7BRWUFJv5j6z47EVhsDS4a6gh+BmRLOd7LMs+/Zq3215WwzzjBLvT6lYFOp5KWN1JKeJNRop1o5UhMngoQ60oWT4lbxgKWw/yhQ9X6m0tq5HT5w4BPKpuIQJ3eGdIp3Yoi9OO1p8w4CQZQmAr5WGM1XzQ/A4n1XEYKRaUB/T29fxydaQgK6wW41RlFHFUGsH5mkJu7YPX4gJDkJJtwbm1eswt3K0U1owAHo+g35JrFdovqU5907O3Wjip1QpdBFuHCVtLzL3v63hP0BPl5AkLNl9V8Qa5F/VeCT88hZzRFHHTih12xz9He68UWuoGeK3trqXu0/TcstckMiy5SxZTVX1mNOk4JoWBNx48wTf/TQNXLt708l7eUMzF65jOOqYgXULDH2NJ6v6wCarGDDS+F+TLOwbzCF1I/vz1+Gies8Bbns7UQyi9/wqw1yMIDa6HHs34GRf3zCyoAHN6JHJ9nX/pj70JV95iXPYOFE+ofg3yQ7PVkzYEr86V57l3y6KIN90TE17Dez3gWkd9W396UhgyFu1i51WDBQMhoQTvPK7h/X1iMP0NK7PnhRJz3ohPzbIuB6jn9CEVgRxlmyg0ApRA/fxjhn92AFQcFnkdizU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(7136999003)(5023799004)(11063799006)(3023799007)(18002099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ejdHOTFqWXpTNlArVStlc0E0bkdUTEgrVWpnODNQVUNPMHVBNmpGSTFzOVVE?=
 =?utf-8?B?ZldXZFhHSTRrMnhBTWRZQ1czVmhITXZtK0Fld2hVanB3UmdhNTV1T2ZEa3Ru?=
 =?utf-8?B?ZXkrUUcxZE5iMnE1czg5RnBZYTlCWHhTeC9BU0lTd3B2K1czVkQ5cWo2L2ty?=
 =?utf-8?B?Tk5UMFN5VE1rUFp2eE1oR3ExMGVjRWhaV2Fhc0VJQ2pQTXJ4OUdEUFpINjZx?=
 =?utf-8?B?Sm9Ib1ROc3A0azhia0VBZHZNVFhDL29KeUk3U21Vd1pIaGNJbWxXdHRiVVN6?=
 =?utf-8?B?MzdFNWQ2ZmpJUkVPUkIxcFViMVExeVpGVyttSCsweFBDSlpOckp1RkNqZHpt?=
 =?utf-8?B?c2prc0cxY0wrQy9pR0p5SzFweUdxdWgxUnJmazlLZWZsd0IrM1Q0MllpWWdW?=
 =?utf-8?B?TWdIQlpEb2krWU9qMXZzeFlwazh3eEh2dVdBM21PdXhRRVl1TlZ5Q1dpN3gy?=
 =?utf-8?B?K1FFbXhuY0xweEhHbDhVWDMvVm5uK1h2bXpKV1U5cGxKOCs4QzlWTzVqZ3FV?=
 =?utf-8?B?RCt1akRvdXZLR2VZVUs4OHJPVUFCQWpqSlNGZ1M0cUQrNXY2cDlOZFlpeEU1?=
 =?utf-8?B?QmRMQ1IzRm5wTjQ4RTJoV0Z1Vk1YRmVobEw2ampvUUtyT3dZeDZQTGc4VEhY?=
 =?utf-8?B?MStmN2xyUHFEVXZmSkV5NjBOSlMwczg4UVkwSVhaU284TWhWb294eEtWUUs2?=
 =?utf-8?B?SGhJdmZUOFI1SHYrZURJVTJkTzB0b1JoYXF0UFpHc2ttNzlDdzFsV2FKRjNn?=
 =?utf-8?B?TStVeDZMSEE1RmJiaHRDV0RDbzFibnE0UTJuMXJLNG5OL2ZtRnI2UGtrM1ps?=
 =?utf-8?B?b2pFaHJwRWpQVDFQVWhNNzhNT0hGMkNYVUNudEV0WkhHYm1TOHB2QkNMbTZK?=
 =?utf-8?B?V0d5SlVlZWRrUENsNytJSFBkZ2xGUGZUb1FPWDRIRVVQcWZ3VlVVNmtsOXNK?=
 =?utf-8?B?Mm02V25yRDhTSUF4ckRtNkpqVzFYOWxNQ1BJaHNtOGJ1U2F4ZTEvNXFYc0ll?=
 =?utf-8?B?R05uL0FzNUp4d1U0VWlIYkpqUENsMjFyWERqUFk1S0xGMlp0RlhBN2FBa3Jz?=
 =?utf-8?B?d05vZXd6RVdGLzNCa2xzQWFWRGtWb1puV2FaYklSZnJ4dGFyaEllcUpBZVl1?=
 =?utf-8?B?OXRVdk9IM2N5aFVsY0toUkx0Y0xib21wTTYxcTZ6aVNVbXF4RE9zc0l5U3Fo?=
 =?utf-8?B?WDQ2cERKem9xM0pZTHluaUlSc1Y4TzZHejZvT3V5TmxIVWJaVDd1SFUzZHVm?=
 =?utf-8?B?RkdYWjdKSllvZlUyV1FwS0JhZ0liTUYzWk5EUVlNK09ZVG1jSEpEMll1NTRJ?=
 =?utf-8?B?WDBMVEdSay9rUFhVdHZYM2EwY3l5aERSWjZ2U1lWWnBPZGV5d1ZpZDVyTTZu?=
 =?utf-8?B?SDRRNVFqRjF6aEYrQ3FPYkE3QXVRN3RsSmdJS29OdE9OMzljTlNoWHQ2d0Uv?=
 =?utf-8?B?V1UrNXMvYWlSMXFTaktqeFVuVE5DeGN2Q1E3N2l6RU1qdktibGhPV2w0L1B1?=
 =?utf-8?B?MFl5ZlNMVjFZeDNFNGs5NUF2TmJ3ejZwYTNBejNYVFNuekhqYzl3eklQSzZr?=
 =?utf-8?B?elhjOGx0TkJQR1F3ZEsySERaZ3dBRlVnM1MySnJ5SG9mcGZZVzlNbkdhK3BT?=
 =?utf-8?B?MjlybkNNZENONFpXdG9jQmdvbzM4QTVybzhjNkxJNEw0bnljS0tNY0QwRDBR?=
 =?utf-8?B?TDFOdkVDQk4vc1lXaXZOM1F1eklEV1UxMEM1SEMyS1c0Ymt0Rm9jdHJQbzlv?=
 =?utf-8?B?N0dSMHJsejU5Y0o5eGpyZTE4akdQRUg3U05YbzBURmkwbU0xdnBWMXRzZzNu?=
 =?utf-8?B?OUJQbFpwVFlqVDNKbitqeDU2dFVRUVk4dHJCYmgvMEduQkFoZHBwdjFUZG9z?=
 =?utf-8?B?YmwraEhuRTFWZEx4VGh6Z0tEcDJVYjl5dXdsNmZTZVhlak96aFBVbDdlQnFM?=
 =?utf-8?B?aHQwV0wxZ3NyZEc2MW1wT1A2TFU4ZlVnSmpyeVpyQlFrTnpxblp3bWFuQkp1?=
 =?utf-8?B?SFF3WVI5KzJSNXFZMWJhMFBzdThsbGlUSjdBZ0FSY2l2Z00vSmNCckViNHE4?=
 =?utf-8?B?UFY5ODA5cWxScXE0ZVdXdUFhQWNwZktxLzVkLzFwZlJQMXkrZFI0ZHFQUU02?=
 =?utf-8?B?bTJ0WC92eEtsWVFGKzFDUzVXU01Qb3lpUzlhTm91eTh0azRKdjYvd1R6QVlP?=
 =?utf-8?B?eEN6QlFha1RGTzhxT0pNTVJ4czd5dlc5TE9QRUZJaTVYc2pRSm84Qzd5VWhR?=
 =?utf-8?B?WG85bnF3L0tCRExRQ3VvOGh5OU9RcXlOamVLUHprd1pRU1MzOUl1ZnNLdDNS?=
 =?utf-8?B?UVBRYm55OTVXNFB2MGhLZ0VnU1dDbStsbTY1bUZ6NkNjUkhTN1pvN25sV2Va?=
 =?utf-8?Q?I4+n3y7jY43r0bb+grsV4NdslrGZtxj4LDQjg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14763885-5b29-4759-19af-08dee3094a59
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:10:17.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKUjLfO7iHw4/SN/5Dy1S+XQy5l8Wr/Qv40HAW+DwuwLvyTpvMeZQFNABbGaJ9NB71gcrHcUPLJe+ku9KxlxUnq9L475eQ/4KswMUONxv0R3Jz67OsN6m4nyGG5ur9Nh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12440

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
 drivers/media/platform/nxp/Kconfig                 |  15 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 808 +++++++++++++++++++++
 6 files changed, 991 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

