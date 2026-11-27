Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795769671;
	b=o7SdK08a1H16doqJ8uFzKtPWuqXWsgRwf8oFFLsHUQrk9Gwp59xHlRmZ3girNz6ZM0NH
	 6MWb0OopVnYHnp/3KncoKPHy5T2vmO/GopDO0i3cuwprOUAXBslDO/43Zq7YZyb+sxxdv
	 LiwWwp+ev7yeur9o4fHWXs8p5S8LKDPIDLrKiR6MsbasSIMOVjDBCSCB3H2PUT8eQW16+
	 iRYnaSaj679R2YyjKqV2qC2Eh4iaShHiqfl0Ay1MPaj2IR2ko7ZoTwA4JWMnEV6kymFJL
	 A+wt8i92fMtd1kQeevgJ1WCtTFZMagrFL23Cw1PjLGR2Ojq+8AY/bKxz8CNtmmZydaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769671;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=T3qLaCwib+7pykyfh1QYb8xQLqsZY1jXwoFqmVtj3+g=;
	b=RIcoujx64LtdFv2amuX/DJI6hyNflRJ1/PAu2NeGXMr7HBiLwuD8vdeG4xQ5sILqlC/7
	 zKcrVt7M9BosR6xYhi1vBxVeP0T2/Tq1UwiSDZ34WV2uv4w9M9UEbkSPRSrprGrp3Mk4Y
	 lNObSMCSO9Qy/pHVzlsGWP4kZBrY4WZC/ofT/574PT3A+Sk2ZMKqXIfYh8t7XzKiZBNOH
	 1/4ni7i4Jh8uZ6N74ahTBaZJv8KdR6SE8VDWjTQ98NDlL5iFQRgzqkAOe8POjYKfFXJM4
	 jlBQPclQ089t87wQsiFdCA9phrCRpBZ1zn/K6C4V0efB1y5fDuivXHN+yYtqlH1MkJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=xmJiQmx7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.83
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023083.outbound.protection.outlook.com [40.107.44.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF2606A31C;
	Fri, 27 Nov 2026 08:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=xmJiQmx7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw8v1hhO0EJevFYcjVoAh6FgOV9hEq7JIKh+JrSz0lNn6PYD2gnWZ3fKTcIOFK6utIZpTFXUpQvLUxgzz8jyGCR0KN7790YwXlLBkXVrGc+fXlexXMPsK7zI8NABKn2usIAGT2mQ1nYkZiT+BjyAq6m1DXhqVVDVSwSnlbu6ARbepSzEgU2AsqVyKRyR5eXYyVVv17M3/Upj9dqnFY0GCI3Vh55bjLJPibcjzBV9f+PsdH7FofSnmd512HLfMug8VEtu9PtWK5hrjfQMjc3JSiw5uJ7YxCabjlW2P+7NIZEHvmvfeRFDpfoj73oxx1bAhK19jaGDWpbGBhSeX2ZcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3qLaCwib+7pykyfh1QYb8xQLqsZY1jXwoFqmVtj3+g=;
 b=TjyEvWRNK5pwAHSh/yRFZhzUq7ZhHm8YeGnKoCRd/YF3T5VFKqAzsTu1N6ZYUam1TYzEP1OFUdIsNc+GTJ8yby7RoPb4fxmeGes7ihmyWhC4kXP/mHyDFOODlkDk22+2XppumzKJq+9fto61FWnNxOqdsB837FXZOz+WUSh1bhOENajgd07AkqYAWQj6WYcCkAV0DqkJFOfOQWqPDDzSztskGjSJMZLUGl6g47vG/8zcflRgM69fWgzkLXtjUa0T0F+/RUfcqvj/12KmxlWaacoIsr8yvVpZMIYMZajkHFw8W/L1tWB6dSlhytXvf1w8b389gEAZErIqD83Xuh7oGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3qLaCwib+7pykyfh1QYb8xQLqsZY1jXwoFqmVtj3+g=;
 b=xmJiQmx7qbz9R/4czrtP7exfgiRKAe/aQtaDTzGZ31wpkOutC0wTlL4/UWIHmO26Cya5dSCffNlQ7m2PhJ/HHYzFx522tt0Htt43K0l7c9wchr42UKf+DkUdCzFFyN9VkY+snLBesblb6Ao45R0w4VPy7Sl7hogIZI70g1kb6qqy6YnWE8hUEqO/9MVHeBERGEDW3lM3fqHgzfH2IrxODqWgCrZ+u5FI3NROnpHV1LtbQuMe3J8lhhtbQcoOhPSw6RgR6Hfhp8EDHJ9s3t7KwN8M2NUq+13QWFWXY8E1L3uvMR07RP8eSeH9aKduDWUqmRmMn5yLBOWTer/5DQ1q0Q==
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by JH0PR03MB8290.apcprd03.prod.outlook.com with HTTP
 via P2P; Fri, 27 Nov 2026 08:54:26 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 08:54:25 +0000
Message-ID: <71eb9aa8-b630-439a-a9bd-227e3334b7d5@amlogic.com>
Date: Fri, 27 Nov 2026 16:54:19 +0800
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
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
 <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::10) To TYNPR03MB10226.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|JH0PR03MB8290:EE_
