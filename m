Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796C420465;
	Tue, 18 Aug 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041179; cv=fail; b=Cfh0c7rUC+3koHgUvx7wwrJ9TK5vMOehL6HIBIwKn0GwCo/UD5WAqFL34g4KmTVErSwnDZ7j57NfQQUJRKVVUzWF+hIMMqck4xWbZk09a78heAC6ppDzAJQcFVR7IWYX/AN50dsuDya1OmxGFuBSdYBbRFZ5toic4Cj6mll5NOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041179; c=relaxed/simple;
	bh=6E9Oq9SP2QpBI9RQb5Y0ZSwcWwgFwu9B23dN8pneQQg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C4rGfrABK66PUaTKPchUlX88eiLu+c11Dja6gHotTtLw5GSVKSPJvsqIsT/ONH5F/s+gu63TjDsRHVRFYFGCOetrryc4tVUvFIFmnTSJddKvvFzZlzbhEJXbmDLDugL/QqSWG9NrCzkcUcuMQPcQISserUGPVcGjHDf8qJyGMcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tzlkfrtz; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tzlkfrtz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBxeNtTfhcvJNrfNpW+aAvOcvrhF9UxUqwNL/XWkt8Ce3U6oyOzO2BAyM/+fk9ADmxhFoZ9/z6ihthvMyFplfOU50nV7Ihb6GCnTtejGjhqteJs88jw5oFMjtZtrauwblAe2ikNwTZJCIppBRFEvWv7wbBrXxlhCnFGbDJrMYV2ZGJRSKChY6G/28PQqFQkv+n9rA7BVVQBEeCSqmBhuUcdRAvbGDK0Htl4ZENJQberGJda44+Ya4AwUpBAKydRkurjnYLJAvA8lFHxw+Dx7sm6wclD71jU9IQCS+C1ubTMUI/g2/Wg8jZkOYmkdM9Pe4QuOJMGuCTt+OJweBN8rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhhEhRpPDS3B96DG68gA6nEZBSrdpmLbmXT5tdyLKfI=;
 b=AEb/ZcQSTpTf5BzVKb+SCkMOyrqz9C6fvhNmvBX8qaa9sl+cS443q9Ad6IGTObxZOk5+7Ny6Qlpnk2rp4+AXRf6F7EPBm/IYflrhAqgjJUmjt1RipQ01PXn+Sw/TzxR6CLx1W/9E27WVOZ/YESlaVFVRJs7PqzrR7tEdvJY3frcVnfYGoKiIrKdGpYMqyTblcD61dCfwS+7iGcZNqQfgH3IeBKmNCfrwltU0Q1nvYIt0vmRYpUUd+s1peUgGSHj82WP1WkjH67MWAQm3V8C6Z6wyJCLA47FJblP5Rn8Hb8XWBkwz7ReyUvr7UAZ3kjTc9oSUFisEMM62ZdDkTtpyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhhEhRpPDS3B96DG68gA6nEZBSrdpmLbmXT5tdyLKfI=;
 b=tzlkfrtzymLUN6bLOO1lxIrPLsgTQLbTp39taBaLJEQW6TG90Bm07UOJcOsjH3CZWRn71Kp0q2nbKYN7BSnwdS7SRFUnMEfl2YRP0mgEaPu1e8BtQV13VPBMD7CJiQy9+yjXo38vKiB/pRX5mF4AL/qBPY6wJP64gi0h1BWM5EhS27ioWLJbd0nG++4pmytsLmp/fsG6I6K0iwCyeH04cTWOJ69iRF/CRHaSKUcFFbzF1AfMJN8iiJzQ1FyqgVSt38U7BFE/Rw+qPk9RNwfFfcQ22Gr/UcH1VH0gpGwI5qrXScG05y2/dvz9zFlbYj4rWTIm6n0F2EW2AGxd77f90g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SJ0PR03MB989394.namprd03.prod.outlook.com (2603:10b6:a03:402::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:19:31 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0315.011; Tue, 18 Aug 2026
 08:19:31 +0000
Message-ID: <00e9e61c-e96b-47d2-b560-9a362c872a50@altera.com>
Date: Tue, 18 Aug 2026 16:19:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>,
 Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
 <20260812024937.GA616612-robh@kernel.org>
 <b027b8cf-a97b-4670-a57c-1585feccb21e@altera.com>
 <20260814173551.GC1981719-robh@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <20260814173551.GC1981719-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0089.apcprd01.prod.exchangelabs.com
 (2603:1096:990:55::20) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SJ0PR03MB989394:EE_
X-MS-Office365-Filtering-Correlation-Id: 267ed127-d3ba-4dcb-eef7-08defd016dc7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|10067099003|4143699003|11063799006|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tza7CwMvZT8vj/XyomA2DudpundTP178m4FTpmKJzcz0agI/qK/pnhdEPkuOlreK3SUtCwO/28JWePD1rBnkD74wUmFscB+1uGXYAK/xfyRCF3sNWbQL74NDoyWxxIL6Ar4m4++bnRRuG1AY975L1NKFE8JwU44NCsd8T67dcmNk+HlfKEVA9sn3/lt33n2mvFmLixENOdnLm1Ga711FzgaVchUFvPM5P3MjZ0WZcmYFRY3eRV/HunyUulSgNjdjX1P3nug+1XTK6xCPht7kDuMVgB77MxXkY7EfWbc4aBxlznDDhgRewiwmdrhJ9Ldt0p6P8C67OjYTYTxR5wUzx9RZS9EKj9t/xljIWsV/8Ctuez0911SBBvTM0uuyXy9FB+DxGyjg/WiW7ggEFxIEbeHj69TIafF8Tek9DVohe+GBzMAuMlRCIv+0XAM9OLIp74l0gTqA7d7PnandeZ1XueqwqyhQJec0PR6kbicARZ5QQQYBCKpUi+jY0r7YHH//Hacb+7cfRCg3TZkLFw8wAfp4VE0uXJ2sOl3aF9V5jGNcUBYlbGun3s2S4rgS4hAXknjDeD9cQMLRRCtcFy1GovALsG6mXVyMn8LzOtYBszz+0K9q04ZA6wAhk87tH/tsKhDq1ScxcWtydN1uSVYAmYEPU9iIUUoj2A7mvOwEe90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDNudGE0emJLYzN4Ni9GaXRlUU4vaStONnVPZ0g0TE1QS3doNlEvTTlNYVNF?=
 =?utf-8?B?bWovVFhIYXVLRnowVEw1RU5Mbk1BZUJtUUNkY3ZWRzc1dmVpcFhQeGdYWTlk?=
 =?utf-8?B?Z2x0VFFBQUg1cjFxdi9QZGt0WmlpeWpXMHFFYXdqSDBiaDZycmNBeGJzTnhV?=
 =?utf-8?B?ZkoxUHcwSHlJNVIxWmN0TFpGbUlOMU1pN3lKTm81ZHlYVU5MZjVvM0ZSNnFK?=
 =?utf-8?B?SkhXSVdYV2tOTmxUNW9FS0MycFZkUG90WGxkME92bFEzZVR4M3F1NSsvRGdS?=
 =?utf-8?B?K1ZGd0hRTVYybHRzVFBxNEZiaFo4NUl6MWs4RFZDM1VEUndhKzVxb2FWZ1Ny?=
 =?utf-8?B?KzhPMGJFZUMrOUNZSVlpZzVQb1RrT25sY0daVE5oYlhKVUtNSnlHY0YyTVpv?=
 =?utf-8?B?L090VW9VaUdYUFYwbWIyeHRNT3E3Tmo3a0dHcFNXUisyQVJsVU55NTR6Ulg3?=
 =?utf-8?B?Z0U4L2ZneXoycWVaYXB6TUtoRXdLUnc3amVQYm1Sc1hXNjJqUU9PWUdnRHJx?=
 =?utf-8?B?Ny9BdUFhWG45UGprS3UxODlRdlVVYTkvdjlkRnliZDJPbjZsQWYvSDFiUnZ2?=
 =?utf-8?B?cXB3VTJiR053VWZ5eThxc0FTNzUzRlZXcVhPVkVyZmFwQjZPazBHL0dBNzlj?=
 =?utf-8?B?QUxNdk9nd3oxMFJ2Lys0bUdGdjhIL3kwbWFITWlBWUVSaHg3ZnZzSzhYS1lk?=
 =?utf-8?B?b2x0dStRcnR1QTNtcVVtWnFPc3E0YXdaYmVwKzhlb2tpUlhYeHFtWmR0d3ZS?=
 =?utf-8?B?NmM4anUrV2p0anVSamQ1cDBydyt4MzJPUlVOcnFFQVoxaE1jNWVDazl3cXor?=
 =?utf-8?B?ODkvK3JkTlBKTlFUbUdPYVRRZ3JnRGFxcFMwaWJIL1AwWUZEWkRpTDFjVHBp?=
 =?utf-8?B?dzcvdUpoVzhJTVIzWHVSMDViR3VvYmNWTUxMckhNcmUvUUVlVmdTK2JJbVor?=
 =?utf-8?B?cHB1cGdjaUg5aGozYUVZZ3NacEJSUWVMemJKU1dIZ1ZKMmJ1Yk41aHNGODlO?=
 =?utf-8?B?K2RQT1lqYmlBSUhibXJmRVl1Zjl0cTRTUkMvUXZ1NkRsdDZkU0tMRmFyZnpH?=
 =?utf-8?B?V09tUWg1cEd0ZXZKczJROHY1a1dYd1M3dUJKQy9Dd29BcmdyTlFDcGs1VSs3?=
 =?utf-8?B?SmNUVEtVa3dpS01uSEpZU2tQZzJzZ2YrTmd5dmtsRVBRSHZWZ3JPd1NiL3ZD?=
 =?utf-8?B?UmoyWE9lRzdyOVhCZUsrMTVkZU5KVXVWN1NKWm8wOHVhbjdtdTdGczBiTFRi?=
 =?utf-8?B?MzYyakl4dGtYOFpJb3pTSjNPeUZQMUNleVE5WkRTbVI1SXFiclhUZHBwcmkx?=
 =?utf-8?B?QW1zT2lpZlVYb0c4WnRGbGh0dlBhRWdwUWc1cVRJOHlMVlpremc0ZGQ2Ym42?=
 =?utf-8?B?eUtSVktQUmFxVmhTN1M1WTBVRkRHNTdMRTE4c0c3Z0NncDlPejlFOC9pVzQv?=
 =?utf-8?B?KysyOHltSG9rQjBSN3VSQ21VdUhXZFRDYVdGWUt1Z3RqQ3FxY0ZiV2ZPL2Yy?=
 =?utf-8?B?TFM1MXJkZzRZVENjRmRWMEpzeVIvTEtKSkI2dWhHMVdSMUpNeEhMQ0g4RFVU?=
 =?utf-8?B?UGxKOXViMjYxcUlHNTJRbzRoVklhUXRFK2FGaDYxTmdoTjMvbzB3Mys5R2p1?=
 =?utf-8?B?NHZwK3RTOWMvcFhVQmQ2VitzKzBjYmxuVzJySGVaTEgvU1B4Rks3akVDQlF2?=
 =?utf-8?B?SGdxWHp4YkFoK29Bb2M3NXdQTE8zeHBpME52cW5ha24wVENycURMTFloWlVn?=
 =?utf-8?B?YzJKN3JRRnhCV1pIME5tanpQY1A1MU5VMkpJcEFVN01NdUNxcEtmQ0s0Ymdu?=
 =?utf-8?B?S3o4Z0hpMmh1aFpJN2JyTHc5dkREaERxZDhhOXAwTEkwZzdHWC9ZYWZNMG0z?=
 =?utf-8?B?MFNBcldoa1lRR05TcEE2TGpUeGxHUC96NlpVTWlnSG13WVd1L3Y4aXlhdUYy?=
 =?utf-8?B?Z2xUWjdaai9rNXFTK3R2ZjJUTStOQzFXUzVBdGhVcExpT0FYaXFaWmVDK2Zo?=
 =?utf-8?B?WHVScEVoV0tQeUYxRURmQklWMmIvazY2OTdtYXpQWTMrdEZWRlRab2hYVkls?=
 =?utf-8?B?d3NST1RWNThreDF1Snd0RE9FdDNVWW1PaE9oeXhKRWFLSVVENVR1cThLNEha?=
 =?utf-8?B?dEgyVkdXWFZjbkRTSXZLMmRUY242L2VhN1p6Y3JyS0JTQ2tEVTFKWUw0M2di?=
 =?utf-8?B?R2ZNVWZtT2dQeGwvbUdrSitVM3RZaENsRjN4MVRRalhhaWQrdGRFeFI4dkdh?=
 =?utf-8?B?K3ora3NFb0h2WlhwRXpJVGNOUjA1eVQxTzI3QnRmeG9vSWNjdzE5YktxMDdt?=
 =?utf-8?B?bTdMSUtvMWVvZTJuaEkvcTVzbkQzWW1wZ28xWVk5VExLNStRdTRnZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267ed127-d3ba-4dcb-eef7-08defd016dc7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:19:31.5239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKaMoQdW9v92oCy9H5zVrh904AZl6tTjIHKzieIsz6r0Esb/aMvfz76IYFp3qBNxLOm7BFbI4qiYMbt1pXj1cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989394



On 15/8/2026 1:35 am, Rob Herring wrote:
> On Fri, Aug 14, 2026 at 04:18:59PM +0800, Chiam, Evon wrote:
>>
>>
>> On 12/8/2026 10:49 am, Rob Herring wrote:
>>> On Thu, Aug 06, 2026 at 05:25:01PM +0800, evon.chiam@altera.com wrote:
>>>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>>>
>>>> Altera has separated from Intel. Update the Agilex72 SoC and board
>>>> compatible strings to use the Altera vendor prefix instead of intel.
>>>
>>> Sorry, without better reasoning, you are stuck with them as sashiko
>>> pointed out.
>>>
>> Sashiko’s comment on the DTS still using the intel compatible strings was
>> based on reviewing patch 1/5 alone. Patch 4/5 moves the Agilex72 DT from
>> arch/arm64/boot/dts/intel/ to arch/arm64/boot/dts/altera/ and updates the
>> compatible strings to altr. With both patches applied, the bindings and DTS
>> remain consistent.
>>
>> Would you prefer that I combine the patches 1/5 and 4/5 into a single patch
>> so the binding and DTS updates land together?
> 
> Moving the dts directory is fine (though that is really up to SoC
> maintainers). Changing compatible strings is not. It is not about the
> patch split. It is an ABI. There are exceptions though. Generally that
> is if there is no one with the h/w or the current .dts is so incomplete
> that anyone using the h/w will need to update their DTB anyways.
> 
> Rob

Thanks for clarifying.

To provide some context, Agilex72 DTS is still at an early
stage of development, and most people do not have access to the
hardware yet. Anyone using the current DTS would need to update their
DTB, so changing the compatible strings at this stage should
not cause ABI issues.

Regards,
Evon

