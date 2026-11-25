Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795636211;
	b=nj7CKZZkfGF5JKsXFaCCJ4xIcKpkq0Aa2req+nCKqD4cXsh9gBd5IYIcnNs23qcPtWNX
	 CWHwY7eaCmVOwWxHGGNuM22qj4lopl3gIB017ymkeCuLwxb4kdJ/BGuvO1WmsBM/1B95s
	 46qXwGgOLeH5B51yxRIHIUAeK5M6rDwtjp8AOFio7TqVj+dHSrT8C5+Tjtg53tNIn/oCt
	 TAxfG2WrKkzfccxyTuQhP/mRk0pE5xirtfQSHuQ/AZNrYfODigskq+sWDjYhs8WdgqZeP
	 75T6LaXe3TnLCT1QUL5SP+s2c47Yssdum0oZoMTziV/YL7uhACmhDHw9ttlEsPy7x2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636211;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=4LrMQT6gJOI/7UHNlXEjqj0LJlJC1ZrLM3aTPaTpPHQ=;
	b=LfCnCZ2qkN0Hns28dHutm7iS42r9/gkHQxhik0bvGcHu3XYpcP1j1Lw2JgxJFVBgDq36
	 En09bIinIn87oseEQjvVf+asFgElhDOvCENGRLQZI+2m6iYEy2yBA2ZpkpWicW+PECCrA
	 Yh0NzsyEkR1+h//zASv3OoriKXCcqY576RjEyPLQEdA2ZffyUYNTUP/huzMqNUrVzG8Kh
	 BdPZX2xuY3vyRNoc7R2fHmPH/9dwPQaZ5HJohl4OsO1v0kNrL6AiurigzGZVqr2RlpsnY
	 B1l+25w2puyqAE3ThG16UL35oTJM6mPfmbTxEnXSOU2sXFOJLbmOJ8heRfoXEuGP0rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=reliablecontrols.com;
	spf=pass smtp.mailfrom=reliablecontrols.com;
	dkim=pass header.d=reliablecontrols.com header.i=@reliablecontrols.com header.a=rsa-sha256 header.s=selector2 header.b=Uqxte2Od;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.115
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020115.outbound.protection.outlook.com [52.101.191.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D444606A31E;
	Wed, 25 Nov 2026 19:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D444606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=reliablecontrols.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reliablecontrols.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reliablecontrols.com header.i=@reliablecontrols.com header.a=rsa-sha256 header.s=selector2 header.b=Uqxte2Od
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcagPPnUt7QJl3TGCaQ/mUud4nmx6+/gduz4j/B+o4qRZb6iGhvyav6SOl1z/kNKkprvDnhUgZ2kdAYmvy8noHFgxrKTsPLht4y/C/bvhhq4VB6ZDmllSUSEcin7Tr+1Ng+HrzcJLXJjGknvjh+Qh+o+A+25Gec5NFL37UDboWE5beXXq0tJKsWZeFxO3DRcQmLZKJEr7MKeY2TAjCuRA28zqX5Wud2id2bm/P0+b24Q4aPzcllJm7gldCj3mlhgFuvi1lV0vRIgCQzTdaLC4KVkndaZHnn27rmPIzsJHFuGqMOucGXLdnmU0j/L0jaIlgL3Bt7BRLq6V2dXDXrOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LrMQT6gJOI/7UHNlXEjqj0LJlJC1ZrLM3aTPaTpPHQ=;
 b=G6jVpiVCsUSHo4ci0Ca7Nv6zPnqW+ARWEXBUCkdPq/5RqQ50Dk42r0DoNc5dENu6Q/IC3/tFxH2FNaIKI9O9F/xDkbvWKFh3EuFaotyyMk+Ywn6NNS5GnO7Dn0SZFK6WwOOyyXJs/4sV3kT0rOGb+NdxVc42TOPC4RWDszgIabP1axRdSHDX2/dLX4g725CWokgUiyo5JA2so0uZX5x0ubtZUwArGpQ4O0jR4V3lsinBCv/FVVdlCAoaWYuNAoRPV3d6A9k1gYgw6qXD9ZwjYyP3Wu3TMRMBoF/siUnZvX42ZiihduVBHc8YCnOHNoUgm6ofBZn6D7DI91wNeV41vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=reliablecontrols.com; dmarc=pass action=none
 header.from=reliablecontrols.com; dkim=pass header.d=reliablecontrols.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reliablecontrols.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LrMQT6gJOI/7UHNlXEjqj0LJlJC1ZrLM3aTPaTpPHQ=;
 b=Uqxte2OdR3AOMBSku71yt0z9HO61iD30XTIm0C9ZkpQ753AqoOkn04MLq6jK8s5RFpkVGrgahTi4nGBJm9VKzuGolomykHI1ikHWicPttwqJ0cjLQfyG/jN8gZ1QWA4h2lfVTtwHGHq1CTaq4h2Oe86kb9/aBz0hxVkxZdjR5CIUCvsXzJXKMGkL+kXYoIe6qPOxbZBlWnyLI5MCkS7qQpe2U07yL8pcOJsnhJLwl1ihV9iHzQ1nLpM+aBd6SJ30K1NGhwtRP6dmYfzaHpKtfUg28bvOpvXAx7/01f8JYEuPCqcpqA96VRElQk1H3UojJI1tTXdykt0zQ8hIlWiZaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=reliablecontrols.com;
Received: from YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:a::10)
 by YT2PR01MB5837.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:55::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 19:50:06 +0000
