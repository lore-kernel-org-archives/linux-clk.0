Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023107.outbound.protection.outlook.com [40.107.44.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAA53164C7;
	Sun, 20 Sep 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892541; cv=fail; b=dorOKmsonorlZg9aV8QD0cAg6bXOiH8VZrix77vzWUPzVnOvNY9SlER5QDy820tJl1S12x40ccJCD69+TjMPjiKY/pHfD1k1czQYT0+d2aAeUa8h1E1/Geav510kDECf0n66N4fQjQUl3I9hOMEugcGizBrJFNqHhH2H3Txv8ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892541; c=relaxed/simple;
	bh=q9QvuwjbwKdLKQYfWbSPyPR6q3f7oxHkxIP+9G6mCqw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QmdV9B1CmVXWXw9ZMrD2y+eOmy4OBdDjKi5vqftwzi6ycAkd03abNO3zbnxUO4hn5WXaJH07qrN0s9jCaMQkh4v5lZIV2o5JbilktqAkQ8M/juUH2ZW9LlyKRb4XpJPbS/U9m24yTyZoM0JUULJLv2Md1DqHH/e+fTXBJgOh8Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=FKjbsd1c; arc=fail smtp.client-ip=40.107.44.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="FKjbsd1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMoUr/mjtfo7K8DmTMB2tS2LO0dCw1CKMU0JCjQxtablOmp6bys2jBjB/10cnoCkblzsQ8a4cn+i4U5KBlehOcjtQlWWCQQuoAnFW+5xVotN6ddR1I9IQzwfQ7lLx5IncHSNiJctncQt9sSC2id3BiFBASvI1dRfPxcvYZkvZbdU05UhDgcMY5sHLY0C9eEaT+9IEbSH25gAwAJjLPG4YB8MisjF/hkZfFbGzf2C7SsM8KwhVm6A012dDZ4Uh/YxDR9VayOPVWRzU3CPMM0cFhAMC16pgGk3eqm+LZCx0ldWgsU7kmJN8IzJp+Tu3HTqWiMalq7rcQ/ETJ/8e0Q3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQiugX6KGIMCU1p+cKlXt5BpMDGezJZkqwRlbpQS7dM=;
 b=hfFsoTJBTEZetBxFi9BHYVKVxEN4S800r4/ibsGFxj1Uxql8fcYSMJgWldbNyShUqkKQRcv+B471X3m8pHWDVqwXxFkiNaDkhfVvDLynWA08lsAiWPhBVqErLOqXPzmrUUM+hrwU2E4xTMnjroXNu3RLUSqSZvNg0P5wIg3YFCvorHvWtm3YG5bLH3xQx2vpC60ieOSZpPdymrU+Y4K0WuRLRNPVm/JCNMPygcNuvML70tA0CyyQ0B6aDO/wxFB02qbM4aNx/NcQ+NHq3gBOW4n3R+qFma6XC8IEtZccf20hEDLnBJEFUrZUu86bacgPZ965hw4Vy7mQ6hwyH+blSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQiugX6KGIMCU1p+cKlXt5BpMDGezJZkqwRlbpQS7dM=;
 b=FKjbsd1cA1I6Ew4/1fGlUWiH+/sOFQeXBIFHM8gZUFjfwfvOjQLuh42bNthZ5a1I5Vd9CLUY6sG/Ubatjyqk5aM/SW1oe6P02Oto/hemHAS/0+jPiU+QAacV+9po0S6stfjaoy9Lbvbsv4QuOwQj2zoXDfFnKB4QIUikb3p83EiAJJAiTaSpICF+b8JVyQZ6i2Mq7CCCTtMC5lHxyC72pdFhNZlc31YsxcIneI28KQ8MdKoOUfbg4Ih9putXu5kTDJ3kuS6YvtmUdGbC53kilR9UoAvSz4bwbd2sYAJadwlj7z8keRGuhY89wL+2oMppXD/cLJiVtoz1ewzSubJ7kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PUZPR03MB7015.apcprd03.prod.outlook.com (2603:1096:301:f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 08:22:15 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0428.011; Sun, 20 Sep 2026
 08:22:15 +0000
Message-ID: <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
Date: Sun, 20 Sep 2026 16:22:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
 <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
In-Reply-To: <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PUZPR03MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: ac292b9a-fa2d-49e0-c6ae-08df16f046f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|3023799007|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jRquFaxp7rJmK3riJoqazrV6H8D3XHUqlokthRxTp5yVEB4ZxcPR7izbHBnkezlhgabUsY3EqLnf3D/PA4Zn+GTVodNmD+QY91+i8Ig/2gPsWoMhmXK8Z2ryTz5GZMsM0kCZRqE+sUVMQb6DK8wa2HnGH0mJ/MC/0xTBhUOHPkiM0owTTkv5mnFPZzUC5MtPnaus6PU2TgISDqqEFkrAwHsUvmzMkdpzKlSXKebSYwJog3egUF9uCWxNGqrwCbEJdfJXgfv8hBmEqvv73qfQFK0m0whP/QXn3qxImhphzYqC+yTujUaPKo2J2c+7qpWzJTP48fwAv4ymAFXweNE6bakyxwvyvgd5vMw+P919vYQ5Zfsbz7d05+TFyt0uFBOm4opiHq81gcW9x6d58nKeAzelDXW492I0J9zEalutf4isq9gt5kM1drg78MlpBwGalaLPmukQALI5PjjGBE+EWQ8b3gpNkdWli2E6GGlB6IKzqdNV72JlYmTD+bi6KVcNk2VUjXRqkPmHUgtYttvsp8nBh5x0xZYa6F4+XZN+waom4bsEWQH993BtBGwd0ehQ9tSAXMqEdPB1bzgXm5myGVq092lxKrjB18289mDwPuBz0agclEfPFuF8G1+4r5OiO2nQy4OK18hHunpDgGNVf++zajQD2yAOtS8EBc2pTJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(3023799007)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZieVdtZUVkZWg2VUp2WXFwbzRKOFNPdkNxVisrdVpzbnJWaSsva05XWkdv?=
 =?utf-8?B?bkx6cUFaYUt0Q29XVytQTzc1YUo0T3RIQ2ZtU0tkNjJSeVBER2VlZTMyRWtu?=
 =?utf-8?B?OEFZV01ydzVBR3hKdlBadTNZbjRlc2R4K010WEFWNXdJek9RQk1VY0tBbHpj?=
 =?utf-8?B?YTBFS1c1RUR1Q0pFZTlka3BWN2pZZjFmQ25kanBMekJCREt3QzJZekRNT1dI?=
 =?utf-8?B?emJxalh6MWRZK05hb0J3OUtPdFhBcVVvSStlSTdsSVd0cXhsN0phTkdhTnli?=
 =?utf-8?B?b3l2dGtOVGZ1TlR2L3VQMXZoMUhHc0JkdDAwM2xvTVBVUE5JeVN0T0FHTDNW?=
 =?utf-8?B?a0lBWW9LMjJ3ZDF4dDlrWWVmWk1iZlZhNHpNWHJYcE9zQyszUmpOQUJwcE9v?=
 =?utf-8?B?U1dJdjlNQXJaV2FRWERibFhtR3BtUEZhNC9pcnp6ZW9lUHg5emtaVnU5TGJD?=
 =?utf-8?B?VDdpZ1l5dUI5eTRNcWcweE9INzZYMGtzbklYTHZCTjJnWFlodzM1d0kyYnZK?=
 =?utf-8?B?elhTb2ZoVkpBQjgvODVMUkVLRSswVEQ4Q3NiSWlKQklJQWhJUklDM0FtL00v?=
 =?utf-8?B?YjM2d1RsQlhOWTkyRE92UjEyWmZmZ0JaQ20wWWVPVlpGdThyem1XVm1xcjky?=
 =?utf-8?B?SnY3bHR1dXQzTktZY29oQm91bmoyVDNjaTd1NExVbXlvWC9iVzFlUnNKUS9N?=
 =?utf-8?B?bzM2YnhJMGZsZXlLcmt4T2VyU09PNmVZTFkzWGRMb0Z5dlJ3aTFUdEplMEpP?=
 =?utf-8?B?blZZTVJTdW1PZHNUVUh6ZlhrYitpUHJvUmlKNTZqdU1DWWFKejZtK0w5andZ?=
 =?utf-8?B?YzVtU3VkY1B4N2h4TkVRMW82ekliLzBiVEJjaUIyZ3pvVmlNeUUzY01RWU5G?=
 =?utf-8?B?QXVFUnB2SUJsNzdJMTUyYVBJNUtOZi9abVNnTVhFSWRRMXBFbDdOL3FuajdK?=
 =?utf-8?B?eFY1RmhPMy84Zkp3V3BaNC9lUU82TkVmYnZyTUhBdmRkRzlVQW16WWJCVmFW?=
 =?utf-8?B?eHczU2tCL3VXcTNkUUpOYmR1LzBFNXNjL3h1WU9uTWdCSkttYWJySVRqZUhT?=
 =?utf-8?B?Z1NmWWgwS3VsMjJ4RkN4dVBPNVJlNmtpNTdRaXUwYS93MDc4TWlmMEsxa082?=
 =?utf-8?B?Z0VvbE1WRXpoR2tGR244Y1hJWVA4d3ZTRjBaTkhFR1ZDdXdMK21ITHNaSmNT?=
 =?utf-8?B?UnYxeFkvTCtjeVI4TVVRZ0V2VWhvc0IvTDlrTmgxWVdXTjJDN2YwT1VyNWJs?=
 =?utf-8?B?Z3oxSTMzTktMWUVBNFN6b2NpSWExcTltTldpaW5KZm1sK1g5Y1dRdElkOGNJ?=
 =?utf-8?B?dmE2Ui9UbHhYSXVuSzRMMTkwMkFHNU5HNXBUblpGVTFJaGErZmJ0Q0hXWWR2?=
 =?utf-8?B?TEViVnRrRGcrbytScU16TTcrL20zUWI1NzNFNlk2VDlaYWFINEhMN3AxZ2Y5?=
 =?utf-8?B?M1dOWmt6VncveFM0TjdKUjZtdjdCbTFGbUQyODVUUXM2L3FJN1dObE1xR1JN?=
 =?utf-8?B?NjJ5blRDdTZmdWt4M20zYmlZSTdlcXNoWjNmckdJUHF5NWVYVy82K21tVWJG?=
 =?utf-8?B?Q2o4dWhvNlNHNU9VVER3U2pVcmNjOGhvU3NsTksrUUNHNktnOW5WR2RmMEpo?=
 =?utf-8?B?aTAwSG85TnBuMjFXeS9GSUVlaXFLWStiOFRxcGtQVERtOENMdWZ4SHh2YzJF?=
 =?utf-8?B?N1dRekVlZmlpWWlpUW4zT3Frb0tsanowSDZiM0Q2emM3RDRsbE96RStRRnJt?=
 =?utf-8?B?cjZsaGtGb1BqUFJsZy9xOTdZTTluZ3ZNTFlpOWNxM2pUY2g1L2xhYTFFTFhv?=
 =?utf-8?B?anZqUG9WNVZVYzZIdjg0aHp5Yzh4d1pLdy9WUmNpTTdkcEV2MFptZVpVZWtC?=
 =?utf-8?B?SnZJZFhwcmIwK0RtTGF3dVgzQXUyOWlwdmR4V0Zjb2RsdUY1dDZ3RnZkUnVk?=
 =?utf-8?B?eDNZUlBMaHBWQUUvQnRYekNmelFBdU5uYnRrS0RWaFFlSkIxVXVOL2s2b3Bq?=
 =?utf-8?B?ZEZBWEdKbk40Wlh0VVovb3VOeWNhb0FvR0FUSGtNL0NIcDh3cWRZKzhSamhW?=
 =?utf-8?B?Qjl6dVRneU5VVWo3SldEdHUyNFgxSy9GVXRIcUJOZkVRdDhmeXF5QjM4K2VD?=
 =?utf-8?B?em1YSWtWSDNwN01VTWxiQ3FGNVBOUlB6NzV2ZVh4T0c0bWUzUkdFSXNsTEtU?=
 =?utf-8?B?c2kzUE5IdVNhL3FhVmQyWi95L0IvV3o2THlkb0hBSmhuQ2hIN2ZaK0NYMGRF?=
 =?utf-8?B?LzhudCsrZ2NEQzI3ZVdWOHZqUkFKMnVobDFwazR2UWl0aTN3eXZOalFwMThH?=
 =?utf-8?B?aG4ralVGa0d1b0Q4bWVMblEvRlRKQmpZSnd1UzArcFZxQU1xNTVQdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac292b9a-fa2d-49e0-c6ae-08df16f046f0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 08:22:14.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZrFr1jixGDD1UiyUBqjJnaPGUnLqdEkHpH2vuLmgSUYGabWbx9KwMwMoBvYO8q1Dx6gqrxtNOdGa2G7pVnxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7015


On 5/29/2026 3:08 PM, Jian Hu wrote:
> On 5/26/2026 8:27 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mar. 26 mai 2026 at 17:58, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> On 5/20/2026 3:35 PM, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:
>>>>
>>>>> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>>
>>>>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay 
>>>>>> <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>>>>
>>>>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>>>>
>>>>>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a 
>>>>>>> clock
>>>>>>> duty cycle of 50% after predivision.
>>>>>>>
>>>>>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>>>>>> pre-divider division factor is 2^n.
>>>>>> I understand what you are doing here but I have to ask why this 
>>>>>> can't be
>>>>>> implemented with independent dividers that already supports power 
>>>>>> of 2 ?
>>>>> If we use independent dividers, the n member would have to be 
>>>>> removed from
>>>>> meson_clk_pll_data.
>>>>>
>>>>> However, n is referenced 35 times in clk-pll.c, which means we 
>>>>> would need
>>>>> to modify all
>>>>> related logic across the file. This would be a relatively large
>>>>> change.
>>>> Yes
>>>>
>>>>> Moreover, for all Amlogic chips, the n divider is an indispensable 
>>>>> part of
>>>>> the DCO clock.
>>>> There is hardly a justification here
>>>>
>>>>> The difference between SoC generations is as follows:
>>>>>       Previous SoCs PLL: n = 1, 2, 3, 4... (linear divider)
>>>>>       A9 SoC PLL:            n = 2^0, 2^1, 2^2, 2^3, 2^4... 
>>>>> (power-of-two
>>>>> divider)
>>>> Yes that was fairly obvious
>>>>
>>>>> Therefore, splitting out the n divider from the DCO clock might 
>>>>> not be a
>>>>> good design choice.
>>>> I'm not sure I agree and you've only stated your point of view without
>>>> providing any technical justification here.
>>>>
>>>>   From the datasheets of the different SoC we have, the documented
>>>> limitation is always the DCO output rate range. Nothing related to 
>>>> n (or
>>>> m, or the mult-range for that matter). This is a legacy problem, we
>>>> started with monolithic driver and slowly simplified it.
>>>>
>>>> As far as I can see now, reworking the PLL driver to be a simple
>>>> multiplier driver with range output rate constraint could actually be
>>>> simpler than the current code. I would also make simpler to accomodate
>>>> differences such as the one presented here.
>>>>
>>>> Unless you can provide technical reasons why going in this direction
>>>> would be incorrect, that's where I'd prefer to go.
>>>>
>>>>> [...]
>>>>>
>>>>> Best regards,
>>>>>
>>>>> Jian
>>>> -- 
>>>> Jerome
>>>
>>> I agree that having an independent N divider would simplify the PLL 
>>> rate
>>> calculation.
>>>
>>> A separate pre-divider for N is technically possible, but there are 
>>> some
>>> hardware constraints that need to be considered:
>>>
>>> N = 1 is the preferred operating mode except a few fixed-frequency 
>>> PLLs.
>>> Larger N values reduce the PLL phase detector frequency, which may
>>> negatively impact
>>> jitter performance and overall PLL stability.
>> Understood. You could really make a difference by going deeper and
>> explaining what those constraints are, especially since you ask question
>> internally at Amlogic.
>>
>> At the moment what is documented is a range regarding the output rate of
>> the PLLs. A PLL is made of a pre-divider and fractional multiplier.
>> and you are saying that for the multiplier to work and lock, there is
>> actually a constraint the input rate too.
>>
>> If you can discuss with your HW team and clarify what the constraints
>> really are, that would help to better model the PLL. In then more likely
>> for us to figure out the best way to drive it.
>
>
> I have discussed with the HW PLL team. And here is the discussion 
> results:
>
> When N increases by a factor of X, the PLL bandwidth decreases by a 
> factor of X,
> deviating from the default optimal bandwidth, which leads to a 
> decrease in
> clock performance and affects the stability of clock-dependent modules 
> in the chip.
>
>>
>>> Because of this, we cannot guarantee stable system operation when 
>>> arbitrary
>>> larger
>>> N values are used.
>>>
>>> Some PLLs require non-1 N values to generate specific fixed output
>>> frequencies because
>>> the target rate cannot be achieved with N = 1 while keeping the PLL 
>>> while
>>> keeping the
>>> PLL within its valid operating range. So N is designed to have other 
>>> values
>>> ​​to
>>> satisfy this requirement.
>> Again it seems like the constraints we are using are not the real
>> limitation, just by-products, which the situation unclear.
>
>
> When N=3, this type of PLL is designed with the optimal bandwidth 
> based on N=3.
>
>>> For example, the AXG PCIe PLL uses N = 3 to generate the required 
>>> 100 MHz
>>> output frequency,
>>> since the target frequency cannot be achieved with N = 1.
>>>
>> PCIe is a topic in itself. It uses different ops for historic reasons 
>> though
>> I suspect, with proper constraints, it would not really need to.
>
>
> PCIe has a strict protocol that must be followed. It is also a highly 
> sensitive block
> with hundreds of complex and stringent lab test requirements.
>
> The PCIe PLL lock sequence needs to fully follow the Amlogic HW team's 
> released demo code.
>>> Additionally, is the refactored pre-divider N implemented as a separate
>>> patchset,
>>> independent from the A9 PLL changes?
>> I could be seen as a pre-requisite.
>
>
> Understood.
>

Regarding the suggestion to remove N from the DCO and make it a separate 
prescaler,

I have a local draft for this change. Would you like me to send it as a 
follow-up patch,

or are you planning to address it?

>>>
>>> Best regards,
>>>
>>>
>>> Jian
>> -- 
>> Jerome
>
>
> Best regards,
>
>
> Jian

--

Jian