X-MS-PublicTrafficType: Email
client-request-id: 2bb94401-40fd-4f8f-b785-72d4358515bb
request-id: 8842210a-71c0-459c-9f6f-08df4c6409d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261021121427099003|261102123227099003|5023799004|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1+cK5bkFedkhzg5mFHRAaZV57xRK5jkk0wdT14W4s9M40ztJtCZYM9ozSqQUoOYIVKMZjTa5uzekb5tieL0opcTbmIjGsaHnOz5zgrSB0vVMNJTIVqkrH8nJnF6kYD5FKEH5Hn+B5sae+eTteyOH5DMq8Tt6IL7YikRzvqkstzsg1QZWWAUMGqPQ2DpazIe7q8SBWTTPitYyESEbIO/VlHOKkF6/RSzHfkFbnexMxSUvek86W59mVo75Kd6B9TISYTCTdfxfJwoAE43DnZTmSDY84l3pPjrcpgnJvdAM6eO2QBjbm/aNeyzL7u4vgYFxZq/DbVZjDJ1yZOxxSopXdPnlhAhrEJYoP1A+C0rgw+0aHqwrvXU4tlTnDt+CO+H/spMk09uwmiqO3mjhSCS2Kw4pAhTkgGcbkvvwQe/u1fbWuGxaT088jeilrDU0bF0MYbjqBSO3rI7totwnCh3PjslmOwS/ps0jej2kicxXb4QQFWf1mt2Py2hWZDckQwCXxYC/EOgf9tc9aUFsYTuYqvOM06mewXpK8R7v28B32USSlyiOzGUyZC08Urx+1yAUn6EMLfgHsVsSItmtzipg6fjc1L7b48FJfU0C5XCKmYXK7J6lLXU9k+547yc2p0BiQ71/fClhtExisLPOOuR/lBX5PzRgb+tfJwuyxzo/P+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261102123227099003)(5023799004)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVWeFpnRXNPVzhJZWRhSzhMRzlRam12dmlsVVdQZk1jK21xbllWTXNWS2Zl?=
 =?utf-8?B?VDlFS2xZTXk5VmxlVGlDNXd5dE8rUDJrdHBuUlZQeCsrL2NMMWFoUWF5MXdW?=
 =?utf-8?B?Yk5nU3lJWWVyQWZzbjF6b09tZDhmcStxSWhrOVNVM1BUbUI0bkk0MzhsaTlS?=
 =?utf-8?B?ZDQzS3ZwVnl3L2F0N2crVktaOVprR1pHL1cvT2tnSkVmRUc3eTFZRnAvWVo4?=
 =?utf-8?B?NnIyT0JaMFlLVUx3TWp0cjBxK0VDOVAvTEg4c2NIK0dsbmk4MEp2clc1VEMv?=
 =?utf-8?B?ek8rRHYwWW1SUkdrMlMvcFA1aTlBa0praDFDem43WUFUZWYwVnNpL2dlS1BW?=
 =?utf-8?B?N2pGTzVqN1k3YlhZSjJ3MVhOWVJpdUJsS1B1SDJnbWJSd1J6QWdtamtjVE9N?=
 =?utf-8?B?WFgrdThnMEtmQlJlTHJ0ZElMMmdQTExLMlNSNzB1Ukp6UWROQzk1TmFJc1hV?=
 =?utf-8?B?V0NQNTJxcy8wNmFieG0wdXk3ODYrRkRSV0RHV2Y5bDhQaXhLU3RHYUozc0dM?=
 =?utf-8?B?eGhKRm93QmtjVlNwSEx5ajl4Q0J1aG9nK3A5eWp5ZXROdmQwckxRa05KNDNs?=
 =?utf-8?B?OXRibmN5WCtnTkMwMDRyMEQ4eUc4cmdXTkRPSStybVNFRGJMRy9aaXZBVDJI?=
 =?utf-8?B?UGpGSytiWkd2Y2tzR25yb3BNaXVSVmQzY1EzN3NCaVBuSjVRendqbU9YWFdO?=
 =?utf-8?B?bVJHWHVEcERKN2x3aTFMUGdqQ2hqSDJHSXBwL0xyVnc5TVh3RDBoNThnczIy?=
 =?utf-8?B?c3NURUdYVWtEc0RZdE1xZGR5VVUzaS9XczdicFZjN0JWdTlCaWtWV2Y4cGVn?=
 =?utf-8?B?SWNjL2lxditUVkJtOUhiOFpqb0ZtdVBDczhmeWltUWRZMWYxMVRHeWc0T3Zp?=
 =?utf-8?B?NVVidFhVL01sbXhnNktKNklCck5adnA2bjRLNHNRNW94YWlTdU44cWk3UmIw?=
 =?utf-8?B?UjMvOEY5SERBMWpQaFpyRGVsZkVOYTc0clAzZ29RTE9RTFBtaDNCNS9uZGl4?=
 =?utf-8?B?Zy9wa0ZVQlVvQll4dkxCVC9nRXYzemE2VXNRZ0RYQmxLNmlWaDBsN2FLcDNz?=
 =?utf-8?B?bTV5Vys1bjFQVmEyK3FWOUkzYUJ0SktpU0pUdlBIYXB6OStYU0ZBNjlkNU5S?=
 =?utf-8?B?N1BvSjI5cGZGNStUSmVZdk44WFdQV1VGb09CQXFqalFTNzJRRDN3cDhwVUVV?=
 =?utf-8?B?TjFMRXdKMlFWVTlpaUtNNnlNWWh5eURSNFBEbFBuVFFia2QrUjROc1pYMzBN?=
 =?utf-8?B?a3AyTjE2bHZ5K0Q3Z1Y3NGx5YTBGMGNIdGpTUEZ3cytGSVlBMjhyek1MQ21U?=
 =?utf-8?B?bWxjOFJGZWwxc2tKc3ZZcnlyTGFBOWFkYXc4UUtiWjBsdURUdG5DY2hCdGZu?=
 =?utf-8?B?dXZXMlpnY0lNRlk5NmhrTDJQc05DaFJOakFEQzl0UU1wVDFDU0RzM2tXaDRV?=
 =?utf-8?B?M3pIZUxqcjJ0QVNSQ2Z6MWhiMzMxNXN5eTBLdTBORXlRN20rU3JWM1VqZFEz?=
 =?utf-8?B?M3BrKzZrMjJ0M2QrS0xlZEdDUEhNbkpiUnJPMXd6bjZtdlRkZ0E3YVhiTG45?=
 =?utf-8?B?bmsveHF2d29zTFljSVZ2TFBBdjJFOVJNVnBUdTdLYUFiK0tqcE52SUJQTXhy?=
 =?utf-8?B?WHEwOS8raGJHYm5nY3JEbXpxMjJuM0tOV29NUG5CRDJMM3h6aDl6MDF6d1pq?=
 =?utf-8?B?QUNsMGFtVzYva1VjSExIckhTdnRXL2NIYzRvSXpIWjNmYWVyRFlSdVFiRjht?=
 =?utf-8?B?MXAwTVZWOU1GVTV4RlJLWS9yTno2dTF3TW02R3owdlMzc2g2VVJDZERtWExr?=
 =?utf-8?B?dVRnc1Y2TmgyUTdyUkNJQ0pmRWhkSjh6Q3RvdytKeENaZTJoNmY0U1pCWEpT?=
 =?utf-8?B?Yi9zR0FuUVkwb29saS96dGFSd0ZVQVVONVd5Y213WUcvT3EyNExacWFCaW9C?=
 =?utf-8?B?OXQvdEdiNlI2cTFxa0RLY1hwTEpjQ01tSHY5bUlxVlgzNVJrWEhzRkgzOHNz?=
 =?utf-8?B?YjhaNWVzVzAxTUF1eWEwYUNtSnNyancrM2dQZndFcjNDc2UvbThWbW4yQ3Z1?=
 =?utf-8?B?Tk82NzlsVC8yU0xDbUxzN0t2UXdNbDNSVWNBRVAwT0tTbjlPMFlQTG1mYXFw?=
 =?utf-8?B?b2djbHJsc1M3MUZ5ai84Vk5NT0RjSng4cEtISGJXbXBQbVVTb0Z5VG85MlRj?=
 =?utf-8?B?TUhMblRKd1cyeGJMdHRJKzcyKzRJbzFXSUFBbndMQlBvRXZkWmV0N1QwbUlJ?=
 =?utf-8?B?ZGs3SnFzMDlVbzVySk1VdCszSDhUTk9tWUplczJXbysyU0t4aVZpNEpkZ2FJ?=
 =?utf-8?B?S284RVpXYkRSYlZXQUJ4Z1Vta3hrNGVTRVMrc2pkQU5hZHhCdFBJWklUa21B?=
 =?utf-8?Q?2KetpbFpa0gzYrxA=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8842210a-71c0-459c-9f6f-08df4c6409d0
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:54:25.6172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xn0D7TmvxT9BNUl1k6iD6rmtdC7nmai3Nv8GS1kfEr9R1jzVl64LJFEOeKWcMbpn3rZeYOC+ct9NtgIhGGj+QUWeJRSX/A+SnHnsgwt2Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8290


在 2026/11/27 16:45, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>>>> +
>>>> +&spdifin {
>>>> +     status = "okay";
>>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>>
>>> With sashiko remarks handled
>> AP222 does not have an SPDIF IN port. I will remove it and update the
>> interrupt number for SPDIF IN.
> If you need an immutable branch for the clock changes, I need you to
> submit them in a dedicated series. Let me know
I will submit the clk-related changes as a standalone patch series based 
on the new baseline. thanks
>
>>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>>
>>> --
>>> Jerome
>>>
> --
> Jerome
