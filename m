Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2102.outbound.protection.outlook.com [40.107.215.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDC51F76A1;
	Fri, 17 Jan 2025 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101098; cv=fail; b=YNGtj+SfksRvHIBtePsnq/FTlOQik8Jc2nJazRMO/oI8f398gBhXlyznaTnX2wphnJ9Z44Cl3RRHAm1BpcUnuXeEmMCqF8U2DI0Fd8MJB8jq0IoIbPwGHYPvI41a9m1f2ld/DEOrbOm2ItPNHiY41oaMqg9qRR45BRs9i8aTNX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101098; c=relaxed/simple;
	bh=KEqrd0Ar+9SarXL29BtQ8sC3QbfkiVFdPReyAFxUUaM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M1+U+hTgjaM0pdyj6CZ31ueLwuXDOAQDhuAorDGcpUpL2zM07Wv8vljYE175kFnz8I8zidO30pT/xVtTTitvcbxfDflvOmqUJfHgkODoO31DFDq601LuSglAoK5tb4glSKiQ8dAH8l9z+6HoPGU5je/JwZ5+Kw+XjZCuN1zCaHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XWp4HZ7Y; arc=fail smtp.client-ip=40.107.215.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XWp4HZ7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1Zb60SNCE9eBXgq4fdbB9GCU+twu6GxSPh1bzvHvh4ojOiotAei8ri5YW2+KKUH8lau8DZoEfOcIRKqoWNX8EtlgOGykRiJ29QSdVaCei5lDom1VoJFsQQ4jxdTbJkvhSaT5RP0dyK8Za+EfEckxPQGFYdUB/W4l9tO+WS7silJ4NywEwgdUJSBvfonihzmTlB9e0zEfXBAcC/QsxRazdWk6B38JQ2J6hSdQ0g/TUTLKsjPczayQYH9awZOnZgod13wweZ59wU8SRhvne21c5x/8qRkWxEOtDRcVytqqKFZKiKQu385xv5niu300cWt9VFXzGj8pIdwZrlLZ4lO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7X4EqXXBM1UY6h7g9S5peodvJU/2uUlhyiIREggXY0=;
 b=MdKEafKAMUueuXdSirZCwLVRYGsd11JgB7xTFHLLxUwNDK6fJi9Fs4UhE8s18n6lytn+c/Ffd9j4pbQYTgFvpSLcljviSewNWfiY6SNw9p7oNm+xajx/+ArLpV/52Hpzjn1zXKxYO6IU0oxl8CeZjhsZ61Rc5gJKyEmCWf4rJmQlQ9ogKezpFl0t0yN73tSrJ53bX36seu4TYtj6oC2EUQv3xJJXXBXeFc5P05/hE30ox+otPi1Xre7Wwos2XuVSBNU7yN0n+j4Hhb7AMKZh4RRAWy23aO5Nssy/QSDLkPt/mxyl4MtJDsnwE4XyEugdYaLDURhrskCFddvzA3bhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7X4EqXXBM1UY6h7g9S5peodvJU/2uUlhyiIREggXY0=;
 b=XWp4HZ7YilOcY4cHhel0syiiiLpqcg+jNSOQLHPvWadwh8CjY13jpwPva8/sj6psXZflJCiCtP9SYBPxqQwl7Roj+GoCErCK6xqi32q1t6vMlI5JW59VnXkeWZglB2MIHbroH2OdKLHN9cNEYKQ6uii/m9AYEX/VXBMzUJ2CiwcuVrdkJTzFlZlUDWre/jdC6aY0/zlrdAaqvRj/7HxRMCUx2Y1jMFOpTQECy86dCWcsfisjzXZkJk8GCKZSWygCS6VsQY9VSI3ywcDZZGY2hsp5rrRFNq/2UGwC03/K0VvS/H9BPySOFFrkI/dCQFRhz1I12KHdYaMp7s/tYQumng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYUPR03MB7163.apcprd03.prod.outlook.com (2603:1096:400:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:04:53 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:04:52 +0000
Message-ID: <f205415c-097f-47bf-8b18-097ea034df64@amlogic.com>
Date: Fri, 17 Jan 2025 16:04:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-2-jian.hu@amlogic.com>
 <20250110155404.GA2928945-robh@kernel.org>
 <1j4j228uxg.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j4j228uxg.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYUPR03MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b4e90a-d119-4100-0381-08dd36cd9f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU5iSlcyTVBla1FKZlhQS0xSZUtDS3pHN0pZV1l1WXRZanpISTdMdTd1blNH?=
 =?utf-8?B?SGFnOGRLUkdXVzBYbTBqcStvcGY3dlBkM2hSVkRJNVFneFFxakFybytrSDhC?=
 =?utf-8?B?V3JGdGJvUmR6YXE4NzRXYmxOeTY5WkRHS3N3c3RkQ0hCZHFUZ2VNU09rdTNy?=
 =?utf-8?B?TjRZWXppQ1gxeWdnRXozUDQ4QXFKNmN1TXk0ME5Kc2xhNkFlUHF6bU9vbkVo?=
 =?utf-8?B?V0MvRFBmT2wzY2FJTDF2dXNFay82amo1QnhOcEZRQnI2SkJlamt0ZjYrUFov?=
 =?utf-8?B?TzYvZWhpbi9UU1NRVXlzVFhNcTllOHRxb2VoZ1NPdkVJYkxqcVBLWFFBR1RC?=
 =?utf-8?B?VWNsMlRvTDBTL0g1cUpqOG5xbXVCRHdOQ1ZrZ3RmRTJlTjQvS0Rkcm5jdDhi?=
 =?utf-8?B?ZVRvSEwzMTVwRndZcStWa25hb3gzQkpsQnZuWjkrOTlGd1IzRG9WUExJYXVp?=
 =?utf-8?B?UFN2RjA0OURRaGxKM1lQaXhjV2hVa3AxV2w3ZGNNVWQyMzA3VnB5ZDk5NXds?=
 =?utf-8?B?WC82VDU5cUlwbHlTSnA1d0ppSlpRTVdoNUpBRU1ZNTJkNlU5bHhUN1hnNERR?=
 =?utf-8?B?b3N1aFo4eFF6UVRLQzg2ZERRZ2hENk9RalF2QkNxbUdKc2VoaU16NldqRS9D?=
 =?utf-8?B?eVNDUUI0dURqc3VsNDllOW9rcThhaWRsYnJMcWJoSFNjTEdrZC9WUTliS1oz?=
 =?utf-8?B?Nm9ZUmR3SS9kbHFnZEN1bzdPaE5hMFlJK1RYUXlJYkNpaTVwc3l6bjVmUFhl?=
 =?utf-8?B?WkJwTmRiWFEzWnU5b0dlc0VreUdkVmFUUGNteFZISXdtVHFyNnVLTjJlbnA2?=
 =?utf-8?B?eU4xOHRCdG9LK1hsd056QWJBdlhOTEtZMS82MXdPaDlUSUVJemtod3BRUHZq?=
 =?utf-8?B?NFVxU3RrblB3aVpNVHpPZVFYTCtsSVUrSkEvb1dVeWVkYWtQU0FydTNHd2ZM?=
 =?utf-8?B?VDRpYkxQRVltQnQ1OWxRakkzVlpSTGg5UENpR3VPdHpRQVdMcFJpa2NNbTZT?=
 =?utf-8?B?b3drcGNzc0UxZ0kwUE56VHAyb2crSzNGZDBXZDczRTFEb25pZzJTSmhmL1F4?=
 =?utf-8?B?V0loUVl3ZTF3WHNUYUhzYnJFTlRJZUVWbFIvTEZ3TEJyL2x5SlpZR3RCVlJy?=
 =?utf-8?B?VWhVZWVDTlBIV3krUlNVVStxeTdIRFg5eGZqWmRzVGMwU3BIWWlGVXBQMllN?=
 =?utf-8?B?eHdLcXQ1VEN3T0tQazZUOWU1VytKSHFPeHV4RERxTG50Z3cxK2dYNTR3T1FK?=
 =?utf-8?B?UmJtdGpiZnlIbjlzblRMZE5ZWWg0MHpqemh0b21Sb1g4aUdnOU5DcFA3MlNH?=
 =?utf-8?B?K2xjV1NtYzNvZjBGZkJZaC9UZHhuY1AzOUVDRVRTdktpK2lwbmlCN3EvbGpY?=
 =?utf-8?B?VERmVysxY2liRENjNzVIS0RMeXJ2L3ZBdlJPckc5bXF6TmY3WGN2Y1VVZW04?=
 =?utf-8?B?M2tKQU00M3c1S1RlVXMxUUFwSmJTMzRtRUJqVTdzbmUrY1I2YWRYNXVDd2Fi?=
 =?utf-8?B?ZGdkZkdGd2VRODJqN1NROW9qNTNvaU1WNnNta0laRWc2VlIwck55UWhHSnFJ?=
 =?utf-8?B?T0lleWZhYm5pVzVsRFVQRHFwQW03VVg3NFBkUlNoelY3K1gwL2dkbUJsRVZa?=
 =?utf-8?B?S3FseGt0U2U1MG5ZVnU1Z1JEV2I1WW1HUzBIb1ZNZ20vcmNmWndhNm8wSGc0?=
 =?utf-8?B?enkzWmdlZTJaelVOVGtLbkd3MmRacU9kVUhJRzE5NUJBMGxXbWxEckI1SklX?=
 =?utf-8?B?UjJZRmhDV2hmZFFZQzNMenNoK1YyNVVNdVRja3BlbVJESXNqTy9COGZXTDE1?=
 =?utf-8?B?T2Nxa0RISFh3c2cyZUE5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1UxVklZNWFFclg0QzZERjdCK3FvRzZyYm91TFRNTFh3T0RCS01wT0VQWVA0?=
 =?utf-8?B?eUt1WnZjanM5MmtPY3M3bEpBb2Y4dDBqOFFGckp1eDQvQ29RNXdSTXZaMWto?=
 =?utf-8?B?WHBrUWVnOTdyaUxZU0lqT1M3ZmRtQ0x0aGRIbG5nVk40UGx6MHZudk5sRDlp?=
 =?utf-8?B?UmYvZC9mKzhVOUpIYW1uNGhIZHVDTkFIS1dHMTNoOStKUGg1MEVNM0FiU3Fr?=
 =?utf-8?B?TmJOamdUdjJoeENzS2RCMURjU3dlZGhEam5Gd3E5L2U0VDE4V09jMEorMmwz?=
 =?utf-8?B?VTkrcXZQYk1CQUhWTmpWZ0hBeTc3T1dJb3lLMTVvaE5QQnJNdlNiQk1BanhZ?=
 =?utf-8?B?YW9qTlQvY1k3b3phQlBDbDExcEFpODZ6RjVqRVRPVFdQYkFrcHFiTjl2SzBF?=
 =?utf-8?B?WGRpTmFxcU00SHROcUdmV1RKY3JQZnloVHp3VUNNeEEwa1RnN3RvVXpXZlB2?=
 =?utf-8?B?blRBT0tUOXpCc1Y3LytZNWxRQ1JNUEtOR05ERW1sTE02ZEIzVUtyeXJPbi95?=
 =?utf-8?B?aU1hc1V0dUdwYVk2MTB6ZkxjWitjQWZjSVVueDk0ZXk3OEN3cDgydzFHdG1z?=
 =?utf-8?B?bVYwWU9CU1FtU2N0N050QjVhL2RCS2xZL0RTQVpUMlBnNnlsbDBDZWhUODhR?=
 =?utf-8?B?b0Erdk1VN2w2cHM5N3FLYmd3VXp4TGx5cHJHSG5UVkw2MDBKY0ZQTFMxNCtJ?=
 =?utf-8?B?TTcvTDBVVFljNDJYNE4wYmpiY25uMjhaSW1oQXprbm5GWTU0QnZtYkdNMSsz?=
 =?utf-8?B?SSt6VVY4RjRtdS91akxRNFZkWWRaRS9OYUlyaG40Vi9iTFJJK2w2K21xWDJN?=
 =?utf-8?B?eEU2ekJEdTE3Zzk3ZXBNRDBEcVhmcVY5a2FIdzZYZHl3Z1RLSHcvTThIQTd3?=
 =?utf-8?B?YnQrMDNnM1FZY1JEdmFFUzF3NWZsRmEwZGw3ZWhxTjE4bUV0VEoyd0FFdXl4?=
 =?utf-8?B?T3VmS3ZzL3BPRllYYi9KdTFSQk5pRy96aFV5U1hjcnU0aFE4UFV5YTZsUFJC?=
 =?utf-8?B?Ny9XSWhDRmYvRm5vcDdYcVNCUzF0ZXpwbjc0dWpBRHh0QkpFUTBWNWJvYmR1?=
 =?utf-8?B?a1pmS0ZRM1B2QmVnTEtGZVZqR1hWMWxiQ0QyVlUxVFJHRkJOWDhLM0Y5NHlW?=
 =?utf-8?B?dWE3bGtpazdKaHMrQ0dtNlh2WU5jNmMxZUVCRUxBNHhSVW1CU05vZlNSUW9O?=
 =?utf-8?B?RVY5Q3dlK0FLOTlKQWJ5bU0vZzFHa1puNysvY3VMdXJrZUdYZXpnVmRUMlhK?=
 =?utf-8?B?b01XNjhhaHBjdnY1anpBeXdPOGNvWFo2QVAveGUySDR5QWNmemlBRXc5Z3dN?=
 =?utf-8?B?WkViVFd2SXVxd1dmRkczc2FYWW5mNWlsOVdUMTZXOUw5NFN4UUw4b3ArS2Nu?=
 =?utf-8?B?RFpxR096dW15aE1kbFNXOVV4TVlKR0tDRWlEV0tvTFgrS2xFeUNWK3pZcjJw?=
 =?utf-8?B?Y3FxT0NEa0FnRmFxaHI0Uk5JVk5WQ3h1bGRvc2dpQmhQbEt6dHRBT3BGeXhN?=
 =?utf-8?B?V3p4WEVrR2xmQUs5QkJaZEIzMFFBTGR0UzRiQVQyeVByMmNWWlpxNDdLUzdS?=
 =?utf-8?B?cTVFRTI0TnRNVk9xQU92YURqdWpYakRzOTQ0TDBueGVJcVNNRklTTVZha0JO?=
 =?utf-8?B?TVl2SklWQ1JiN0Zwb01qK3ZtQTRSbFVGcmczanV6ZHhUUlZjVEVSRkVuMGlk?=
 =?utf-8?B?RVBCaTlhVUZSQWxBTCt6ODNGUzBoQTNJaXdWZ3ppM2lkR3ZXK1lhVDgwcXQ1?=
 =?utf-8?B?TDZVZjVhKzVhWnVWWEhKMjYrSElTL0MrdXBCQUpDMkVmbkdwRkdvbmxCZDVt?=
 =?utf-8?B?cVNGajIwcXNVU2RnSExWU1liUzB6QnZlMTIxaXZjN0M4MXRBUGZPd2xYb0pl?=
 =?utf-8?B?RDc4cmMrV0hFVGdPZkZjT0p2TGhkdnpEUnBld0FEK21IU1U4L1A2N1g1VTZ2?=
 =?utf-8?B?RDBXRmErQktZTENmS0l3SWoxQ0kwbHNhbmlWdSt4KytrUFlNNThmMloraGJ2?=
 =?utf-8?B?QlVHQTh6QW1hMGl1dnlNMUNwUFJhNmxrRHk2UkNGd1JoaW5FY0dpUVpaLzd1?=
 =?utf-8?B?Q05tZWVSbzhLRXZ6cnpRbDB6azVxRzMzcHJoR01aSzZSWlkrYzdORlUzdVVF?=
 =?utf-8?Q?2OhWR7qQBOeWtHegPo7gFcDav?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b4e90a-d119-4100-0381-08dd36cd9f50
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:04:52.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5DshIiQV8R7dGk0AaL5TfhQD0xFl3yMJ55Jf3JEeD2h6kX8iw/W+26krzJFXATkl7OB92iwA77KUQmNC23byg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7163

Hi, Jerome


Thanks for your review.


On 2025/1/14 1:50, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 10 Jan 2025 at 09:54, Rob Herring <robh@kernel.org> wrote:
>
>> On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
>>> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>>>   .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>>>   2 files changed, 160 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>> b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..fd0323678d37
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>> @@ -0,0 +1,103 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic T7 PLL Clock Control Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Jian Hu <jian.hu@amlogic.com>
>>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> +
>>> +if:
>> Move this after 'required' section.
>>
>> Generally we put 'if' under 'allOf' because we're likely to have another
>> if/then schema on the next compatible added. If you don't think this
>> binding will ever get used on another chip, then it is fine as-is.
>>
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: amlogic,t7-pll-mclk
>>> +
>>> +then:
>>> +  properties:
>>> +    clocks:
>>> +      items:
>>> +        - description: mclk pll input oscillator gate
>>> +        - description: 24M oscillator input clock source for mclk_sel_0
>>> +        - description: fix 50Mhz input clock source for mclk_sel_0
> The rate is whatever the clock will actually be. Better not to mention
> it in this doc.


OK, I will remove the rate here.

>>> +
>>> +    clock-names:
>>> +      items:
> one being "input" and other suffixed "_in" looks really odd
>
>>> +        - const: input
>>> +        - const: mclk_in0
>>> +        - const: mclk_in1
> or just in0, in1, in2 if you are going with Rob's suggestion.
> Having "mclk_" in the top level would be confusing.


Ok, I will use in0/in1/in2 for them.

> --
> 2.47.1
>
> --
> Jerome
