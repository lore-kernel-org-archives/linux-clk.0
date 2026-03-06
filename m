Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F671175A5;
	Fri,  6 Mar 2026 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782606; cv=fail; b=uSBgSIl3bZqf2cH6UYzP/WLscjCJ1TZcOYvzRTlxn2CD7L5utBRQyUwVmyO2MAva4EPNVVHHCQjJc6JrUIoWmIIRwRGZzOPuGbotxJ7sRxz7cfo6UI9Hq1F6eJTe0lvz2bkiwT+ounLck1p6Y3vT/5HWjuaIpF+ckmnUgtgR58o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782606; c=relaxed/simple;
	bh=nj8Z8VWB+tfde54sru4aLHagvbepPe2ztQPsqTZgUcg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o2/dlJC9CGKJzgROkQxQhWQDcZOsYRAdLwv80kUfevajIxNhqfZpKp2X35YqxIJ/xt3xVphdvDaAMDmwHNkXbYYQdM06gadpu2yqcB6yN4tUD6F0FvPrmYq1bEqsz8E0y+TEmEsl3RCTWVy38iS880ZNJoXrBSNG+gHKSMm39Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HyQM5kQB; arc=fail smtp.client-ip=52.101.127.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HyQM5kQB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tS+iFyxBRYm2Qlce7aE9nZIxMi6tDwAJeLBZmqcTXz4yMSY6JvxPIU723tGXsLwVOMMxXlP5BnoYuU2qP365vucSvcgeXNnPcvnpaF6mBjmT7F2pFO2F/dY8yMpgydScdBfimyOaYpEuIukStpPu3Qi670i5lVutExg6JYlim+JEInc16wHXxY14c9etQ2NjAttu7UyP4OCrjEapTAFsCUbs6W6azRNx+B78JzJ6nRagHEXzjViaU5ttVIUTYcqjZwWLsrEyW1NKSKphdm0Rg6t+ZFkDxRUarZwS7VvTnVY2x7CS+0jPvOtgZKq7BpztccayobGxCl0iwiUVHtWmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF/5HSiZAhoqyRQYUkfeWSjaeRBG4N55IauQjThe2S4=;
 b=uO4g7wGQho0ruWpYvxDhhFFWCacS48OxJugVe4qWX/SE2Y5Nr0htC/OxQtPnPbjvpApM8n80cXEi2+QDJY1D/uploOh4Ibfi1t+3LKC4YfDxpThQLu7R6QJehkj3Vfkns6qc5OKAc+6EEypYUyAqW3tmBYjM7R5//Bf7w7+0iQiy5cNId5IFtiIV+uy1hFAzg9NgHsVG7oVbU2xmD3TLsPVKHvBqYE+2s+boc0vCQDZYfnvCoF9wfNJZAbro9Qvhp1KQDN+Je+u0yD3G5MhVugmTrfuLnlRq0wTCz86CcNv7xGkRTrS8X8w0wdXKoG1zE8SVBKwmBduw09teUqFW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF/5HSiZAhoqyRQYUkfeWSjaeRBG4N55IauQjThe2S4=;
 b=HyQM5kQBRQpdwiHhXshfE3cmtDcjUfY34yAlQJm8U1Nne5T2S+eUzq16CSW7ziLO/zX5tF9RXmWJfuv87dWs9XCtkM/bNv3CVA5IgiE0vnmJOyPmKcZat/GmnGrGuSa32RIpTaGyUpKFeHYWzWaln69bxpy7KBdLhBxAWjvt8apf6XMxarDmvahYtYr8uXy75AcBPoDajH9KVFTLm3nOCS+GxbnZSc8zUGsxHncrNNGkqqVV+ZArQdEOmxJQEAiT6UZ8OMKSuUXIe3UIu0ylD4ZhYi7NPSg8NLek7oZ+LKCMRQxI9wdyP4Rwlp11eBqgczI0xY5cNj9NU8/9eYzjaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB7638.apcprd03.prod.outlook.com (2603:1096:400:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 07:36:42 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:36:42 +0000
Message-ID: <088f3444-a66a-45ad-8eca-39d32ca96a51@amlogic.com>
Date: Fri, 6 Mar 2026 15:36:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: b31a37e3-cf54-469a-025a-08de7b531c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	q60D5hXqOZ0NNu3Fe2b3AUJVeY3RmzIFFYIFuBHo+XXkO/ZMUMmveZBBU5PxtpyF9hOGon92dy2z/S+KqreLvNhkYjZ7QvCqRvTlKR/Lc+9GdM4f2WR/7z2OSnT5RZPH+4hYhFrOi/B90muGQOOZYH6co29b9wpFf6zkiLBb3Bo9WJNdw6rbH9AaJFqC9EYQsXKAYgfeXob4IyxQeB6FEZh9u7iFN261hSAB06dObIppHSUhUPXCGcJtyPEK00Tq/rBb8f1fwBmPEDFviOjgCpBiEwrRmTSplRORt886zLt6txxBJvyUBQJvNWh65xrq3haPNQ9C3sUu8OUSjPdxXwqeE98k1On6ROxkhUdAvCwIt3KoPH+tfoSgQAOv21zuxgP680rOXm6+4h5gALS2qgTiGOJ6ZEGhR7hUTxjDOZpWJrdfIcN0nksWdWR2nu819JpzsVuNXwp5YuKvW4agAMa86owWlaBlEgyErRfREJzCgdhTocTFzB8nBwse9qkTIgZcPl7bWMznhqpiQjk3aeHlsK6ct2WGapU5njCrIv+DVjZLcFoLyfid+37zAXdnaeuSpra1op/q1VQuh+5nxxhx0Xup5Ylp0VtTEeJ97SA1R7SW0KBEWXd99T8VmgdUuRekKPos6+I3wvsAD6ytKUUIqCevFRRD7KjuoJSojClzDzIrD9qRrNsqnnHgovjDlafkTCW8JH4PI3lYcYaROLTrNLduXTNy2CMP6ooNlCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGtmVTRzb3RUY1FVMmV5UXB5M2lHN1BHNGF3ZEtkeUJUMjA2MlBJZFJWNmZ2?=
 =?utf-8?B?QzExVUtoT2h4RzIrQ05ZcnBTcWdMVUVXcnhQa0pBTzJCbVcrb1dxeW45ZFRp?=
 =?utf-8?B?RkYyTmU2R3ErM1hKYjROY2xrUTJWWXB4TVNtb0JrdFAyTGphbnFQMlJ0M3Yr?=
 =?utf-8?B?TUpERnBsbVhFeStwSGN5aTVCZEJSTTBKTEFSWW41TXdTbEFja3JLQzVNQkpV?=
 =?utf-8?B?bUl3QUsreXRXbzY0SDBOU2l3aDZjaU1xN3lWQ1Q4eU4vL1RsbFpNNERjbHV5?=
 =?utf-8?B?OXhHci9XaUlEbTFGb25aRXMvbmM5S3k0aFMxMDlLaUxEVnhpcGhmT1cwVDl2?=
 =?utf-8?B?Uldpdko1eHZUaWY0aFc4MVphL1orZWt2Und5NVRocUw1ekJjZlZKSGFLdDJv?=
 =?utf-8?B?Vk8ySzBPK24zQjRLYlFYVDhyV3pFTXZXcEFpNTVKQTBVK2hlVUlEU0hYUE5r?=
 =?utf-8?B?YUdsbjdWYTdEUXhEaHZpUGtjOVY5TmRYVlBLT0NlSVNNaFQxcUdpR0t2Ync0?=
 =?utf-8?B?dlU4QTF1Q1kzUVlIWWhrYlovZUVyQkZScmlOTkR0bk9mYlAvbXdZd0Rqb3ZJ?=
 =?utf-8?B?Rjc1L0ErZ1VtNS95RTZDQnZRVjJSYWp2ZnBTbXV6Uzhsdlk0UE5NS3IxTkJk?=
 =?utf-8?B?UWt1cXUxOTJBc1NLL2dlS09CQkRsNUZ1b2RSUUZLMnRHVjlkUUUwSk1nNFZQ?=
 =?utf-8?B?eFFIbmFuZThiTGxvV0VpZk45Y2FGVlNZdmxSSWxkcXhERkF0d1pmZkhiZ0xW?=
 =?utf-8?B?VitBOEZ5SUZYSEtHd2ZFWjhHSFIwYzF3QjlDSWVlSjViem5Rd0xXcWEvOTYy?=
 =?utf-8?B?aEtCSGNsV1FKVjcxQ01uUVBiZHpFb1Fzc0RwL0RsZmQwSHdFQjVqZGdXeU4v?=
 =?utf-8?B?SWlQOEQ4UjhDUXV2NmFubkZKRUEyY3dFRktCN2R1cGI0eUpYbzh6ekpYemM3?=
 =?utf-8?B?Rm52eFhmcThQTWxXWXdkY3Yyd2MrTEhtVit6Nm0yaVVFUzJVK1BDYXl1T2tT?=
 =?utf-8?B?VEkweWVVeXBMenlYNzdwb3NZM3M5MUpSNitmeVpGRU9CeiswT01lQkdWdUJU?=
 =?utf-8?B?V3owVUNtZXcxbENLNnlCZ24vMWo5V3JXU1RJWXlUNWU1dzFzcERZVXZOMjl2?=
 =?utf-8?B?anJUS1JiNzZDSjcxaS9xRXdyZGwxTW53NS9nWHo5ZkJ3OURhcnpCNXpsSFE1?=
 =?utf-8?B?bUlGTWIyOEZNVzB5VlJ0ZmtmdktKZ05uV3JocDFHL1ltcGhlVi9wMnl1Vlkw?=
 =?utf-8?B?SWQrbkU4N1ZxblFtU0NLUFAvQjZBQnc0bWNiSGdsaURrbEFPOTlxWENxbkhC?=
 =?utf-8?B?cDNnVjFjVkJ6NHNSV0phVVBLQ2tuVi9kZ29uM1hIanFDdW11aFNUdSs1OVFu?=
 =?utf-8?B?Vm1qSU9UM3RyWWx5Zk9MemhUTXZCT2hmMmJWUmJ5OGZrSU5aWnUrMTg5c1Br?=
 =?utf-8?B?TVYvNlRqclNvS2RhekVEOXJuRHY4TWpWL2VPQytzeSttbm54TkhydjZmUG9F?=
 =?utf-8?B?S3dJTlhpR25EbnE5b2xIVU8zSTVoU2cyTGhlOGVxMEdSZ3VWVmlNTlpLZXBs?=
 =?utf-8?B?a2pDN3MyRU4vRFdLZFJXUW1kNDVMRXV4ck9Pa1VaekE5RkhmREFTajRzNmFL?=
 =?utf-8?B?NXRQbnVRemNkVVFKYVl4a0RFcWY1SlhKcHd1R295Uy9qdnpESVpZVXlSdVJC?=
 =?utf-8?B?ZWFtbCtycWZ4Z1UwRkl4UDIycnZJYVpsb0p3alFGcms3NkdWRCtZeVdpN2hU?=
 =?utf-8?B?elJXZXR4ZVYya3FaazU2dnRYY28yaGd5Y0hBblQzQ2VMUVRLeEZGbGQ0RWx3?=
 =?utf-8?B?c1daVjdselBFbUxJWjZFYnhZWDMwZlg1RmtLT1M3WGJ4RVBPRHBYNkxGUjNB?=
 =?utf-8?B?TVV1azh2U2R0dmpMV2FWcnpWMGpqNkw3NzBGZFlDV0RrWXdRTlU1UUZmYkxs?=
 =?utf-8?B?OS80TmdNdy8raXV0dmN2cXVqeHNNTG5MUnJKSUdKSm5CZTFOWEpXYlFTY0FM?=
 =?utf-8?B?eE9hclE0VkJGZWJ3TVhCOHRqcVBEOEJ3Q0NjcGprV0VuZy96SXZnNFRtMmhE?=
 =?utf-8?B?TFh4NGIxOWx4OTZtM2hWaDhuZ2U5MjZqT1p4VXd5SWNEZ3lzTU1xNmlLc0Nv?=
 =?utf-8?B?WVNwS2J2akd6NlFleVBLZDVFNnZxOThtSmVIZFhpTk5BN0dYTm9BOEhIV1pM?=
 =?utf-8?B?R21sRjE0a0JSR3hOWXY2NEJjSmhoVlJMZW5DWGNVTmZIMXB6VHJPeHdOeXRX?=
 =?utf-8?B?MnljN1F6RXpUdFRpelJDTUVSMElPa0NnNC9uOGJ2aVpranVwQ2hMUHk5bTJ5?=
 =?utf-8?B?eEtMTFdFQWNCOUtVRjAweXFJKytyQzVzNFBOdERycGlYRnRyY3JsZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a37e3-cf54-469a-025a-08de7b531c4b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:36:42.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnCwlskbL7IWZM7PJ3PraAZGT0BO/7glhGfB2ZjFV/j8E0UkTR7Xvdl45F3sS3Li6iOtQOBIwxDBdWTmE/xl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7638


On 3/5/2026 5:03 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
>> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
>> Add it to enable proper clock parent configuration for these peripherals.
> ... but this changes the index of the clocks after this mpll3, and those
> index are supposed to be stable if I'm not mistaken.
>
> It is indeed more convenient to have the optional clocks at the end
> as it avoids writing multiple <0> in DT when we do not have them.
>
> At the very least, your commit description should say that this change
> will not break any existing DT because these bindings are not used yet.
>
> I leave it to the DT folks to say if the change is OK in such case.

You are right. I will add a commit description to explain this.

The clock controller node for amlogic,t7-peripherals-clkc has not been 
merged upstream yet.

This change modifies the clock index order, but it will not break any 
existing device tree

since the amlogic,t7-peripherals-clkc bindings are not used by any 
upstream or downstream DT yet.

I will send a v2 with an updated commit message.

>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> index 55bb73707d58..27cc1f331587 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> @@ -24,7 +24,7 @@ properties:
>>       const: 1
>>
>>     clocks:
>> -    minItems: 14
>> +    minItems: 15
>>       items:
>>         - description: input oscillator
>>         - description: input sys clk
>> @@ -40,12 +40,13 @@ properties:
>>         - description: input gp1 pll
>>         - description: input mpll1
>>         - description: input mpll2
>> +      - description: input mpll3
>>         - description: external input rmii oscillator (optional)
>>         - description: input video pll0 (optional)
>>         - description: external pad input for rtc (optional)
>>
>>     clock-names:
>> -    minItems: 14
>> +    minItems: 15
>>       items:
>>         - const: xtal
>>         - const: sys
>> @@ -61,6 +62,7 @@ properties:
>>         - const: gp1
>>         - const: mpll1
>>         - const: mpll2
>> +      - const: mpll3
>>         - const: ext_rmii
>>         - const: vid_pll0
>>         - const: ext_rtc
>> @@ -98,6 +100,7 @@ examples:
>>                        <&gp1 1>,
>>                        <&mpll 4>,
>>                        <&mpll 6>;
>> +                     <&mpll 8>;
>>               clock-names = "xtal",
>>                             "sys",
>>                             "fix",
>> @@ -112,5 +115,6 @@ examples:
>>                             "gp1",
>>                             "mpll1",
>>                             "mpll2";
>> +                          "mpll3";
>>           };
>>       };
> --
> Jerome
