Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022118.outbound.protection.outlook.com [52.101.126.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D89F9C0;
	Mon,  9 Mar 2026 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773026944; cv=fail; b=JtaHnei19LUHbX6qsRq/myuLbG8dWuLXmZmwQXQTEoBPNEYosKxvGcu5HEmFSwlS8D+qSZLeQ0gYGIPYm38d2ay4GurF67PtQcBNYkALeF8x5YyfxkP6OCwOQoHT+9Hh5hVHbesU1N3ZstJUbi65N6qVgNlw+9JXRCsBsj23i48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773026944; c=relaxed/simple;
	bh=5PTIp/86A0TKMvRwFPfQ3qv6Z0k+dnW0YZmdd4i0HII=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CMJwOSpcGCeF8H+u/tlM4eShxWxqVp4Mohaeq1/FCIZNcuSWH63zA3+4ojAPFlvHi7pQYuKRmrlAUZkiCnNBX6kxiuu1iwADHy0e2XEQVikmapjVvuuSrnZLXSSzY/1+AB9LcFKD1QcuBCxo6ggIwlDLGUHjJffX3eONGDxXRXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=krelTXMl; arc=fail smtp.client-ip=52.101.126.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="krelTXMl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVI3Gnk9xFyYVnC9qH4u9xn6mzsti9ATsMzxbGERxgzyN/LeuodzGsImIoPl4UdZUPdIeZkhZ/1oAAtwIxRPS4h76BjxfedoWdDcQSjdrKzNuCbVJhRJRHBPmk+10HVT1DXh5lqgtbaS6yCwYdJ357Kc30PSxnPZ/GclN0KCVfGKPupAWOsfAtR8UV5S38L7cbUJOKduUfV8vMNn8mGkdlPRlDxCAvopX9vH/ulZY1NqLctIItHN9zJpYSKa00vTIYKaQCY3TehnrTUlkn0peg+lwCutJtGPfOircDj+tX+cCMFjfX/gzH32Cq94kp1Q4YOZ/QOdd3cmwHI9X8/dww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzeyrJr4qQbp4VcnfMka12y/pocBRdEm9ebG9oRQk3A=;
 b=p6xFUSswjzJFh4ANx7VNGZoC7Ht6VDkunXBfOSV7R5nrF633JHKygshNOqtIRaY4UGtucB0diD9uNV/QDOxEcliC/E8Cj8EZreULaVX/G9nmjNAg9kKOGDiaR+cIf/wPug8ybJgRR2hER6wOKstwusWkYRKQhAgiNDjP5q/66ssC3zu4gOkG8hXo7PNAFFEVQwdi1jeYsLaHCD8+FFglRs3qEDk8RBlVneC65pQGPH23Hmy1R5ujZwXrQRapHVjWB0yq4b7YzgFx0bOqSMHfqOxVH4+nDErBBzE0UwL80/ee1Ynd7MXqTTrDST/uOvUqu5/CVzcvwBLZ68Q9VvZMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzeyrJr4qQbp4VcnfMka12y/pocBRdEm9ebG9oRQk3A=;
 b=krelTXMlhRc88UNQlcEg3qzUI5l4i5LxNI+NXIwwZEbsMFMhJQkk5Q5bVwOm1I+UX4knoztmkNyHo2KOMe0Txi81SGMg54BBJKIQUUBnokn7tWBSs464IFVzgwFVjrt1OrVcSW2IGFZ1tHnM3jSoACqEkwmeAstIyEDSURfbJtFxFTCXQiqGK1/JAZoX+L9Tdnby+2YrbRMsTVNyIoJXsu/3AD9iANjEU9sKOvLb+KeUX49xvgG2x8f9NPODcCl1KddkZ80DBhH3wEfgyUIzaOVU/iYcBZWBfbqPZSbIP40lGTEGOOuhDD3NL9j4WmlGCpmTsqi+aaiC1iiQzPce+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB6813.apcprd03.prod.outlook.com (2603:1096:101:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 03:28:56 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 03:28:56 +0000
Message-ID: <737408c1-e887-43b4-b977-df8f328c9518@amlogic.com>
Date: Mon, 9 Mar 2026 11:28:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-2-jian.hu@amlogic.com>
 <20260306-primitive-lilac-catfish-fbbf9e@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260306-primitive-lilac-catfish-fbbf9e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0840db75-5c6b-4bd4-7c87-08de7d8bfed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	yZ0hcRaL0OMakIQh5yaBBaqEIdAVQzDUTrqblnFR8lW5zV9e40w4qqeQ46ymADTu6bHr8jqei6PI08LEJQZfrLUaXNIiIf2zaW6lXQ6hZAY0xtZDJ5DK+XMklTbfPE/dmqGKqaN6JSfhV0KhiXW9VWbAlQdwPnNszI/vutDiqoXljlFPGd2RHS7LbwgT7+6t2dZ67qrNCfybJd5FOcJIV4gIjDks0drXfwrgc4qZz+WmX+S1C3m9af1ACl3v1o21nHDTioQ3zD1heLbQZbKpgtPSNUjbacIoGm37oF91LhJJkAZB23JCbTvALA+i2XPnJ1+OwydGysB1tN85xrgGlbb/1zcxeLaf3X4gkr0vgELQOG1NPstxny3ibmMzJMgMOTtRkBuO7Ol5yQLl8TGmqrogP6KTvIZMeNpHUY8MX3bCXnazQsL1vuUxydUavAz0wsL2JFLgVLHxoqkaT+xAr9+nK7GOJT24B0DqRoXyue3Az3fqYeIkF/sx4gee70EZeXIbUMZrRNmwBW35sPjYMeI2oYxzAduXVvjb91KtqBjeP53Um3qlevsKGf+gr9U0iI0uQqHf7sPLa0J4tcMAdl2q7ULereG/fjJcP1YeWYrVlOqkQlqILddj0x6iVY8XM96cM4n4eLJciWmEbJqrWIAulxagOjIOvu4yQPgIhNruIBtWS9NcT968Iu7YOkZoYZWl3Ht1JD3vezLaOVKsTf/c1uQ/z3dpfpQID9JOL4g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZpeTBVU0haSlExVTZ6eXcyR2lqeWtyOGJxSVdzRUUzTldIVEtSckxkRkRM?=
 =?utf-8?B?UmFUdnlVYmIrLzE3US82R2NMR0FDbVJPSytTeSs0akVCclNrMlA5RXZmbnRX?=
 =?utf-8?B?MFQxZGpRZ2VjalFvaXNISWhPazQrREhyV2dQckVUMTR5OUdOb1BJN1FjUy9l?=
 =?utf-8?B?TDgrbXJ1Nkp4SmY4czNYYTVwT2k2SUREckVhVTJ4cW5aV1dwa2ZYQm9oaURU?=
 =?utf-8?B?RHEwNHp2R0c5a0ZnSm9XejlkQ0N6emlyTHYwVWJjclhCbk80OFduVlVaWlEr?=
 =?utf-8?B?U1Z4RzBPOVpTSWlSMWNnaUhMQTVjdXlPTUdCaDFPZkNzS3EvazE5VEtHMFJW?=
 =?utf-8?B?R05Zb3BYM1hFN2RJK0RSdEdYZ05NSkNHNkdMUVdpWUE2R1hUZWE1a1NLOWlC?=
 =?utf-8?B?d3hxRlNYa3RsZFJDZ0tESEZiRnBhYVJ4UndqeTRXQXpKVXFGOU9SV25GbWg0?=
 =?utf-8?B?RVR6aHkycGRzcThTUVhxQTQ0VTBjcTdTeGhSZ1ordnRqS0g3QnBqalI1VjN2?=
 =?utf-8?B?S0VPK1VyS2YyV0d6THJIdk9GN2xFRUxvK0QxVklUdUhMcWIrSWFkd3MxRWRq?=
 =?utf-8?B?TjhsWUkrTVBOb1YzbWd4Uy8zQzFrUE1ScmxNSDhMRXdyN2hqaUhjemVWcDFt?=
 =?utf-8?B?bk1QZlNHYmJLRE5LMXpRZ3BWUnlrOWowZkRZdDhlZXdsV2pyRHZESEdEZnR3?=
 =?utf-8?B?eFdQWmo2YVY5bndhMU4xVEl2eG9PcFdZenkzYlhOaHNoK09qaTgxVC9icThB?=
 =?utf-8?B?djlrSnFKNytOZWZzV2RmQ202R2FIczk3VHVDSm4zMUhELzMvdUZaZnV3KzBm?=
 =?utf-8?B?UFZ2dU1BVm9xZDdQSzE5UDlzV1oyRFBGak10YkxIaGpGUk5McU9EQndyOVBh?=
 =?utf-8?B?a3dVYk04UmNJZDJRanEwRXhHeExJK1RZRDA2eTQ2MUxha0c0alN6OW9pVnJS?=
 =?utf-8?B?YU9VVDNFQnRGVkR4L20rUjdjTEdRcWZpRmdrajMxTUFrSVFiQy8vam0rQVc5?=
 =?utf-8?B?d2FFMzdUUk9KNGJoUnFURjFXRVJSR05xWkQvY1NkRDgrTHQ3NEMwZ1JKOEVl?=
 =?utf-8?B?QSswN2FDc2RnRm8vREt2TjJCcy9Lbjl6by9hSzQzODUvUVBXRlI3aTJnOVc5?=
 =?utf-8?B?czFtUzZDT2llQ2QrVkxYK1ZZVjdET2xmaWhjVElBK0xRMHhtVEI1b1pETVdS?=
 =?utf-8?B?ODdvd0RsaDNxQ2NtZC9lQW1Edm5XbGVyQitXQ1BRcG54ZnkxSDNrU0FxVG9V?=
 =?utf-8?B?OEhqaDJIejVockxKOGVBZnJSU2xRWUVtK1dDdkl4SHdGMi9wSEZWakdTQkp2?=
 =?utf-8?B?eWdEQlQrdnNFOC9KcktoOFZoRnllK211a1NZcG1JOFVjOG9SdjU4WVc1TE1R?=
 =?utf-8?B?SVBublpjNWlMQ0hoOWhxYkpGZVlVYWo2KytEbmtwdXZuRzNkRnVSblFZU1dz?=
 =?utf-8?B?QnFMU3l3NWt4Z3lMYXZtNkNTT0pzSGNERWdDSUNYeFRmVE5rSlYzVWlRM1p5?=
 =?utf-8?B?bHo0RTYxOUMybHZCOG5za0ZINnFDZng3dWJGd1RaUk54ZThlU3c2Q0J2RHhn?=
 =?utf-8?B?VVliVG01OFVYRG5yNzN1V1hEaktGZnpHRUJtMUN2WmxLckNXdjlsS21yY01i?=
 =?utf-8?B?eGN2amZ1MzhpK21vemZiRFhqWFJXeXdPd1JPUDAvOHhSYjMraXlkNHZnVDlC?=
 =?utf-8?B?NHkwakRRVjZWdGlOVE1TR1laNDdXcysvRFVId1lXU3BTMFZaRWJaUjhiTmRt?=
 =?utf-8?B?Qm0zenB6SXFtb3ppVHJXMzBQd0JXa0ZheGgvSiszUTZFQnZXakN4aG9qdHQx?=
 =?utf-8?B?NCtXQWlYdit0UGVlT3l2TEJSa09vT2hMU3FvYXVpdHFTa2VRc2tERGx3ZDkv?=
 =?utf-8?B?bEw2aHAwZWFZdTVUblNobFVuaCt3RGg3aHZiaTU3bUQydHdGalNWRUIzMXZu?=
 =?utf-8?B?Yk5VVk0raU50SzkrTXFmSFlrdTFIVFVEaGk4M3NBajQrcCtjWmZtZXZUT0FI?=
 =?utf-8?B?QjhtbFJEK1BWNEV4cTk0blpuVkVUbTB6RjlKaXhKbXJTWERWNk92bkY2bWor?=
 =?utf-8?B?Y2ZrNXlsbkx1Ui81TER0d21mWnZTY0NTYS9XR25mand6ZWtWakZrMGk2elIz?=
 =?utf-8?B?eEVSdDZKNHMzaDZpUDVYeVlrUmo3azJaQms3cERKZHo5ZlpGc3paSWFXUytN?=
 =?utf-8?B?OGdaZDVCYmp4cVhlK2NUL09lR3U2aVA5UytiVG44NUh4OEdnM3JyMytuRzIw?=
 =?utf-8?B?eFBGdGRUZS93c0hCM2k1N3VHWGUyd3ZOOXk1S0txUjczS25pQzhtb0t3TnNs?=
 =?utf-8?B?TDBLcmYrTmdUeDNhSUlMQi9UL0oxS1VYUVJhYzhVSTRzL2Fwem9JZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0840db75-5c6b-4bd4-7c87-08de7d8bfed7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 03:28:56.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kGHTYn5WfudtMOoP7/uTg2zRgYbLBa72WKKY3bxteoPYKBYVovJxX9sCp1ZFdlrQZxJdtM6Qs+TWzooHl7v/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6813

Hi, Krzysztof


Thanks for your review.

On 3/6/2026 4:11 PM, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On Thu, Mar 05, 2026 at 03:43:25PM +0800, Jian Hu wrote:
>> Fix a typo for T7 gp1 pll.
>>
> And also Fixes tag.


Ok, I will add the Fixes tag:

Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock 
controller")

>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> index 49c61f65deff..b488d92b7984 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -72,7 +72,7 @@ allOf:
>>             contains:
>>               enum:
>>                 - amlogic,t7-gp0-pll
>> -              - amlogic,t7-gp1--pll
>> +              - amlogic,t7-gp1-pll
>>                 - amlogic,t7-hifi-pll
>>                 - amlogic,t7-pcie-pll
>>                 - amlogic,t7-mpll
>> --
>> 2.47.1
>>
