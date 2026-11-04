Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793793581;
	b=zgqoq0ZxZZKPl0hOUoNI38qsHUNwmQVQd37H77NF1yTp6IKzzM+V11rEAPBDJYs4fE4o
	 AwXWMYgMe6CdVamnf/7xhxhDWCD1JL3r8mXLpPDzEgkanoTsgGPnMMNCZJwnjaOcIAHEo
	 MbmeF4BOW+t3Fll9nfNEBeZbDA5xSGAKpLIb44ESmW17Fh65iEMhulpm1bdGJb8rNdJTO
	 4uZPZEZHhSemyFz/1PrwarPpbhnuIP9T4tywixnPIS5j7C1jLJrcHEUA1NJv037n8YkuU
	 VUxdnH9rQ+Ni+k5y+46CvoPSaAI8DnCcTnWKlG0BOIoBLqgPaYDqHDyarkPr8ZJYWgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793581;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=PTca73JcWVXoQn9Ndaxl3EDBJzITtlgjhNuFiexk9o0=;
	b=KcI/Qu6LsYOXvDxkOorYFMeoQsNY7rBuwJOxfH7Ug9gVHV/IyP6BgraPdxfpmkA30yjG
	 05k4tERPwDLIFi6DzAVZR9i0BvEtJwk+eJV1eM14OT4Lxv/MPMgKn1gt3Ze3KT6pbmRcH
	 O8AaPPsuEES3luQMUCkFm/h2vbhsMIH7GHe7ylWauZtuvSdH7tCSPOsnVe9Z6hgMibNAV
	 5umfFU0gNBq8vcTLgjOSLVgYK74nV1+ZgG+2N1UdH7gI15uEmQm0CYv0EbMGWpma8wST2
	 ZXhvonxYEJc8jpUu3WppXGODHE6upC2TVMtTZmh3ylJMpWg4AwryKJj5n7JeW5nzxMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Z1lOwLcG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.94
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023094.outbound.protection.outlook.com [40.107.44.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F5606A31B;
	Wed,  4 Nov 2026 11:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113F5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Z1lOwLcG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0HofTzCS6jLDUW5Hnu0l5oAd0qoPAheifDbZs9kDa/aDDDxA4KFO8yDoFz77GmvyapPbZOv+m+xi0lSeKuZZoAuU0GYiZ0pdmXZPFPgslpqcDgLN5DX4CPfxFBFBjPfX08w5EAR6Sbh3El1Sc2ds6ItnPsFqKkCSMXBcHZRhOoxCFT+Y/W8VLpXCjqcfp+z0phPbPpu/uYwNLefDAwid+TPzQM9wMhBFRZJhvQG77h9Ztb3iiefT7bKf9QKz/qn2krXgkI3qIPFDWSle/WW8uT3sawDve3GC9LCpUhD3N8X6dl6crD1okNeFelmrhxANdndZNpYbjx8tqhlf/0ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTca73JcWVXoQn9Ndaxl3EDBJzITtlgjhNuFiexk9o0=;
 b=FZ6izGmsi73X8aR2XTm8sRRa1odE6VChiX7HrCltTgau1NifjwWEFWAiXrH8LPxCD4X7G4UEA5l1aWMPqeT3J37aO1Zuya15gJeOvMYSsZc2W78LZjCXdQ+NoF5RH8kNLidrhvFOVU5IOxFejFiYc2KCY0qWratQ9IMGY23+y5vgeO9xsXHsFVl96GKD471W0ARu0svSLHhy8oBegd90GwRb8GrL1dB5NU8Cl/y09oY70HL7wtmJ9oqrzWIYhWV/lKpnR4fPCIvDuau0f/xU6vNcnNhCuOUAm+z7XTmNHzFafvKzVT09h0Vh7LLQZDtcQrluMYQ+blUOzrY/ALFR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTca73JcWVXoQn9Ndaxl3EDBJzITtlgjhNuFiexk9o0=;
 b=Z1lOwLcGikiGSFflEibO1P42fDRDrPUllw1TzyX8Th5lPfj5bE0FJSgGzQ1TFSQTe0+bkOJewiUNfjOa5CdYMiqUUGIFOfcRcyG7KEHfKjSA494VW61JpFRTc1+3Cv0UUxfI7yGGmeSuwKRtzk7+SRKKFk59UyBrNS0ZQycVolqzrSJd+ac0vojTMtg2v8fFtHW2nH6/Kr4ZfO4zcnYQjtFEdYbG7FrQ+dJnwv/jaNMMN25Y/RF6Zvv/I8D0QTOP6oFAJd37lxeHxGLTnL5kJ3s5Ys1jDdkUYUNM5fM/q0ZIqsqpHRPALfHlZlwhKb9SQVt94MoP1hiNojYiC1IJxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB7925.apcprd03.prod.outlook.com (2603:1096:990:32::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:59:35 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:59:35 +0000
Message-ID: <6db205ac-1a00-480b-9ccc-6f2a588d5ae1@amlogic.com>
Date: Wed, 4 Nov 2026 19:59:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189074@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <sashiko-outbox-189074@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0192.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 992696f7-33db-4cad-972f-08df3a6b1806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|261022113327099003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ga/a5HJF0BskNH4OanPRctf23fbeURjVz0u6wsqDQRDZwiE35hXpAJ95FqyM2Fij+EvmymLjwjpFa2NVGir/OsX2p1GUVStmmLwUcTOQqPP8wKYp3cLCJOpV6OKrGnDEyvPD4PROxSwc0oGMBJmfz/sZ0Tu5gn7lLUCqoFpri5rnD/sHm86MghTdt3HHVO30tRQ/h9r2oo4pweAQ3eWMSvFzo/HybgblEIpbufDYcQK+ANc+Xf4lw1YqqA4+D9z8YksMDMFxVdZ2igCSSDXyVVEQM1VchUBQs9wbwdZZo7B9P5oCAARtKnbBrXHyvigiUG7fG8tublIYvoDemiZMkJdxIuAi2xke693m6POkVlry16CVTEEDxkoBgI2Q/RgsyiqRvld2yA6XVdpRCKJ7mid9rp65p7feWY46GwRYdItmHJuX44geBKHFFDtqLsql82kcUCs6D4iCMfYhLXh/Qr9WgE2iCSyJqAoomsT5GbzD7GjgOhK57Yg78T519ApfcmbOhmb2lvwGuW5TnENrft5p0Jj3idZEoAgOeEkkq0BejkW7cNzQ4Hz611UZxMhKb6TIagEy8rY9RgT4r/qnSYJG+Zo747lzzev6Pgv7WWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022113327099003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRYNWlRQlZmZ080TWM2VVYxYk96VWkvaXhCdi9rekFzMXdRcCtWeVF0UkpN?=
 =?utf-8?B?SkJYU1NCRy8xUG1Eem1VVEpwZU1XWEk2aXA1SGVCYmFqQjJpQ0ZxcnY1K0Mr?=
 =?utf-8?B?UDFyKytWU0F1YVZ0TEw2SkFhUlVQaG1pN3laemdjRE5KbmVGOUdFWXJTVEh1?=
 =?utf-8?B?OW4vbEZNWHJHbWxMdTJXRUQ2YnR0ak5acFZXVkFQK1lKWjlRVy9FdExHbHJv?=
 =?utf-8?B?dXBFZ2RLdUloOGZWUWhXYWtOeE9za21ERi90cHdzdWFyM2tYSGJZcVU5Y3No?=
 =?utf-8?B?Y3RHRG02WDNnaWw2Sy9YWjN2Ui9VQjlJNnhBcWNwYkxxbW1XOCtWMXJKS3RJ?=
 =?utf-8?B?YWZ3cHNwdklqVVBTd291SEwvRTRUQktYbllMSkdyY0h3ZFE0bU5SYWlqYVgy?=
 =?utf-8?B?OXhnKzBpaDRxdm5CUjVDVW5WSXlCcElGS3hqQXBUNE5iZEZNcW5XY04weUQr?=
 =?utf-8?B?MTVFZlpOUnRzVW5LMnBGRFpJOHNGWGVSY1JUMkx3WG1sYUxzOGlNcTBRT2ZI?=
 =?utf-8?B?ODJ4VXRnUzhmcllpKzEwK0RKNlJmQnFxeCtZUDRDeUpsdmhiUlVoMmQ1QmJq?=
 =?utf-8?B?ektPLytwMk4wb09xbVlqblJRcDFzR3NwRTI0eU9TbVE3ZDFwcE9oVTJCMllK?=
 =?utf-8?B?eEJFbk5nN1JZMnh3WUhERjZjbHF1RmlKYWhBT3U3QzBMcVhzTjFRZlBQU1Qx?=
 =?utf-8?B?RFlkR0ZIcmdRMENKbmJka0h0ZUdNeUh6R0F1MWtOOU5pNUlFUVhVNk1sQmow?=
 =?utf-8?B?bnVxRldqMUJWTmYxdy9aQjM2OGhQbnhuM3ZPUmpPN0JYR0V0YUdCQ0F1eGUw?=
 =?utf-8?B?aHNwRFNSUkw4QmFKQnR3cU9kNWhYWlpnWHRObFA5ZCtnQWNKdnJXWjRKZTJi?=
 =?utf-8?B?ZS9pNnNvVm5VcUpuNVJnMXNPMitnZ3Y2Y2FPYmRrSFNTSlMvNXFEdmlhYkZi?=
 =?utf-8?B?Q2pyWnpuWTRJSjFNR3JtSjcwV21taS9LcXJ3TTFUYTBmZEs2K0hJa0tqKzZm?=
 =?utf-8?B?bzVoMHJPN3R4UFlHd01hc1d4bTZxK2JhMmM1OXNvc2tHQnZYZDhWSE9NMUNZ?=
 =?utf-8?B?dU03V0Fmc004MlBJQy8wc0p0NzZ4WlpiNDdEOTY4MmhBNUUzNW9ZaXhFaExH?=
 =?utf-8?B?UVhxcjlOWmNiOXROUWora0RRa3lPczNWMS9Jdk1jUU5ENE5Kbk4yM20wWSty?=
 =?utf-8?B?ZXBxMFRSSlNnQjlRODlWS0puNW9ubVNaNVBiNGdmeXh3Zk1zeExCZkFLbzNG?=
 =?utf-8?B?MmEyWU9PTmpWNVRBcGlBYlp2QTdjdE5vVTdCN2JDTGIrdldGcUtubWF6bE03?=
 =?utf-8?B?eUtVMENTdmJHVWU4TStCaE5MQ0NYZHcvZmpBcXN5RG1rQVJ3KzhzSkhscEhI?=
 =?utf-8?B?MTBSak5idWlBNU1kdjlZWG9IRFZJQlBkVlZTTGRqVkcxRTZIKzNZNnlyTjBv?=
 =?utf-8?B?RXpodFdkbTVSYXIvS090RTJHR3I1QnJxR01UZWVaektoaVNLZkdhbG0vZHBE?=
 =?utf-8?B?QXBCZ1k2TFB6ZTFpdTJJSDhCNXJVai9jUTlFS25lNjI3bE1NYW9TeDRScllu?=
 =?utf-8?B?UmsyUkhYeEYzcG9wMTNPa2c4Q1JRZTRudlo5aEdxazdML2Zzc3NpU0FQbzdn?=
 =?utf-8?B?NFJkQVV0T1pGNmpQRm1CMlZCWW1kZlZxUXRvZEhiK0NXVy8vaEdlYzBNcXJV?=
 =?utf-8?B?ZjZPR3g3dUNCSzl0MzE0T290NVFWclE2ZFQ4cWNRZWI3QVhCMUJpRXZCVlZS?=
 =?utf-8?B?OEE0N21MUjk1RmVMM1J5T0lSSDZVOFlHT3dOMkdPaUU0Zmk1dmF3dzZ2R0U4?=
 =?utf-8?B?dHB6RkhGQWFVSTN2V1p5RjVtVGFOZXc4QTQ4ZVlETEJxdFU4UEYrYUJzQTI5?=
 =?utf-8?B?WlQ4THZXTjRJbUx3RnFJWTN0M3I1TVczTEVUOE53Y2VoZUo5T2llSUwxTkg4?=
 =?utf-8?B?VDMxd2cyM3lMQVVqZHR4R05hQWR2RCtuakd4a0Jod0czWHN4UWtxckxWSzVK?=
 =?utf-8?B?ejlCWFJqWllIdGZ1cE9VdGhvNDNWNGtxaWx0ODRmV3FOMkFHeVBXZGNmdXls?=
 =?utf-8?B?VXdtaHJrRTQzME5HbTZGKzVnTXl2ZEFiRWFWSGV2Q3BSWGJHUzNuM25jQU53?=
 =?utf-8?B?ZktKcnRlLzArYnNvK2VoSmdvZFBSRlArSVBDbG1yVTVIWjQxZTFONmd2bWVh?=
 =?utf-8?B?YVNpVkdEc1hVMHc4dnhRaUd4cnh3d21vdGNvODhYRFFHYmRySlJPQVQvcXNi?=
 =?utf-8?B?Y1A0eWZUWUlNN1pKZksxcUx2QnFCWmtOeDBRUEpmY2ZSYXlmazRvTzIvcWo4?=
 =?utf-8?B?b1gxZnA1MGxBVURFSG1hT1dFdWxCaXBrcWEzeWJOOHlPNElQSTNDZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992696f7-33db-4cad-972f-08df3a6b1806
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:59:35.0115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0EMQ5UpSBnqznHMj4VCKGmixe/luCPclSxp0V2PZzvlXNj4clUcpDPaBmP2qDWNaZwathoDHay9OEO0ZQnBNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7925


On 10/29/2026 5:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] clk: meson: pll: CLK_SET_RATE_PARENT on ro_ops PLL DCOs breaks rate rounding
> - [High] clk: meson: pll: meson_clk_get_pll_table() fails on non-exact multipliers
> - [High] clk: meson: meson8b: missing CLK_SET_RATE_PARENT on hdmi_pll_dco_in
> - [High] clk: meson: pll: cached 0 Hz pre-divider rate on directly programmed PLLs
> --
>
> commit b0439d678a94dfead2cca909902c6363ae03f5d0
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: meson: pll: Remove the dedicated n parameter
>
> This commit removes the dedicated pre-divider (n) field from
> struct meson_clk_pll_data and simplifies the Meson PLL rate calculation.
> Each PLL pre-divider is instead modeled as a standalone divider clock that
> serves as the parent of the PLL DCO clock.
>
>> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
>> index 280842e9cb371..e6e6b9a8030c0 100644
>> --- a/drivers/clk/meson/axg.c
>> +++ b/drivers/clk/meson/axg.c
> [ ... ]
>
>> @@ -202,10 +240,11 @@ static struct clk_regmap axg_sys_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "sys_pll_dco",
>>                .ops = &meson_clk_pll_ro_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "xtal",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &axg_sys_prediv.hw
>>                },
>>                .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
> [Severity: High]
> Does setting CLK_SET_RATE_PARENT on a clock using meson_clk_pll_ro_ops break
> rate rounding and rate calculation in the common clock framework?
>
> meson_clk_pll_ro_ops only provides .init, .recalc_rate, and .is_enabled, and
> does not implement .determine_rate or .round_rate, so clk_core_can_round() is
> false.
>
> In drivers/clk/clk.c, clk_core_round_rate_nolock() checks:
>
>          if (clk_core_can_round(core))
>                  return core->ops->determine_rate(core->hw, req);
>          else if (core->flags & CLK_SET_RATE_PARENT)
>                  return clk_core_round_rate_nolock(core->parent, req);
>
> When CLK_SET_RATE_PARENT is set on a clock that cannot round its own rate,
> clk_core_round_rate_nolock() and clk_calc_new_rates() treat the clock as a
> 1:1 pass-through of its parent and set the rate to the parent pre-divider
> rate (24 MHz or 48 MHz) instead of the multi-GHz DCO frequency.
>
> This affects child dividers with CLK_SET_RATE_PARENT when consumer drivers
> call clk_round_rate() or clk_set_rate(). The same pattern is also added on:
>
>    - sm1_gp1_pll_dco and g12a_hdmi_pll_dco in drivers/clk/meson/g12a.c
>    - gxbb_hdmi_pll_dco, gxl_hdmi_pll_dco, and gxbb_sys_pll_dco in
>      drivers/clk/meson/gxbb.c
>    - s4_fixed_pll_dco in drivers/clk/meson/s4-pll.c
>
> Should these meson_clk_pll_ro_ops DCO clocks omit CLK_SET_RATE_PARENT (and
> use clk_regmap_divider_ro_ops for their pre-dividers)?


