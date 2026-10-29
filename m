Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283993;
	b=cZUJ4UTz6kzrW3b2LI10/ZjdaXaXu0UhBexE2a9zFIYChxuFOUqPAKtVPXnIvJoTaffv
	 q1XZH4sHU6uMiE18nkN+X7ebO7w/Ovnw664mKwxnX5IXSq70+fZYa7/avgT0W0HlfGqau
	 MuvceJ6T7KDTa459tmfkB2/rsR5pHhQ7vRo2Vrm3yz5JcoKQ+oj23M4p8iQ9NTHEYi7Co
	 XtXP1mx8R5nyt+80/oqJJp+y/DfMtS5YGcr/QOTTxX4ep0M8Pf9lQMIzL+ISuMEk12tQC
	 PZg2v+KxuZUT8hS1eEUDDmz7SnwmfdsVeTz7UGeJoGcfZG7X6x/TO15xFrsf6PTCCmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283993;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
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
	bh=DTQ5Lt98fhEWbUhVkTywJHiSjAVeT4h4ySXrd+F+xD4=;
	b=JzMFncHi6sMykiY4l7Vb4iKaPn8SAb3HMCCiW9vr3qzJ7dn2DEN8PEr75IDMPYZ718AT
	 bP3sltYddNnlLon8k9+uy98ig+Ge1C7cXI/9yEWWd2GulK1+tsj9C1x2qQsSPoV0Fg2Wa
	 SPeonfpwty5Tloyq7rnFOG8Ni/zeILkVpNo6jwzuFTeCp/raAgoOjKKtBZ7bMG/DVub81
	 jhe8/vSiBtSsxVOjdSWhgXtESaMdpbmJua16jLTFkbNZ8YA4pxaM7R504KS0DeiPTYUuT
	 Guvn2gkhDSHQPjvsxzPQEaP1MZ64TQt/GaOVMjR97zQXO1IcuYlQ9TtWwnBdTtKdWRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="P3/v6gph";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7D606A31C;
	Thu, 29 Oct 2026 14:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=P3/v6gph
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWyzDrag8bnTBMFmjy5kjCVUbBc6ntMPb5D2s6K72tIHdMuflsEH/5EtD/cQsKs8uaEPcH54gbYRrvQa4vChC9+SONFFsAkpAnXM22qa1O97ZWjxBi8AxpSmNuMAkgZ6cGHijaoaD+9AGZbG4Hrbb5SrrQVSx4ODt8rTPNT3FuT7A2f7Xct5Y+MgAFTtyiSw84Wx1mO4IE+JnNAJNo2KM90FtUW2RZQS1yeHfQJvdfv0O0SSYXhywQs78Jx//ktgnqp4Xn5tB9MuCK8Nlsr7/jCrLadxRYUR4xNKT5PXGpYPdSjg6ON2KZlBZgwsIRmB0nG68h+6Xl4jNYs/gZqQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTQ5Lt98fhEWbUhVkTywJHiSjAVeT4h4ySXrd+F+xD4=;
 b=jdx782vk+Np0MxrFckhnVG9QbMsAws1LDp5/k/VwpvOtAyErkYLg55LXXW6eQzk8ue4kbUNtihUj1PzA1P8uJQMDDHhho2Rx++xgNsobA2M7p+gLkJGm1mgi/NpDvC6wUHJP0tXeQl/xnfSeXdYHwZY2XNiZxbzHHMROx/4wzNsfDJKSTBJmVTDaARxhz/8XFOOUHl6TxJwIhYsNo2dgaoFPkIlSdmAfmGBhA3f5zSwGDGXfgvik+/SHFx9FSq1+kq5bkfkSX3GfLrtiSlMN8jtgbxXTUrlaKUpFukWLNiwhOKC0U+l1mbDW57YDZcmfgXG8HTyhFpNBJwP3xsQgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTQ5Lt98fhEWbUhVkTywJHiSjAVeT4h4ySXrd+F+xD4=;
 b=P3/v6gphy78v3MlNeqb372peZntBBkdlsuEAJFVRBbcz3sb7DLdw7hNpQAohrn7Wi42VdkJ3aHtNpVCNIWwzAqojvqtt4tojHNn17r6Tj/o7pNgSuMvtmPfIBp6TNErbwRJBJaI+IzY6yY5JsIotkw/UQ0MPxTmuphH+9MG39ZQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 (2603:1096:604:35d::12) by OSZPR01MB9632.jpnprd01.prod.outlook.com
 (2603:1096:604:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 14:26:29 +0000
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8]) by OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:26:29 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Date: Thu, 29 Oct 2026 15:25:37 +0100
Subject: [PATCH 1/2] clk: renesas: rzv2h: Forward PLLDSI mux rate requests
 to the parent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793283976; l=5281;
 i=tommaso.merciai.xr@bp.renesas.com; s=20251006; h=from:subject:message-id;
 bh=rvgJTEhLM87jCXFxZE+/JpiZBpQEcCKC4Gwah9dhWKE=;
 b=75kxY88N5W0lCvfX7MSaZHU5NuE71YsUl79qnxL73RPduWiRvUi89gBT4WazB9uGZWhPbDd0f
 sUexgjk6t+LBXoGyV7jKjaXeTBZzGm+KMYnEvcyinVjQKpvk1OtHKjd
