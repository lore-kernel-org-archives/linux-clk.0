Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283995;
	b=Pkvm/0AQnqn5sNIjD1skYng5BCbDK81DuoIoAOGEvmjCM6LENb14c/yxoBSNveb6hYHD
	 eg8KHOUgox314Q0VeH0RuzF846+Xn0KJ0LLp3fArjp4cTsCX9jntD4nlND+rK1QTWcsK6
	 j6/nHI92eIqK6LLUQP0MFD88T3T4RmRwGruvjrjb0i2jRMaooii7j1NPbOuYT1UlcR1/q
	 ZzxWz7z/tCu0RbuXU871HAQ3PoZG6BFKctF67I9jj+gUhX5FWfXOCmV2LawDWUVejH24m
	 lQxyrfGjwUIDD02Ztp+4ElKevUNcv7aQxD9DEUxH+lVDQXtHE0/J0xRNGs/Sv4pzqlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283995;
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
	bh=HrHbtTBc2tP1jAaFtXLnfPOe2KN4rEIODss21JbcJiw=;
	b=PwxEd4SFur52iYG6rOi2rLMK3Eosi50SWTG9qg9387+SrG5dXVCoNI2LR1cyCgVOahTZ
	 0UCS3OcIDC7O3atZsa3zSrcnFgrTGWnpUFmEJjR1r//PfK7A60JD4tnM99d1W3zBC4jHM
	 9LdtXXN7Z/Yd7SQ0bzLv6tSvz4LYMad6n8RANrjkSVzC0vs2NhFZF8tYaSDwXVLxJXL+p
	 i7eBuZQAflFu6CQuhqYqv5Hl5iWZkzATD3H3pWB/xYk4h+YN9zyH69us8ZVdgLCfXUPDY
	 lnpLsV25L/JSCn6YTBWPDVfy6p/IVY9VkG+TJlVyObxVPqcpK0uVU5sNjydriuq+b4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fSSSbbSd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A790606A31A;
	Thu, 29 Oct 2026 14:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A790606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fSSSbbSd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr1LrKW1+BgjoVTgfw45xfjDdQoHSpvM5pckv0aq1lfeFLgG/ij2/yvGWYA1O86sYiRx3gHIzJiXDSLAWscV5lbvi1DgzEqORHtQNieyGrLIyUq1OrsTmvZ8a9QS5VMvfzlsleoEqHl8pAZsX4ZoLcArKYE7t0mR6Iii2c8G3wU5jGnb7KN7LINE7MsayorOZ9pG3qtgfa0PDaSSNb6iu3+yPOh11ghjAP5zLNsAx2BwGiNvCaQ+IcqFgKVgSW/uqd+lt01ZXoIaKkEC9czDTQccGdWit8yyyEs3NN88iZJC+E6BvNcjquwimTOI8N0gFxQSgFvxQ+QC/k4BGBjMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrHbtTBc2tP1jAaFtXLnfPOe2KN4rEIODss21JbcJiw=;
 b=CcDqnMsKfX2U0sIgsrWepGZl5QB8jMplpVFB9L49lJUgYajSrrY4Xa/WEEDE12Ta5HDpqwXpYUF7x4jdTglKor6mmS3+mZi4cq08iBBsbC/BTvz6F5eLsWCLzm6NTbs9Z9wu6kbonWuf6jzmROGMalWIEer3v3GlRACFQ8cgz2i7ao9Ge/sJo5jFcNWZXhaa2dtIxZpAU2Gy6Sf5rOHnRqH63291XVCi+LfHgT9zm+noUHaWCG9EmM0VnEw1AIdeZGEmQOy6NIxQT1bKKh6lD/ATYdMHgGG7GhwhFDWkSBWPMZTDqCyk/1HKiyundtGz5SXMvafTM1pdmu/ORJs+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrHbtTBc2tP1jAaFtXLnfPOe2KN4rEIODss21JbcJiw=;
 b=fSSSbbSd3ISlYYhUChiSN0+6fnaf5wybJNe0RAqL/2u7i4X61qM/LJRqj7bIEJg7h3GQu9onlAdJ08dkFbRb9xbL/3nLARviqBC9e3R/oNaZ/6z76v1kKexiXzGk2kYa1n0/HKNU/VWqM3ehfPWKI9WZ3lW7QLyhrGisyZq/FeE=
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
Date: Thu, 29 Oct 2026 15:25:38 +0100
Subject: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793283976; l=8119;
 i=tommaso.merciai.xr@bp.renesas.com; s=20251006; h=from:subject:message-id;
 bh=LVE6RbJVP7mBhhy/pd9MiSjLEjFe7aKfecpxyQYf56U=;
 b=7T+rtOb9gWDqh8mNL8vL6zZS5sVldHCsYc9zG0glccdZo/Myzp1YfRfvlsWmTxHC1WBNhi4fj
 7cIF28gWZVMBT3tbih14Tr1OOAraZFA8JQ3yBggeXoKCNqD9EZbfCra
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
X-MS-Office365-Filtering-Correlation-Id: 56047f20-f7b6-4f3f-3ec9-08df35c89f4a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UQsX1TUePlnYF0Mj9hue0A4726VirM510344KaxZsyNF2o9AYiWICgg2LZavq6o9FUO6IPIJ3dQniH+ggho2EaVi1chbYBx1PHSGEIgWQXoUwK9zCmCNYbXRvtX+Zkq9YM17YfwpvFdPBPGMrvIh/PY5kfLL9nkrSLy6Ac/n/eH6T/DvuMFgRPb9MDDrRSthiWYui43ziEs/cRDVnKfL0RKmDkq5zzpPEg/k8nBPKOPNzZMVBuXLsvOp5ch/jTb33loRKi2LXlUNzimi8moy+N1nFo2sSx9aJeTM9f25j/rSxkc4B4HHGJbfHRv9+l5ohceJBWxQV7UeWfU84V02ayNuHUgzgWtvUM44veX0KQqkWGXiAPsMguJ+zXGPoK+Rajze24CVYluvQeMlSf7iktmVDEPGigKk+lePJwW9I0S//KxmZnXe/mR/BvFYtyjf5cLEiCAv61SSTVJU4bUHXVezckXPayQd6hvh6JUwQyRymfAcDAzSJyxYRiUdmuRGZWKeD0vHq8IzdKlZ7/b5MsyUZAg8RM0NHSqcjIi74YLyBMGphneB17lkFuynBGOxzDe6xSrAPp2Yf6rYwig3OUntumh5AGF/pqnf/eUlbEO/G2MjtEmj8+fX16k+nIN6KIyZ0pIHkRbA1X+7QSkyw3ZiEusk48MBVQvVs66bl+ObwuIXU9d4WVUbWDFPYFA6e+icoRPWv1+GFVtSd7oCflKwioihxKfODlbyg7RdR+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13601.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEQ2WExUZnZ1R0hjWTRLWkVLUUVOUHI2TGkyMUJZOWdMWEdpUWxsT1A0YmtU?=
 =?utf-8?B?UWM0aUdNRGFJdjNlT25pcGdhd09mYUpYSWRVM0Z2V21xZlVUYkJIZVM4OUhs?=
 =?utf-8?B?bzNlWlRFeEtCM29DMER3NklsQkpxa1kyMk9FNVlIdGtHSC9jYjM4ZVU0Ulh1?=
 =?utf-8?B?YWhSMDZSYTNDbVh1VEkzbVNzazBjbDJsakpDeURjV3lCamhFSHV5WHlYdEFN?=
 =?utf-8?B?SUtIWTRSSWtHdUY4UllRZTBqdTA1Q3FFQUxVVzR3aDNXZlBRd01PdkNKTDM3?=
 =?utf-8?B?YmxGLzFvcjZGaXBaNlB4SnBReHZ4RXlwN2NlRjFLK2hTQS9PZ255a2JDNnAx?=
 =?utf-8?B?TTNGY1Z1bXBPVmxOZ3VUeDgzZjdFMmh2bTVIVE42MXBBbERlQTFoZng4OXFB?=
 =?utf-8?B?NVQySHhCZ0NNOWZ6aHJxSHlKNjNZUXVrNVFUUy9odmNWZVFwVTAzb1pFYUU0?=
 =?utf-8?B?WGxnU01tdk00a095NFp5TjYyNjhMMExyRm1BTVpUUExqSFcwRm9jeERoejJw?=
 =?utf-8?B?ZTl4OGJzMGtBMzVzeU1vWSt0Y2IxM1JSNUdMdGo0TWhxQTVrdS9kdWoyU3h0?=
 =?utf-8?B?ZUx1TkF1VU5JODRjRlk1Znk2R2pTazRUZkRhbzA5bFZUSHMrbkZ3OFV6NDdM?=
 =?utf-8?B?WGZ0UVIyUEdsQjZUNkFNZGVaODdIdTQ0VFB3aVFSQ2VOcUExREI3Y2VzUDdk?=
 =?utf-8?B?bHRxOTJTYU1rU1JDQjJSbUo2ZnU0bU10ZVNZeXVTRW8zYTJ0YjUwY3cxT0ZR?=
 =?utf-8?B?REMvQjVqOXh0SFJZak9EWXc1VTkrNnBkQzB0ZlIzdHZQanBqNnNOd2RBbjl3?=
 =?utf-8?B?TTBhb1J3blJqN1Y5RTVqVmJ2OGRyN0J5NjlKeC9pZ01kalNFVHZzdWJDblFJ?=
 =?utf-8?B?ZmlzbUVlWnY3NGRqc3AzTkw2OU1WQlk4NUIvTDRBUmQ1MHlPNWZ2ZEJFbmFi?=
 =?utf-8?B?NmFyUWUzem9SNGxDVkFkeEJETWtQdWE3VkdIMVJlVnZvVTVRRGdHQXYyRTdy?=
 =?utf-8?B?d25ZYW4wSGxXL1ltNEJkN0tRd3UvUEZZTXVpSnQ3cFlsZGpobEJ3ZGt6dS84?=
 =?utf-8?B?V1ZMdUQxL05pNlprOTZVMDdZN29iTUpMVllPNFl6cWh0K1NSMkZuOW10NGpk?=
 =?utf-8?B?L3JhY29KaXNVU0d2RTRuVkV6ZSsxNkkwVUE2UUYxbTFpK2x3TlZsM2hFZzdo?=
 =?utf-8?B?ektZaGtoRUljTEtqOU5mYnRUOSt5cldCcEkwWThoOGJjeEViT0RDU2htUzNl?=
 =?utf-8?B?TTVEVzVQT3dzT2Z1RFZ0d2JHNVh6M29MYVJaVllJQ2x4REdKQVlBMGlTdWJK?=
 =?utf-8?B?Zk9lay9nb3hjVmxkZGgvUHR6OFRwOFQvTTNMa1d4YmxPU2RMK0lZVXAzdWZB?=
 =?utf-8?B?cmlXY0k2VU13V2RVNHJ4VklpRkFXcWxuV0I0YitxZEFlZXhxK3NNUmUzd3gz?=
 =?utf-8?B?a0F1MzFJMkhBUGF1MkZPd0k3UTRPK1BmUzVRZ2c3dTgyOEdXdTZSSTFzaDlX?=
 =?utf-8?B?dHRvSlhDOW4xWUFZWDdtSXdrcUdhM3hQaUtRblpFK0JpR2VPbXZWYk1TU1Q2?=
 =?utf-8?B?ZEZSWDg0N1lTRzNCbTIyMW40cDRGWitLTU5DV0JCbUhsZ0VOaVBPZjdjRnRT?=
 =?utf-8?B?UUVDa3JRSlAxRkJ0dzVENnQ5MEdnVURIWmJGeWlBRkYxMEx4cjBnQm1rZFhs?=
 =?utf-8?B?MXI3OUYrYXFYWlcvS1RhcjI0b29CTmhOS0hVTnNsN3E3aVRUTjV4bjlrZTNv?=
 =?utf-8?B?WjZaY2xFdVpkdHViQy9JYWVqbUE4QmkydUdQVlBtNDJoZk1Ma200K3UvakFl?=
 =?utf-8?B?K284VnVCMkZDSTJJdzdkdHZDRXp2aEVndnRyZS9TRCtZbVF1Y3B2L3k5L2hx?=
 =?utf-8?B?R3lFZFc3OFJ6cG9taUxPK3EyZVJyNmRvSkF3Qy9HRXlheWhnTUVxaDN6LzJE?=
 =?utf-8?B?TGhETzJXRnNzU1J5TXpmak1QQUVMbWkxNW4zQlpxNnBOVVZOcmg3SFVQZUwy?=
 =?utf-8?B?N0xQMnVjNFN6SGgxOFJ5YTNkOXlDOVdXWW9KVXJXOERyeXpSWGZ6Z2FDS3hD?=
 =?utf-8?B?WklBTEg2aWE1LzZiOUxnZHQ0N2JzdnJNVjFkZTR6N2VuY0owNHRJUUZoS0kw?=
 =?utf-8?B?RFBIWGRFTG1zT1grSHRLTTBUQ2VZbjYwVFlnNGVpUm1Qdm1BbWJIb1N6YnZC?=
 =?utf-8?B?YkswN1JNMXV5R2Fmcm4zYXBpTTVNN01aMk52WHk2L1VCNlpGejBHd1pSS3dV?=
 =?utf-8?B?NVdpRG52YWVzMXVEM3BhT3p1S1BnNDMzOVBnUjRRNk9peWVKeS9jazJKd3Y3?=
 =?utf-8?B?ZVpsb0txRURZT0JjTENVWXIxS21hUmI3N2RpeFR4VVNaRkt3emZmYWQrU2d4?=
 =?utf-8?Q?0bWIdyfqIiCm7ItjPdGMTTyyjw2JBThD7GsGJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56047f20-f7b6-4f3f-3ec9-08df35c89f4a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:26:29.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pxD0DSyILGUKBP7Nh2B/wSt71Hh3noEmuRjFwyLDFp9zZXSoEA3wEapSzRMTypcWh96NcUmHi9uTc2RcndXiKdVpnfnVIO4I5hsautmKlHGI3rPwsy8sdpHHGuL4SLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

