Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792635867;
	b=KH5ssETsrqhuDq44Qgwuh3HkKbxYaHIroQyYL4B5zucK+WDAjtvV4H+IvNQnWRs9wGOY
	 yOMolA7OvNF8A0MmdYJrW7gpsYKSsixRhKIJySzEh/b5wxr2CB4ONDK+abcBjxKsPH+O9
	 Q3p+/Tmzer14WFfq7hjDZfYkL5DEi/RQPi7NXKPFaIAuzd+kKPwMbJNq9N6bSDY/V+cvQ
	 D1+sF8TK6UA3Ezpl5AiHbiTKDsIieOHK7k7a4Rh2AP+Yvo7LBINVjltXGWZbTJLTN/NfH
	 Y45/dUqiHsXaR+1FD/EpMkKlshhjWqjCzLj6oXbhggjDL++z8wHYHtYDbB1YHlOFNXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635867;
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
	bh=QQ6TEXmRqjyEaZIEQysYmLI0+LE0QNEPyL7RQNv99xs=;
	b=Xsr4+a296xHVRT75j+gy7VLNkNyshKSAXG6BvT+GY1PvQkaUjJPPl09SmIgwi2oyQW3N
	 boZ2r626npcTqADUvMzDne/zUYMfi0klGCtoe38WuN+WTZBOB7tO5P7yZuy4PJg4cBKy3
	 Mg8eQQyvk62YDmz4d7xN1d1EoimPkqTH6tRlzkqezw8gddWNqACLyYH47v7BvJ+WQ4Gmx
	 ThlNlZThUoucPyMj/hNKkOrTmP15JU9+SqQNriiv7NxAUZJNcrUkAT0/wmKIlVnfoNQvo
	 l2YoSBStkl8099KA3cjLj1SN6yT2SX/dBMWftVtf7bmn9P10qtb6QHBnL9AFvOtIjQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=jlX5ToI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.96
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023096.outbound.protection.outlook.com [40.107.44.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F7606A31B;
	Thu, 22 Oct 2026 02:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=jlX5ToI5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt+XuSC9aUO+Z+b7UTo03/wjVGIZktrnXVvAlgtxVBUTOzHTWfzYXmF1Zz8Wm/GV35CUno68R3/henZotlmdd4vrH+RTLEoQzKEJf3AvzrtXHjA8TQvAOJVW7iq14XPHn/0/0nJyngb09WP0YPozb+I2ib8GoqH8EZcC0PgZIkrX+eC8ym9QqgbvVQdN4BA30x4IfEKFSlWCcigxIhdyglm/OSEYqNXS7wC9cjTsZSH39Zj/nUGZ9SG08Y9l0z0hLgkU4cFQIB0tRs4Kmv6o6Sp72YRg288iWYQXjtZJrNaF17DZB8FDqESiiTgEobvlDIIgmez5HT+hyFs081jDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ6TEXmRqjyEaZIEQysYmLI0+LE0QNEPyL7RQNv99xs=;
 b=wRD8k5wLcUrx3S487ZbQzJsHHLuiQ8FDmC0HZhlhfvnESzAVlD0TSLyqYxEDvUzz+x70nQAnUhlEjtM/T9PO6PdjgjM4njmn5besd0+qlf2JVRXjTQppPAlSA9SfjOvjMFbMxz+nL08SIo1EgWm5jzuqeS4gRxyOq8BHwbBkBVxVmAItj5kh8XZZUT6KqpoBJI2nfpEsf3S9XIzubgz/7GDACV3nnONryXxQEuJHZKNhofvWaucgNksqzl3xBowH4V5M+g6xM2cQnnErnHANbJiHBzBGFl7yJJafgJ+PCZbUSHp1pJbabjd0k1YLkAFXmfAdbVx+gMvPF3E2bvm1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ6TEXmRqjyEaZIEQysYmLI0+LE0QNEPyL7RQNv99xs=;
 b=jlX5ToI5tY+zET6XDrCfhgEY0qQ9JzISvo03YqVHKExYSZz2h2zcjCrV//j/3vOT4a04JOX4WB1ieTp+3blELra46fDWp8v/XPw1YrdELa3KXh23bLF44+K4fechuzt6HorexZB07w/94PvaFqTyGbH3zI8PeifFN7KfWW3PKCAAV3LNZC28nXnkEomq4F4h+ZHdrWk5aUKdmwnZGncTYEoxE0Ph2mnPl4wpO246uk2JxM5ikWsGrcTahAD8B1Kg0wZr6FfZjhgNWuQjCssOb3xmKH1IKttziCHi8Aj71/qMFYb/dqv2Dynphoi4lZn79/VxuLEOCwVqYax2heWEdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by TYSPR03MB7572.apcprd03.prod.outlook.com
 (2603:1096:400:432::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 02:24:23 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 02:24:23 +0000
Message-ID: <83bb17dc-49e2-437f-a55f-3f8a5e77c5f4@amlogic.com>
Date: Thu, 22 Oct 2026 10:24:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
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
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
 <179259528986.4070168.179126639869298765.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179259528986.4070168.179126639869298765.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYNPR03MB10226.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|TYSPR03MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5ce28e-0c75-4b11-559f-08df2fe39644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|10067099003|22082099003|261021121427099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	miX2Jabfg5ba0UN/IHc/zDhqzbW8GTcR0yJ2XvAmkj1WcnbJiyp3kdFS07lc07Oi0FeF0HhLnbiplbL7Y7vEwzjXalEZiyNTUrPtwMe7oTtRljo18AKl5noAVK+zsvWRPr2MHbcfcD1KIrFHxYGGFBdxv6wb/d80c2f3kicyyKLLkRESc+WNckECi57ue6qoHbaJJ9uDlEo+z/UB86NVz6VN0+G8miY2PH46UxG4KvRI8tvqx7ZjmM2bSuf1OLjpeGxqom7ZIWAnpdzaNyV2yWhtCAwKvn9TXqPFIY6wBXE4zTvqN7WmKzHXU6msDt4uE03R7nN8G6eYTzy4vY6Sj1yMj5LysIv7ghTtTy1lHU+KKKH6euW2DwiqTuNEfFPMTfWPnA9A4LVVQVfD+jorTYMmLE1ZULfnXJv6uJ8BntfmjXCbDjJDNsqd1QODMxn8bOgwiefoxVkD6H5gCD4nqq06oGjqtdyKExUvQgjvCq2eeRdpOHncmQ8EjQeWD5ftWvp+4FMtkvyw3MuRqJG150E1oRt3VD+O7Xz61B21M0Reurex+EdtzbNy/ogzrjpuiVRBVvFgHDM1pmuQyGp9KCRMivBtgztVXJcxORQTMYbaF0iDsgZrTas7B4kutjRd+kUcSsXpP4iB+lRrYiLEaNXtKY35OQWdwZdWxUHLbkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(10067099003)(22082099003)(261021121427099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFBhRDJBZHdpS2lXUFprU0NzbHdEbzJzNytDWmxXWitVQ25tdXR4REVqamRi?=
 =?utf-8?B?Qzd5ZlZyVUdJWVZBRXR3bmd1ampPb21yOHphckVLcGlJOE0zS040UXlpeVhq?=
 =?utf-8?B?bisyaHQzZkRDb2J5a25WbzJrTkp3UTZvWHdqOUdFQWxlME1CNTZzT1dPZklU?=
 =?utf-8?B?bzEraXpnNGs5STNXTm53UTRtWEpSRE51bGxESTdnODlxZWRwTWRrMzZSQkdl?=
 =?utf-8?B?Yk1OSGJ6Q01NUzBtdCtjeHNPaFE0a2hwSHorK0VlbCtkVkJzVExyZllROURj?=
 =?utf-8?B?UXNpWmVNaStlK1BSMGNQQ0pXdzNmcmpDRnJzeWlCVml0S2NVQVhXUmY5U21u?=
 =?utf-8?B?RWZBK3JQSitYYkJ1SkxoakM4cWR0S01EZjJEdGFwYW4zcVI2Q29sMXRONGZp?=
 =?utf-8?B?dW9DQi82Z3NzMVdJYnNwNnZNZUtiS0ZaZ3E3RHBCcVkzMHRmZVBRelg1eUZS?=
 =?utf-8?B?WU1rMUl1UzFrak1BZVhwcTRMTVF1RGxDOEcxVzdxQzVINzF2Q25IdDNFQlNN?=
 =?utf-8?B?blpWUzNtUGsyZHlNQW05dVZWS1kwUVRhWmpaT01qL0lQMi9zWTI1RFNuWFNV?=
 =?utf-8?B?dnhELzNRdmNsVkN2bVdSV2dMS3dnMllITEljekF2SzE0VHp6R011My93RVFP?=
 =?utf-8?B?YzExMGQyWVg5OGdpTE8wYmJoOWhTNk9DWk1acFJuTHpFT1RQOS9ZRXpadnBZ?=
 =?utf-8?B?QTAyclJicEJIU0E0d0Z5dFJKc2p5NDlRZVFaOHU1RHd6cUZjQ2VnS0doTW12?=
 =?utf-8?B?bStUbnRoS0tyeG1vc1kvV2lrb1VwemVTMElIdUZibXBSVjFBRWdmWmtXOWo2?=
 =?utf-8?B?NzNxeWNicllGOUpJU1FZbE4xYnVaRGs1MWcvK1dkTFlPMTAxVy9HejdGQ3A0?=
 =?utf-8?B?QUFDVGY3SW5wcW9PeGUzUS90SDJqcEVZa01FUXovdExic1BaRGdkeUgwT3Nm?=
 =?utf-8?B?SjVBelhCbnRlbjRjRWtUNUszNVo3WlhMWTN2NC9SN3llbU1pUU5WQm4vYmEv?=
 =?utf-8?B?aDYyZFlYWmtVNUF5M2pkOFZUZzY0SHRKMDhOeVhyODNlVVBreXliK0daeXhp?=
 =?utf-8?B?ZHMvelBaYklPMXZHNFlnbm5wUVE3Vm1YUzF1VVF4UDExYXAwa1V4WVFIQW05?=
 =?utf-8?B?OFhrYUp3Z3JGRTl3M3Y5VXZaTllDZlc5c0d3S1RIaGNnOGRjYXB2cENSelB0?=
 =?utf-8?B?MS9UeVpSSzU1RS9HQWtFcXBKWDQ1dFVRelBrNmtNVEkrYmdBUm5SUklXK2tG?=
 =?utf-8?B?N2JucUkvWEE1VkxOVzJ2SEhVRGU4VmpmcXBrQnYzOWdGWlo3YkVZTEVWN1Jq?=
 =?utf-8?B?bzNKNThGZ05LbFBtVUxaeUtmbUY1elNxRk5CRE4vSnR1bDZ4VG9ZazdCcmNu?=
 =?utf-8?B?eDBkRW9RTzFVN1NSU0RCVzg4dFlpNXhWMktwb0xMN3JjN0d4dGdYcmF0VFY2?=
 =?utf-8?B?OHg1dGFxOHZleUxxUktua0FjQlBNOTVZRGtXekl6WEdUa1dHZzhjaWlGSWcv?=
 =?utf-8?B?T2FYVEh4aStlRlY4dE5KQldObFNOc3lHa01TdWlKajZsYnNSRTdNTEVIUndJ?=
 =?utf-8?B?OHh4MVEwdlU3bzdqWVpqdzNkNFJ5WUYydkJMeThDNFpmK3hTakN4R3UyVjZk?=
 =?utf-8?B?MDN0MjNXZUpvK0haWnNJdDc4VmZsMmh5MWVPU3NGWHpHTzZ4NllwSmgzUU81?=
 =?utf-8?B?RUlpbnBOYlNpb241ZC9SQUluZGZUWWFHQVRmNTR0RWU1WUMxVzVJQ0p3THBH?=
 =?utf-8?B?SC9TN2puRkhVTzdFRFZZMitKeEZWeTY2SlVlOFNaWDdWSFhYMUdxVlllTTgr?=
 =?utf-8?B?Z0JWUWFNT3FibmtWRG9WWGJjbHB0S25uN1VFTllrR0hEQzFlV2NFY2JSdTRp?=
 =?utf-8?B?b1NtVGwxWDdWM0l6OUw3L2RCQ2l5TEdVeHBqcFZTTEsxc250UFRvT3hKVzJR?=
 =?utf-8?B?VnExQzZDd0hseXkyNWhHVEY1enR0NGpHNFlNR1FSbVVmU00rOFRUVkhFVEp5?=
 =?utf-8?B?M0hEbGo5b0p0RTFBbDBqaVhFM2doNytZZ1dST3hxVWZlZDQwa1pka0lGVFdo?=
 =?utf-8?B?bzdRdFZUOEVnZGoydnR0ZVFJdS84SjBUdUNnUTdjZjJ0bzFZc2Iya3pGVFFI?=
 =?utf-8?B?OTAreHZsVlY5WGU5MW8zNmNybG9GSFhIK1JIYnB4Qlh2TmlYSUFJN3c5Y1pj?=
 =?utf-8?B?OW5oRlFQVzNWMXNYUEdlNVgxRFlqa1VuRnhoRFV3c1VIcVBuajdBaVpSR1cy?=
 =?utf-8?B?cWdWcVdwNDRrNFpnVURlZWdxRnZRallCR2g4UmtHYk5QMStKT3h4S0dWczZU?=
 =?utf-8?B?Zk0xZ3FjZDZybmhISjBCYUNGdUg0dCs5d0ptVk9XS3U2cENGT3pWUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5ce28e-0c75-4b11-559f-08df2fe39644
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 02:24:23.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YK5k/NNcyvC0tEguZcpeMoN3wywSk/jaVUnewq1XrZi4wxgiHJslAW4b5j91FESFNsapALXPAiWB5Ufh8rG4tIAN+wC/lyJF6KFxoNJ1B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7572


在 2026/10/21 23:08, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
>> The S4 requires additional clock control bits to be turn on while enabled.
>> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
>> Update the widget accordingly.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   sound/soc/meson/g12a-toacodec.c | 49 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
>> index 21941ee552c5..9cfed3702354 100644
>> --- a/sound/soc/meson/g12a-toacodec.c
>> +++ b/sound/soc/meson/g12a-toacodec.c
>> @@ -41,6 +41,9 @@
>>   #define  CTRL0_BCLK_SEL_LSB          4
>>   #define  CTRL0_MCLK_SEL                      GENMASK(2, 0)
>>
>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
> Please follow the indentation convention in place (2 spaces)
Noted with thanks
>
>> +
>>   #define TOACODEC_OUT_CHMAX           2
>>
>>   struct g12a_toacodec {
>> @@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>>                            &g12a_toacodec_out_enable),
>>   };
>>
>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
>> +     SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>> +                      &sm1_toacodec_mux),
>> +     SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
>> +                         &g12a_toacodec_out_enable),
>> +     SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0, NULL, 0),
>> +     SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0, NULL, 0),
> BCLK Gate => BCLK EN, same for MCLK
Thanks for pointing this out. I’ll fix it.
>
>> +
>> +};
>> +
>>   static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>>                                         struct snd_pcm_hw_params *params,
>>                                         struct snd_soc_dai *dai)
>> @@ -226,6 +239,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>>        { "OUT Capture", NULL, "OUT EN" },
>>   };
>>
>> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
>> +     { "SRC", "I2S A", "IN A Playback" },
>> +     { "SRC", "I2S B", "IN B Playback" },
>> +     { "SRC", "I2S C", "IN C Playback" },
>> +     { "OUT EN", "Switch", "SRC" },
>> +     { "OUT Capture", NULL, "OUT EN" },
>> +     { "OUT EN", NULL, "I2S BCLK Gate" },
>> +     { "I2S BCLK Gate", NULL, "I2S MCLK Gate" },
> Audio signal does not go through those Gate elements
> They should be supply path connected to OUT EN.
Thanks for your guidance. Is it correct to use the method below?

  {"OUT EN", NULL, "I2S BCLK EN" },
  {"OUT EN", NULL, "I2S MCLK EN" },

>
> --
> Jerome
>
