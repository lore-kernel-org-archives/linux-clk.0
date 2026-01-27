Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022116.outbound.protection.outlook.com [52.101.126.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F243398A;
	Tue, 27 Jan 2026 02:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480450; cv=fail; b=i4S4saZdFUaKaJN8XtcDhMuSbxZd9j9eJBu4GcIo+nMig4fhPscpKs4E66n0QMoB+1A/Y2c/QaGbLkqrOxYDe3BDje9xTCXhoiJruZG3ZKyyUSN9pMwhGiolMLK3wYX5oqcP8T15ERkHtkZFMC6Uo4QNKTLoKQIWr5SGsUblRN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480450; c=relaxed/simple;
	bh=akNcO23b0Efn6m32gYTTXA6esznO7F9nH6uRCrJpTOg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W5NeeUpvsgK3qIjVVijkdMmXa1PkQFpDTHJhaZkK5F4Q34KGHRThCR/KCvuTxiJxDMym3Fetbphrg3EypohnqR1EMTwV5VS8LmVvQN011EDvrzc9BCrID47QikMIcAuxJcZIsaxHTx0kDOGcyeUljPu3qHdto4dPd3ZpyrIJ9ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=CWLWWyl9; arc=fail smtp.client-ip=52.101.126.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="CWLWWyl9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KasK1vCQBtxpOY/IW51lAAFgIgLTSPeB554lt1ON8facJl+fgRLE5r8ayCfhy0qITeUILNSRjFfj6FtWLsptIQ4S1d6OwA5NQ3oeqtf3WmfXK3FecmHNfBEjOUIUElyWbCkAsSGBxBveIpspAjJKNbEWk6CgbvHlADgsw+owtk06UdfKbLw+O3Z2ehKJmnCrTo3DBgL4gENGWqQmOgjPYpwxPLi/0RxqUFQfRw0QXf5OvCAejCHPjg/q05Dz+unH4zrUIl5QMtLIjlnKZzpdzDH3OG/AaKswehAwFJTqx+ccSwRdTt2nqOg7O6WPR2bPOEjmThe7njOnF3NFSISSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnzQyZ3ibp8KR09FQ8K/RreUAEVl6XTA4dTCUC3k+mk=;
 b=hWQKcvmih9Rhvhh40aDMfLa0p8nrboCWlRJajWT/ss/9EueZPlFkp4Cs/apLt/PTDXg0Q4up/g+YAFSuFk/46hELFSGQgejrBYJd3rGq2jSKTMBUpesO5zYzH10dPhxYM9I7JM92mgb5evu4vQMltKuIj975p8sOzyJAWq8nBaS5D87y0dd6dHJkRO/0O6bqsQUHE097wlEnS+kEnR+ho8l+J/+RFnovA9c5b6Xqv9G7yXXU1gZvgD5LOSAJyPBIc8wWWFL+Xdjy5O5cbf4b7RRuqyb4buxP58spIUDYmc1/128OaUuuKWe0VCvo7bikBPwf9ngZqEbG+giAdmFzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnzQyZ3ibp8KR09FQ8K/RreUAEVl6XTA4dTCUC3k+mk=;
 b=CWLWWyl95ng0oZg6q3UZN5ctH0uUXWrmMprtTiIJt4C5k45X6nv+Tk0WSCdz9tMgREsvwXpWEDjl/SQ23yF4Q9jtZpxYLAUO2AHJa1l7euBcxgYNBQDWZtvSFDeu1a6cRzh8PTOdSTvwpF2eurpE4TskpFIDUDswZWhDd+tczjbKzpWGWg42KKLvrCxuKTNJSCN2Nc8w6Q0JYDcUxLtrQycPTfTltBMjiiqeOqSNPh2DH32F8RBtkiPOYRO4bTbDjj7uIV9xs0rfCoLDj1aGHAvtqz3+MV/ZAfx9knl6840mEq3IEM6+BBT3zzWBqg0dG3NiF/MqMks/w00yYAQ4XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by KL1PR03MB7852.apcprd03.prod.outlook.com (2603:1096:820:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 02:20:43 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 02:20:43 +0000
Message-ID: <cde224e4-0ee7-4ba4-b26b-1a433e209876@amlogic.com>
Date: Tue, 27 Jan 2026 10:19:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-5-99e350855bc2@amlogic.com>
 <1jcy2whb9k.fsf@starbuckisacylon.baylibre.com>
 <d403bf7d-6e73-460c-b2db-8019d9d44a67@amlogic.com>
 <1j7bt4h161.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1j7bt4h161.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0012.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::20) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|KL1PR03MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 26393cdb-84ca-4dca-a45b-08de5d4aac61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjkvK0NaeC9KRDVWNXV0M1BObFZGLzUrcUVQZXVwTEJkTlRwTUhibzBNRWpC?=
 =?utf-8?B?N3UzMEpzMmJlcDZoZHNNRWk5RTlJY3l2T2k2SmRBK0NtdzFOYSt4em9KL3Zx?=
 =?utf-8?B?KzJGSDJRcTlNcG9xZUk3THg4ZkNPbFV1TnJhelZQTlZFa0swczF2TlZWVUhP?=
 =?utf-8?B?L0lMaEtadUw0NzZrQzVTYjFCQ2VSRmN4YklpMHl0UHVkbHphcUxDcnNtU3pr?=
 =?utf-8?B?anVDMFpvVDlaRU9QVTdOdkNQN0RsZ0xRakZPRTRUVmZLVFk3cHpScG1XaW90?=
 =?utf-8?B?UzNnTllIM1ZXNGxSelE2YmNaRGs2Uk5weldZLzcwbUtJU2huMWtDQkFsME5m?=
 =?utf-8?B?WkxXNit0eFgxK3l2Q2dQSmNkUlRBVVZuMkxWd1gwOG5tNUhGNCtHQllYa3Vj?=
 =?utf-8?B?QWV3TkwxaTRvUnhQOFZhWWduQkUyVEMxQkRScGlEeDg2MG9TZXZFc3hsOTho?=
 =?utf-8?B?S0oydjRlbEo5Q2FhTlFYOC82bERydFQyb2dtWkRRMkg0dEdwVk1qMkxPSDB4?=
 =?utf-8?B?VHVpeWZzQm5PdU9pcE1QaUpvK0hKTG91VlZqeTVwdkJBdU1uay9pYnpIRGlr?=
 =?utf-8?B?eDFNbytPblY3cDkraWtYQllUMHZRaFBtVXhYUXl4UzlLNEFCcU9zMFJJRy9U?=
 =?utf-8?B?M1J5ZjdlaXBGL0NRWCs0WDZZK0pBcnUxY01SaFhDM2p1R2VwSnB5RnR6UWpz?=
 =?utf-8?B?N1lENWJTZjRwL0Y2U2swSjFNak5MKzdIbExBbDM4YXlINzNCRGU5YVJZY044?=
 =?utf-8?B?RC91U0FjTm9sakFFTnQyaVgrVG40T0ZjTEM5TTNuZ0M1OGtHN1pzWVltaFFF?=
 =?utf-8?B?M3FYVzJrOHo4eFhSMm5uSlFmUVFaWUUxa2N4dkhNVHVlUE1RQ2Z0MlhET0xJ?=
 =?utf-8?B?Wmd4QUlNWmNpV1Y1VVplL3ZlWWlzNTJJajJLdmJPeHRHYUpuNHZtQmQ4c3RK?=
 =?utf-8?B?Ym9nS25PV3VOT010VE1yelN2a00wTVhTU0RYeFAxaHlOckRRcjdvRFJtUnli?=
 =?utf-8?B?Q3JYVEN6dHl4aEJRMDE4NWU0Q1ZBWUE2UU0xZm11YzUyWUluWlNibHpWZmxD?=
 =?utf-8?B?eGNzTjBBLzE5ZkVkSHNIbUpMdEJDRThLVmFKSTJtNG1aM3FhUllPenlVdzAx?=
 =?utf-8?B?bmdIbllMWDdXdFBoS09VOTB0YjFKWUVDQW4zbENkaTVnd2x1bSsxUkQ5VWpQ?=
 =?utf-8?B?ZTFXa1VBZlBNWTF6d0VYSm5jVm1PbEZWNzV3LzVPNUV3VWgyMUN4V2ZQVkFQ?=
 =?utf-8?B?RzU3Rk5EMU96MWtWUkIyaVU1bXE3QzJSTU95R1d5TXBRTXFYWm5HMUhsbUpB?=
 =?utf-8?B?b3RDRGdweEpTc0NKdUV2d2dQbjlJNy90eGh6SncyWmVDUGJFMCtNVFhLK1Rv?=
 =?utf-8?B?OHRoOXdqMUlMUGxKU3hRSjlIbkNWTW93MEt1MFFmY3NmS1hqbkJ0Z2hQM0oy?=
 =?utf-8?B?LzRhdXZ1MGptaGprVzk1VWhoc3Z5UGtJOWFGS3g0S2QxRWRrOE1jTk5CTFI2?=
 =?utf-8?B?QTVPWVJtbE82UHRWM2psR1d2dTFqRWROVkhkMmVtTytrME9nM2dVV3p1dHhL?=
 =?utf-8?B?WWdSa2NWS0JJcEZncXptNHFZOHhQQ0VNZXZPd3R2bG8yLzRMU21oWEM0WHNu?=
 =?utf-8?B?aGh6NDErcjVlWDFMdjJ3V0dkOWdLNDZzZDQvNm0rRjJXZXRhQVdUOWdYVFVq?=
 =?utf-8?B?WmhjajFGVEIwK3JXSXhNcEJLMHlwaWo5djByUnNVTGVCNmovWWorMHFNRkZ2?=
 =?utf-8?B?a2FuQVczeFBvQjFnL3hDWEU4MldxN2JqQzcvYi9CR0pHdkFjMlIyOXlmQUFZ?=
 =?utf-8?B?cHplSmdHQzNRalU3VmdDTm1VVWRsNyszVEhzRlN6OGU2d09KU3ZyRzlEbGIx?=
 =?utf-8?B?YXZFSTVNZVcrcmNKTDFBODZxUk9UK3o4eUlraFR1TTNJM2hzUlViU1dTM3o1?=
 =?utf-8?B?N09zTWJhK0tVR29YTWwyWlRCNzVid05hUnhBRDVCK0Z5K21YR2xMakJNbXNB?=
 =?utf-8?B?cU45b3lWYWNqNDNWd3BvTkxvMjE1Rjk5aGF3Mk1KRnVCeWFkSUgwSmlEeWVD?=
 =?utf-8?B?WDcxKzZhMlZBUzJXTGtmb3RiYkhweXFoRjVwZFQrZk1wc2tRemRPTUhOTm5r?=
 =?utf-8?Q?TnGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1dzci9JbDNENHJXeEtaelM4Wkh1V3U0NThiakxSRW1IdWZuMWtacllSSlox?=
 =?utf-8?B?TWpXRzF4TVR3QnpqWXR6OXh1S0U1UTk5ejY5dEJFbmFoTExMR2xKc3dBV2tM?=
 =?utf-8?B?WkVHTDJiY2tIWnpVMkhTbmM4SHNBRXZ4cDh1NUlDTGZyRS9za1E0TnAySVZO?=
 =?utf-8?B?ZU5KWHM1TjErelNUanRBenV6TU9TTEZPaEExWmdXVm9tV29PY2lNOTNMMG1o?=
 =?utf-8?B?d3FDL3dYUEFQUGY3TW1Ca3NIbnRaUGQ2cldoVG1Qdmg3WnA2SENBUW5UUDVk?=
 =?utf-8?B?Szh6cFA3WDFSd3V0L3FoMEwvdlRQNXgwZWI2ZVp2cnJQRUdlVCtuRlh6OEtV?=
 =?utf-8?B?OXZMenVXOEtlblNRajkzRDMyMm85MWJkanN1Z1MxOVRteVJIMlU0YzFhNndY?=
 =?utf-8?B?c0o0am9mcURWQjFTNk92YlNvZ01pM3BZV09pd3NSem44ZUlDTHU1eVo1U2lV?=
 =?utf-8?B?VWMrNCtTaWJ2TWI3dEJIdHU1Z0ZsRUxiOEo2VHpEajdCUEJ6ZXptRThQZm1D?=
 =?utf-8?B?WVI2dWFwbTVnZ21LaGtyWHo2TGVqS2JFNTBaK24xbU16WTl3RHRudWh3bEFS?=
 =?utf-8?B?eUhwb2lwWWRsQ0FQTjkwbHdjYmlQQ3E2UjhpYVMrZ0huMTcrUHZpdEV2RkNT?=
 =?utf-8?B?czB3THBtQ0d2K2pSZHl2dHdVY2Vsc3RwaCtDdGxWdU9RWjEzWVQzcGphTzZC?=
 =?utf-8?B?eWIyQStOb2NOYWVaTFVjd3Q0NjBFSkwvNSsvOWtUVEM0Ym13NUllVUxUSUJZ?=
 =?utf-8?B?N01NTGN1aW1xWmdIcUxvbVFJQ1BpNmwySy9RazRwbmtGMUROWXdwalJYRGpi?=
 =?utf-8?B?dVZEOTlDUDBjQ2JwQ05nS3pxZkxLaDFxL2pJR3BZaHJ1MitmdUlxQ3RBdnpq?=
 =?utf-8?B?VllXeFBuSHdWclgyckNEdWdFTmNyVXNSMFYxWmZRRUZHeWQ2R2pMMHBneEE1?=
 =?utf-8?B?YTBEdWhjc0RQcWhmWVNwL0JPVlhHd3drOUh1YWkzRGhGS3cxcUlkMEtmdS8w?=
 =?utf-8?B?UW83d085cFpDLzJCaFRmTmVieTdlcHFHV1cycVlCVUtOTGY2dVVmK25UVkpj?=
 =?utf-8?B?Q1UrZTB0eU1vcFFTeE5sS3J0ZzMyRnRyWTlpZjFSU2NubnUzc0JVVTNRNzBs?=
 =?utf-8?B?elltVWIxcmZ1Ync0UFJreHZEbDQ1clZDU2RCY0NnQjNsMkVHYWt3a3pkYkFa?=
 =?utf-8?B?bVNkUHF0SHlzSEQwVlh0eEVFemJVMEpSNTcrVjQ1TG9IQy95SkdhOEVKV0Fl?=
 =?utf-8?B?ckluTURSNUU4aFEvQXlCL3hmS1ZtT0sybHdlcUp0dEJXbVBaTzFYUmEwUWVs?=
 =?utf-8?B?d1lpY2VzUmxlVlhmL090dDZLMU9vaU5UR0pSRWJoSjFDTTBNUzZsZ0dtOU4z?=
 =?utf-8?B?TDMzSGd6SUpTNHJiMjF1VGZIR2lyMDhyaEJHdE1wQkwxNnBlTElVT1UvdjRU?=
 =?utf-8?B?TGdzQkp6THBGQUdWcUhOemlqL2xyZTYwZy9ORFQzL3o0MUNaTnd4dG9TM1Qv?=
 =?utf-8?B?dHFpWG5ZM090VTVoL3N1VzJtLzNSbjFGQnFIS05qUENhSUV2ellkZ2NESnJO?=
 =?utf-8?B?SEVKQ3BpSnVUc2tYVUpydHlIbVM4NC9CQnF6OGMvNmlpS28xK1BzOHI2WFgr?=
 =?utf-8?B?U1VlNzE2YTJZWEdUS3ViRFNaOHdzTnlJekJNaHlaSlg0SkFXS3d2Y1c5RWtJ?=
 =?utf-8?B?OG9GN1R2OGRtMnN0UVNaVVljTHp3UlhlNHpZT2tFOVlZSUFHVEdScFd2OFJN?=
 =?utf-8?B?M29KNHVlclQ1OWVFYWN1aHh4cUc3V1BwQ0Z5clpVT1NaalRNK1FlaElTTzdT?=
 =?utf-8?B?dmoyd1Vwc3hieUJjbzVRNTNWcDZRaVZIU3p2NXd0dFNLNzNiQk11Z2o4dXVu?=
 =?utf-8?B?VXFHZytBVzlaSkt3Yk5jZFErQUYrZWE5djdtd1hDYUwzUW5KWmY2WStoZlc4?=
 =?utf-8?B?UHZIWEtyb3V5K2tUY0ZQTjNBUVNIVE5DV2kxbDdzWmVrV2RnY2xUTEVUMjRM?=
 =?utf-8?B?aFdQTG11MW1PczhGdFcyMi9FQnlSRFFhbHVDNHNXN2EvVHowWS91OVVoUVVP?=
 =?utf-8?B?eWUwOHZhSlBiUmJxZlczQWdMdk1iekc3T0VoZTRHM2dMWlpUUytrR2lzZ0tY?=
 =?utf-8?B?dm9kRmY5NVVzVThHKzQ0T1Nib3FGZ01CbmEya0VtcFFHQ29yRkJDZFJXZFZx?=
 =?utf-8?B?YUN4UmpuTUlqSDg1dkdNcThyRWU3TjVsQjlXRzd6SGsyNFBrTFFoQ2RaRnk0?=
 =?utf-8?B?L3lNWm5ZN1ZMR1hERmk4NXRObVVKYzFaYmRjOFlxdWFMZ0Z6MWhTcWdvbEdi?=
 =?utf-8?B?N3o2SFN3V1hWekd4a2Z1dzE4VEpYY0UvMGppNkVlWmlRLzlOaTI3Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26393cdb-84ca-4dca-a45b-08de5d4aac61
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:20:43.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySMsD+2J0W4TNuAsLLQrTYBrzg+XJqt6AsV0Yr8+rrzhTg96QizOucIMAbdcuPx0bJPQsaAmyXjbNg199uHkDCr+fTeZQL4Pv2cOhwA0Bs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7852


在 2026/1/26 22:57, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On lun. 26 janv. 2026 at 21:20, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>> 在 2026/1/26 19:19, Jerome Brunet 写道:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Jiebing Chen <jiebing.chen@amlogic.com>
>>>>
>>>> Add basic audio driver support for the Amlogic S4 based
>>>> Amlogic AQ222 board.
>>>>
>>>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>>>> ---
>>>>    .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 +++++++++++++++++++++
>>>>    2 files changed, 583 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> index 0a3f81ea0fb0..43493bc9da46 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>                regulator-always-on;
>>>>         };
>>>>
>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>> +             compatible = "regulator-fixed";
>>>> +             vin-supply = <&main_12v>;
>>>> +             regulator-name = "VCC5V";
>>>> +             regulator-min-microvolt = <5000000>;
>>>> +             regulator-max-microvolt = <5000000>;
>>>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>> +             startup-delay-us = <7000>;
>>>> +             enable-active-high;
>>>> +             regulator-boot-on;
>>>> +             regulator-always-on;
>>>> +     };
>>>> +
>>>>         /* SY8120B1ABC DC/DC Regulator. */
>>>>         vddcpu: regulator-vddcpu {
>>>>                 compatible = "pwm-regulator";
>>>> @@ -129,6 +142,215 @@ vddcpu: regulator-vddcpu {
>>>>                                 <699000 98>,
>>>>                                 <689000 100>;
>>>>         };
>>>> +
>>>> +     dmics: audio-codec-1 {
>>>> +             compatible = "dmic-codec";
>>>> +             #sound-dai-cells = <0>;
>>>> +             num-channels = <2>;
>>>> +             wakeup-delay-ms = <50>;
>>>> +             sound-name-prefix = "MIC";
>>>> +     };
>>>> +
>>>> +     dioo2133: audio-amplifier-0 {
>>>> +             compatible = "simple-audio-amplifier";
>>>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>> +             VCC-supply = <&vcc5v_reg>;
>>>> +             sound-name-prefix = "10U2";
>>>> +     };
>>>> +
>>>> +     spdif_dir: audio-spdif-in {
>>>> +             compatible = "linux,spdif-dir";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "DIR";
>>>> +     };
>>>> +
>>>> +     spdif_dit: audio-spdif-out {
>>>> +             compatible = "linux,spdif-dit";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "DIT";
>>>> +     };
>>>> +
>>>> +     sound {
>>>> +             compatible = "amlogic,axg-sound-card";
>>>> +             model = "aq222";
>>>> +             audio-widgets = "Line", "Lineout";
>>>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>> +                              <&tdmin_lb>, <&dioo2133>;
>>>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>> +                             "10U2 INR", "ACODEC LORP",
>>>> +                             "Lineout", "10U2 OUTL",
>>>> +                             "Lineout", "10U2 OUTR";
>>>> +             clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>> +                             <&clkc_pll CLKID_MPLL0>,
>>>> +                             <&clkc_pll CLKID_MPLL1>;
>>>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>> +             assigned-clock-rates = <1179648000>,
>>>> +                                    <270950400>,
>>>> +                                    <338688000>;
>>> Seems like you've got the 2 last PLLs serving the 44.1kHz rate family.
>>> Why is this needed ?
>> Hi, jermoe
>>
>> Considering that the sample rate is up to 176.4K
> That's not really the question here and there are interfaces (internal
> for example) for which it can go higher than that.
Yes, if the number of tdm slots is smaller, theoretically it is possible 
to support a higher sample rate.
>
>> PLL0 270.950400M max support 24bit *176.4k, 32ch for tdm mode
>>
>> Perhaps PLL1 PLL1 calculation error , it should be set up 361.2672M for
>> 32bit * 176.4k * 32ch.
>>
>> In fact, most situations are limited by the speed of the IO pin.
> ... again, no everything goes through those pins.
>
>> Can we remove MPLL1 here and keep MPLL0?
> That's up to you really. I'm merely pointing out that out of the 3 clock
> sources, 2 are setup to serve derivative of 44.1kHz, which is useless.
Two PLLs are indeed unnecessary. I will remove one in next version. thanks
>
>>>> +
>>>> +             dai-link-0 {
>>>> +                     sound-dai = <&frddr_a>;
>>>> +             };
>>>> +
>>>> +             dai-link-1 {
>>>> +                     sound-dai = <&frddr_b>;
>>>> +             };
>>>> +
>>>> +             dai-link-2 {
>>>> +                     sound-dai = <&frddr_c>;
>>>> +             };
>>>> +
>>>> +             dai-link-3 {
>>>> +                     sound-dai = <&toddr_a>;
>>>> +             };
>>>> +
>>>> +             dai-link-4 {
>>>> +                     sound-dai = <&toddr_b>;
>>>> +             };
>>>> +
>>>> +             dai-link-5 {
>>>> +                     sound-dai = <&toddr_c>;
>>>> +             };
>>>> +
>>>> +             dai-link-6 {
>>>> +                     sound-dai = <&tdmif_a>;
>>>> +                     dai-format = "i2s";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>>>> +                     };
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&toacodec TOACODEC_IN_A>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             dai-link-7 {
>>>> +                     sound-dai = <&tdmif_b>;
>>>> +                     dai-format = "i2s";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&toacodec TOACODEC_IN_B>;
>>>> +                     };
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* 8ch HDMI interface */
>>>> +             dai-link-8 {
>>>> +                     sound-dai = <&tdmif_c>;
>>>> +                     dai-format = "i2s";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif hdmi and coax output */
>>>> +             dai-link-9 {
>>>> +                     sound-dai = <&spdifout_a>;
>>>> +
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&spdif_dit>;
>>>> +                     };
>>>> +
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif hdmi interface */
>>>> +             dai-link-10 {
>>>> +                     sound-dai = <&spdifout_b>;
>>>> +
>>>> +                     codec {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif coax input */
>>>> +             dai-link-11 {
>>>> +                     sound-dai = <&spdifin>;
>>>> +
>>>> +                     codec {
>>>> +                             sound-dai = <&spdif_dir>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             dai-link-12 {
>>>> +                     sound-dai = <&toacodec TOACODEC_OUT>;
>>>> +
>>>> +                     codec {
>>>> +                             sound-dai = <&acodec>;
>>>> +                     };
>>>> +             };
>>>> +     };
>>>>    };
>>>>
>>>>    &pwm_ef {
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> index dfc0a30a6e61..a6c2c83eea16 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> @@ -11,6 +11,11 @@
>>>>    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>>    #include <dt-bindings/power/meson-s4-power.h>
>>>>    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>>>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>>>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>>>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>>>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>>>
>>>>    / {
>>>>         cpus {
>>>> @@ -863,4 +868,360 @@ emmc: mmc@fe08c000 {
>>>>                         assigned-clock-rates = <24000000>;
>>>>                 };
>>>>         };
>>>> +
>>>> +     tdmif_a: audio-controller-0 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_A";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_A_MCLK>;
>>>> +             clock-names = "sclk", "lrclk","mclk";
>>>> +     };
>>>> +
>>>> +     tdmif_b: audio-controller-1 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_B";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_B_MCLK>;
>>>> +             clock-names = "sclk", "lrclk","mclk";
>>>> +     };
>>>> +
>>>> +     tdmif_c: audio-controller-2 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_C";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_C_MCLK>;
>>>> +             clock-names = "sclk", "lrclk","mclk";
>>>> +     };
>>>> +};
>>>> +
>>>> +&apb4 {
>>>> +     acodec: audio-controller@1a000 {
>>>> +             compatible = "amlogic,t9015";
>>>> +             reg = <0x0 0x1a000 0x0 0x14>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "ACODEC";
>>>> +             clocks = <&clkc_periphs CLKID_ACODEC>;
>>>> +             clock-names = "pclk";
>>>> +             resets = <&reset RESET_ACODEC>;
>>>> +             AVDD-supply = <&vddio_ao1v8>;
>>>> +     };
>>>> +
>>>> +     clkc_audio: clock-controller@330000 {
>>>> +             compatible = "amlogic,s4-audio-clkc";
>>>> +             reg = <0x0 0x330000 0x0 0xd8>,
>>>> +                       <0x0 0x330e80 0x0 0x10>;
>>>> +             #clock-cells = <1>;
>>>> +             #reset-cells = <1>;
>>>> +             power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
>>>> +             clocks = <&clkc_periphs CLKID_AUDIO>,
>>>> +                      <&clkc_pll CLKID_MPLL0>,
>>>> +                      <&clkc_pll CLKID_MPLL1>,
>>>> +                      <&clkc_pll CLKID_MPLL2>,
>>>> +                      <&clkc_pll CLKID_MPLL3>,
>>>> +                      <&clkc_pll CLKID_HIFI_PLL>,
>>>> +                      <&clkc_pll CLKID_FCLK_DIV3>,
>>>> +                      <&clkc_pll CLKID_FCLK_DIV4>,
>>>> +                      <&clkc_pll CLKID_FCLK_DIV5>;
>>>> +             clock-names = "pclk",
>>>> +                               "mst_in0",
>>>> +                               "mst_in1",
>>>> +                               "mst_in2",
>>>> +                               "mst_in3",
>>>> +                               "mst_in4",
>>>> +                               "mst_in5",
>>>> +                               "mst_in6",
>>>> +                               "mst_in7";
>>>> +             resets = <&reset RESET_AUDIO>;
>>>> +     };
>>>> +
>>>> +     toddr_a: audio-controller@330100 {
>>>> +             compatible = "amlogic,sm1-toddr",
>>>> +                              "amlogic,axg-toddr";
>>> no s4 compat ?
>>>
>>>> +             reg = <0x0 0x330100 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TODDR_A";
>>>> +             interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
>>>> +             resets = <&arb AXG_ARB_TODDR_A>,
>>>> +                      <&clkc_audio AUD_RESET_TODDR_A>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <8192>;
>>>> +     };
>>>> +
>>>> +     toddr_b: audio-controller@330140 {
>>>> +             compatible = "amlogic,sm1-toddr",
>>>> +                              "amlogic,axg-toddr";
>>>> +             reg = <0x0 0x330140 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TODDR_B";
>>>> +             interrupts = <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
>>>> +             resets = <&arb AXG_ARB_TODDR_B>,
>>>> +                      <&clkc_audio AUD_RESET_TODDR_B>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     toddr_c: audio-controller@330180 {
>>>> +             compatible = "amlogic,sm1-toddr",
>>>> +                              "amlogic,axg-toddr";
>>>> +             reg = <0x0 0x330180 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TODDR_C";
>>>> +             interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
>>>> +             resets = <&arb AXG_ARB_TODDR_C>,
>>>> +                      <&clkc_audio AUD_RESET_TODDR_C>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     frddr_a: audio-controller@3301c0 {
>>>> +             compatible = "amlogic,sm1-frddr",
>>>> +                              "amlogic,axg-frddr";
>>>> +             reg = <0x0 0x3301c0 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "FRDDR_A";
>>>> +             interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>>>> +             resets = <&arb AXG_ARB_FRDDR_A>,
>>>> +                      <&clkc_audio AUD_RESET_FRDDR_A>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <512>;
>>>> +     };
>>>> +
>>>> +     frddr_b: audio-controller@330200 {
>>>> +             compatible = "amlogic,sm1-frddr",
>>>> +                              "amlogic,axg-frddr";
>>>> +             reg = <0x0 0x330200 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "FRDDR_B";
>>>> +             interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
>>>> +             resets = <&arb AXG_ARB_FRDDR_B>,
>>>> +                      <&clkc_audio AUD_RESET_FRDDR_B>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     frddr_c: audio-controller@330240 {
>>>> +             compatible = "amlogic,sm1-frddr",
>>>> +                              "amlogic,axg-frddr";
>>>> +             reg = <0x0 0x330240 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "FRDDR_C";
>>>> +             interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
>>>> +             resets = <&arb AXG_ARB_FRDDR_C>,
>>>> +                      <&clkc_audio AUD_RESET_FRDDR_C>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     arb: reset-controller@330280 {
>>>> +             compatible = "amlogic,meson-sm1-audio-arb";
>>>> +             reg = <0x0 0x330280 0x0 0x4>;
>>>> +             #reset-cells = <1>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
>>>> +     };
>>>> +
>>>> +     tdmin_a: audio-controller@330300 {
>>>> +             compatible = "amlogic,sm1-tdmin";
>>>> +             reg = <0x0 0x330300 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMIN_A";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMIN_A>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     tdmin_b: audio-controller@330340 {
>>>> +             compatible = "amlogic,sm1-tdmin";
>>>> +             reg = <0x0 0x330340 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMIN_B";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMIN_B>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     tdmin_c: audio-controller@330380 {
>>>> +             compatible = "amlogic,sm1-tdmin";
>>>> +             reg = <0x0 0x330380 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMIN_C";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMIN_C>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     tdmin_lb: audio-controller@3303c0 {
>>>> +             compatible = "amlogic,sm1-tdmin";
>>>> +             reg = <0x0 0x3303c0 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMIN_LB";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     spdifin: audio-controller@330400 {
>>>> +             compatible = "amlogic,g12a-spdifin",
>>>> +                              "amlogic,axg-spdifin";
>>>> +             reg = <0x0 0x330400 0x0 0x30>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "SPDIFIN";
>>>> +             interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>>>> +             <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>>>> +             clock-names = "pclk", "refclk";
>>>> +             resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>>>> +     };
>>>> +
>>>> +     spdifout_a: audio-controller@330480 {
>>>> +             compatible = "amlogic,g12a-spdifout",
>>>> +                              "amlogic,axg-spdifout";
>>>> +             reg = <0x0 0x330480 0x0 0x50>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "SPDIFOUT_A";
>>>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>>>> +             <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>>>> +             clock-names = "pclk", "mclk";
>>>> +             resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>>>> +     };
>>>> +
>>>> +     tdmout_a: audio-controller@330500 {
>>>> +             compatible = "amlogic,sm1-tdmout";
>>>> +             reg = <0x0 0x330500 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMOUT_A";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     tdmout_b: audio-controller@330540 {
>>>> +             compatible = "amlogic,sm1-tdmout";
>>>> +             reg = <0x0 0x330540 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMOUT_B";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     tdmout_c: audio-controller@330580 {
>>>> +             compatible = "amlogic,sm1-tdmout";
>>>> +             reg = <0x0 0x330580 0x0 0x40>;
>>>> +             sound-name-prefix = "TDMOUT_C";
>>>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>>>> +             clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                               "lrclk", "lrclk_sel";
>>>> +     };
>>>> +
>>>> +     spdifout_b: audio-controller@330680 {
>>>> +             compatible = "amlogic,g12a-spdifout",
>>>> +                              "amlogic,axg-spdifout";
>>>> +             reg = <0x0 0x330680 0x0 0x50>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "SPDIFOUT_B";
>>>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>>>> +                      <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>>>> +             clock-names = "pclk", "mclk";
>>>> +             resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>>>> +     };
>>>> +
>>>> +     toacodec: audio-controller@330740 {
>>>> +             compatible = "amlogic,s4-toacodec",
>>>> +                              "amlogic,g12a-toacodec";
>>>> +             reg = <0x0 0x330740 0x0 0x4>;
>>>> +             sound-name-prefix = "TOACODEC";
>>>> +             #sound-dai-cells = <1>;
>>>> +             resets = <&clkc_audio AUD_RESET_TOACODEC>;
>>>> +     };
>>>> +
>>>> +     tohdmitx: audio-controller@330744 {
>>>> +             compatible = "amlogic,sm1-tohdmitx",
>>>> +                              "amlogic,g12a-tohdmitx";
>>>> +             reg = <0x0 0x330744 0x0 0x4>;
>>>> +             #sound-dai-cells = <1>;
>>>> +             sound-name-prefix = "TOHDMITX";
>>>> +             resets = <&clkc_audio AUD_RESET_TOHDMITX>;
>>>> +     };
>>>> +
>>>> +     toddr_d: audio-controller@330840 {
>>>> +             compatible = "amlogic,sm1-toddr",
>>>> +                              "amlogic,axg-toddr";
>>>> +             reg = <0x0 0x330840 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TODDR_D";
>>>> +             interrupts = <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
>>>> +             resets = <&arb AXG_ARB_TODDR_D>,
>>>> +                      <&clkc_audio AUD_RESET_TODDR_D>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     frddr_d: audio-controller@330880 {
>>>> +              compatible = "amlogic,sm1-frddr",
>>>> +                               "amlogic,axg-frddr";
>>>> +             reg = <0x0 0x330880 0x0 0x2c>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "FRDDR_D";
>>>> +             interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>>>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
>>>> +             resets = <&arb AXG_ARB_FRDDR_D>,
>>>> +                      <&clkc_audio AUD_RESET_FRDDR_D>;
>>>> +             reset-names = "arb", "rst";
>>>> +             amlogic,fifo-depth = <256>;
>>>> +     };
>>>> +
>>>> +     pdm: audio-controller@331000 {
>>>> +             compatible = "amlogic,sm1-pdm",
>>>> +                          "amlogic,axg-pdm";
>>>> +             reg = <0x0 0x331000 0x0 0x34>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "PDM";
>>>> +             clocks = <&clkc_audio AUD_CLKID_PDM>,
>>>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>>>> +             clock-names = "pclk", "dclk", "sysclk";
>>>> +             resets = <&clkc_audio AUD_RESET_PDM>;
>>>> +     };
>>>>    };
>>> --
>>> Jerome
> --
> Jerome