The 4/7 duty cycle of the LVDS path comes from the division by 7, not from
the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.

Report it from a dedicated LVDS divider clock type and let the core walk up
to the selected parent through CLK_DUTY_CYCLE_PARENT. The reported values
do not change, the mux keeps selecting the path, and its duty cycle
constants go away.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c |   4 +-
 drivers/clk/renesas/rzv2h-cpg.c     | 120 +++++++++++++++++++++++++++---------
 drivers/clk/renesas/rzv2h-cpg.h     |   6 +-
 3 files changed, 99 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index f576dd441a11..cecc6d38d8f0 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -226,8 +226,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
 	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
 		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
-	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
-	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+	DEF_PLLDSI_DIV_LVDS(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 7),
+	DEF_PLLDSI_DIV_LVDS(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 7),
 	DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
 			SSEL3_SELCTL0, smux2_dsi0_clk),
 	DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 12a5f058dd71..7ca2447fd811 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -75,11 +75,6 @@
 /* On RZ/G3E SoC we have two DSI PLLs */
 #define MAX_CPG_DSI_PLL		2
 
-#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
-#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
-#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
-#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
-
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -466,26 +461,6 @@ static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
 	return clk_mux_ops.determine_rate(hw, req);
 }
 
-static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
-						struct clk_duty *duty)
-{
-	u8 parent = clk_mux_ops.get_parent(hw);
-
-	/*
-	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
-	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
-	 */
-	if (parent == 0) {
-		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
-		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
-	} else {
-		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
-		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
-	}
-
-	return 0;
-}
-
 static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
 						struct clk_duty *duty)
 {
@@ -497,8 +472,7 @@ static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
 	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
 	 * - Otherwise, select DSI/RGB path (parent 1)
 	 */
-	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
-	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+	if (duty->num * 2 > duty->den)
 		parent_idx = 0;
 	else
 		parent_idx = 1;
@@ -517,7 +491,6 @@ static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
 	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
 	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
 	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
-	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
 	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
 };
 
