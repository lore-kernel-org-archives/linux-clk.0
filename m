Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307A226CFE;
	Fri,  2 Oct 2026 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790910070; cv=fail; b=jHMB8FVm6v7MgKliy5jE+6pCSK1UkOYdJIiS0VCHdJJnAY7mp+EUNmFr0xq0Wr+AU+Hkiy66G6LHA3O1q5ztL72YJRfMrA+9g1dhY7FCJKVMafNK7VjZFJUDiWFQl4dRxiy7pnvDzZ8NXOIVlzEZd+SUvS6CKpSS02m2k6Gd1JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790910070; c=relaxed/simple;
	bh=ficZQnUrErGLewCcqPX/moaFxe6rf59fPQmWd5a1viY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ncdRqRxR6ey9JbnEsHGOkL4U6u9yeCrAUWsissZmA9CQQHwy0t2d9Lv0BJROEAo4PgLOtb3eJa1Uz9VbGlKgiJe423ZHG5WydiZZJdJUCKYbSlYLvfcPEKPKVwLNBGAF7rQ9VY6KqHmEMDFPB1h7FrthX9s0d0HN+KpGXCq0LNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=AsXQbZ/0; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="AsXQbZ/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1vjTVvgVqlgc47Sbkl229QQiy8MHlrZ28/yprGUwDvZxq0QrFs98t7RkCXS7YBsqDdf3H/ngRVpt9MyD8zutzUTSxu5DZaRymWtsV8GkBrKeUAgp/aWsfEfiJYb3yu0myfMhlB5K9bagqa9dtcA17zUHnw8WOqHTVHBVUc/Ho/XsDx3SFdF7fecqbjfTyTqayhk415LHZrV0r4bE+bL42F3TnJMCJKxfR0bOXuGuj3TcNM2nIzmMJjSU/yx7bgGXRDrhPSobyGMKa1Fj383z88bn3Biw2Yf7DuZJnyJHLrXJtGwOsuwrYkjcn0ruIyhkvhtOlzRMNQnrMAl/Mbplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANWFlMr1yveEcSzw9yiQm3eA8o0eaeTPHOT5Gz2Kiz8=;
 b=OgzgvpZCz+F7+mie2Y1jcXQJBunH9AhOY0sBgV25l3hLksNCQjZHQiLjQv51aPE4+YefMaaV23JweOMtC/X7LE7gIOfjFR3A8K9kfKkS7ANr8VUkgzCo6Br4zzM3RYn6dz+1kU09ni7rnSjmYiAtQyH1+FGpaBcnOG8PxdjyUMNo3ECDN9GroDm8xhirrsH1Q9lfEMIosYYJ/HW3B8ImGV3vtQmq7cte/afKCBId1mt/z4nIocmBX8D71Q74v+LDE1cxpLY8wDCmEa4d1gOzUm53+oGItLqy1Kw3+yBw8Ju6riqT0Q/OCB/MfRKI8PaaxFOD/TAkoIhaXRVaf3QDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANWFlMr1yveEcSzw9yiQm3eA8o0eaeTPHOT5Gz2Kiz8=;
 b=AsXQbZ/03Wr2aBTRnYk2nuLg62SGaGb8cb2QT7QrQBRqR3P0qZYGPQSetj4AVYUy7hEraoQBRPlcDENyiR6AlwQUEYYZrECTvAKC0bbJIJ/HyLvsRsD69fvts8xsCVpw4uu6N6YXro3TrI7FCknPkfRh4Z8eOqL2RR7IrTtVKk12R0DhCYIkF9qi7EtHU6r7ob1yl5LogADUo9MaUo3Ypw3wItWoBDmC/ztLuUB8RzsWGom9tQ5HtzyAB4i+rd1AqC9kcY575qW0E9MzImXv/W+2PMKqnWghQ46UgKjZM4n+jiI+NuPnzJ91OQo4PLOu3bd3ZqdLJWNlPgyBlLT1MA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CH0PR03MB6179.namprd03.prod.outlook.com (2603:10b6:610:d2::22)
 by SN7PR03MB7155.namprd03.prod.outlook.com (2603:10b6:806:359::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Fri, 2 Oct
 2026 03:01:06 +0000
Received: from CH0PR03MB6179.namprd03.prod.outlook.com
 ([fe80::60aa:1bfd:62a1:2ddf]) by CH0PR03MB6179.namprd03.prod.outlook.com
 ([fe80::60aa:1bfd:62a1:2ddf%3]) with mapi id 15.21.0472.015; Fri, 2 Oct 2026
 03:01:06 +0000
Message-ID: <bd75547f-b254-42ab-9df0-fc16d8dfa8e7@altera.com>
Date: Fri, 2 Oct 2026 11:00:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: altr,agilex72-clkmgr: add
 Agilex72 clock manager
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790651166.git.evon.chiam@altera.com>
 <db3dd69fc666cca536488a75da122ff173995030.1790651166.git.evon.chiam@altera.com>
 <20260930-scrupulous-immortal-saiga-f2b24f@quoll>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <20260930-scrupulous-immortal-saiga-f2b24f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To CH0PR03MB6179.namprd03.prod.outlook.com
 (2603:10b6:610:d2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR03MB6179:EE_|SN7PR03MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: db201bc2-c849-4834-2620-08df20316695
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|11063799006|56012099006|4143699003|260925021911599003|260925022911599003|260925021311599003|10067099003|22082099003|55112099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AWex7bEMwBnIYrSGWi8TzZ7Szt2Fj5Gn2/MLNYk2wOL61FnsdEnF6X813DlFWJ2k/X/14tvVqhheGE1xdsVATWFc29zNY/epSBG1FgUEdUQXLK+b+io9qwT0p8TtXnWLhSI84q+ZTMFL6k7+bEPcrmoLD1tqd/3VT4Zi5YKJQYqPvVw2zrC/8D4mPFk1EQM1/K6S/i/pDiKaBqvA3J04uicO0qX5SkhELuENjDJkrVixAymtaHdwMAk86ZYb8CHUPEZjyofdLmDiq2sKQJXcp6phgpQiPGOiDIfp1TjhTWA20hNN5XLCzNDjMdSctEIuTzAkBbRkQxtVeUGTP7wipuO526TQ+iFnkfTOMinF53/tlIOo3GDV6QvDDWEU0GSyYOIacc5oa3cR/mZt799MZrI2VAygjiBsadY2KG3bMh+XMIbDH2cKbuh8R5Q5pd6HiiP8NYchFvTW0G6VJzwNADLTL7/kIAwwJO/waiquVHs7xm32RuT9aJ15PN9RDaXHyCNzxM+6bM/beGmqrne6/rLLtjUDhi5KWo35OBmTi7zxpVx5gx2TvSFpbD34ENk+Vhr2BSGwVT9mpd7yvSRTBlLKMgSMnBfCwKSge2FGDcZa1+2SF/Pc1LiHWn50aj/9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR03MB6179.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(11063799006)(56012099006)(4143699003)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(22082099003)(55112099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0JOQzBtUDRvbjA0REM5MHVCck9RVjlWYnN4Nk9HbGhpMG42VG0zU1I0c2sy?=
 =?utf-8?B?LzN5bU90UnVERXViK09sN2dTSzlIbm4xSkZPanVuMDk1N0ZFaS9nNDRjcFlY?=
 =?utf-8?B?V2pNUXlXWlhwRWZNaHdkYUtSN2E2SnM2VllpckJFZmtFM2drM0ZTNm42TUFz?=
 =?utf-8?B?UlIwTGU2TEFHUGQvdVpINElnUU5ZWm0raHZHM3poTG14QjI4VXhhdVl0R2RV?=
 =?utf-8?B?OUJQTnNodVhEdFF1UGpuOGhXbktiVjUyUFhMb3FlNy8reG5kVHViY0h3c1hy?=
 =?utf-8?B?eFJ5Z0Y0SWQ0dGd1MnhQeHExMlRVOFZBTWEzdFdYSUliMDNmOG9tMWpMSjR5?=
 =?utf-8?B?amRKbjk3WTJmNHc1MjhIRHFZYjVXUnFUeG5jOEE5K1BVL05aOFYzWVJESDVQ?=
 =?utf-8?B?YUYxUXdkSnZRaldPbXo2SEU1VXpoNC9KZk5xR0gxK2lmVExSelhOSXBjcHZ5?=
 =?utf-8?B?U3pZU2VVSTJzbWliM0xabkprMld0OURCckRuNVU5dENOOVUxRHd5MStkbTM0?=
 =?utf-8?B?bHIvMmw5S2tScDBWUGhrZlVPYzQ5VVRld3Blb2dQUXhBd0NRSmZCVEhaWEpK?=
 =?utf-8?B?Z0NuZXBMREpZbTlmWUh4Vks4aStJRWs2cUdaaHNWb3NCcUtYZDlEblYzZmQ4?=
 =?utf-8?B?N3N2RnJnbXhGUjI4eFFGWVdMVmkwdC9tYjJ1bHI5V1g0dHJPSGdIT01rMTJR?=
 =?utf-8?B?cm9ndEhYRnhUdHM2YjNCSlk1MXNpbm9odDFTVTV4SDVyeFArZE5CeDdEaVFE?=
 =?utf-8?B?Y3c3SkxDTWJOVVVxMFpSSjMzcXNIYTluQnNMV1ZtcUY2ZE4zZGUzRUh5Q0h2?=
 =?utf-8?B?MXJuUVNKZE83bkR1YjJnQkVwN2ZWcUlTYWxsd2wzNzlJUHJDUVZhSHErY2xy?=
 =?utf-8?B?dkR0Vkg0TjE0S3d3SnFVbXlLRHN6ZHBac05HUmxwK3F1RUF1cEkzRzhzZWNu?=
 =?utf-8?B?aUtucXNVVVNnQ1lUdFdBajh3TUtlU2dwMVptcEkzTCs3Wk5PbUxFM0NZcFZu?=
 =?utf-8?B?L2hLZTQwQUZpZXJTSGdwTDFTUi9HN1ArWEtuMEJpS3UreUFMZS9sdzFFMmhC?=
 =?utf-8?B?VXJhRjRvRk1OSDJLd3ZOb0NQaTFEQjZvMnFtRURHZGhVOTBoME1reThhc25I?=
 =?utf-8?B?TEJhcDJ0OGpJLzg2clg2ZSswN1IyMlE1M0o3Tm5raE9hSUJ5NDFvKytuQ01P?=
 =?utf-8?B?dUJlQWtEWEtOQVpwa1ZUQnpRYmd0RUlWN2s3UXJpU3hxcTJyczlQbHNnZmxy?=
 =?utf-8?B?VHVCRVNHanE5NGRtdXNqb1kyOVNUblp3czU5NHlyOUhGSklYc1hGZU1nWWZr?=
 =?utf-8?B?MEYxRnVxNEx0MG1zNzJib2tTMmNVNHE5aXFTMUhWaEdRMkdTK1dUYXZpTXM1?=
 =?utf-8?B?UnJlK0FDUWVGUDYrcFZpL0ZpYSsvZzlQNkZiYjNNa3I5OENKTUV6cTh2MG1B?=
 =?utf-8?B?bmp0VHJlMnFucUZpTkdxZ3pudFBLSjFaeGhGTGNhVjhmNXByaFBoYmdIR0p2?=
 =?utf-8?B?SU1GTm1JSnVjY3I2ZjFwbDhyOSt0VE1VaGN1U1NSd1NUR2NLWWlEWTdWQktZ?=
 =?utf-8?B?KytJSUdjTHNWVkh3WXhMNkh2aW1va0xTMnNFdEp2ZEpEYThBZTJuZjhKTlVQ?=
 =?utf-8?B?UjQzZmFyUFN1dkJTNmJGZ0JidklFZDEybHFMRkVwQklpUCtPWVlKUVJsdU42?=
 =?utf-8?B?bjZFeks5eXp4cTJ1ckRzSXZMV2JiakZ6K1hBclE3bUw2VnNhU0ZuOTQ0M3k2?=
 =?utf-8?B?b0QrQmFJeHBhbTJsRlFoc05mWnVEcUw2ZjY2d0wydk12VmxNQ1RYZmRNb0Fx?=
 =?utf-8?B?bUtYUWpMbzZqL0ROQkEwOFBQYVlnT3ZmK1B4Yi91dGNBMmRIMVZQa1UwdERp?=
 =?utf-8?B?Z3ppZXlVT3plZkZla1hncy9BVGsvclppQnNVYzVsZ3VQZGo3dG5ZNDFHMlM2?=
 =?utf-8?B?UWNoVTBQTHJ3NXBMZ1lBeWV4cFNycFdFcDVoWTJualcyVmM2NnFaN2gvTDdx?=
 =?utf-8?B?R2NYZURBWVRqanZBNGVDeHVHRXF4Z0Y1aHlsemgvTnFyNWZkam1lb29VYTFE?=
 =?utf-8?B?SG54YTREcW9BdHM0RW5IOFdzWkN5YXFqU2xDYWpBR0oxR0c2UHU4NHFqOHU4?=
 =?utf-8?B?MWRDaGUwYlVRVDdkY3hiQUtPSGpicWNDbTVSK2p2aWEyNXB4QjY2ZnhIdUpz?=
 =?utf-8?B?RGRaOVJYQTIvUHVWd1N6OEVPS3AvaUpVcnpXcTVoVEZ0dlZ0dFhGQlVISXIr?=
 =?utf-8?B?cFFjclNYVS80Q3RXWm1FNEZQdWpJdlhKRnZqcTFJS2dlWFNCR05UelpkY3A0?=
 =?utf-8?B?ekQ1NnBBU0RrcnVkZjFQWkdrVTVwek1xeVBRM25SUVdicGJ0QTJBUT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db201bc2-c849-4834-2620-08df20316695
X-MS-Exchange-CrossTenant-AuthSource: CH0PR03MB6179.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 03:01:06.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfEfJvcUQFMx+8TPgpaUiCdImESthhYfj4rw2cb6TQFyVEN+Xvcxk37lACtm2lAqPc6dei269KcevmWe15EYag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7155

Hi Krzysztof,

Please find my reply inline.

On 9/30/2026 6:48 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2026 at 05:38:12PM +0800, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> The Agilex72 clock manager exposes four register regions: the clock
>> manager itself plus three general purpose PLLs.
>>
>> Add the schema and the clock ID header that consumers index.
>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
> 
> Where is patch 3/3?
> 
Patch 3/3 was sent here:
https://lore.kernel.org/all/d6a2a5026a6a00d0b7ecfae76ff299f5b9752686.1790661931.git.evon.chiam@altera.com/

I accidentally sent it with different threading metadata, so it did not 
appear in the same v2 thread. Sorry for the confusion. I will resend the 
full series as v3 with proper threading.

>> Changes in v2:
>> - Subject: dropped the redundant "binding" suffix.
>> - Reworded the commit message.
>> - Dropped the external fixed-clock nodes from the example; they are not
>>    relevant to this binding.
>> - Dropped AGILEX72_NUM_CLKS from the clock ID header; it is not part of
>>    the binding. The driver derives it instead.
>> - Added the clocks and clock-names properties for the four external
>>    reference clocks, made them required, and used them in the example.
> 
> ...
> 
>> +  clocks:
>> +    items:
>> +      - description: External oscillator input
>> +      - description: Internal oscillator divided by 2
>> +      - description: Internal oscillator divided by 10
>> +      - description: FPGA fabric to SoC free running clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: osc1
> 
> osc
> 
>> +      - const: cb-intosc-div2-clk
> 
> Drop -clk
> 
Will fix in v3 to remove the redundant -clk suffixes.
>> +      - const: cb-intosc-div10-clk
> 
> Names are odd, seems like you put here source clock names, not the
> actual logical names of the inputs.
> 
Will address in v3 by using logical input names.
>> +      - const: f2s-free-clk
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clkmgr: clock-controller@915c000 {
> 
> and drop unused label.
> 
Will remove the unused label in v3.
> Best regards,
> Krzysztof

Thanks and best regards,
Evon

