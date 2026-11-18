Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794971850;
	b=iDkbOgQSqjbg5b4g4ELBwmBmvl2gok1EFg7tSZAzdxAzHfzi+fzaV+ekpHhrzsZgolaJ
	 lQAQ7lNGTw2QIQRExIILACsU+r08qajcbqS41WFHUawAiHloUrROBld8q9+fJtNqANbPo
	 iuVH38M/daLzNZJqW/puCrB9lhTNGSip5SzQc50Bwlp3/aSPE2vp37i0QRf5sRKdBwSrq
	 dKXIx4LB0+w9GBF5N01TNLaXOKrBw6a95eh90GYkXp3pdme1RXaLM4yaEMj2Ncmyp2/HU
	 6nTND4KQALb5O0iQjE/hvKJXlakAQwNHrRC34OrtxlrmRR0eaVP/WyWk0oZemMACPew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971850;
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
	bh=OQs5et1zCvRnccFLDFFa7U6eHyVmrH8fX954lu9qjE0=;
	b=Dv4x6z3j83RtxyzZlrc/Pef4snLg1sqlUWRnswix+HJPi17FLqyUIH286tENqiaBZWQe
	 AROua4H/9sRlddB5Nn24/F0q6Rp98GvzP8Tmp9njEFc+/ivs2clCBNUy7YS9SMXwOrUH+
	 fiksjRUUFL+xeLrbtr2hkzhcp45S+FKPZ0LBSw5n+zaR6VvcRx2Xh9zUtfM0w8Fy60wGO
	 kKzuAjGaH/mux9R7li17IdkRVwEivzXPJF+PXBwzrJ1vAOvqHCChtPvLIxmgzAG52OWGc
	 pyv/P+OcKBiRqMnoUAYPLJzgNe1mYZB+IgncjqbA1lojggkiVNTSw76VK57Zpei1Vfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=vFY1GgiZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023100.outbound.protection.outlook.com [40.107.44.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1225606A31C;
	Wed, 18 Nov 2026 03:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1225606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=vFY1GgiZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmrVlGGGhChd426yVD10wivh1rmBHG+L9nZ//75YWWjlz3zTm/tdCOq1Kqwjudm3DtGY68wcpRnD6RP1v8sMAHYMbeV9/++YrrHymETZ516KH75/PNu/mnxXcBBeuRMylwlGxN6NH8icpjBQmY675plXiK2VZEgR1ZzgfZDPnKSrgEmuritUnJs7/gAjEso4tWkpSi8yi+ntadQelp2w7aRQHwscH2xB2JTmManBmm1Or0q678OI6xQGcbhUQ5LJLXzXRaLpgh7GjF1QgGoxJ0CTZzOrbVrS1aRnB3ZMku8LHpWxA+kyYSJAZNH0q/QuhqD/Id82ieQNschya3pkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQs5et1zCvRnccFLDFFa7U6eHyVmrH8fX954lu9qjE0=;
 b=Wo9pyhHAP8OzPCGmWL8vHk8Uq9GANb3mBWO14fnyZrLiisrgnErGhHYVJfKzULvQeax9cYAWKG6H4mU6afe7MWegLdXUqjDHK3X4ZpLH7ejBmG8WflE3RAlY/L8Z7nlSUyGX6ZGxst8G3EZPHX3KojqNLnllcxKZO4paG7chotjHL28AyFx1/PYeOftx3cqJbdo7uyYZMq5kt50lcqao6y4VvpRDF+r1oIRBjWQ21ehcP7vaH76ZIvqif6dURoVCD9V2la8Blu8ezPZmZ+VS8MqoFBfUZpAgaEMfpTmw4LMQqPnRApZ3zusjzz4QWhEAn6PRRiUqluxos7Nq+XtnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQs5et1zCvRnccFLDFFa7U6eHyVmrH8fX954lu9qjE0=;
 b=vFY1GgiZK/SgFQM0m0uU4SyfxpSmzC8VV3umIAa3RxEw+aL7ZGDldpCRmVAdAzB5BpXPWrmV5owFKkn2c6yddaXxOQHdxstNKSSOJ32Zha6IbThChRet96Puyh3d9z76UA8IK49ob6anEMLJJN/WLcUWjjuOrM5972AvuIURjmzOPjGbcdh9ll8wOztgbxNNRAMAoNL9tgbSy7e1544V4WpN0+HV4x/15488dKl4rSiqf9gmS0M4GL+D8Xaem/l8vyuaq3faWqRy1XXqAZ9PgEsLVNI+EduxtcKhFMvFVqai2V8zPlpu2tVgc0aAk6C6v0yXhPToWN1IQRYIe7TfAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 03:17:25 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:17:24 +0000
Message-ID: <5071a345-759e-4678-a33f-d80a7c782fc6@amlogic.com>
Date: Wed, 18 Nov 2026 11:17:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: meson: Fix PLL enable timing
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chuan Liu <chuan.liu@amlogic.com>
References: <20261104-fix_enable_timing-v2-1-05cdaf34fcdb@amlogic.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20261104-fix_enable_timing-v2-1-05cdaf34fcdb@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To KL1PR03MB7149.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 73956cc1-7859-48c7-0892-08df4522774f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|22082099003|18002099003|6133799003|261009223027099003|3023799007|260925021311599003|11063799006|56012099006|10067099003|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	Qww348/iyTfHy3YHK9iMTQIaos5esbYCxHsfTguGW9j2yvC2sISH6y9VhCSLStx29R09JLYYCkLu365Gzm+qthNXzAHpptIS0rAU6cYTEChS+ETYJuMvT0fr49USQjfyr1hCv4t1/gK36SKTdrLPXYu2kdNbVXOjCKh8wUKbTwA4qeVS2BVurwiyiM6JeCu/qDKEhYLf8uZk7qGS9IQGhxK+tYEvXgJuU+ciPdgOd8tzHMCMh4+dxvvkMfIdAElFKXKKPUG000GGA6qnQKZoPQYm46l/m0adaJ5nSx6XC5bUcfiMcGeDnXvA1UEziAb93XYCXPIg4pX882DHWFeZ18er2S/n9a2HtibgBSIA7a5faXBAh62NtWQV1nRxhLKzTy+aZzaMGu6cFt3MG1wx6HmV9hF5ePzPdI0Ho7lXKKNA2EyeWUEO0M+vtBc+24FcFV/IVBsAZWaNQdklTpDHfsRMDLULRs99sL5FiTBZNoSO70pqtDo6J1JtyZMoJo7s7QNBxwFpY9/bHtx2y0jjklYPmrDXI6nvEXcdGOvWKWxbyU2x4kwq+DpDgLkiLUzlFn6mdk56QCUZ2Mfm/GQ1IEfhkeZIJvOKu/OFRHEzl62/L8crYEfcimxl+NnZjiKq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(260925021311599003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXdOK0YxdlpaQ0g5QnZIUGh5SFoybVFMdURXbVp5L2Z3YW1hY2dNRE1kT2ZM?=
 =?utf-8?B?b3dIUGhBK05FelBEdDV1WGIxQjYzSGpIRnZtZmRuLzB4V1kwYUtaVGRScEhI?=
 =?utf-8?B?NWVodFQ1TnE5MWxPeTdYbWJFZnpZTHZ2RHVLMnk0Y29iY0lTTE5NZzVWNkFr?=
 =?utf-8?B?Um95K250V0lGd0FaQ0YrODZBZnJEM0R5VFVraWZQT1dLVlZqRUE2UWlBakRj?=
 =?utf-8?B?YktieDNZbDZPdGkvMlpmMmNDNWZseTB6ekRyWmRnUW5QV1FObjkxWGNaa2pO?=
 =?utf-8?B?VndGajZsZU5YOEIvTVg4cUpSWlNjMXZjTjZtckx1YU1qc3ZsbGdHdUpNZ0V4?=
 =?utf-8?B?TzBwbWxubnNpcVM0VEJKWVliQXZ6REdIVE56NXlKR1FuTU1DNDVPSG81ODJp?=
 =?utf-8?B?Ly9iMy9rd3p1MkVXS1lJOHFGaEdDNlRPZ3J1RW5IdFVVY2ZqNmZPNnl0R1BF?=
 =?utf-8?B?UzlqSzNLZm9LYkVNYlZRTnovMVFpZmVnTE9SQjhaWDc2MlZ4MExpSGZTZmJP?=
 =?utf-8?B?QkFHSnE4TzFaakJHWHo1QUovcjR0VFhTQStNdWZRTTlZRUlDc2h4ZVErbFJT?=
 =?utf-8?B?N2M2cG85SzYyU0JXU1RYQ3hYOEJwQ2JSbVVqbmQrMER4RjRGOXN4MVdSSUti?=
 =?utf-8?B?cC9sZTNTaHd1cGdhUFBqL3I0c21OY0luek5OZ2ZFdXROcm5XSXkvSVhzaWwy?=
 =?utf-8?B?SEt4MFlXMFE2blhDeUFYWUI0c0ZRa1JHOXNYREZvSkNSR2pOTXVhNFdCdE5k?=
 =?utf-8?B?Mm9mV1EwamM1QS94Q0ZoSGo5THpLc3hFWHFOYXo4RS9zTWtKdlE2aForcVo0?=
 =?utf-8?B?SElNV2Q5ekVHaERlclhyMStocHc3eVlPTEJ0enVsVDh3b1BqQTdSZ09FVnhV?=
 =?utf-8?B?VXhTY2t0OUpudi9XMnZGU3BxSHd4WXhQSjlKRE1CUlFzYjVBS1RlTndaRS9W?=
 =?utf-8?B?WnVmZjl1Ykg5OG52cnFGL3UrVStIZ0paREtWeW9ScFhEbjNYbXQ3dEVERFY2?=
 =?utf-8?B?WGk4WUlqMVdKemltSUd5emg5L0g1WHpFcnFtVU1qeTJEbmlaNXVRa0NFR0Jo?=
 =?utf-8?B?dmZxaEhteHRaV2k1UU5DMzlhNjM1eTZDTjZ5MXFoa2h2ak9EV0JUdGMrN3lp?=
 =?utf-8?B?WHZFS1NUSFc0R1AyVGVJZGxEa2JoWWtPbkNqVU5ieTJPTWUzNENmZG5BcFdl?=
 =?utf-8?B?ekJMeU1yZmpFc3BIZHA2ZmMxUnQvYndsYVZHM2I1RzRERHF5QWdaT3F0RVo1?=
 =?utf-8?B?L0RodE5vSGptVjRzMTR6VEhrZlcvTVRsY2hJeXRqdy9janlENWVCUytIdnAx?=
 =?utf-8?B?TnV3RUdZdGtlSk1EZFlWTkNPMmxYQzFkNlc2bnYxc3d4Y09XK2xaLzRaTjhP?=
 =?utf-8?B?QVV0WmlQZmRLUElmRTg1VHVOSTNUY3FtcVpBbnovVlBNekxMYWF2ZDFxYndF?=
 =?utf-8?B?MGNlRkU5bGN3NkNTSlIvZjAyZGRvU0FiR3d4WlRVWnQwSndKL2lhYWs2TGJu?=
 =?utf-8?B?MUJFd20wcDRUN2FmNXBnOVdULzdoNUp6VlJsZmlNVSsxR25tSE0xVm1IOEt5?=
 =?utf-8?B?OHJMSVBNMHBNU3lhWmJlOThjd1VvdVlGdjhTTU1DbTBaQ2lNZkNKcGs1RGhw?=
 =?utf-8?B?Y09vdFZSS1gzeWZmVzNFakhZeEdEOWpKcGZqczhvYXdvcTlQU05EUUdBamdB?=
 =?utf-8?B?WDMyQVp3N1VNbEUvZEFIVW1GYVF4dW9nN3dsRHo0bFA1YzBEbGt6QXk1T2F1?=
 =?utf-8?B?ZytTanFndGl3dnJrN0xaYXFjQ2hpMmdBUUFoWndId1F3M3Z6L1ZlbFJwbFI5?=
 =?utf-8?B?dURrY3laNUVscjdLK1JkbUhnU1FQRVdKRm9hREIzQWdJOUpHdjV5aHBQS01B?=
 =?utf-8?B?QWZGWWEvN09nazgwOUpuKzE3ZEpOMW5xTHZpd0l4VUYrajZCQ2oza2ExUXVh?=
 =?utf-8?B?K0tncUZOMHpBNjNsSE9GWGdDZ0R5eDBydFEzNUpTSTV6Zmw4Y0ZBWUFyYWov?=
 =?utf-8?B?bVN1Ry9WTC8zMitYMzAxSmtydUhqNmlBU1BXbE95SFdUVDZxOWpUR0UrcTBZ?=
 =?utf-8?B?SCtISkRzZ2syUjQwWGZzN1lkK3FmcUU1TTV2eUE0ZHg2dkl0ZC9iTENkN1hx?=
 =?utf-8?B?WlRUc0IrRE1sRWo1bUgzbmwvbXZsaVNlZG16NkZ1MTIya3NQSXNpeFNlZTF6?=
 =?utf-8?B?VzdJVXRZaEFYazRkTGFHSndabmZ4aHBVVWkrOFArdldVRWp4ZVJGTUxkemFB?=
 =?utf-8?B?THB6TXdCVVMzS3V6aHVXQzk3clY0UlgvTVdMMEc1TFh4aTBwRFBvU0ZmbEhJ?=
 =?utf-8?B?NWJwNzYreHArRGRQMkorb2JPb09zSVdVWDdPZjVMc2Q3b1FqdzMxUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73956cc1-7859-48c7-0892-08df4522774f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:17:24.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0PjHRlruCbPyhBMpO7YjyRqSTMS+JzFYfEaEeRS/lp2YMmanY5Ri0THhq/vkwyPGmXkW7Lq3KxgL8NUJ8PrIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6700

Hi Martin,


This patch aims to resolve this potential PLL unlock issue.
It has been tested on T7, C3, S4, AXG, GXL, SM1 and A1,
covering almost all Amlogic clk drivers except meson8b.
Could you help test it?

On 11/4/2026 10:13 AM, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
>
> The hardware requires a 50us delay after setting the PLL enable
> bit to allow the PLL power-up sequence to complete.
>
> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
> may fail to lock under stress testing.
>
> Add a 50us delay after enabling the PLL and another 50us delay
> after deasserting the PLL reset.
>
> Testing on GXL shows that the PLL works correctly without the
> additional delay and continues to lock successfully after the
> 50us delay is added.
>
> On A1, remove the redundant 10us delay before enabling the
> self-adaption current module, as the new PLL enable delay already
> covers this timing requirement.
>
> Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> For example, enabling the GP0 PLL at 1512MHz may lose lock and
> result in an output I/O error:
>
> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
> sh: write error: I/O error
>
> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
> ---
> Changes in v2:
> - Combine Chuan's patch to this patch.
> - Update the Fixes tag.
> - Move test details below the commit message.
> - Link to Chuan's patch: https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com
> - Link to v1: https://lore.kernel.org/r/20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com
> ---
>   drivers/clk/meson/clk-pll.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..477eb9958a8d 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -369,20 +369,25 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>          /* Enable the pll */
>          meson_parm_write(clk->map, &pll->en, 1);
>
> +       /* Wait for the PLL power-up sequence to complete */
> +       udelay(50);
> +
>          /* Take the pll out reset */
> -       if (MESON_PARM_APPLICABLE(&pll->rst))
> +       if (MESON_PARM_APPLICABLE(&pll->rst)) {
>                  meson_parm_write(clk->map, &pll->rst, 0);
> +               /* Wait for the PLL loop to stabilize */
> +               udelay(50);
> +       }
>
>          /*
>           * Compared with the previous SoCs, self-adaption current module
>           * is newly added for A1, keep the new power-on sequence to enable the
>           * PLL. The sequence is:
> -        * 1. enable the pll, delay for 10us
> +        * 1. enable the pll, delay for 50us
>           * 2. enable the pll self-adaption current module, delay for 40us
>           * 3. enable the lock detect module
>           */
>          if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -               udelay(10);
>                  meson_parm_write(clk->map, &pll->current_en, 1);
>                  udelay(40);
>          }
>
> ---
> base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
> change-id: 20261027-fix_enable_timing-842bfa84d4d4
>
> Best regards,
> --
> Jian Hu <jian.hu@amlogic.com>
