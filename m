Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283996;
	b=xKa11iHZzZFxEWh3nmArPQVI19XUY4wWU2WdKZS579C3wfzOOPOCk/ZBkAKQpLtaR9Kw
	 28Dc8yGyw1+pDsGNivy+2wsUSAcp58XDQpn+WreEk23Qr1ZmlOpSFlNV6BkFCXylGhMzn
	 DP3pKUsgmsoPoLkfzaI9uoGHDfVMHmkEA1aaR/0nQjIImdpJxsHJm8bdsLELuoZwJnDIn
	 ZFtJ9Y/5K29Bc7jy1RD2b5yj0zT7/ubTCwA6ychGaD/Hi3EcIfrqSjJ+mH7uJP2atVObh
	 QcCB/G7GHpuvDI0KhzKpCPnftALO/a4Snv0Aj/W3EOeJ40nU1L6LgoCxLuma601cpCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283996;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=Dj/ngwntG08mK7vz6aCCfCSbMkOgsh/sEccqc4dzUWc=;
	b=CpfXyIA2kV4GXGZ5TgaefWSjte9aqfFaVyenuG05HaL5wjDv6AYVIGDUV6Gv5dRBMGXU
	 bOavFm2KQ9rsm67+xbu5zQB/FZPaDje/DyLp5kMnXKVJnPSJuNK0oMGQpIoA37RAEyuhR
	 E84sVjSDztmPV+2zngS8jY26b0UbfcWmWi/IS1f+EdI4vcIdevovsoe3/bjcRjroFE31K
	 WYZ/tIepo7AwdHZgwYh6L0/P/DxGoh2sSc+f+19HFcAhz9xAE2OjEgPLaVoqr7tJrjDa2
	 jUvmydNibd2v7Dsd0jsGAF4XV67tCa58bhFhnM+ZoNpRuvnhjs27vSTNf6EhIJF2Y3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="JMvLK/AP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E42A606A323;
	Thu, 29 Oct 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E42A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JMvLK/AP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyyG5D4dJ3LiWgpB3lcl8zwaIn08S4qcJNSBBBYr4eistjkL5cjY41wXtNSEE6KG98RdEtJQNKf4xp+K5zo/krFUXgKByGgtTgXjVAeboYT6DubV0DeMOEr59/FPBuDNASoY+uTSZZPagqd2asPMtc0YhejuTYhIRSZ0Vkyhl21yHEsXNCcquMIpQCymQyuwfiZeAR5yLfsTmMPfqik+UDlklmJYJQC8v7LbY2AljN5wJLBVwdOFx/lyXpSLV5J50FdH7CVdPWuGEKhyxo0LviGsqoroGdjy387E61SeY6Uz+oTkP9Za/8vvnRUg72kQOYplibSOvy+8zGYHbiLySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj/ngwntG08mK7vz6aCCfCSbMkOgsh/sEccqc4dzUWc=;
 b=FrOakQE1ZVDsJJ4WcpYnEAY6lpe9zp26UIwy9r+RxniLTMtJstmYurrNJn8mB/DxgDWIScB3L0uQQ1HP87b1bb9gVK7FGR2TwQNW32hFdVVcOx/0IbdnMAZ/55x3b1YTcslaxqb+X9rOTKfV2omukLmYIHALEP/LjeCfpNnDF+Flk2DIo4zJ0vZX5hi1R6OO36MD6YqL+ZfzFVm9uSDz/p8NDUNA9t3TebKjxi8yJJTQb5DE0Ax+k7b15oSBQ3V+r/HYcY3GbEJk2R3KIkHqXtXCnwirK/5lMU2Kj5Kpnbzs7WWPpkB4g7oz89q07Z85xiIdIp7tQ09jZV5p1v/EGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/ngwntG08mK7vz6aCCfCSbMkOgsh/sEccqc4dzUWc=;
 b=JMvLK/AP7i6qJKciC3PwkXLmvIYsB8TKxtOOuyQxGQxW/VEZOUH+8SZJMBEsjMOika9h9Go/DdunRS1Mpr/k3ujF2pBe7tDjZDBbhFDGTJqN0aCRZo6tpjYai00pwNmeYTFNjIbJEP733+YjxTXPC1FXC6xmLkYu7IywRGaFZbs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 (2603:1096:604:35d::12) by OSZPR01MB9632.jpnprd01.prod.outlook.com
 (2603:1096:604:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 14:26:28 +0000
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8]) by OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:26:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 0/2] Renesas RZ/G3E DSI/LVDS clk improvements
Date: Thu, 29 Oct 2026 15:25:36 +0100
Message-Id: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBX42oC/yXMQQ6CQAxA0auQrm1SxjAOXsWwkFJxFJG0A9EQ7
 u6oy5ef/BVMNIrBsVhBZYkWn2NGuSuAr+exF4xdNjhyviRXY3qgWa/DxKaMjsIelwp5uGM3pzd
 e4ksMmaiugm8PngPk1aTyC/l0av62ub0Jp+8btu0DVs7qzIgAAAA=
