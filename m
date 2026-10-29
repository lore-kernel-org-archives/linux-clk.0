Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793242583;
	b=ixqLX0W2BxiUFxgsM4YuWavT3783agzB5douNyJRInx1JcR50pNvNyl4LvUBSHJyAmrX
	 E8F8zAoJxhsdD7InfhDrKK3s3jjrEp0Tr9Mif0rUD9d1Tjpr8GLgAwgchTtCdi5M8wwwt
	 XKIvtzn2uz9HGMlc0R6UljUfsdyNltlGjYuR55Rui5y1qkHWmfWxZYGD06VtjdsEsXTQ8
	 zgkSyl1FFMMZ7w6CtIICDvbx9W8qsa57/qkire0TT0ODQ19xGA2eMOpsxjhse/5DJtwe3
	 MQhHsUk1FSg4gm37KEVX+MmWfzaTgARZilP/GQsJjKCvv1syPMJXL8+rpEir+6QyMuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242583;
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
	bh=hnrs2FdnwHWCgKg0SmW1qSsndTGKhMKWtE98bO4UpLg=;
	b=dJ8BH+2V9pFw1pUktKfcNKmJ0vqCWCkhZzZnZ8UPbqEQh5zLLFQxl2QVQSKRqxEVrjhy
	 n7hZ8mMkz+2N4xX7igwtTC/fJTL+TJ1nRUDNH8Wl+UhLo77xFwfVX58iP5TIUj76O8pFP
	 W8EWU+Q+8fIFV8Ol9M6BiZ5mhaMR3FdKFto13eqIPOsktgbxWGTK8bFVhkQPnINNJMPo8
	 rFvqOHUkVBZfnryRFqHl+oIlJUMK/A7Qh1nnAWmcH1m2Gxn3zhvGxF6hlGAvk6bKAsLu8
	 7bEFRDXVHu7ryYCXP+qc3S04FqD78ZvPIsnIuElC2B6vgPiHzFG4Wn/+HmLwD2m9y0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=YfL6swxf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.86
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022086.outbound.protection.outlook.com [40.107.75.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92ED606A31C;
	Thu, 29 Oct 2026 02:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=YfL6swxf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf0gv2qQslJAk7lQWjBteK7H2SC5wuPrrJvzt1blBs1Gu6GKeCfA86jCtxHmvhBzd0yQ1GELsoZhu0hMf5ol6KZN2Zu3x0wCIepn6WGApB6UEqqNoGJ9Gj2X1vOberNK6gwNjUcl/32JtVC1SBKn74iVBRib4wDJcZVr9G26ih/zT3Z0a1Nb64Jdf0a6ZO5sY6oZ9lv8E3+66FilnBmEU8V5mOaCtSVdcZ1NQLP3t8m2OjWG9zDRUWLz2Y3vwWgJQ4BoAMB5iCXIFzdFLHYtq1c4b5cVtfI1LJjLq1qvhv4i9HpeO1YC9vF3lQfCz0E8yo4akUDTd5ASLH+9N7+K7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnrs2FdnwHWCgKg0SmW1qSsndTGKhMKWtE98bO4UpLg=;
 b=bVS/IKjSK30obqA3O0OREyy9kpX4FNjFmn3Q8Je2VLF59xJS6PXjOLgdBDb1fC8EFLh0u9etAmzKEmEV9uN1aQu4AQklHnQ+28ihfakty6zZ+Lej+hayJEQoX/Zw9XoCeJ/xA4BXVoffmX3qiCmo5kyhpMgtFOHZh2K7wMSj8Pl2oHrrxYTpyLbk04Eeceq5lW2jlgmCzl7QTsfHk7E1j71CyuaTLJOqI4cJq8RGbCyORx7Z/lwae/0JUkFVL+DbMe/h7ZjF7UlZGzGUhP3m28xQ5srtyPk7rw83LO0TMrw49GkqWj1OiEC2m6QpLt/iU77XCAjsgVAFwg/lGZct2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnrs2FdnwHWCgKg0SmW1qSsndTGKhMKWtE98bO4UpLg=;
 b=YfL6swxfD17sRy2P8FLRzlfzyDz9rM+U7NUK3RUl/La+sOpNmLIj6c3KdYUYmqgdQ+sYZiy54RF7E8VsSm6Hmt2Pa7Vp4s72U0rNlDPV+lgupubUZ14BkAPnTj5lXapTNTeuoAX5cpjRpmvRniW/Zn4v9iVu1xDQavplxyjlZmff/6iAXrOAYZLXmvg0g525Fjmf6WVT60/cfZHryK+2piUtwTC3hPg6yujVMe/hjH2z7oz7xdftSCcc7vH/Zb0HDYF4T+pdBJkJJ9zNNTQBPYqRmhluI+b3WTKkc8kaiQN89Hy6npDmTBKYCHpv3W0qnxEJfFB1wkNv6Kkw4/kddQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by OSNPR03MB10495.apcprd03.prod.outlook.com
 (2603:1096:604:47d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 02:56:19 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 02:56:19 +0000
Message-ID: <6009f35b-b1e0-458c-85d4-08e4bfb1db86@amlogic.com>
Date: Thu, 29 Oct 2026 10:56:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
 <20261028-sparkling-objective-cricket-a428bd@quoll>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20261028-sparkling-objective-cricket-a428bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To TYNPR03MB10226.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|OSNPR03MB10495:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b7f319-7190-4a34-2118-08df3568353c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	qHvFRTiC5JOur0ghM9aekSI9hudhyLMr4Iy7Li46BFhxxKPzzovpy46TTjLMhaIHvJJign2brdLwsjglvE/20pl8E3h33CMB+eu57smHlhD4wnxdsjiuwEA1p0hMucj+tJEEYzPoY3dLmI9H21tPchvVhIetxvkIqzK073c994JgSgjAxxK2J5rsyux5B0F244JMgzQHKGMmIT9kH1irJnUVSN/rjrPwSmmAkYtb3GqnVr+s1M6Skn80LD1PadMLwoRY4U8Ueo72JYOVdq4v52kLG/Ecmr85OIf14DeUPVKFJvJCT+pQA5A3ukxUju7Z6GbSGiNen1+r/p9fgLv2M9hE8t6hsyzFw/XImYfQsD/h/pldZL3pywjuS2iBaMC+IK1oXItjBKDRooB0zsy0lr/4Ml520SVfgLQipidVjT99RJSmLBfmHjJ3h/JKE5DJFqDo337YXMHrspw4EVWJHkyGBTlU+gmswH/TO5/oLkVQFtmncJiQk04OskgmGduW5znOne2YfHPsUPJhXqBHYyAWuF7IzRZdEIkiXh+dwFL4sYx6nDJxRnzDCifNrPLe/mvBLWhgIW/ljzzeIsLTPBPQSO6Yx0gKwfbJCxjGjOMsygDnPAN2ufyibFHLwrFHloy/RSq6PsZAK9/OsiILGJwuKnuhvz1QE15ZsipCzxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZvUFpxMWk0NUdheE9HMmw2MTZYT3ZlSlorUnQzaUdaRFhha2RnR2t0Slg0?=
 =?utf-8?B?eERmWUtXbnV5dlZ3cVoyRDNjcDNsL0tuVEtxZDM2NHBoSDQ5dnJraDJjU3pO?=
 =?utf-8?B?RVRrdWtBd1ZESVdzUjhJNmVaKzNaUzhYYzRyYnhKR2lJSVZMUnl6bmx0WS9z?=
 =?utf-8?B?K0puTGdBTnduNkVqVFJsZ2ZPOU1obHNNcjU2ZzQzeXFvT0lNK24wSUY1STlq?=
 =?utf-8?B?SGhwN3cxanBHMlZqMUdTaGRCQVpKcEM2WWt2b2ZGY2lITjN0c1BNVkZ4dXlP?=
 =?utf-8?B?c0dUT290UHZsMExBd1BmcTdMOXJyTHJ1N3M1TFFlTXZvdkd3NktDbWN4Z3lM?=
 =?utf-8?B?Q2NDaWdXSkNrd1RvdmNIRGRiVG9pamdpTVFTajV1dzJ1Um5QcEp2VEFDTzBB?=
 =?utf-8?B?c0FHeEhFMXZ0amhjQ0dPam1TRTdZUTl6bkdTQXliYnFkMnd5dVZ5RWQzcHBk?=
 =?utf-8?B?bXdSOVJQNnZobXVlb3BmS3pKSXVydW5DWHZ5NVFLaEF2L1o0SzRqaUJzRmpM?=
 =?utf-8?B?THRjZHhUQWYrcWcvbE5BUU1mQXFLZUlrWXRoekNvYU8wZ1p3YlRNdHFWZTZO?=
 =?utf-8?B?QUJjblJOaEhpREJhTDNvNTl5dmRzNm5UalRQenc5MHlnc3E3RUdDZmtXc1kz?=
 =?utf-8?B?V3ZwVmcvclRYM3RiWjEwNkM0WVRVN1VFT2ZtNXhoVFczVmRxUTdpZ2o5MjZZ?=
 =?utf-8?B?dE5maHFWSXNsSjE3YmY2dVJqZys1K3dkS2szOTRZdGN0UHBQREplaGRmMmNN?=
 =?utf-8?B?Vm9YKzIxK1VvdWpJWEFYRnMxbFUrQ3F0dHhDMGxNWTdPalg1NUViYksxSk94?=
 =?utf-8?B?Z2tBYnRmQ1RHL1hqWlZiU2pQZDZnTlYxSCtUZmhiZVB1NE9KMExrakdjK2c3?=
 =?utf-8?B?RzJzL2VpK0dqNzdoeWtrWmtNc2xGMkpsSlZmQXFOYTRaUllyelROWjBHZ050?=
 =?utf-8?B?MTVncjcrdS8xNklzcDVpWjdiZEd0SDNxQm9NbElnUEpXVC84S2dqRWpveEVv?=
 =?utf-8?B?NDZLSzA3Z21ET0tUblducFNza2hBVGIrZjByK3F3dldvNWlDb1ZIRzdxaGFU?=
 =?utf-8?B?dlVBZ1VVUS9kT01Da2xqVlF0SWcwdk1tUHQrbEhHSlZPV3ZPSXJBMjFrdmNT?=
 =?utf-8?B?ZjM2ZVRHbmora1JBRktwSGtWOS9JTEhlbnpVUEROdHYxNUQrSytpekJmVTd5?=
 =?utf-8?B?ZW9Zc20yRXlVbk5jOCtHWFdCZUpRbDJtb09CM1lqYnVoM2U3WlMrSElxOVRk?=
 =?utf-8?B?UC9qbExwM1lwWHN2S0dLOTRCQ2hRbDd4NFVERTJMclViL0RYZTJPcVVWR3NJ?=
 =?utf-8?B?SDZtd0J3cjZHbmtlY1d5aHVSTDZrN3VnSFdwMlJwNnljajhUL0pKNkF4cE5p?=
 =?utf-8?B?QUsvRTg5bGxIa1owUnpBcGFxU0hOTm5vV0lFRlNmc1paTlpMK2lpOXpiUVlL?=
 =?utf-8?B?VDk0SG5WWW4rRzg3Rlk0dGZBNkd0bXA2N0IwSU9ad1BvdE80TElkZWxYUlY3?=
 =?utf-8?B?VUZJVlNrNThvanUvK0R3U0xGVElDR3ovZVhic2Nsc1Z6M2hXQXl0S2d6Zkh6?=
 =?utf-8?B?Y1FZbWlJdFpWUlMwbzdaT2NNaVdkZnBQV0RkRnZvNmFFNG94TzRTUnZWNjRO?=
 =?utf-8?B?cTZQbzVCcExaZ3gwYmN0U2NpN1Y4Y1hheW9KQ1U1MlBHK25WdU8rVUQ2ejRq?=
 =?utf-8?B?SlVOM2E1NDFHNi9EaUxQOWRnYmYvOU5Cb2pYc1JFeS9JNVZMNk5WSWszNURr?=
 =?utf-8?B?RThnUzFGUnlHNjlPQUNUOGd3bFdQTlZjWjMrZ1JzVFIybE9vTmJMejVwVnhI?=
 =?utf-8?B?d2dwaEF0Z3pLWExvOGpEaGVSTlUySW1UOFhEWDhwOU5hcGxSUDF1NGZEVHdx?=
 =?utf-8?B?RkJrTFUvSkNBR053WVFwL2lySzV2SzlzeWNQck5lQjdzUnp5VXlScVNJVVJU?=
 =?utf-8?B?UzI1ZFc4Y0haOE5XbGxWdy96dU9BcVZOR3cxMldzelVnSTZ5VUFlNHVsaUtk?=
 =?utf-8?B?dFlXdjl4YVJONjYwRjR6THcvdXFGbWtoNjY5Um1HR2c4M1RqVnpNVllwNU9a?=
 =?utf-8?B?RGxKV0gyaXZicS9TOWZ5S0JSbDYzM0ZaZGhCcTVsaE9XT0FEdFhEWmZ4ZDdF?=
 =?utf-8?B?TTFhTEJoREZkL3ZBQlRRd29YK3VwajladmV3QTNDcDIzcFY3M3BIbkZ3Q1RM?=
 =?utf-8?B?TVRVaUNQaUF6QUdvRlJIdEs4Skx0dngzaytRZHJlR3NYMFVaVTVCbE1BRm5o?=
 =?utf-8?B?dTBZS1hvK1Vtd3BGKzN6a25sbXpxTzQvcEhnY3RyZk1vYmdSQ2ZYbDRMSnJW?=
 =?utf-8?B?aktjem9xMlBncnpBTXY0NEFVZitqRzJVWkNvOUdtamFRUlZUTGtwQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b7f319-7190-4a34-2118-08df3568353c
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 02:56:19.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeIDULntJPEm8AxruLSJTXtTpGOmVh15ph24RGqvqzqUQh4PrwzWfMQGC1SBa4gvopYUkUFQ84CVYMtlT8OK1vs6WuUAmW/uRg63DpaoBgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10495


在 2026/10/28 22:48, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On Wed, Oct 21, 2026 at 03:08:28PM +0800, Jiebing Chen wrote:
>> The audio power domain has been found on S4 device.
>> It must be enabled prior to audio operations.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> index fd7982dd4cea..69f5fef5f14a 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> @@ -20,6 +20,7 @@ properties:
>>       enum:
>>         - amlogic,axg-audio-clkc
>>         - amlogic,g12a-audio-clkc
>> +      - amlogic,s4-audio-clkc
>>         - amlogic,sm1-audio-clkc
>>
>>     '#clock-cells':
>> @@ -100,6 +101,8 @@ properties:
>>     resets:
>>       description: internal reset line
>>
>> +  power-domains:
>> +    maxItems: 1
> Missing blank line.
got it, thanks
>
>>   required:
>>     - compatible
>>     - '#clock-cells'
>> @@ -115,6 +118,7 @@ allOf:
>>             contains:
>>               enum:
>>                 - amlogic,g12a-audio-clkc
>> +              - amlogic,s4-audio-clkc
>>                 - amlogic,sm1-audio-clkc
>>       then:
>>         required:
>> @@ -122,7 +126,18 @@ allOf:
>>       else:
>>         properties:
>>           '#reset-cells': false
>> -
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,s4-audio-clkc
>> +    then:
>> +      required:
>> +        - power-domains
>> +    else:
>> +      properties:
>> +        power-domains: false
> And here as well.
>
> Best regards,
> Krzysztof
>