X-Developer-Key: i=tommaso.merciai.xr@bp.renesas.com; a=ed25519;
 pk=J15CiW2gJfhl906eXCszPfqo+ddBW7v9wVMkAFyVDys=
X-ClientProxiedBy: FR4P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::10) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
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
X-MS-TrafficTypeDiagnostic: OS7PR01MB13601:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: d653807a-d5fc-4992-b216-08df35c89ca9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eZYUBOq5I4wxI1HFJYShrJ2EPhHv7fhyhiPwRW89Z+wxUKbpPh0fnU01vx0KSK7iNGpGdqyqLw1DNc2fNOeaejUHFJOQmFo4w4ULPekMqGq4M7vVIsU8A253xfUicJ/2e0JadhBgI6VT/uxD7njdM2yP/fgZBX7f8mSHo4wKGRZ3B0ejYtm2m0Y6CavMo6hhl2SzBHxVcZzF0SW00Qt3mPqtkGchNa+Dd3Az1XiinSuAYi6YR0MeaulqkbJ5vcEHQTWNgiAmBrzeVAjhfpH2bpN3BO8g0+7kH6hII5ZayDfUafpXC2XL21pl0ED1pEylN0vh+4kGeQgYzUWMaviyoeMqYkmCedQYgjWkjzNC+xAE9O3pWjroN0/uPRvzkeL5KMx+2FQEWK0tisdzsJJjqO1s2qq/L7tKA60TGZV59nLs9pykaXpqM7oLqMWdfELZfgB4ozWUz/GqYapeHA5KdNPOD0S+S1hGN42/EmNtU38A9X/2OrRCIEDbL7akPG7vk3+fQMEooEr8OuqpNlbHoDgFhZKjp56iH+QWrM7WVWuhmMA6q5ex+eXl60HQePBl0OC1XDUd9pTfjfIrv2ic8d2KWYTQIGzPnYPyHvfcP2HmnbJAW87PXmAeKhfdagMAInpv85qy9XQWy5baaSAH1iZHyNuEwS8aHcOmpkMPVdo5zoVLAWpG9OCSqVhPTJ9o/VFLEPKSsz1t7dAafKc5sc4TTETqC4ImiAt2xoFfV5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13601.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBtRzhiUFFHZ2dwdU5YWk1Eazd0RkpWbVg5bUZTSFpqM1RQekUxRUdvR1dH?=
 =?utf-8?B?N3pxbXVPR25TdFgrc2M0cWtUVmNnbmNJWk9KamFsQi9qV01iQjE0N2lVL3ZF?=
 =?utf-8?B?bm1NeVB5WVFISk9yK3FITDdvV2h6T0pKR3hPdHlmbncvOCtVNUVRaUgxQlYy?=
 =?utf-8?B?czAybnVVdUw0TlptbXk1aHhzUjI5ejArQUwrNTd0VHd6cHlhSkdRWXEvUkwx?=
 =?utf-8?B?Tm0wSEs1RG5XZkppUjlFa21vQUlORXVqRmFUMlgzY01VbkdOSTk0T0xFR0pI?=
 =?utf-8?B?YTd0NnpCRDNvQVQ1R2V4eWhXbGhUSUZ1b2U3TjFLK2hyZTRGclJ3Y0xXbzVL?=
 =?utf-8?B?MjRaL091MEhrVHRKSncwV3pIYmlZUDQ1NFkxMERFSGFuYXh2NTVkTVE0VGk2?=
 =?utf-8?B?Q09sUWpXeE5PNk1uRDNnOUNwSi9xZ3NqRktqQTRWOHppRWJWTWd3YWc5T2Fu?=
 =?utf-8?B?VlhkRXBRdytvcVVydktTSHIyM3pSUlZGa1FUeEhTRXR6ZVIxTyttbGl1ZkF1?=
 =?utf-8?B?RkdvTVk3SUdwQ1greVM3bUg3Ym9UczVmSFhUNk93UnpVdkFoeEptRzBqMEpW?=
 =?utf-8?B?S2pwTjllMjZGOHBuMmRtbFJOQW0za09vQmUxY3dzZElUdEF5aHZyV3Fad2xB?=
 =?utf-8?B?TlRRWDJuemx6d05LMW9zNmpWcmRDTDRnQnA1cFZYK2ladXV1YzJGcHBrREto?=
 =?utf-8?B?cjE5aUdmR01LRE5ERmY5VXkzd3dicHZEL2xrZ3EydW80SW9kbllYTnFwVFVs?=
 =?utf-8?B?ZVB3anZJeWw5dGlWRGZ5RnZhdWE3Z2R3RjJuSXFRSVJEQ0pmMWppQlBaZFY1?=
 =?utf-8?B?OE4yOUVYWFRqK0lQT3F6S2JvTjJjUE81cGZyMExJRHdGMjc3S1RQbmlNRVQ1?=
 =?utf-8?B?Q2hiT1RJSy8wUEk0cXcwL25JT3VLcTFBbGY0VWljZ2pSUjduNkRtNGxiaWJi?=
 =?utf-8?B?U2Q4dUVra2VtUnhWWUd1TzA3RVZTMCt1RnJxT3kyWExLT0ZSMUt1QjNQWWQ4?=
 =?utf-8?B?VldmT2RjUEQ1Q1BPZEQ2RWxNODNPM1kzZGJLTFRTZGd6ZnRmMDJ4VUM5SE5o?=
 =?utf-8?B?NTd0VkQ2eHdqV0llem1mZzBoRStIUlgwc1I2b2ZNQk5VSVdRL0Npd1ZiMERo?=
 =?utf-8?B?dTI1Z1YwYnpPQWZZak5PUlVjRUpIUk9XQ2ZPTi9EU05xSTRheGorS2laOHl1?=
 =?utf-8?B?Nm5BbFZyc2hvYUdtRUUwek1hWnFobEdHc2xSbE15WjV3em5pRHgvcmVXRFBk?=
 =?utf-8?B?TVc4T1BuUlh0MlBkSWJtWGUzQnpKNldwUGZtTXRsbnFiVWcrTFE0VDM3TTcy?=
 =?utf-8?B?K2ZpK09sd3kwZzFLZGVKUCtHUWFwNHBLeG1TZXgxT3F5TVp4ZURHSHlRQW9N?=
 =?utf-8?B?TDFhK09FSDE0OFBTcXVLMXdZL2RhYi9SVVhpclVRc3hKeXByK014OHY3ZStP?=
 =?utf-8?B?cUYrMjBzMHJ2c0phUEtiMGY0ajJrQjdXNWVHbyt2TWc4Qkx6U1d2TnhEdTdo?=
 =?utf-8?B?U2lLNFBZUEo0UHBPak12b2Qxa2tJY1UrQTlDbFNlOGNmSkdSU3lGaXoza0ZV?=
 =?utf-8?B?dHhWMWtKSUtvSDVPd1JNbVE3emd2R0tFQkxzb3FtODZ6eThFVGtGa3lZWUJx?=
 =?utf-8?B?UUgzVFR0UmFnc0EzSEJ0M3hxWFBocUx2enZmR3JrZlZlQjNPdWZJbTBvL1RK?=
 =?utf-8?B?bUlUVVZvb016SmQ1K205RGFWZXpidmxDd1RWdk5aV0pMYnFoQTFIYzM5MlJL?=
 =?utf-8?B?ZXFhT3BCekVVZGhLcnAwN3E2UnlwMnpZS2plMGlWNnpPK2lvS2l4NXZhMmRF?=
 =?utf-8?B?UzZZcjBQeWJPWFo0UzRIRlZDODc2YVpHcmFGUGxTTEZoKzZXUzg5NkJtVEJG?=
 =?utf-8?B?U1RycTVIK1NBVndXYXhjRC9ZaWd1eHl5NDBvNEg0MzdnbWpTbmZmbTZjQzVZ?=
 =?utf-8?B?NHpmYWZlRDdIRGovSGtYZ0VsSU9qOURpZDhLbWJ1YzgxN0JRV1dTQ0lKckxs?=
 =?utf-8?B?b29pQVpMUTlLWGdOVmhHR3EvUjl0Vi81dDNZdjFMbm01RmhNNnFNU25tL0Nm?=
 =?utf-8?B?WmtEWE9TNTJzcGh2T0tWOHNKYWFWUnI3UThYck9PV1ZGQXViOEdudk5uOGRI?=
 =?utf-8?B?czJoT2tMOWEzajRjNUZlYkNkWGM4VXIzcXFDSnptRGlFaGFJaXowak9tei90?=
 =?utf-8?B?YnN6SkhFT1ZuZDRuWXZobDN6UTFsZmxhNzQzdDFEeDVIY1lUVFpsa25XUHlu?=
 =?utf-8?B?dXMwckZDM3hITHgyT1dYMndvV0YzUURvc3NiY2IrSEhSSmtWSUJXU0tzc2xM?=
 =?utf-8?B?TUl6OGVHUnhVaWl4b3lyWjFKdmxKNDMyamkvME5XSWp5NDVlaGJPbFhKdVNI?=
 =?utf-8?Q?DhNypNp6/jarIZ/CDgz4/UVUzvLtysnU3L3Ax?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d653807a-d5fc-4992-b216-08df35c89ca9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:26:25.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PHLuNkEX4HpiaBRIyMu0IcL3BbWNRdaWZFIcnr9ZkXk2S9+KqbBgG4YedaehSN9VBmOorFuDRxq4hWl3zsV+Mx2rHQ1a+ZTSXPT1t2skG/+p8FHsoDx2noQ3NLcQpgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