X-Change-ID: 20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-c009586b76c8
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793283976; l=1272;
 i=tommaso.merciai.xr@bp.renesas.com; s=20251006; h=from:subject:message-id;
 bh=AF9eb1BCxXmM3Y6ob+S/KS0ism5YHoPt8QPDY4LDvYY=;
 b=9z5w0v4CyWiiz6otHlw1G9EQHFG8sP6ewJOEY+37Yxl/dbTgnhEg0TwANIJ3DyAQUdOmFeGQv
 h/77EVzfCVlCep5oXmc6czLg3WPfL9zDHHjbNtYR1ZVEbyWI1xPjunK
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
X-MS-Office365-Filtering-Correlation-Id: 0696edcc-1622-4fd1-3828-08df35c899e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0us9CWA1WmmBZYZhaojS6xGmR0oEYgBzGN8JvY97Gq9STzRerwF/jmysimgLseOfxypRprXGcAre539SSBRW4cpZMEA60vJuMxC+ErdMRJYJDi2KGNp94grHyyBjj0dqayfMMhss3I+yGjxpRC7bc1HNJhAE6YObESguZZDx/xJhOU2ftBlGt8v9x1a+VVQrOca47l9m4lKTcsEsIUtmHBNt967jq5FD1FwbCLdbI6vLcAuNunG8cdg2NBlw46GGfhaRt00FPZ6d2PJXVv5jm7pAOEHBzZSFiFo90yrVAqRVD0sgfJiHGWgB/mc3k+Hi7ruRzEgDsTCraDCvn/0xpW4IwEEGDAD5OXKYSH+IwIVNRauoFpDajtKGhfwj0uknvAm0TVhdG0Uhg89VnGJkRxJIrTd85NYdVKasI65uwApwrXX2utdz1szHFXUNib3laSHzUpe+HIkNGjFq0AhkLPdlTLhPcG+txLi3WYHb+JuvvNTXRaVbY0KdtiQhErTenfDrsm51Zo97ZJRloCawrdiTRnn1Qa+k1rigLArWR6ey9q3fC4DwA/tXONb7pCy88TPL3JsW8dUDag/LtLA8PQSTttJU/PDMn0NBMgVTXGzoCRoL/UBJbfnbpooSEoBmybjbq2f11bIzj0NnJCVSQ2BmNZGf9RrMfFYy7UQ0lYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13601.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THBoODkxTnVGSjYxZXh4czFMcXVoeFhEelFOVlAxQ2lNODQrRHZpTHk1Q1Jn?=
 =?utf-8?B?cThxWTdDZVNCNmdDWmN4cGlzaC9zM05lWXp4Q1RaUlpYSEVWdG1Mb3A5Nzhw?=
 =?utf-8?B?VHJIYk4zOCtnaFNRdG9lMmNOcUlMRTB6MzN1WUpheTlkVEk3RDc5eWI3NEtY?=
 =?utf-8?B?ckRqWHhSNVFKV0VwcXZoazV0bFNnWlRTYU5CNmFTejAvRmdLRGhzWjZGWEV4?=
 =?utf-8?B?KytzTFhZMktYczRjMjVQOVJST1BGWDNiV3I3TjBxUGlDY2hHdW13cVQrb3pk?=
 =?utf-8?B?Uk15NXZweHdFejVVUnE2NTNTTkwydGF5MHpFWm0xdngyRjlNdEQyQlJ0VlZ2?=
 =?utf-8?B?TXlVSW5TYlFrYXlDNmk4cXZYUGtKT1F4RjNiVFBCUXJ1N1dvVnJyb0psYmFr?=
 =?utf-8?B?UkZ3NWVJSG5XVEtYVi85VHNFaEVTcnNqVXJINlY5azlFMXRQK2tOM2orcHY5?=
 =?utf-8?B?UkF1R2pRTlpkeXdDZGgzUEM1Y2hnTi9Za3cvL0F4NzdYZU5OUit6bkNEMStO?=
 =?utf-8?B?YW5kMFZmZ3B1ZFg0TnBYeklOSGd1WVBKQU1yUkl4d3dRYlRBbkdXdCtqV255?=
 =?utf-8?B?K1crUFY3MFNaU1MrQm02aUJWekIvK0RqK2pycU9MNlF1RzNDMnQwNkNGUzBO?=
 =?utf-8?B?K3JCRXB1WWYvL01nOWxVeWhoNUxHcDRzQmY1V0plaWlBT1I1Ulh1TDBYWVJF?=
 =?utf-8?B?TGI5blRtSmJXQlJyWDNGQ0JqeU5QNkZNN25vem8vS1pRTDA4OFN6K3l4RVRi?=
 =?utf-8?B?c1ZVREdpcC8yVVgzZ3dBTTJzVUxHSjB6U2syM0NhLzhJa0JJVWtWa0V6V24v?=
 =?utf-8?B?dTNvTHdhcjRudllnRVNPdE5lZVdMM2FSQVhaZFZLVTlwZzh4TnBDSlRZQ3Ux?=
 =?utf-8?B?bTQ5dnFhMENtNDQxbFBqS0h2ZUhnMEJWZUE5VXpCQzk1OFM3NDg4WURaQWJl?=
 =?utf-8?B?RU5zZ0FGVkcrN3ptaHNzRFJhRjJBZmF6NDNrZGV2VmdaYWlXcGduZ3QxNjVy?=
 =?utf-8?B?aUExcWJJQk1oYzhFNHJudVBmZU5zOGg1UUJXNE9PSjZQWG5HTTczMjFWZW45?=
 =?utf-8?B?UWtRMzErQXk2d0FhYnBrTDRYT3JYRUFWcG11QThOdDJXQ0pEVkVsOEt5ZFNU?=
 =?utf-8?B?SzVGdzZXcjFmSFRSMHRRM2NabFZDN2RyNmFpS2tzbTNPbHEwMmduMSsxeGpW?=
 =?utf-8?B?M2NXNXA3aGhKcFVPQmJRVEpZT2t3Tk5GdUF2OHJWazZXQUZiSUtYYVRNcTBp?=
 =?utf-8?B?MGsrQUFVNFVVSFNvMGs4b1NxeU1DNHM5TWFMUzZvV2ttd2pKNmd3TlJMd2lk?=
 =?utf-8?B?MFZyOVRodFVIeDA4QTVtMTU4V0p0Q0h4TFp2S3paQ1cwLzFlb2Z1bFpHYlZS?=
 =?utf-8?B?QS9udFBjQnpkVWZLMzFPdEd3b29iMnFzL2xjQm9IbWdqdVpiQjlKOU9TTis5?=
 =?utf-8?B?czJlcHhZekZ1SkhlUk9EOWN1d3Fhdmc1V1BkNHZmR3pwcU9OTUk5MFZxN3ZD?=
 =?utf-8?B?SXh0UUNvbHdVMnhPck9PTWlaSlV5ZmJ6eStsaW5ISE5YRlNDSDRZTkFYYnNF?=
 =?utf-8?B?S1VKRlU4UytQK2didDVRY2w3V01iZFJaTDVrZ09icEFTVE8xL2E0UG0ya3Jz?=
 =?utf-8?B?K1g4TGFmdTd5WWxaOVowVldaYjh2UmNUU3lDY2F1STNaZENzWndKMm1pOC9r?=
 =?utf-8?B?R2dXSTE4Nm1SYjVuVmtuWFMwMmJjTjdhdlRaNWVtSEw0bks3Y1N1MUg3Z3NX?=
 =?utf-8?B?cHFPTjExR3NLZzBLVzIwa3JFU2ZqYnJDMnQyNmxJTk1menQ2TG8xZFF3bjhP?=
 =?utf-8?B?SGk3TVlUZDFuSHpScE02NkdGSnpoMk5mbVJ0ZFlnaVp2WURNL1FXNXliL1By?=
 =?utf-8?B?azdOeUNWNDgxZDY1K0RDZmZFazJNU0loYzYzWVhoVk8wKzJCWGN1UU90d3hE?=
 =?utf-8?B?ZmowVThnc0lFbDgzU0dGbmNOSUJZWEJaWHo1OVNhVTB1a0Ewelh3am5OaHUv?=
 =?utf-8?B?VDRnTnJ0bHhjekhhYXMyWnl6R0NnVFlLRnpPVGFzdE4rb2c4U1dKSHJCM25t?=
 =?utf-8?B?WmlLajhMZ3ZyZkFsSG5md2NKNHhUSkQwZWpFNkpmMmhiN3VJUk8wajVyeFY5?=
 =?utf-8?B?bDhTVXE0Ulc1ait2M2w0RjN2dEtLTjBzNFVualp6TDBkOVo4RW1YdEVzSW5s?=
 =?utf-8?B?NnE3dExsUEVCZFM1ZnpNZnVkVTFYREZGYzlSd0hmQ3psUjU3b3crWmhDaFdN?=
 =?utf-8?B?RVV1VG5KOUVoVVhWOTRnZGhVZ1pUVU5Fei9LZmV5THVZc1NaTG5BOElkdVFN?=
 =?utf-8?B?K0ZtQ0xZSFA2Z0xRajJtcjV4Q3NKYlI3STVFYTVJN3hZa2gzZ3E3SDFMallZ?=
 =?utf-8?Q?xRXjikDw+HtKdO2VPR+v3LG4te1jgGt28Me9B?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0696edcc-1622-4fd1-3828-08df35c899e3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:26:20.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7PfySiO41PRGN+K8RZ9sOtE94JXe7WEzzi0Lw5zUiT+vR7q44SZqjwOgWKQPXhGUp4a15TNUb74FT0v7Rq0C2qmwmIht4l5V8+9KjUbaNt/FR4ld0dUtHmdM3DiTWrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Dear All,

