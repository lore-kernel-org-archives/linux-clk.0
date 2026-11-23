Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795402138;
	b=waS7ePUG496Jj+8yOYlEH/hsuYy2kOyFfT7rDO9rY6IACsZ7ItByMPde1IdO6s2qIlbE
	 aP5blDtbCEumLwOJ0j4ZzZnLrwS7odkIlRoQRQf3PIDy1klCBkULy5bgpBQRBWyIx9Hn+
	 X1vV/nDg3nepaZV1lKCf2vGnyu9UGZ04PrRvu11GK8+rCI0CyjRVG4etadkZw1DQn98lw
	 S948aErs1frEMRDYbX84OskkJMixvO1tvgKCtMXFBNIm2FgklY2iDxqQ/QFXsA32+zdMk
	 JcQ4C/zoVGXD198fVKaD7wfshkQpVkweB227VXhsPGKl6sWo/EZ9b0vGwO1PA7WEG/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402138;
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
	bh=VK1T2HwlPyFHMRMv7r8NO5LBtROymS3xhOkA36Wy8H4=;
	b=1JLs7T0EFioFJPT/2T24uNIMfJTjB3og7AJ1JFJf/wje2iLalRxFZme6W/br5Nd+lvuK
	 LoJGRBQwCNyqD31sLFScQE+PWfLYEwsjvZQVDLOYP22K3lj+Z2LWHrz2qXdk9FJh4SIY0
	 jL2z4T6+tJICblUKALJ24gKz/AMQTN070bYXLTF8HhodG8J92s8sQqbyDu/e0fbKAvdwm
	 lJykqAlo5JfQ6UITzrRv3GlS//yj2JbM0vmXrDjtWv7td9mxV7nm0Cmo8F7jOvQYhDVVc
	 LKNKfWPesE1i9CVGJi4d8daxvMfpugQa/YoboK5gU1NIX+sD9IR7uFVuiu3dnwOZVYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=TalrCIhg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.90
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2C606A31A;
	Mon, 23 Nov 2026 02:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=TalrCIhg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZBiYK1BqG+dCdLGFlkOEEa9uT71Of1W9WEbiOCQMZq1LoXqOjJUsUfs2vZQ2EcjqjO/VhX4QotlZIXyo3UnT/P2WVBQDXkF4sAwW6hzAar2IUeMuIW3T3ZxNx4stmeEqV3aB3o+hdtyjRrIrQgL2z12XLfPcws+MXbW/owhVTPF4gxw3MQG8E63qjXx1h/6iMj6lfH65XG8mM3wwz1vrfTIUkv9WOs5kJct6+ThOi8TeOkjC/Uze50iq1nJX6+SqXTV55k3PD9sh2cd1iEHQQeqYYWb8whjKX276EmjdvG93g+xIeDR0rWJln9ni9XUTd6R2rNssuhlLQ+XkDJ6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK1T2HwlPyFHMRMv7r8NO5LBtROymS3xhOkA36Wy8H4=;
 b=weHxpap0WthzC1fnm26xSdA8L4Z0WorxtXr7Fq9t394or0TRqdQNeRuD9NM/Ei0q9OkVfe6Q0mqrAVYdlN7CEdlfMuyQCLq5T/gC8TSFiYjbQpe8Itjr7tFPtGAWjfMbzoMYHmYP0qul+YTJSwYiOTM9hxANlTJoRCpIXZJxT1Z7PHNQ5X0o6Rd9VGtM5gKh3YijkxBLRy5G2lK5S5z0p75VuBlWnork/KrV6bAxG3jtUVf372nwPh7OTsmrILcOF2cjP8o3x0kZtj0C56Ql8BK/ExsdkTuYrlyvfaImMOdAdwYAfBaoZugfZVa6agHiq73HBzwzZnKJXjxAebHIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK1T2HwlPyFHMRMv7r8NO5LBtROymS3xhOkA36Wy8H4=;
 b=TalrCIhgqrZqmyP5fNHQL3FVZ9HP4SZxR7xk7x0rWsiM7Ho0gwkLXBtYv9IYTt/gxCF9xpfxzMjqILNAm/q5g3hbolVxbn/FcbRsuZcNVh0H2/Dz9m2bX61WotEYBLLZ414ZQG5Isy5L0KavHKxZFlo3UekreuZvH2tzsoacgea0OZgdugr6pSCKy5DpETzeKrWJaHgvtv4a2I6l1r2sxkoUZvu1Pj0miTzeFUM9d0JO0mLdRqms34YI4iLH2V6ZnX43tDqyEv6MXXEUFBDkC6HXbFuIEDDXKKxHIdgs36qWZaRQlBYN+QU+FY4jsQxwXHdSlFzUQXytUghHQnej8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by SE3PR03MB10620.apcprd03.prod.outlook.com
 (2603:1096:101:322::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 02:48:55 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 02:48:55 +0000
Message-ID: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Mon, 23 Nov 2026 10:48:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179536111581.2728475.9919460533427781841.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::8) To TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21)
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
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|SE3PR03MB10620:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da04716-41e1-4a85-c1c2-08df490c508e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|3023799007|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|4143699003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GtZqkqK2SALF80BYwhKSFt4V8aoRgYOfN46gyuCDOEH/f/BWCnCWC7T0L/KzTxM+eKNzSeVxHsM+SeS//vRXI+lPJScSYNnWciYob6u666QOPW1o2eXUu4Ib0zafkiZZ92YdBqxqm+cPcMMJF0UMplAfNSMI9Jx0Uu8aGccCXcGBM0NA+nrVeNJqDkHe4SWeqPGWloAf48PReYVSFNiFBT3pQdYCelnL80zfWMgkTsDWd2Gt+eCbO/rMdQL3RMhIJ/vetxoyd30OU6OUINK6xYBy0NIlFnLLgj/NF+nZf3oi9utN14fqpVB1NZC028g+t1joNVAM0jbuHtjaSMxIFHj7wb5h3o+cW+kUFkQOKO7Y27luRVsfVVUlP7fCv1zF1GEv0rHuD+TYMpVpYFLQX6UAesEX31uhay7pR+EeuWmtQuEzD67YAwAHETw7/AwSByPc2gP0xCk/S9zxl6zMbcAwHErrRfTbVX8M4XDCdx+KsjsfcbXRUokuTI9wyS6cCs6LH4RLQSNyaxcVVpXcNO3tWKGQYgtA/vSe4yeY1PhyhT0JulxNqnw8GMhNm/QN7ie5j9mTWOyiBh1Lrqpdp3gEfQ4hAdrEkWtNs28+S+JIQet1L3AkO3rjGRNLUiLMOMXcTOo49HoJQQ6INzMvke+0XtUyvPZzf2ZppKy0vyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(3023799007)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkVxLzdyMmV4d1RweFVpU2RVcm9XUFljUEdJNmc3azRneGxIRHd0Z2h6SVRy?=
 =?utf-8?B?aTJiQjNBSWNKWjJEYlFhT0JBWFRxcDdwdFZsOWp6WVdYYW9PSXJna0hJcFZV?=
 =?utf-8?B?MUFGL08wM2U1alk2RHF1bFBBZ1c3NnJLRTBHS0pSS1VsM2lPOC93M0ZDZXVj?=
 =?utf-8?B?RnRGWFBlODFEZEExSHg1dXYxdEZTejVJSnRMWFBLbW5CS2xzdmdEK3ZuNmp4?=
 =?utf-8?B?cVkzVnR0WmxIUmdrRzdLSnlvVGMrWmxQWXJzSEZpR1l2amJSWkVDbi9VRWhB?=
 =?utf-8?B?b01yODU1UG5ja1pUVDFrNEF4QTZJUGt3VjhQdXJSUnVaNHg3QnF0aW5ycVox?=
 =?utf-8?B?NTltM2tqUEhZTlFFQXFuQmtyOEFuT0IwUVBqaUlMa3p0d3kzNi9PMHNzS1FW?=
 =?utf-8?B?R0xBTS8rc0lLYnpNdkZsT1EzbzhteldLalNGdGNkN24xR1QxZUxUYVI1TTNF?=
 =?utf-8?B?QTY1cnhFcVFMV2NCcUJDMFpSdmRoQjNYejV3K2EwV0FvK2oxVkpncFFUNXFx?=
 =?utf-8?B?aW02dktCV3lOSTBIbnJqRkpkd0F3eFlTZjFDNEJoVkRRWThmMHpuZU96ZDJY?=
 =?utf-8?B?akhKbEtvZHpEb3R6ZEhkdFYrYnRIcXhHRERjdVcvSEdBZnJVQ0ZsdUVrcHVB?=
 =?utf-8?B?ZVo5eGwxNk9SVVRTOE9KSVZNSnloQlluTW9CVnVCWm1xdlgzV0NFZ3YrUy9L?=
 =?utf-8?B?K3FPYm1QbmpCNHByNXFyYzh3MGt0OFN5Q2xVdTVLQ1FtQXA0THVyOHdFRVdD?=
 =?utf-8?B?SzNaZVpBR2NxQnp2NWNvU1lVbnFqTmJTdkFBcGo5OGdaQ1dObWVyMHdEVUsx?=
 =?utf-8?B?KzRpMFpzd1h4eUdFVTJVMjdFWWJQLzR3SXdtTFVuTnJvTG5nT1h5OGVqZHVK?=
 =?utf-8?B?SFc1S2hrMDNXa3NiYVdTRWRwSDFVOWpTekR0WTJwNWQzcUN3dlh3WExjUSs2?=
 =?utf-8?B?WnZvTXBYOFZTRGxvdXhXZWtNOE5KS2VhMlFhRUMwTFBaMzk4MXF5RER6TTRt?=
 =?utf-8?B?ZGNTOElJdzkySEVoUHNGR2lKUWRocll1K1RyblYwclBBYzhDVTZVSWtFSnla?=
 =?utf-8?B?WjVvSTZMSXQ2aUhqa1ExRFFtUGtvVXAxamh2OExrY3lnQmJBaStTdUFOTFE3?=
 =?utf-8?B?UTRuZ1pwZlVLK0V5eFhjL2dQaGFNV255cStKOUt3WE12Z2xwNllsVVYxM2VU?=
 =?utf-8?B?K2syQXEyMzJ4MWg3c1N1aHlaSWpwcnBiM2RNWlRhN3FIbkpZY1FDMlJITlhk?=
 =?utf-8?B?QWpXRFYrbjRELzA4TWpibEQ2WDVzdlArbkladG1FRU80UXE1NUZMMDVjQXJl?=
 =?utf-8?B?aEsyYVVKcStHU1M0TUNwY015QjJ3cUlsYk1lS292dzVxOHVPaFEyRThJM1hn?=
 =?utf-8?B?RE0vMVhWeDdTWlNXbTZHTzNIL3ZpbkpaS2psYmhHWEpFUnpKeFhXRjlDL1Vk?=
 =?utf-8?B?QzdvS0Z1VG5mejB5MC9iUUFCZGxzNEVMVmRwaUx4Vm1SM2tHb3NFREVLaVFh?=
 =?utf-8?B?b0gyS1ZyU3U4ejcxN2xDOFhLZkFrdnlYMExOTzBpL0UwbThIcjE3SHEyV2lv?=
 =?utf-8?B?YTZBWmU4bmVYdXk4dmdoUUdIR2g5QzhRYWxxOHZoNEJOdEN6dktrTDBhR3Z5?=
 =?utf-8?B?dTNWRXdkMi9pN1hzUWphUld1UFhETHA1OWJreUlvL1l6YVZQN1oyaFp6ZVRz?=
 =?utf-8?B?a1lXbXRnMmIvR0Rhb0lMaElCWU50TlAyQ3Y3ZVlvblVPTHN0elJGQzRxMkd2?=
 =?utf-8?B?clpKZlB4c0lEb3YwcEpTOCtkTDZ3NWYxY3FQVzVDM2puRUtzNUJyTTdEV2hG?=
 =?utf-8?B?cWgyR1dlQys3blY5VjQrSFpBZjVwSzczL1ZzSU1qelR6Mjhidm9PVUFnT3hr?=
 =?utf-8?B?b2lnMXRBTHlYaysvSy9CRkpyOGluV0hhYVNWaWd2cWJsdUhoUlo2UUJXR24y?=
 =?utf-8?B?UmUzYnZlZHpyajRTOHoyMU9pZDduRndaNDJEd09zRXdTem0rQ0VoMlpVdjJq?=
 =?utf-8?B?WkRpTk90T3AwWGMvQkNBNzdpSmZtYURHSDUrSzZLUXBVeDBCdWFwcnNvUS8w?=
 =?utf-8?B?cjA4MnRFZ04zclFSY1BxWjFvazJMZk8rUEg4eUNWQ3hGN0YrUUM5ZXBRbk5Z?=
 =?utf-8?B?QWRBT2tqYWNyUEd1aFI1d0g0V1gvQjV4cExRcFdUYU1qa0dNRkN3Z1l2UE1x?=
 =?utf-8?B?TThVVzJvOE5OMG5oSHVNdHdiZ2F5S0JDRDN0cTN3cVhTRnpQRVdvSXZYVFdt?=
 =?utf-8?B?THZ2OVhCYkE0ZUxibjJXYlN3cmRMbUpCT3hVWkdCNDlmcTQyK1ZIRjNpUUp5?=
 =?utf-8?B?MGtkN2JIS3BmRkhHUSs5bC9wODdTeWJBYkRTVnZuQlIrTTVEN2tMUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da04716-41e1-4a85-c1c2-08df490c508e
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 02:48:55.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgGT/ADOr4uDMxBJttJQbc7e92Uxqqxf2zsWcijRR0DGQU2ZSrl2N6K5fiVc4j+lC8fjaqlXML3EdhWdVyNq27OVPBq00Tsfzs4Q/guWZt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10620