Yes, the meson_clk_pll_ro_ops DCO's CLK_SET_RATE_PARENT should be 
removed. And the pre-dividers

use ro_ops. I will fix these in the next version.

>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index 1ea6579a760f3..a7e3f8c8eb783 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
> [ ... ]
>
>> +static int meson_clk_get_pll_table(unsigned long rate,
>> +                                unsigned long parent_rate,
>> +                                unsigned int *m,
>> +                                struct meson_clk_pll_data *pll)
>> +{
>> +     unsigned int i;
>> +     int ret;
>> +
>> +     for (i = 0, ret = 0; !ret; i++) {
>> +             if (!pll->table[i].m)
>> +                     return -EINVAL;
>> +
>> +             if (pll->table[i].m == rate / parent_rate) {
>> +                     *m = pll->table[i].m;
>> +                     return 0;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
> [Severity: High]
> What happens in meson_clk_get_pll_table() when rate / parent_rate does not
> exactly match an entry in pll->table?
>
> Previously, meson_clk_get_pll_settings() iterated over pll->table and used
> meson_clk_pll_is_better() to pick either the closest entry (when
> __pll_round_closest_mult(pll) was true) or the largest table entry with a
> rate less than or equal to the requested rate.
>
> With this change, meson_clk_get_pll_table() requires an exact match for
> rate / parent_rate and returns -EINVAL otherwise:
>
> 1. Sparse multiplier tables such as sys_pll_params_table (which has a gap
>     between m = 68 and m = 84 where Meson8 CPU OPPs at 1800 MHz and 1992 MHz
>     fall) and meson8b_hdmi_pll_params_table in drivers/clk/meson/meson8b.c
>     will fail with -EINVAL in meson_clk_pll_determine_rate() and
>     meson_clk_pll_set_rate() when rate / parent_rate lands in a gap.
>
> 2. Unlike meson_clk_get_pll_range(), which clamps to min and max and returns
>     -ENODATA, meson_clk_get_pll_table() returns -EINVAL when rate / parent_rate
>     is below the minimum or above the maximum multiplier in the table. When a
>     child post-divider runs clk_divider_bestdiv(), any candidate rate * i
>     outside the table range fails, and the fallback clk_hw_round_rate(parent, 1)
>     also fails with -EINVAL because 1 / parent_rate is 0, causing
>     clk_round_rate() to return 0 Hz.
>
> 3. meson_clk_get_pll_table() no longer checks __pll_round_closest_mult(pll)
>     (for example on axg_hifi_pll_dco when fractional mode is not used), and
>     leaves ret unmodified in the loop with an unreachable return 0 at the end.
>
> Should meson_clk_get_pll_table() retain the best-match and clamping behavior
> from meson_clk_get_pll_settings()?


Ok, I will retain the original best-match algorithm.

>> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
>> index bc029c6ab622d..0c9ba079bc51a 100644
>> --- a/drivers/clk/meson/meson8b.c
>> +++ b/drivers/clk/meson/meson8b.c
> [ ... ]
>
>> @@ -185,15 +209,38 @@ static struct clk_regmap meson8b_fixed_pll = {
>>        },
>>   };
>>
>> +static const struct clk_div_table meson8b_prediv_div_table[] = {
>> +     { .val = 1, .div = 1 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap meson8b_hdmi_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = HHI_VID_PLL_CNTL,
>> +             .shift   = 10,
>> +             .width   = 5,
>> +             .table = meson8b_prediv_div_table,
>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "hdmi_prediv",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +                     .index = -1,
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>>   static struct clk_fixed_factor hdmi_pll_dco_in = {
>>        .mult = 2,
>>        .div = 1,
>>        .hw.init = &(struct clk_init_data){
>>                .name = "hdmi_pll_dco_in",
>>                .ops = &clk_fixed_factor_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "xtal",
>> -                     .index = -1,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &meson8b_hdmi_prediv.hw
>>                },
>>                .num_parents = 1,
>>        },
> [ ... ]
>
>> @@ -279,6 +321,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
>>                        &hdmi_pll_dco_in.hw
>>                },
>>                .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
> [Severity: High]
> Can rate requests from meson8b_hdmi_pll_dco reach meson8b_hdmi_prediv without
> CLK_SET_RATE_PARENT on hdmi_pll_dco_in?
>
> meson8b_hdmi_pll_dco has hdmi_pll_dco_in as its parent, and hdmi_pll_dco_in
> has meson8b_hdmi_prediv as its parent:
>
>    meson8b_hdmi_prediv -> hdmi_pll_dco_in -> meson8b_hdmi_pll_dco
>
> Because hdmi_pll_dco_in does not set CLK_SET_RATE_PARENT, when
> meson8b_hdmi_prediv resets to 0 and reports a 0 Hz rate via
> CLK_DIVIDER_INVALID_ZERO, meson_clk_pll_determine_rate() calls
> clk_hw_round_rate() on hdmi_pll_dco_in, and clk_factor_determine_rate()
> returns 0 without rounding meson8b_hdmi_prediv.
>
> This causes meson_clk_pll_determine_rate() to return -EINVAL and prevents
> clk_calc_new_rates() from propagating rate changes to program
> meson8b_hdmi_prediv. Should hdmi_pll_dco_in also have
> .flags = CLK_SET_RATE_PARENT?


Ok , I will add the missing CLK_SET_RATE_PARENT flag for hdmi_pll_dco_in.

>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> index 0a622f45fa368..28d563fcb1bd2 100644
>> --- a/drivers/clk/meson/t7-pll.c
>> +++ b/drivers/clk/meson/t7-pll.c
> [ ... ]
>
>> @@ -292,6 +346,24 @@ static struct clk_regmap t7_hifi_pll = {
>>        },
>>   };
>>
>> +static struct clk_regmap t7_pcie_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = PCIEPLL_CTRL0,
>> +             .shift = 10,
>> +             .width = 5,
>> +             .table = t7_prediv_div_table,
>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "pcie_prediv",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
> [ ... ]
>
>> @@ -345,10 +412,11 @@ static struct clk_regmap t7_pcie_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "pcie_pll_dco",
>>                .ops = &meson_clk_pcie_pll_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "in0",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_pcie_prediv.hw
>>                },
>>                .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
> [Severity: High]
> Will t7_pcie_prediv (as well as g12a_hdmi_prediv, gxbb_hdmi_prediv, and
> gxl_hdmi_prediv) remain stuck at a cached rate of 0 Hz if the hardware
> pre-divider field is 0 at clock registration time?
>
> t7_pcie_pll_dco uses meson_clk_pcie_pll_ops and defines neither .table nor
> .range; it only programs PCIEPLL_CTRL0 (including N = 1) inside
> meson_clk_pcie_pll_enable(). If PCIEPLL_CTRL0 has N = 0 at registration,
> t7_pcie_prediv caches a rate of 0 Hz via CLK_DIVIDER_INVALID_ZERO. Because
> clk_set_rate() cannot be used on t7_pcie_pll_dco (meson_clk_get_pll_max_multiplier()
> returns 0 when neither .range nor .table is set) and t7_pcie_prediv does not
> have CLK_GET_RATE_NOCACHE, t7_pcie_prediv->rate is never recalculated after
> meson_clk_pcie_pll_enable() writes PCIEPLL_CTRL0.
>
> Similarly, in drivers/clk/meson/g12a.c (g12a_hdmi_prediv) and
> drivers/clk/meson/gxbb.c (gxbb_hdmi_prediv and gxl_hdmi_prediv), the HDMI PLL
> registers are written directly by the DRM driver in
> drivers/gpu/drm/meson/meson_vclk.c rather than through clk_set_rate(). While
> hdmi_pll_dco has CLK_GET_RATE_NOCACHE, clk_core_get_rate_recalc() only
> recalculates downward from the clock with CLK_GET_RATE_NOCACHE using
> core->parent->rate. Because the parent hdmi_prediv clocks lack
> CLK_GET_RATE_NOCACHE, their cached rate stays 0 Hz even after the display
> driver programs N = 1, causing meson_clk_pll_recalc_rate() on hdmi_pll_dco to
> return 0 Hz.
>
> Should pre-dividers whose registers are programmed outside clk_set_rate() be
> marked with CLK_GET_RATE_NOCACHE?


Ok, I will add CLK_GET_RATE_NOCACHE for 
t7_pcie_prediv/g12a_hdmi_prediv/gxbb_hdmi_prediv/gxl_hdmi_prediv.

> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com?part=3
