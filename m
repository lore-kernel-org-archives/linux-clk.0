Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794320892;
	b=nMvlnkFSe4Qp2QJvarqQOIdYAoY9LpjdTNt9FYIwnTqZcRCAwO5vky52QVqqpPx107RK
	 Qk9r/EsxszBeREv9wogL6vFangpvaDMHnE/oQ79PdCJlyjL0nUkFLDcfDRgkmLkxfbZu5
	 427UckkzFeVgRyRQ/GSPbLOuEQ1rOh10Da/qP9sKk4HBdjb+UPa7q1L6P9ENeRpl8DY+Q
	 lO8StR7XV9ee48V7C5BAWygYTb3eYp/D2SuMI7SwDgrVZ1zjsvwCchsKJ5lmauaTzfLKd
	 1B3jFhD9J+TOA87+Z+ag41n8cqh3vZYcqKYf9RrHEVAfEiKZ2mi/FIIJVpdO1OwSHgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320892;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9E2e2pK1rduOxFzOxq5ag07EOx0kX3VEs4QtH3xD51A=;
	b=pUeGFJ7lcKvyGxujLJyom5+AXzeuaxeYNNatyzBzT13gxCQSZAe4qGjGbRXqu2IZ9mFJ
	 d7nsO/IxZDsn2KvJ6WyfLsSIMI6ayXvd2LTWoRGmmU3RFro4sc5+QJk53h27w6bNBg+iX
	 99ZtBlhszGkZnZQ4WMg/yr0RdIMilZ4gwRmj8sBxm9/+F0eSN6wlSltbjkR2XYiPH2k4e
	 Udgu/QxtSsQYrdoZ7B/b64yovW05c24D5qAq1+K9P5gL8YQSYbT8OtUx0TcNb/6Ku+0+8
	 kzmDQLWjlT+5QMVi1G4B9o1QB4XYZLRqDWQFV8/V3S0VTFplLDgrPCZJegzPAp+Pd/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IywNimJu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.21
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625E606A31C;
	Tue, 10 Nov 2026 14:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3625E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IywNimJu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzMD6o1lkt8n7J1Ra7i4wp6rv0HofjcRBEnltVegIlHW+0021JGb+DDA/vteFKwSlqaEjKYlW30hwnmVtXuaLaCVq96R7qeGHopO7vnYWRj40rJXw1tnfdy4daOm2/TE4O1iBOCuVZ/g5WLvYv7aRTnCuU1wgGr7ZFbzRbYVpyVeY6u5HmakYHGP1544DAPVsJ3r4ANJwqOpc4LOCvosK4IKGQBp4L5t9SSOeq93P5kE1DCH/G7giAXAdijQZsEBLkH0XnyVpll6H+XeNWH45Wsj8xjKvmj4qMArz6dcLmdpEESrFBTqG2Jt5LSUPOjKAMMq2ZbDyPH1Ro4huF+l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E2e2pK1rduOxFzOxq5ag07EOx0kX3VEs4QtH3xD51A=;
 b=q4lPZTBSl7fpN+0V7Z97zA/Bwdq4egVoaIsiWg+Ig9C/sMCj5WM871gUr+LKAG854xm1F5ZrX6Cj/M+en44wDX8UoiS+QC78UXwpIqzyc2xqW58o6fgxHpjno4r6Iq8J1TpKiiuyVxTQF2F0xuiqqxvonXQ+rWYpzTJWig9zeJO2B/btC3JwYU0QhEFFNI7P7EE0VHP06NWnKWNUQODAN2Pg0l66RU8iDspVP8O9UXFmFOVY0L2c4c/GSWgOK57hURA8ESKDsmiciRvw0ijSqZqIUtyw+Y1Lsz4DQWzR4TRz6jfFslzC6tdKXMIhBaUk42/UjltQivVJp0J7PdD7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E2e2pK1rduOxFzOxq5ag07EOx0kX3VEs4QtH3xD51A=;
 b=IywNimJuLQ4H893AkQN5UEgQNU2hrKBv5QqoDobir6VI+tEVb/Ck3iFgBP1I58LOGtXZrhuIEF8+jakqeGTxPoyOSlhF9XtvKqxd6SlM6aE1utCtbHnmCTow1r8t1eCmajNXlMbc7Y5xQQzYJXmKX9LfkgW406nO5jIImZ6FH0T0QPBXMpGNqCUI2sD5Zqs0UIpqgItWaZ4hMbeCfr/GE1QwLfiJYDIOCiNb5zav16+CSQfZs7C+yyIjc1Cm5OygBaKV8jZyM/DdQvLyZQQu37cDE/+GaKzNorS/+4bZE0Aqo2KsUJgQBWljOWOOtRuaaS6RhLm34nhu7VlV3cbt2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by VI2PR04MB11196.eurprd04.prod.outlook.com
 (2603:10a6:800:291::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:28:07 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 14:28:06 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 1/7] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Tue, 10 Nov 2026 14:27:41 +0000