在 2026/11/22 23:25, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
>> Add basic audio driver support for the Amlogic S4 based
>> Amlogic AQ222 board.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 311 ++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 396 +++++++++++++++++++++
>>   2 files changed, 707 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> index 0a3f81ea0fb0..334b57bde4de 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> @@ -75,6 +75,17 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>               regulator-always-on;
>>        };
>>
>> +     vcc5v_reg: regulator-vcc-5v {
>> +             compatible = "regulator-fixed";
>> +             vin-supply = <&main_12v>;
>> +             regulator-name = "VCC5V";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>> +             startup-delay-us = <7000>;
>> +             enable-active-high;
>> +     };
>> +
>>        /* SY8120B1ABC DC/DC Regulator. */
>>        vddcpu: regulator-vddcpu {
>>                compatible = "pwm-regulator";
>> @@ -129,6 +140,207 @@ vddcpu: regulator-vddcpu {
>>                                <699000 98>,
>>                                <689000 100>;
>>        };
>> +
>> +     dioo2133: audio-amplifier-0 {
>> +             compatible = "simple-audio-amplifier";
>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>> +             VCC-supply = <&vcc5v_reg>;
>> +             sound-name-prefix = "Analog_PA";
>> +     };
>> +
>> +     spdif_dir: audio-spdif-in {
>> +             compatible = "linux,spdif-dir";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIR";
>> +     };
>> +
>> +     spdif_dit: audio-spdif-out {
>> +             compatible = "linux,spdif-dit";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIT";
>> +     };
>> +
>> +     sound {
>> +             compatible = "amlogic,axg-sound-card";
>> +             model = "aq222";
>> +             audio-widgets = "Line", "Lineout";
>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>> +                              <&tdmin_lb>, <&dioo2133>;
>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>> +                             "Analog_PA INL", "ACODEC LOLP",
>> +                             "Analog_PA INR", "ACODEC LORP",
>> +                             "Lineout", "Analog_PA OUTL",
>> +                             "Lineout", "Analog_PA OUTR";
>> +             clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                      <&clkc_pll CLKID_MPLL0>,
>> +                      <&clkc_pll CLKID_MPLL1>;
>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                               <&clkc_pll CLKID_MPLL0>,
>> +                               <&clkc_pll CLKID_MPLL1>;
>> +             assigned-clock-rates = <1179648000>,
>> +                                    <270950400>,
>> +                                    <393216000>;
>> +
>> +             dai-link-0 {
>> +                     sound-dai = <&frddr_a>;
>> +             };
>> +
>> +             dai-link-1 {
>> +                     sound-dai = <&frddr_b>;
>> +             };
>> +
>> +             dai-link-2 {
>> +                     sound-dai = <&frddr_c>;
>> +             };
>> +
>> +             dai-link-3 {
>> +                     sound-dai = <&toddr_a>;
>> +             };
>> +
>> +             dai-link-4 {
>> +                     sound-dai = <&toddr_b>;
>> +             };
>> +
>> +             dai-link-5 {
>> +                     sound-dai = <&toddr_c>;
>> +             };
>> +
>> +             dai-link-6 {
>> +                     sound-dai = <&tdmif_a>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_A>;
>> +                     };
>> +             };
>> +
>> +             dai-link-7 {
>> +                     sound-dai = <&tdmif_b>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_B>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* 8ch HDMI interface */
>> +             dai-link-8 {
>> +                     sound-dai = <&tdmif_c>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi and coax output */
>> +             dai-link-9 {
>> +                     sound-dai = <&spdifout_a>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&spdif_dit>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi interface */
>> +             dai-link-10 {
>> +                     sound-dai = <&spdifout_b>;
>> +
>> +                     codec {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* spdif coax input */
>> +             dai-link-11 {
>> +                     sound-dai = <&spdifin>;
>> +
>> +                     codec {
>> +                             sound-dai = <&spdif_dir>;
>> +                     };
> Was this tested ? ...
>
>> +             };
>> +
>> +             dai-link-12 {
>> +                     sound-dai = <&toacodec TOACODEC_OUT>;
>> +
>> +                     codec {
>> +                             sound-dai = <&acodec>;
>> +                     };
>> +             };
>> +     };
>>   };
>>
>>   &pwm_ef {
>> @@ -235,3 +447,102 @@ &ethmac {
>>        phy-handle = <&internal_ephy>;
>>        phy-mode = "rmii";
>>   };
>> +
>> +&acodec {
>> +     AVDD-supply = <&vddio_ao1v8>;
>> +     status = "okay";
>> +};
>> +
>> +&arb {
>> +     status = "okay";
>> +};
>> +
>> +&clkc_audio {
>> +     status = "okay";
>> +};
>> +
>> +&frddr_a {
>> +     status = "okay";
>> +};
>> +
>> +&frddr_b {
>> +     status = "okay";
>> +};
>> +
>> +&frddr_c {
>> +     status = "okay";
>> +};
>> +
>> +&spdifin {
>> +     status = "okay";
> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>
> With sashiko remarks handled
AP222 does not have an SPDIF IN port. I will remove it and update the 
interrupt number for SPDIF IN.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>
> --
> Jerome
>
