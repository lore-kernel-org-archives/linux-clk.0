Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA6E22A80D;
	Fri,  7 Aug 2026 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786075433; cv=fail; b=HAWAshsIqSJHB39mdyRIBIDtYUUadcCStsK05VhjP4kUD994kR98SRpNnd9BYY0jXddFx5z/SC5D5yC8dwmoW1sM52EIWeV1HCcYWfdS4pseAhYxyPApJHtiPMRfW0UjI1YKzZSK5X8PPhsGww4/5NyN5H9PtzNRmOowHVC+e3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786075433; c=relaxed/simple;
	bh=mN4LQ0wCBILzThRTr7wtO80JZnpYrD8h7vXg6lI4t2s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jwxIdPOwbKG9s6/7vYM/vxP6fkXLh812Wrrp12IMEU3Lp8rm48ze9hpBiIsvqVrQ/7Qt7EnqII4vr/kWGUpwOxr3G6OwIgl7i/xHyhESp2gNiHnZLqS1LqEMaOwcY3+64GPEmZKhUm/HzTj6N8iHFD2qIm4Dx996ZMFrgx+uAx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=U4N3ydlq; arc=fail smtp.client-ip=52.101.56.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="U4N3ydlq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EylB52X6i/wCgLlcNsa1iJJYuxTQa0An2cUCT89Kw1XmRGLmUNuXPA1S8fiibrZ9kxYr46xrsPphv5NzEVjdFiWSOJZaGilsfdh12bx8MEbKn8K/fkY8/oAJRRaKaaaYzLfNbVKQZLVIKz7L7ceauyid/dLzs9kgGKCGxAfPDO0ETFGrF5PmdbvIVSqkZkrqLue16sBVPn8h7w8EOBY9SA9NxlWbmpOMjBRx6GvZr2TMZupHadMzWdMS2UTfbr77JRd6nNIgX0aAljm2jOLszqsq8qc7pnnAmfyCnJE8nPhZUcmgQ07JBunx3ur/YVYnxNffUzsTCjs1+R35iwxw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFTL6QUaHaP3pOEY7mPsBRIB6B18oL+nE4zRhVbOR/Y=;
 b=PlVFoReSFs9tg10LMeWxt63atOjhfAKPp9DJPtGuVffxVxr2Z3tukArG9r7wrwR9eUYJDIRuxn37nH+4ZHPMpSEN8PXmlnTScrtRVAdJTPMUiOypK8BuInsQKosLllaZ7U24JXzVb5g5qsvu3WaEfYkwev9MxtPXiGYxOGBPXKuam1LdTN7T1KxCYmikHjF1Xlf1/Fn4WsubFHzUk5s0Sf4yODRLI70ZHZAtsrukKs2k7eQPftb4ycAcZjfzDgBa/z6gpWlMkvgXvDGaoe18Nkf2VOEYkCShVLKgi9VPFpSPGFKs22v5bd3lHSTkeig4EWLzTNf5tHkx6FVFSqc+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFTL6QUaHaP3pOEY7mPsBRIB6B18oL+nE4zRhVbOR/Y=;
 b=U4N3ydlqGYnufulQlElm4p9ZW8UFf+8RHCJDUD0R9aLruWRZ6CUA/ymAieBHv2+FPy0F7BzQjtO9B9h5OJEwmQ/8EDyjFhTu1qSBeUwSkQg0U+C/QuPzoRgsqMTWeeOYub3b3LR5B7ziLLXtYWeNAwffRGQ0Nb3Y0/x58UtRHq6msF0FkFv+XqpnT0o8TurT5nB38fM8l17vAmpNgnBInOJl2nwNg3Szskw0cGzEZ4Ou95URJ0TqnbRPShmh79uePsXOgBLe/3CWd57dulqvcbYpWy0m9yFSjHSAnux3ptWl50VAKSywx6S32ndvBPgy7itGw8Cz7Rv0UFz6Wa7QpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by DS0PR03MB8341.namprd03.prod.outlook.com (2603:10b6:8:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 04:03:48 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 04:03:48 +0000
Message-ID: <e80d3813-ad95-48a4-a748-c0ca0d8a2a86@altera.com>
Date: Fri, 7 Aug 2026 12:03:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux driver reviews <linux-drivers-review@altera.com>
References: <20260727094926.1124-1-genevieve.chan@altera.com>
 <03c1b493-8296-4818-b00a-70a51cf5e39f@kernel.org>
Content-Language: en-US
From: "Chan, Genevieve" <genevieve.chan@altera.com>
In-Reply-To: <03c1b493-8296-4818-b00a-70a51cf5e39f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|DS0PR03MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: aecc9f74-7188-4f3c-bae5-08def438e230
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|921020|56012099006|11063799006|10067099003|4143699003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+zmD18n66HKRgDH6uuHYT7pfWLJxey7Rs5GC+yH2vKSzxRith+Qr9RJeEU4mz8K25CCwt2KUP8mnDQvrD5m0O4syl1YOgvibdu8UR8cQbameH58X3kp8F0AjJQAPjjyY4bofhxOp4NfwqWWWiCM61JsVIsxBVIq6DKcMpByeoUoVjvgEFJ+AS4p7WwG/Zc0If9F5QCIqYXppuObtrhiND8zs5bxuKU9kWZr8Z/5F8+yfSOoHquguHUoHtoaJKa2XzhCrfW0aTjgz4DX5F5mqVCItW+yWFK+tY5behb7d/0/e7zaeitkq3Fq6nuxD/Rrv8bwavrk6Zo2xWJtvETn7gCOmsf0L3zdNwhJK9QvMzKYYhEc8sCo5WJbDB7ggCORxx+vRIhPtRonVx3b2pp6bK9yb6MX5gB9oWH1BNQ/sU49VxdVixM1Bh+I8Biv/3AKEHfTxns6Ib91eGWOg4BYGIxZBqNYEmnALF3cSkZg1mNuNqiwfXw0bCiMY4HAKza7F7h0NRBAZHvCzmnVQC47ySKFbV/T7QaVjqQMWG/gWKQgMxnTZr/d7d0uhibmveUhuyNp7jrMHla1oqhotwgmu+IOEXpeo1oiInEijGHq1wySUp6lHpd7gNhQ1kzzMTfyNJoH/nJVb97irY8Lih8vhjnpHRwo52YHJ0gOXfYsklemfFZKD+wE6730FkcK6D91rO4ymiAxtqjhppWfZFc47kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(4143699003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekNXOU5xWHJSZWgya0JNT2FKOFJxeHYxOVlaR3BEUVRJUnVPUnJ1YnFXR2sw?=
 =?utf-8?B?VDlNc05Id3g3enU4TWwvR3lXTW1KQmI3SG1PZ0NMcVh2bjlNWG8ybTZCclI3?=
 =?utf-8?B?MENKVTUrQlF1UnRJOGcrUDJTRFJsRG4xa3VnV0lyRW1pam02WEEwY25JdzVD?=
 =?utf-8?B?cllzOW5xQ2NvVzdFcGZVTHF4VUw2NWhoRzA4bysxRXR2c0RMZ0RjSW1Pc0N5?=
 =?utf-8?B?NUNpUjJqbHVJWVMvdFpuc1RSckovbWFwZXk3YnllblVkd05tbkUxMk1IV2Mr?=
 =?utf-8?B?R1JQSnFiQ2JKZGNrbUZuWWVEVHlnMEczc0xLdFJnNXByaTBUQlNBRXNmZGJj?=
 =?utf-8?B?bXE1MlE3clRjcHZ0OXFwdXM3UURYODF3UytCcUJ0RmhZeW1GSkNWcFRTRGdR?=
 =?utf-8?B?UGpjZWpGenZ5Wml1dit6NllXOWpyTVd1bnhRZnhpVXRlTGVibmFhemJGSEp5?=
 =?utf-8?B?VlVqbUpvaGFQZVNyYUMvTERmTkJpSlkyOG5ldy84cDE5TnZqeWZGREVHRGp2?=
 =?utf-8?B?Z28yRmVTc0s4bk9NRWVuVzljU051ZFZ3encyZ3plOG9EdE5ya25oMHVnK3Bx?=
 =?utf-8?B?SWtkS0VJZmZrSTZQcXRCdGJPeFd0dmNGTFBXVENSMzljNUpZb05WZnVTMU1p?=
 =?utf-8?B?ZmdoOFRXaVhIK2ZTTzVTaUlsdHcyR1ZwUWtreTczOHFzbVhMTXZSaHNITUlR?=
 =?utf-8?B?Q0g2cHhwclliYnVIa2JTaVovb21zZXYyUEMyM1ROZFNhMEdZenVYbTJUZkFP?=
 =?utf-8?B?aXlaT0sxUFUwQ0R0QndnNkc5UjViYXJWdFVIZ2NqMkFNV0cvZzRlaTNXUWxl?=
 =?utf-8?B?ZkU1Y2d0RGdtd3N4ZkZveVVYNmQ1aVJHa0t1TE5jdkJnbFJUY29zSWxlWnl3?=
 =?utf-8?B?VW5Ua2JQMXBPZHBwR3NaQjBROSsxQ3IydWx6SzN2WWZFeG8yV2I4aE5PcWdt?=
 =?utf-8?B?cHRpWE8xM21IWVB0MXdOclJsdDlMVVNNbklZYmprRVRIaU1WcXRlWnEwUHBF?=
 =?utf-8?B?RlFTQU4rN3ZHMDh3WEQ3ZDlWdFJiS1NvTEpwUzhLbXNJODF1Q2Z1TDVnc01G?=
 =?utf-8?B?Wmhka1Rha2lFUTB2dklXTUxzV0RkaDM3bEJnTGg0QzZTWEtPYzNHNkJwT2gw?=
 =?utf-8?B?T25NZzRyWWY0YUc2c1BGMWZ1aGROcTZXOTM4ajNkVXEzZjRvQU42UWJza2g3?=
 =?utf-8?B?bXpnOWdJdmUwL2NYeUczQUV4cUtIQ3puQW9JMEVtRXkzNzU1WXA4MkxKRGlj?=
 =?utf-8?B?Ry85K2hUU2pEWWlMMFQ2WTcyYnhnbHdRL0hkREwwcTdDSnVmUXR4bm41Nnp4?=
 =?utf-8?B?aVlUYnBiZnNtMERSaUJ4TXBIMXN4ajlVZGJxcGFlVUc1OEdUa1NmRnM5UVpm?=
 =?utf-8?B?YjZtclZJZWk1bk1UUnJRTUtkWXc1ZlFkS3ZPM0pUTXJvQm1QTGZIcjErcmZt?=
 =?utf-8?B?TzRBSllaY1pyNFk0c3dBdnMyeW1HMytCZVlNZXRscnZRbHlzYUVBaTYzM1py?=
 =?utf-8?B?WVd1Z0lXZWxxcFdRMFJyZExxWnRhMTB1VmVBSUxIMFIwTTVWdUNicXp0cHcx?=
 =?utf-8?B?TVlRSXBVdVU5L09qLzZnZTdWa2xHdmxYUnNTa2REckdveW4wSm1QbHVUSU1C?=
 =?utf-8?B?dURER1BJdTVUTTRsWTduWEwrbGt0RWhMbFBNMHU4RlVqd3hmQ05VaUVraHl3?=
 =?utf-8?B?aGxmVHJRa0xGWUM1U1JjOEcycjlFaWdicTNZUW5RNURYMnNPVmVDMEtqc0xP?=
 =?utf-8?B?N2VJWFhFWktFTCs0SmU2NVovcE1rK3lpMldoNE5qeWpNc2ZIVDBUbkFHZ0Fk?=
 =?utf-8?B?YnhrTHJjK3pXVThxTnhZRHd5UVNvN0o4akhONVNyTEdxNC9qTkZoOFVaUkhl?=
 =?utf-8?B?SDV6R1ZiRlprcGZTTi9RZ3k1VVlUMmMrcGo5MGJOcy96blEvamxET3IrUDg2?=
 =?utf-8?B?SXRDOGc0eVBldzZCVkVuR0ZZMFlaSU1VMkFHS0tRVGRqOGltdGp1NHRlcUNY?=
 =?utf-8?B?b2R6ZzRYdTVtOE9PYlZ2cnBYVGxtRnRxTmFJOVFreUVES1BEcHg1WVpTT2V2?=
 =?utf-8?B?RktNb2l4WE92Ym5iNUhsSTNyRXZrR2doVXoybE9Gdk92L3RpK3A5S2cyLzln?=
 =?utf-8?B?SFExaFdSVjRHNkw2VlIxUURaVkNzdlkxYUN6eElnM1htNjFodWVlV1BORlRk?=
 =?utf-8?B?OW9KMzBGYkVTMDBMbCtvSHQrczhDV0MvWExoajRUdFlhQ0JtVzdRWWMwOEhH?=
 =?utf-8?B?MmV5aEVtOHBaOE5TQVNZSkQxVkhjTm9XSEZoSHJWUXhoS0hkWk8wWDhnVXVQ?=
 =?utf-8?B?bnMwMGE3SlZRRGdUV2NXWjhodHpQR2h1WkZiOGd5VlJmZEdqMm1rc2dxWEFl?=
 =?utf-8?Q?HtqWSGEADzFswtk4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecc9f74-7188-4f3c-bae5-08def438e230
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 04:03:48.4525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8/0GAxKR1+FMmmUYcuhedGP9/63uf9ERbknJdvXwiaQX0P9XILLIKbHKVvSK0D0FMPEW788EOPVmoyUHJeB0zYGSNzJdUgpLaO1vFzbePE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8341

On 6/8/2026 5:58 pm, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 27/07/2026 11:49, genevieve.chan@altera.com wrote:
>> From: Genevieve Chan <genevieve.chan@altera.com>
>>
>> Preliminary documentation referred to mpu_l2ram_clk, but that clock is
>> now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
>> Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
>> new DTs) and mark clock ID 42 as reserved/unused so it is not reused,
>> keeping all existing clock IDs stable for DT ABI compatibility.
>>
> Why are you Cc-ing non-functional addresses like
> "<linux-drivers-review@altera.com>"?
> 
> This bounces!
> 
> "Your message to linux-drivers-review@altera.com couldn't be delivered."
> 
> Best regards,
> Krzysztof

Hi,

V2 Patch is submitted and removed the non-functional addresses: 
https://lore.kernel.org/all/20260807035833.16198-1-genevieve.chan@altera.com/