The PLLDSI mux determines rates itself, and on the LVDS path it reads the
PLL instance from a parent that is not the PLL, addressing the per instance
parameters past their end.

Forward both inputs to clk_mux_ops.determine_rate() and let the parents
carry the request up to the PLL. The parent encodes the output type and is
selected through .set_duty_cycle(), hence CLK_SET_RATE_NO_REPARENT.

The mux wrapper is left unused, so register a plain struct clk_mux.

Fixes: 3afccee4a3b8 ("clk: renesas: rzv2h: Add PLLDSI clk mux support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 75 +++++------------------------------------
 drivers/clk/renesas/rzv2h-cpg.h |  2 +-
 2 files changed, 9 insertions(+), 68 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 7ce94680c79a..12a5f058dd71 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -219,20 +219,6 @@ struct rzv2h_plldsi_div_clk {
 
 #define RZV2H_MAX_DIV_TABLES		(16)
 
-/**
- * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
- *
- * @priv: CPG private data
- * @mux: mux clk
- */
-struct rzv2h_plldsi_mux_clk {
-	struct rzv2h_cpg_priv *priv;
-	struct clk_mux mux;
-};
-
-#define to_plldsi_clk_mux(_mux) \
-	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
-
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -474,52 +460,10 @@ static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
 	return clk_mux_ops.set_parent(hw, index);
 }
 
-static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
-						     struct pll_clk *pll_clk,
-						     struct clk_rate_request *req)
-{
-	struct rzv2h_pll_div_pars *dsi_params;
-	struct rzv2h_pll_dsi_info *dsi_info;
-	u8 lvds_table[] = { 7 };
-	u64 rate_millihz;
-
-	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
-	dsi_params = &dsi_info->pll_dsi_parameters;
-
-	rate_millihz = mul_u32_u32(req->rate, MILLI);
-	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
-				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
-		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
-			req->rate);
-		return -EINVAL;
-	}
-
-	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
-	req->best_parent_rate = req->rate;
-	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
-
-	return 0;
-}
-
 static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
 						struct clk_rate_request *req)
 {
-	struct clk_mux *mux = to_clk_mux(hw);
-	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
-	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
-	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
-
-	/*
-	 * For LVDS output (parent index 0), calculate PLL parameters with
-	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
-	 * PLL calculation here as it's handled by determine_rate of the
-	 * divider (up one level).
-	 */
-	if (!clk_mux_ops.get_parent(hw))
-		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
-
-	req->best_parent_rate = req->rate;
-	return 0;
+	return clk_mux_ops.determine_rate(hw, req);
 }
 
 static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