Received: from YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bda5:1597:e27f:11a6]) by YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bda5:1597:e27f:11a6%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:50:06 +0000
Message-ID: <5e2d3dd2-300a-463e-ad38-e32e22c83986@reliablecontrols.com>
Date: Wed, 25 Nov 2026 12:50:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: renesas: r9a06g032: Add reset controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
 <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
 <awcxPKer4G5oXQKo@shikoro>
Content-Language: en-US
From: Kyle Hendry <khendry@reliablecontrols.com>
In-Reply-To: <awcxPKer4G5oXQKo@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:303:86::17) To YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:a::10)
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
X-MS-TrafficTypeDiagnostic: YT8PR01MB560833:EE_|YT2PR01MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 53de6922-f967-4c7b-edb9-08df4b2d4dfb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|18002099003|22082099003|55112099003|4143699003|56012099006|11063799006|261028144727099003|261026121527099003|261021123027099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	eGxWo448/hlE0Fz+m7wc7cF0L7YjbBa0MoO9nHuJ2+DKh1zD7cigkW56cIHekbQGHpkn5MQ02COWucpa/GP81XsveMTqMIBa3klXCr0O42p08XOEBn6NpQymjFfIqu4t4WeMIpbdxQ9ecPH5UxADt181FFosDNMNinVJMTG/FwwNwSXVp7+UegCIPygQVtWKHCOragvkR+n17DK4pKrbq6cbE2BzPkt3DN7SQaEy59NZ0TbM+Y+H0rRDwHDyoTjDlviZ1/mPRWWyXydGEcF3MGC0Gfn0eOmlU/j31MMUJfMjyIFhhqtmgJboXis7Fbikya5ilBqAurK6lX+99rawcCiChqnMuvRMrqjtT+0JHKU79q0tSXwiySQGAeeJJvzuDhGCf8T9PHgRVot4v0wkbp+BtHHLO0mpQALXJ5YDtj2FEBZ5pIWZLh6Hb7hTVCJUHKdGEnlcZg+XN1KXcT4BIn6xBkhTOAkN4OZg66H6pGS6+Xh18z9H+xFmKmTZ6pE+qaHM20PKLcYjEcEAL9i5L2huxUDLTtq8dJzf9r6X+x00HsYfyJ9fOaIBZz29X9knSPftUBdrwDG9Nr7K8IY+OYLyk4jZg7giuQBHcfiKLHwaYDBk6ALF+noBhUc8pNNmsLRFkv1ysB0TtyWd+evjRqOLS3IRm+7qIzRDyyDmhUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(18002099003)(22082099003)(55112099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261021123027099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWc3ajFhQllQUmlVcndwZWNMM3JuYndycklpOVliUzhacmxFdUtRdis0RjhS?=
 =?utf-8?B?aUtZL0ZwWWdKM2gwaW9DWm5mS3p3NU9hYk9Jek9ZTWNaeGZaMXVZaHZzeTVu?=
 =?utf-8?B?R2N6Ui84RmtkV1hrUkkvSnFxUTQ0eTJGL0N5NEljWFFhOTlISERWandxWTlJ?=
 =?utf-8?B?Q0psNkdkN1NwQWRKM0ttWGJWWU5LY1h2eWl0U0VOZ2ljTks3Q3Z4ckpkY3p1?=
 =?utf-8?B?bTFqbGgvTWFabGRVWDdDdE1SMmZwZmZGYkpXR0JiYk5KV2dSYzh1T253bEFT?=
 =?utf-8?B?cVp6eHlCbkplMEhHaytsb3I2VXBJTzQ0bjZ6ZGdVOTg1akdUMzFYWEJobmlK?=
 =?utf-8?B?QTFkeUhhRkswTUVDMmhuZUlUQUtSc3ptcE8rUVdVYjBmOTY1b0FiL2hXemto?=
 =?utf-8?B?RC9FQTZYenc2MVRYa0QyTE9tYlN2NTBGWXpISUlTYXBPWmdFV29adktTNFh0?=
 =?utf-8?B?LzlFODJEYzc4eHQ2R09Hd2NBeUV0VC9ybGhFempoazdzL3BGVExRdU11cXV1?=
 =?utf-8?B?bkNrekx5VWFzZG9QbENRMzlGek9QMUxZN2tWZHVUcmRmWUQvWThjME9GZHFI?=
 =?utf-8?B?ZjFyRnVoTFBZTmZCNysxRy9ZKzZHdUFqYkF1aS9JdzBYN05pblU2bGlwZ0h1?=
 =?utf-8?B?VjJ0eDBRb1dXYjFnZ2lkSTQvUGQ0STR4b0l6czROenVTem5kK3BoY0dVVENa?=
 =?utf-8?B?VFMrdHJNT0Nrci9zNXVPSlVsRUg0elJpajRadHJYdHhWNlF3ejhPM0hpNVpm?=
 =?utf-8?B?QmNSYytiajZnMExyZG04b0tUYWhKRzVGZC9WVjF0MWE0TEpaVEh6Y0tYeXAx?=
 =?utf-8?B?ZFlGNnQvUjJhcVVXV3gwMmZYSE5vQ2dBQmdFY2oyOFpncWI0YlJGNzRtSVZi?=
 =?utf-8?B?VEIxbjF0Z1Q0YndManFBSnlkVEhUeVJ6dGoxTm1MUWVjQ3hxQzBsdW9NeG1i?=
 =?utf-8?B?dUM4b3lIOFkrWkFVdStKeDljQWVqVVhzM3dyRUpTREpFTHpGVGZ6OHA4ek42?=
 =?utf-8?B?VExRZTJ0bHdwK252QzE0djQvdUR4dlpqTitnakxxMWpLMU11SCs2Y21JTHFn?=
 =?utf-8?B?d3o1TlNUUlYvMmJzY2JqeTc1TzVhSW5GN2laNDVaN2VYOEJia3p0QzJkY1Fs?=
 =?utf-8?B?M3JpUkNXbEh2dWlwdmhwSlZJK05wck9oaG5iRTZHNzhyRVJ0NGxvZGJOTks2?=
 =?utf-8?B?MjRGbURpTXI2bWp2K0lqd0R1QWJNMTlPM1BEdHpxbDgvd2lvZ2tZRVZtK21W?=
 =?utf-8?B?a2VFVmNja21PZHczQk0vb3p6MVp0L1M1TGpvU2dGeWsvN081N3g4d2RDQTl5?=
 =?utf-8?B?aGl1MVBYUlQ3N0NYNVJobmlOTmhpMVA4VlR5K2s0Y3RERWJKdWRNeHB6OEZ6?=
 =?utf-8?B?bXIwckQyNUNqZ0Q4Yk5VSTNjUzU0S1hRQTlhRE00OVZxMUZrUDJ0c3lpb3Vz?=
 =?utf-8?B?ZDFsdVQyemo1dEZuR3ZISWcyTWh0bndXZ216YlVJUEtvTUcyS1Z5bW1IMHdW?=
 =?utf-8?B?MTB0UDk1ZVZrZVRadG9SK0VVZG1FR082VU40U0dHelMwaTg5eDJJa1pqNVBy?=
 =?utf-8?B?QVZZdXhHUHhFSm15VStBcTRvMkpFR1V4ak9iTXZYc1V2SXorUEZzbVBYbEhB?=
 =?utf-8?B?T0FyM3l0RHFKd0F3bm5LS01YY2FrbE5EVmduZFE0eU5udVNodEJLSzFBVGlU?=
 =?utf-8?B?amZpbEM4WmI0YkF5WHBmS05BVHhCRjZ2bms5LytVZHZMWXB3ajBFN1ErQmpk?=
 =?utf-8?B?NVArYTB0ME5lSWpBRzZOdFk0dnArWURUd0pqdktaUEN6V3ZNVVdUVVRIdGVW?=
 =?utf-8?B?SlYwcjJ1ekhxeTVZaGRaSWdwdEYwbGZndGFjTVQxdmxiMWU4eWdFYi9JQzdF?=
 =?utf-8?B?RW1TRlQyN3VXOVE0QWlSREJDS25VMGFpcWhRSVRJalFsdUdRK0VLcCtEZUp4?=
 =?utf-8?B?bkRyR082Q25ub1VlSmVCbzdWSGM1b3ZCelllR0JFVGpzeTlJMzYzbmpjV20v?=
 =?utf-8?B?MGluaERpT3N4QXhFSXVSY3RBY21YR3JuaEZaVFplc0xEVkJLVkRrQU1pcWdu?=
 =?utf-8?B?YTFHQnlqWC9lRkFReEh0anFGbXFFQU9sUmZBN1lhT0tZaEl1TGJPSmdvVS9x?=
 =?utf-8?B?T1d3UzJkSWEzSW9jdm5ZVm96aWpEdW1xK1ZtQ1IvdlAwL0RydFhKOWJsT2Fj?=
 =?utf-8?B?UmJVZUhaVGpzbEVvVk9oMUZzYmpoSnl5SUtRWjJ6SG8wUnlVQUtZSmxnS0tH?=
 =?utf-8?B?Vko5Z3JUWEQwVEUvbnJmWnBWL1psb0o1SVprS2x2Z3V5anhhRVpRYVU0T3Y3?=
 =?utf-8?B?anBCaVVhd1owcEdnVWZ2ejNDMzNyTm5xRlk0NjhJR0tmUUZJbWxGeWkrdUdF?=
 =?utf-8?Q?HnrfDVvFxfeCZz1U=3D?=
X-OriginatorOrg: reliablecontrols.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53de6922-f967-4c7b-edb9-08df4b2d4dfb
X-MS-Exchange-CrossTenant-AuthSource: YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:50:06.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70dc28cd-aa9f-493c-abf3-5c1ff69c0ddc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nT1F/mOZKcEbCJlLRg8RiOV/ccfPEzFOBAXbgDC5aQBvKFBqMRcSZVecrLTfDnbcjqXaQfH2YdUZdzqrcIRlXX1b5qQ4y+GWBkcJe2Uz50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5837

On 25-Nov-26 12:04, Wolfram Sang wrote:
>> +static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
>> +				bool set, unsigned long id)
>> +{
>> +	struct r9a06g032_priv *priv = priv_from_rcdev(rcdev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&priv->lock, flags);
>> +	clk_rdesc_set(priv, r9a06g032_resets[id], set);
>> +	spin_unlock_irqrestore(&priv->lock, flags);
> 
> I checked the docs again. (Do you have them? You can find the relevant
> part here[1]). Figure 7.3 and 7.4 mention a reset propagation time of
> 5us. So, it is not describing a pulse of 5us. But every access to the
> RSTN register needs this delay for propagation. So, despite the U-Boot
> code not having the delay, I think we should add a 'udelay(5)' here
> after the unlock. What do you think?

Agreed. I'll apply the delay to these resets.

Regards,
Kyle