Message-ID: <20261110-dcif-upstreaming-v11-1-9e13c85ae0d8@oss.nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|VI2PR04MB11196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb470ed-3f31-422e-cabd-08df3f36d659
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|921020|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0cdbhGI/DlODlXk2A2bkgRj8XEbKDzcjcFtCnc571y+PXwgdVpzRf0s87rGgGF1eC+gQoSvbcrG3JueRFlunBQ2S8K+CEsri/7Xblp056kNCqKbp05/x3CKTBTgfzP1izyWKVj0fYOv2z8Q53xV2BORwduZxO8mI9kIajtd8oQhVp/CUi6xTkxIyAL3VeJ8Zr1CdNXfzfbenhBlDkvTbdPzI09l8hcw9kOtsVnqexnOOqGM68vWiCELpWsbXKhCiJPzFwkFuULB4Hl7miVHRog0qEPlvIemXsJdlJXhz7R+cQ+0ctCwZ1KnGX+5mksJfwjC6IoIbbf9Pwi25MwTfU924LU90I7RVW9DZBUTDTfbdnEhZyKGSr353kke0HYk6dfpu3GCceOFsx4GpIyxpf/0ugCp6B/WrLe/8f8ipK6cKL3crGBl15PXIZVExjZjv2bX2MsmSMGIER2RZoFAsvXwm5i7ta/x5YNu6u5vn2fFUziRu+LW1xE8RNl6y3qoBJkqFUG9VFqF7N5aX5EXR23PbL4s6ans7fOCTzzB7lym8WXeXYns5noRF40/pzy8DecslKN560GEzskog8QKdSSegbXHDy0U+rs24ETjoWSRybUwC7Ip9I+X4X/1gIrBVwhLeR2fE8tBdaxYuaAOne+ePTH46/7AQOem0yTdChylb3gSMxSUIOmVmFc7jymd6VBPAiKDBWROmHQx+iWtwMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzdsYXh5VzQzTUJwR1VvMVpvRThMOUk5WjdaZDgvdlZhYWFiTXFoY01ZK2RQ?=
 =?utf-8?B?bFFGYlg5enRyUXVOYjB0YldKOHJKQUVUcGhDc0Fma1dFMU8yY2hET202bkJW?=
 =?utf-8?B?YTNaSmh3Ty8wL3Z6bXdDaE1vNVZFU0twMkF0eDcwU01rbVZzd0lGUjlyaGov?=
 =?utf-8?B?MmhoQ0xqRUg0V0kzaEFiSXBwb2toWE5UYUNXV3dVYWUyczlZQmFYYXBLMm8y?=
 =?utf-8?B?SFBFVGZsN0hsSUdySFA3TDhnOU0yWkRFU2ViaWhidE1vZytJckJpRlQxQUFC?=
 =?utf-8?B?Y2pwU3VEN1V2bHNmbFFEWHJ5MGNhYlpPemk5bjArK3RlUXNJMkViNW80SEY4?=
 =?utf-8?B?MjdqaE45RUwxalFsSU5wMHdKcGZrNVhiWlVFMjBZTXMwdWtqTWhzajYzVlJK?=
 =?utf-8?B?N0tiN25HWldvZnptZ2ZHSEZYeDc5ck1GcTJmaVk4QkFDM1hhSnJBeGtKMlpS?=
 =?utf-8?B?Yk96cWdrczdaTkdRazU1R2Z0Zkl0Q2ZpL3VVN0k2M2J0Ym1CQ2I0emx5M09M?=
 =?utf-8?B?SWVBcHBLcU5DT0JIaWlNa1Yza0ZxMVVzQStNYWxGRkRUWk0wS2tiSm96VTBR?=
 =?utf-8?B?V2pocWJrR1BkbmJtTXE2SDg2Y0svUlN4V3FUd25EWG1LSjdYNU5NSnB5NU1Z?=
 =?utf-8?B?aFhVd0R0V3V0eTJ5SkYwMFNzeVQrOVkzUysvU2VhNlFtTmJzb1Zxem1vZThr?=
 =?utf-8?B?MWhGZ1JLMWwvaDBHNmxaTVROWGovcWlzbEZVeXlBNmgrZ3AxOHd6bHNEYnFl?=
 =?utf-8?B?bDc5aFAvZHJlR2w4WmlIMWIzcW5jZ3oxL0ptQ0p2ZDViVldtbHBJN2dJc3RH?=
 =?utf-8?B?MGQzRER3bk42WTljbmNzMVE5TDdsWkZzOENQVjM1U1RVTXowTy9vL2VhODFK?=
 =?utf-8?B?eDBYQ3k2VDhBMHpLNEJmWDA2cjYwQzR6NHoyUjVtRGNPb2M3SG5KZWdZWi9Q?=
 =?utf-8?B?SnFyck5YeEZTcXc0VWVicUhOdm5RUW11VW9mUlp4RWNlRXQvRW94WkkxRjNz?=
 =?utf-8?B?ZDB0MTM4ZnJyMHNwRWI5emQxUzBtNHQzbnludy9sb1lwVzcveVhOMm1OOWhB?=
 =?utf-8?B?Wk5yOUMrNzI2YUhIT3VUOC9veFBKNVhvWE1UZ28vREE5VndtVkx3RXJrN3FI?=
 =?utf-8?B?Sm5ybUt1RTZzR00rM2xHVGw4TWhxRjJCdDQ2N0N2V05Pei84QlBlZ0RGRUEx?=
 =?utf-8?B?Z3ZvZzFnUzRSbjd2c3lDTFh4UVlJeEVHa1A5eDZVbk9LeXlvcmZrR2R4YzQr?=
 =?utf-8?B?TmI4aUZsUkFiRVR2R1piYlpUNGVyenc2dHdmcnI2R3JDMng2NHhTM29FYWNo?=
 =?utf-8?B?Yk5WcnNUa2Q0T2dqTExic2JPNVlreENVUWUzUUNadmVxTENOQmx0ZVZweW9n?=
 =?utf-8?B?NFZqYVV1ZjlyRjJtN0daZkhvYm1jNHQyeFNIcG11R013OWo1M24zSHowa1RZ?=
 =?utf-8?B?THJxZW00RlRNNVQ3M21PWmhLNkYzb2FhWTFpRVdwQytaNTdlbnczVlgrMmxE?=
 =?utf-8?B?TExidFh4NHd3azNXNWpkWEdydUUwWDU0ZDEzY1lGbHZLZFEzckpUaEMxTXB3?=
 =?utf-8?B?S1JCSVk5b3lrUzMrU21yZUx4ajBMTTNMaHJZOVJPT3QxcDZob0s4MWgzN0hN?=
 =?utf-8?B?Vi9qMU5tM2ZnWFBTajJML2VOcVg3cHcrS2VZK0thR2ZpUGlFRWIyQ2I5UjFX?=
 =?utf-8?B?VDRhbnJzTTM5S0s0dUt5ejlIMkpOcEw4eFhEU0xoTzBXRFhLLzEwUHBtcGpX?=
 =?utf-8?B?S0JFdnBnY3Q0Y0JzQnhqaDBCcEFtd1lTQnNSY05xemc4c0tTUnE0T290U0Jy?=
 =?utf-8?B?R3ZaVDlUOUVDOTJkUm4rSmc1OXVDSFdEdElRR3dqN3AwY3Q2UUl3dUxUR2VQ?=
 =?utf-8?B?ZjRERHNwYXVBdE5vbVh1Z29INEkzaldRcVk3SkMxaUZFbnRPNW9YYU9BcGNq?=
 =?utf-8?B?cXdWaERXOUhMTW9MMEtyWkkyS1h1TXBiOGNWK1pseXUzYUltRGFXend0eTFm?=
 =?utf-8?B?eFE2K3cweGhBdnFLUE9YRDFtb3djTjNsUGwrNld6OGZOcmZuTHpSYzcxSUhD?=
 =?utf-8?B?dGtUTzJsUk9DVVlpZjZrZ1UvbGxwTVZwRkR6M3Zta1N6OTE4OUhKWWgrZC9n?=
 =?utf-8?B?QytHRWRJQlRNOVpYdS84N3B2Y0xGODVSMDFhNDZ2emcwWjI4UkdhckluaDd1?=
 =?utf-8?B?TXhNeEdwc3I3ekJTeEdrQ3c1eW4rVGNISkRxVGwrNlZldlVMTHFXMHZXU3Mr?=
 =?utf-8?B?U3JJZnRJNDdvKy83eVo2MFVtcEpaTmh3V3ZjS1ZEWU0vRWhZV2pUdU9iR1Y3?=
 =?utf-8?B?MFJjTG5YSTdLU2MwMlBPdnc4YnArU3FjMksrQ0M2V2w0UXV0VmpKSkNBZXY3?=
 =?utf-8?Q?JLqWNGjDB74xkC6w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb470ed-3f31-422e-cabd-08df3f36d659
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:28:06.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gf71SeNmhQ2IunF9KJrwKYF1bCIs6UbRxNh7SWjtTt4P7YFnAm76KkxXNn9HcBk0gVXz9T2ZHV8qsxUcvJ2byA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11196

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index e5a8870bb76a6..87208ba724ca7 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -80,6 +81,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:

-- 
2.53.0