This patch series improves the handling of the PLLDSI mux on the RZ/G3E
SoC, which selects between the LVDS path, a fixed division by 7, and the
DSI/RGB path, a programmable divider.

PATCH 1/2: Forward PLLDSI mux rate requests to the parent via
clk_mux_ops.determine_rate(). Drop struct rzv2h_plldsi_mux_clk.

PATCH 2/2: Moves the 4/7 duty cycle of the LVDS path from the mux to the
divider that produces it, similar to the work done on RZ/G3L [1] .

[1] https://lore.kernel.org/all/20260811182729.360959-1-biju.das.jz@bp.renesas.com/

Kind regards,
Tommaso

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Tommaso Merciai (2):
      clk: renesas: rzv2h: Forward PLLDSI mux rate requests to the parent
      clk: renesas: rzv2h: Report the DSI duty cycle from the LVDS divider

 drivers/clk/renesas/r9a09g047-cpg.c |   4 +-
 drivers/clk/renesas/rzv2h-cpg.c     | 195 ++++++++++++++++++------------------
 drivers/clk/renesas/rzv2h-cpg.h     |   6 +-
 3 files changed, 107 insertions(+), 98 deletions(-)
---
base-commit: b427a7529bc420a22cb22ea09cc788e925804e8e
change-id: 20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-c009586b76c8

Best regards,
--  
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