@@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 	return &clk_hw_data->fix.hw;
 }
 
+static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
+						    struct clk_duty *duty)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	/*
+	 * An odd divider cannot generate a 50% duty cycle: the output stays
+	 * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
+	 * of 7 gives a duty cycle of 4/7.
+	 */
+	duty->num = DIV_ROUND_UP(fix->div, 2);
+	duty->den = fix->div;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
+						    struct clk_rate_request *req)
+{
+	return clk_fixed_factor_ops.determine_rate(hw, req);
+}
+
+static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
+					      unsigned long rate,
+					      unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
+}
+
+static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
+							   unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
+}
+
+static unsigned long
+rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
+					  unsigned long parent_accuracy)
+{
+	return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
+	.set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
+	.recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
+	.recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
+	.get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
+};
+
+static struct clk_hw * __init
+rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
+				       struct rzv2h_cpg_priv *priv)
+{
+	struct clk_init_data init = { };
+	struct clk_fixed_factor *fix;
+	const struct clk_hw *parent;
+	const char *parent_name;
+	int ret;
+
+	WARN_DEBUG(core->parent >= priv->num_core_clks);
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = clk_hw_get_name(parent);
+
+	fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	fix->hw.init = &init;
+	fix->mult = core->mult;
+	fix->div = core->div;
+
+	ret = devm_clk_hw_register(priv->dev, &fix->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &fix->hw;
+}
+
 static struct clk_hw
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -983,6 +1044,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 		}
 		clk_hw = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_DIV_LVDS:
+		clk_hw = rzv2h_cpg_plldsi_div_lvds_clk_register(core, priv);
+		break;
 	case CLK_TYPE_PLL:
 		clk_hw = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 4492f4e7b9ae..fa6caf693a72 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -207,6 +207,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_DIV_LVDS, /* PLLDSI LVDS divider */
 	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
@@ -246,12 +247,15 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_DIV_LVDS(_name, _id, _parent, _div) \
+	DEF_BASE(_name, _id, CLK_TYPE_PLLDSI_DIV_LVDS, _parent, .div = _div, .mult = 1)
 #define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
 		 .cfg.smux = _smux_packed, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
-		 .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
+		 .flag = CLK_SET_RATE_PARENT | CLK_DUTY_CYCLE_PARENT | \
+			 CLK_SET_RATE_NO_REPARENT, \
 		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**

-- 
2.54.0

