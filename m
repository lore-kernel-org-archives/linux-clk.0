Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46038F95A;
	Thu,  6 Aug 2026 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002218; cv=fail; b=tkVOAMbKKETwMAJGilfjR/C+laox6AaFZfjX5MmXsC6z1yY92p8BR2GJRKoiGHdW8IxDEXlJ0vKcjpOpaR4VJb1oLVcYyU9WER/dja2/kobZYrXl5rfoOePPtK5mnGohgI0gENA0qgvXjCu85XbX2dIbsZYL0V3Xc4Yx3poO60Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002218; c=relaxed/simple;
	bh=Z2oNXV16408sGwsUj+jWpLDS5ZY/PsqO1631w8/WRHU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eqhQCIHDxVvXsJk9MNBhQtyENaP7L+7JC3qSAh2Ojr5FSZyEGqfb4zymWetsbPwiE/TG0tzTdbCOxZ33jc2QzQ06waPJ/bY3o7U84ZVaV20SqSBYnYvvHxuMfzeibzJPk8CGIvh5kBSfzJNyjb9jY2WfSfccS2yMLAe3B5E8Kvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IKJ4XRxE; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IKJ4XRxE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF7UYIwoTTLICd8N0mGyfyCGZF4DK3i+H2BJDUiDNjsh26p6LPncGZ9Fr19wOCguTY0+cfdcmjP7+ow6rp2qXkuFv0I5P59AuSkxj3Sq9Nr2og5ElirpobWsaJ1pAH+T9DKA+Xu7E6YQkDwoZxNh7b1+9L8MdySAAOS1MIYRDoyF50fX2lBbExulSZVaT7TfXA9KCwz//5PGsyXbTlOMrHXzYF1sBQMT4zadJn5enkI8AOZsboFN3ZGfa3pF0BLy4DuzKWZzNDPaKMKS7sZYBI4arMW+z3T5Gi3qIy0Yr/A+9FHqyf+7qohBEu/MyW5RAl7aLagjBbE8EJ1vBO8oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBggl6VyzEpYZ5CMl2mNZqnzrQYcSMeVO1Z6lW+jHsc=;
 b=b/LBTwQueos9R+Iix5+6n0hz8soPm/xv4U8Aku4yHpLVxZxf2+71OWm+bt9QS8dmUkbjkftWaDJbgySlAWHdNt2HO7+uqPTMYEpygX0Bl3u4p9pvthqZYdGpzgzeXWhHLstxCqXtNfc5Il5abMzJoMWQEcUE57E0ZBI0wMnGzpEllOeGbBgDIKJiLsEdt+8yfy9DqGJ7nkfLWPnFqHNsi2GlTFms1dMgSi+CtOjR0GHLdQ4pPqvTlOn2nGZGBRJJ6HpS6+EwrwYh3cstySdn7m4tsTTF8Jo5+ZS7b+YQomV5N2pXxJxmYo5Xye1IkKAwNRwanOv+GfPvzezw3IEWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBggl6VyzEpYZ5CMl2mNZqnzrQYcSMeVO1Z6lW+jHsc=;
 b=IKJ4XRxE6YqTTV9DIEg9pGQyJVGZW+1BrfP72rNF2EnAX5mfZONZBFLs7fcOqQSZlhAIfIRoGAFM4le9Bbvu3YrreQ94hrdHfWRWfiyiTWJw7DoDep/nzohfLdE/l95aV602SzcwPuaBTDsfONK4UcAUrue9oWj8jqTNsR5RrEWS6y1VLLAiur3LmydmivFTX8oy3DeP//zjt7E/MoVfsPDC4gB67WeWyPzTo7I3g8hQr66SyfOCLVI+zvDTYzwWAAetha3IyfVBXMoMu5DweMMF2ANgw0qhYD8LL6MZYi1w+9HLfE0mpickyxhlYky1SlSxgCvMGzZUs746XND58Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CO1PR03MB7892.namprd03.prod.outlook.com (2603:10b6:303:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 07:43:34 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 07:43:33 +0000