@@ -581,8 +525,8 @@ static struct clk_hw * __init
 rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
 				   struct rzv2h_cpg_priv *priv)
 {
-	struct rzv2h_plldsi_mux_clk *clk_hw_data;
 	struct clk_init_data init = {};
+	struct clk_mux *clk_hw_data;
 	struct clk_hw *clk_hw;
 	struct smuxed smux;
 	int ret;
@@ -598,22 +542,19 @@ rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
 	if (!clk_hw_data)
 		return ERR_PTR(-ENOMEM);
 
-	clk_hw_data->priv = priv;
-
 	init.name = core->name;
 	init.ops = &rzv2h_cpg_plldsi_smux_ops;
 	init.flags = core->flag;
 	init.parent_names = core->parent_names;
 	init.num_parents = core->num_parents;
 
-	clk_hw_data->mux.reg = priv->base + smux.offset;
+	clk_hw_data->reg = priv->base + smux.offset;
+	clk_hw_data->shift = smux.shift;
+	clk_hw_data->mask = clk_div_mask(smux.width);
+	clk_hw_data->flags = core->mux_flags;
+	clk_hw_data->lock = &priv->rmw_lock;
 
-	clk_hw_data->mux.shift = smux.shift;
-	clk_hw_data->mux.mask = clk_div_mask(smux.width);
-	clk_hw_data->mux.flags = core->mux_flags;
-	clk_hw_data->mux.lock = &priv->rmw_lock;
-
-	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw = &clk_hw_data->hw;
 	clk_hw->init = &init;
 
 	ret = devm_clk_hw_register(priv->dev, clk_hw);
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dec0f7b621d6..4492f4e7b9ae 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -251,7 +251,7 @@ enum clk_types {
 		 .cfg.smux = _smux_packed, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
-		 .flag = CLK_SET_RATE_PARENT, \
+		 .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
 		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**

-- 
2.54.0