Message-ID: <6fc29749-67ff-4754-91ee-4f8021d76254@altera.com>
Date: Thu, 6 Aug 2026 15:43:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux driver reviews <linux-drivers-review@altera.com>
References: <20260727094926.1124-1-genevieve.chan@altera.com>
 <20260804-excellent-electric-yak-d2de63@quoll>
Content-Language: en-US
From: "Chan, Genevieve" <genevieve.chan@altera.com>
In-Reply-To: <20260804-excellent-electric-yak-d2de63@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CO1PR03MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdaa1bf-8861-4ff2-805c-08def38e6a73
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|55112099003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nCeozpR5Eh047784JvCTkNvZvnsDdlLqRYO6REwJMLwhpEA5rjFMO0u9NMLM/Oaj3sOSgrhLEVcuY3ezG011pc65PNnp6Vpi5arOxN0/rwSu2Oihlu/dkAzS0U3Nlai+MnMR/3FfXRBwCI4m5kU+avGTZxNf6u1zJjvG0ToB75aVnKM5giNu5bgh0xWUaf4vjYmLVagt58kmfdkREiGlKYfolwWSKot94gbP2LnSq1w3Wkr17FUyvGbRLCCX6KRTmHstxA47lAfzSl998ASHacq2nQ4ZzFiXG8LH5sSKsRJY2LPk66nzMEATE//7bGu0QGKP7CcJTQh02UnfHXD929/AQNX/PT6iW4n+fPm2lINOw6jtjGVYcJdgr+ekv2Usulcik8CuosWYzGPjwfHif9TTDiG9R4hzEnYY+OhoHwAzmscVMew8e4tJFsqRR3EiEzBDO1klp0yT9eTJJndfr7HAMD+L3MMY6mNBxYabY8Z6NFzP3oW15gHqrGRSoOpD0tK6kWkMmg/fcUN6HpGU5EqMyHtdhjUMKhZH0ib+yPSRsthOU27ZZVE7/qkNlxx4FzN1CVGvhOpsgozi8Z4Ku8EsZRihfaBiDadVLcnU3wLC+jx+lCFwmWfO9+W1KiQ1j4xW1evAjzp0wNPkbT4wjD+UOEZ3g1CBjLd5AGldIKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2k1a01IT3VNNDU0M3pMbXpvN2grbnZWdjBYNzdxUWY1c3pyaUpnTEtwZGJM?=
 =?utf-8?B?bmhGZFl5eUQwdEdDdlNGTkw4YW5ZWFI2aUh3T2cxa1crZnQ1Q2xYSEE1bkh6?=
 =?utf-8?B?K0kxekZ3ei84azRheXozSG9QTXJGekFyQVNZNGlIUVE2b0VITDU3NDB4eUxT?=
 =?utf-8?B?bUdVY2pHMHJIN21UOC9UaGpPaXg2WXNrWjFISWtnTUdBYnpjK1VIYldrRHdk?=
 =?utf-8?B?NDI5WFVzbnNKOUtiVDZTRi9WL0dRSndESzNXbndNM1dKL21VY3VrUThLdTFm?=
 =?utf-8?B?ZENER1dzYTMyKzJkWnpmTVNoNTFPdDk3dTBRSVYvMGRpeHB4akUwMSt0dmdo?=
 =?utf-8?B?RG5jNE1FejZramhWM3dkOEdqRjN4cVZvQjVBM05jNndOT1dMczkvaGJtaEFu?=
 =?utf-8?B?MTJBeTlWTVRTbndsVi9pUXRWTUpNdjBTT2FXb2dCSWZ0S3MwbzV3enlvQ1VJ?=
 =?utf-8?B?Skd3SjdWUWdFTmNLSW9kVEdQVnRFQTBsd0gzSW43VDVVbEw0SWlMek8ySCs1?=
 =?utf-8?B?YWMrY3VIQUt6OTR0Z3U1aHV6ZlNsMEp4bkp0RVFVQXJlTnlVQW8yQzF3ODZ4?=
 =?utf-8?B?M2ZqMmNEN2lhTXRNU3hRVXFTU0plaVlXNFFJOUFWRlEvNWJkUUI3cmxWVjY3?=
 =?utf-8?B?TkdoY0xUVC9CTVp4UjBHL0J1UElLRVN6RWk2RXVSa0NvN29UWHdJZjc3ZklM?=
 =?utf-8?B?Q2VYTjlVT2VyR0pTNHhIemd4MDNiSXZpVndSVEtlM201cWlpeDFvSFhnTm11?=
 =?utf-8?B?cnd3TW9ZNWJWVDVIUE5DaUFVbXBFcVZraFhSdEdtNnpLTy9LZGlid2g5UXhN?=
 =?utf-8?B?T09jMEQxVlkvRVVSOVBZOWZ6YS9QNWZJUGs5WmZ2YnlIOCt6WUZUeTErQ3Nu?=
 =?utf-8?B?WnRwNC82aTRYa1RKOHhPcFlmdUF1NHZOMGdmbzdEV2ZzQnVDWlJ4bnVXWUtB?=
 =?utf-8?B?c2xwSng3aFljNGtLdmxycFdRVThKVTNvMk16ZW5Od010dG8wTXpSTWU5blRJ?=
 =?utf-8?B?WnB6ODJsTEE3L1lpZmdhVi9aU2NJbkJRNUgyUm5ZU0hFME04cURFN245NGp0?=
 =?utf-8?B?QmkyY2g4amNiMFVQV2FTSGY3QXNPb2gyRFRyS0lJYU45V1RkYnFuczVVTFla?=
 =?utf-8?B?S1FZaHNEb09iOFpCdVRaL0VoeENYNWMveCs5aTdSRjhTMGtNN0NUbGhUb1E5?=
 =?utf-8?B?Y3U0c2pMMHVYcGkwa0NtZEtsQTRveEJBMjZKSFUzUDlYdWgrdlB6WnFLb2xv?=
 =?utf-8?B?OXNNcGFKSlZmdGVQejExcGpadFRDUUJ4UitjOFVtc0JJSllUMGhrdG9kL2dG?=
 =?utf-8?B?VW1lK0hYRWF3QnNBZmJic1gwV05DKzdrUjhPSVNCQmQ1OTlJaFA2MlBSRmwr?=
 =?utf-8?B?MExIU0lHZVV4VndZNGxmUVZwRTlzOC84QnNCa0tYRGdHYzZLV1M2eFJMMlBW?=
 =?utf-8?B?SEwvR1M2eW5sVXJRbEhYd25YVGpCVTM5YitnYzQrRnVyaDN2WTZYTW5uQzQv?=
 =?utf-8?B?SVhJeWxPZXlzRmliR2tQRjk3Q3VsamdmOC80Sko5VjEzSTJtaG81bzIvVVAr?=
 =?utf-8?B?M01Ec0xCN2hXQnlGV2VnK0hSTnhOU0c3a1Zna2V5eUxiZFNUWlNkRXYyOHdN?=
 =?utf-8?B?YXZEd0ZYNWFBQVZmOEVDcTFGOWhaTXp3d2I5c1BDRkVGMTl3My9jSTRnaXJw?=
 =?utf-8?B?SlNZcU4zN2ExSEtOekJTZXlUdE04Ky93Q3hEMXUzNTFEMzEzbWs4aVJLQ3hC?=
 =?utf-8?B?ODBEdEJtTE5ubkJBMi9NNGxjVmJOblMvUjY5QW54aWFKVkNvdVdJd2NHQU1P?=
 =?utf-8?B?OVJtdkhOdncyN2lNZzFKVms5Uml0SE5iZUpaMXhUZ2pJOFhGYXlNS3lVOXVX?=
 =?utf-8?B?Q005QS9weXJwUVlsTVY5U1BkMTRyK3RnTFdTZFNIenQzOHl1TlZIQzZ0TFQ1?=
 =?utf-8?B?cFc3bWZkZG5ZVWhZeXNVenEzbDM5b1kzNVJudlJzdHpxak1vTkxEb3d1N3RH?=
 =?utf-8?B?MWNOVGZ2R0dZb2lOSENnY0h1QUZOUG5ieGhIWnpuZmFsakR0NjcreFRPSFdF?=
 =?utf-8?B?eGc1djN6WjBoRjlaOWZPamMreDE2eWxhcHRzUVZ4d1grN09SUHRHZmk0cW9X?=
 =?utf-8?B?SHMyVm5uN2dTYWdjSkZxVHhVTUxCeDQrRWFiRjVLaDVVUnFQaUhESHVSUHZT?=
 =?utf-8?B?czBYcS9FdFNPTTRKQkppWTJDazdKWVF6czhHQ1p6ZXhHYkxwOU8rWE1hSHhu?=
 =?utf-8?B?SmpPczFNRmY3dTRlMmRmZko3b2dlMi9Za09abk1mZy9mSUlhU3ZsNkZqTEhi?=
 =?utf-8?B?aWVBZlZyZGFrQWZSVXlmOEFzdW9kTm1kZUhiTzlocDhEM1k1TFB1amVxNTgx?=
 =?utf-8?Q?y/GTClEE3yJ1npT8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdaa1bf-8861-4ff2-805c-08def38e6a73
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 07:43:33.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUi1UuTubcXUSUUFfxAy/9xVvH7tIp0GkT2PkwnRGZCbfXbcb2rnT4OvyOxOEI6+nkraVM+/XK3M0NKqSDqm/b99LLUgWOLxwE51h3wChaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7892



On 4/8/2026 3:49 pm, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon, Jul 27, 2026 at 05:49:26PM +0800, genevieve.chan@altera.com wrote:
>> From: Genevieve Chan <genevieve.chan@altera.com>
>>
>> Preliminary documentation referred to mpu_l2ram_clk, but that clock is
>> now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
>> Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
>> new DTs) and mark clock ID 42 as reserved/unused so it is not reused,
>> keeping all existing clock IDs stable for DT ABI compatibility.
>>
>> Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
>> Cc: stable@vger.kernel.org # 5.8+
>> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
>> ---
>>   include/dt-bindings/clock/agilex-clock.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
>> index 06feca07e08e..de7a58a06651 100644
>> --- a/include/dt-bindings/clock/agilex-clock.h
>> +++ b/include/dt-bindings/clock/agilex-clock.h
>> @@ -44,6 +44,7 @@
>>
>>   /* Gate clocks */
>>   #define AGILEX_MPU_CLK                       30
>> +/* Legacy ABI ID; do not use in new DTs, use AGILEX_MPU_CCU_CLK */
>>   #define AGILEX_MPU_L2RAM_CLK         31
>>   #define AGILEX_MPU_PERIPH_CLK                32
>>   #define AGILEX_L4_MAIN_CLK           33
>> @@ -55,6 +56,7 @@
>>   #define AGILEX_CS_TIMER_CLK          39
>>   #define AGILEX_S2F_USER0_CLK         40
>>   #define AGILEX_EMAC0_CLK             41
>> +/* 42 - reserved/unused */
> 
> How IDs can be reserved? These are implemented by drivers (abstract IDs
> not used by hardware), so how driver could reserve it?
> 
> Best regards,
> Krzysztof
> 
You are right. These IDs are DT clock specifier indices (provider one-cell ABI), not hardware IDs. The clk driver registers clocks into hws[id]; unused indices remain -ENOENT.

ID 42 was never defined in the original Agilex binding (EMAC0=41, EMAC1=43). The comment was placed to only documents that historical hole so we do not renumber later IDs. It is not a hardware reservation — it is for ABI hygiene.

Happy to reword to something clearer, e.g. /* 42 never assigned; do not renumber */, or drop the comment if preferred.

