Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BB390CA3;
	Wed,  3 Jun 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500951; cv=fail; b=CvAx0CnH8ketMiQMqEAbyGrgPZPrs5kboyJfUeLopkTrjnZ4evIJMkWAlQ1FbU8UdImZxt+kiiIfvU2NjMMG4ms/VK+3yJAa8LUe2NaFsiokK27s0pmftNrGeEjikHyRslIOLxwWuV9XQjLrc5ag+pIZKuhX+AZoa57k88L08Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500951; c=relaxed/simple;
	bh=7897M3PSbxvR+ZXXP4vn3pvHE2kwCnMg4gHT4KLOBMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mTJsZZ7qGHKOqtj/arjFTrPnk9W7wtYsFJ3p5B1eJ0NZ6XYn3tRio/06Molmfx3+Yw4z+qecm7/jtQ+xdB00UYO/R513AizB2B30crVw+zFkJanYLQbG4ihlyzQotDCdGwXgwQjnaa/00robJ2Ps1tzqy7er6a/OL4kE3e+pC0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GHmO+wvt; arc=fail smtp.client-ip=52.101.48.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GHmO+wvt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaM0fFkhnyNAS50RxCIxTUb4fynZXvWZen8AUoTsM0HOZGFn5Uz8rupUatVXjz0x44nu8MQdDgCQZnPUx13C8xQfFK9sh7ttDKq+00IRZzIRHokD1rH4oTyCqIYHuyEojR3MvOUs2knK/gkd2U+PUcyfi2M4Lu8etsp3S2HIZCP0w0Ny3uJB8h4e3Je2DgYw8VDSIo1NdzhIAbdlmGAklDDmVsV1JghAPZ5UKtwx5h8RvfhT/+z3wyfex9hNNQj3yV08WbawiSQ6wiNwOa1p4eQkgcKgRPeape6SqCByhbA1VvLoA1GHJKpupdoyBWnDzIZkg+lfb6+helWCqEbEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh6RsM2oy2SBI7aOEwoKVJAiEgTGQJ1LiBlETQ+PLoU=;
 b=L6GJGBrs1+mYWNCwJ5ltINAHMRj+QWIZvchM1KjI/UqZCFX9DB+Zli8HRzNBfqiH3WvPbg/6mLZ3s9mUcqs/GdV/DyvfYbwTH9g+iwQH9cUbD3xSe+K/RkhrVJDvtxBL+2bZArJiPbAm8MbgmDurLC1Yx1eMsrEqDSUk58q2Ztu6bWAZWMohnzvQoAK1WIdDSPrkEA4s2lg1luf9AVX6wp3fkk4O2UTd/dK8ihr6AbHBFlnvx90p5rEjzpdrRz74+LmDPDWHeGq7/eGmiKAFyCs4zcy0wz8rbWHNV3g1M2zObnDXO1pSWNDHPdE5kSLyM4aP8NvGgAcgSwHK+Yhvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh6RsM2oy2SBI7aOEwoKVJAiEgTGQJ1LiBlETQ+PLoU=;
 b=GHmO+wvtTNnr+JnLguPopqeJGWUwNOhqHQiFqNwsY4BWNjsoN/1ysQ0TbVC3nnHLOUZ1XWHTRyPOeBZcjNFp5Cv0KHqC8aCLsqg0uQD/v+Bc1iQJzUpNNntdAOgT8FIi/c9xTb9nRz1SFIskTPyBe5N1XB2SbKWQZLsadIroWos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 15:35:44 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 15:35:44 +0000
Message-ID: <c33b3684-bf96-4c2f-8251-9ac7c1444c3f@amd.com>
Date: Wed, 3 Jun 2026 17:35:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index
 range in clock-names pattern
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
 <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
 <20260603-catlike-uncrushed-b98b66dc92c1@spud>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260603-catlike-uncrushed-b98b66dc92c1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: aa949078-7c7e-4aa8-3ac2-08dec185c6a4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3WVc6UV9e9hFS7IOjIcRYX+Wj/HE3GRzJuZMfsx8ROmwPj+qeMdWgctCatEfPPH8SG/ct7EFQCjbCU4Q+O8jnHbKxghja9zEW0+JHqGAvjiROyIKNcClI2jKiZM6fDmt1OMP5+nJfvkXqnI62B/YLcSQgHaLx5KkV1mVtLQ5DjcXGnITWnl1F4f3MbMy2wxE1EtuZYxnxog2Qb/jpHvfV1bUMJwISuxhb7NR4Ae+TZoEKMiK3Ezh2+yk9vc4U9Vnmw5fWd7zgfKA+lzMAbLJ4FoWAgy8SyZ/ckmx7cT6KPOxqwId1o3Z1iA2oTz/UfIS00+q0gKvgQz/+FPZVNNq2WGTfFvo9wNcD+WrxQWOsVnevk1DEDoG69owmW4QoG0VmDRyqLqDdGtwd8KjDmeeSrnPND+wQIsNRuyw5NgB4uUXXR9PNlL9X0HKC49CflhvVc/lRI0xB7dlA0EKCNn47Lbg8mEogNVIm4TgNbTbl9T0HKmS72nesWB01xHo6VGBD5TeUTWGFfpgurh4o2Xxjb2vhUiK14e+sny51kn6YPa+lxWqoJNzSffcEXtxnHa4QBk3s9Rg75n3NJjFPxzYLwtRjcSlQqFMYEIaaorKULkTEoO6vgpBnuKmA0YpwfCtJF6ChOeJmd4/uLWS0zykXqNS2MapTln4GuHj6/3/qSIFrw+eVxk16EoWXsTapw5g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXRSUFUyMEJ1ZXl4L3oxVFQ0VG9adXM5SCt3ZCtoTm83Y0NXTWVnaHJuNTNC?=
 =?utf-8?B?YTFoUWNkVFZHZWNNeFZvWk1EY0ZKRERuWnliZDZZMjJuSlBLU0J5MWVZenlS?=
 =?utf-8?B?alNmUys4d2JKbDhDY3FsRm8xOXBaR1FxVUFoV0lrVUthVU1MTTlMMzgvYWQv?=
 =?utf-8?B?VG9uc0p0ejE5ZW90eHFtVzVTSEJlUnF2TkZxL2Npb3RZa0o4bVllWnhRWmhK?=
 =?utf-8?B?M0lBVGFYSXY1WDhnTXZ5OVZpSklQSjJiN01IOFBJRVpBQW0rQ1JkaXBzbnlp?=
 =?utf-8?B?NnM4NUF3QUxuYmtTU3cvS0hHSFVPVDJpcjV2dnlaMnJPYVM2VjBVcU9ESGs2?=
 =?utf-8?B?WkJhY1dBaGlYTUNYSVNrUVdTOFNmVG5CZlI5TlNzd3dTc1JqdzBsb0FKa0Mr?=
 =?utf-8?B?azI0RlVTRG12bkc0RlJBY2JFU3BEekVxV09HblVaWGJpbDNHcHFOcnRuZ1pa?=
 =?utf-8?B?KytCWWtvN3JzTldSa1QvaDJkUmRDMGRwM3JUMWltUHZJMkVVVzUxV3ZzQkpk?=
 =?utf-8?B?clFlZ1hJVC95THptb3FUZ244ODRwUTZoYjVRVHNFNXowMFJZL1ZvL0FpOFQ2?=
 =?utf-8?B?S2p3d3RtMUdwQXhzeVJvbVJrR0FKajRTd1BZOEEzUmNUY0lCSTU3b3dOL0Fm?=
 =?utf-8?B?TjE4SFAxTEtEYUEyQm90c21BMW4xYUE3RUZKWk1WUmdPRkhiWkpVVzZnKzVa?=
 =?utf-8?B?amJlSGpCVGVoTitDV2w5V0d4WFpFMGR4ZWRvM0hWZ09iK0RBdFpRSlhwMFpU?=
 =?utf-8?B?V3VHSDVMREZUbzZ1QlNEbHJpQ0tDSFY4VUU0M3RnazR6VCtLRnd2VC9qSDlF?=
 =?utf-8?B?NGxLbmNjVDV0Y3VzSTg4OEExWnlWY2FoRG9SejN3dS9UV3k2S0lsQ3VrclFK?=
 =?utf-8?B?MWthelF6Y1h0Vkg3U0ZvQzNCV1NYVWRIRHArdDQzbHhxc2Z5cDZjaWhUN1hI?=
 =?utf-8?B?V0VvWmQzNGJnczEybzBIdkZFOUtHMGhzK2FVNzBDVzhTWFdkNEdkRDA4RVE4?=
 =?utf-8?B?eG51bTc2WjJlRGxJampyazFaWFU2MVFHYldTRnJoeUQ1cFo3Z3BwTC9oSnVE?=
 =?utf-8?B?SXFLV2lQMmlLT09jc3RoUzd2TWR3cFZkakFTLzgzWklndWFhN004YWpSRWhs?=
 =?utf-8?B?eEFDRzJ1SDExRlVMbEIyYXhIVXFoSENLUEgzYUZHQjZYQmdpcm1GL2hpWXNh?=
 =?utf-8?B?ZHB0NEhna0ZJaTNwOUxXSFlkS0c3NTdLSjJQbXB3bjQ2UjB3UTI3T0l1akkr?=
 =?utf-8?B?dmtBSjlpUHdkdUozdFN6aDJabkRNSE9mUmFTMkhUZnJqeXFiRStzRHUrcGg2?=
 =?utf-8?B?eU4vTFNacGFZejRKY0FBN2RFUFo5ek5LMHhjcTFNRDIwZFZ0bDV1VVVLNjNO?=
 =?utf-8?B?QUsxTW54MiswcGNmK0FWaUF6c21SSjFWNlZkWVNDSE9scDFCV0pHZ3hMamg2?=
 =?utf-8?B?OENGNnFBT1pRVi82WC94WWkrU2FWRlpuM3FFTjJaSzFpTy9RYW4vcE9TZzBh?=
 =?utf-8?B?OUhQWmxxN3dNT2F5UzFlcnNxRFNaYUoxQ1NVVEtTVTdBaTh3Qk0yUXFPMUdG?=
 =?utf-8?B?T0h1Y05ONEhuZW9qNTdkQ0R1blRMKzBNbGgvdlJFdDRGQk4wcElCNUV6QWJz?=
 =?utf-8?B?S1ZTcjVZNzdMS3hCSzRJN0h2Z1pkQUdtSi81TjB6dDRFVFcyZ0l3bmNmQ0Nt?=
 =?utf-8?B?bU1SaFFVbDRUQW16dmRGdVB1bUswNWFEQ3dJTVJ1dXNsaW1PVU5XbDIzVENx?=
 =?utf-8?B?ZDZCaGcxTE01Vk5JdlNKYnVHWHRlZDJMcWVITEJyd0JnczM2dmtQOG04RTJn?=
 =?utf-8?B?YkQwOVBEMFNWR2tsMEpXVXpYeUZaMGppaGhXMFdWRk5rZmxxc1VlVkYyUmI3?=
 =?utf-8?B?L1I2eDJWdG1ZcEFJaWNoRThkbktQYlZ1OUhZRlI4VTFPVm1aemF3UWNEY24z?=
 =?utf-8?B?c0NYeDZaRmRlTkR3VXNyMU9vdzJyS3JpYXJUZHVqdW9oamtiMW54bm9HR0Ix?=
 =?utf-8?B?ajdFK3UxeU1KcWxQYm5XNmQyUzJ3Q2tMa0JTZDI3U0daRVl0bVJhZ0xXU0NP?=
 =?utf-8?B?RHlndUtGNjBDaTZJUmszbHdwOUdHdXgrSUptYTNPK01KZkpzQ1NVaW5Jd1B3?=
 =?utf-8?B?Zkl4emtxNWRTOENxNTA4TlVLNG8yZzNxRyt0YzNveS9LcWFzY09Nb1EwVkdD?=
 =?utf-8?B?MklGckhwdVlGQ1ZtMktBMmNSNDFjL0N3akczdVlhQkZuUjZ6d1VJKzdpbysy?=
 =?utf-8?B?bU1FVDBWL3JGUmYvTDJXZWpkUVcrSk56TmxQQUxzbU1mWEVDU2NCMHN6bkhH?=
 =?utf-8?B?bXJYeVl0R0VvWG9iOVhLVlpKeTZmOGZIcFpwTUw1VUlLY1RHaXd2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa949078-7c7e-4aa8-3ac2-08dec185c6a4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:35:44.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hPgsiqoLWVDKYs58y8K2BuH9f9xH91wFBda3nPEC4sc+Z3WVymZE1r6eVSQEdIU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272



On 6/3/26 17:33, Conor Dooley wrote:
> On Wed, Jun 03, 2026 at 05:12:07PM +0200, Michal Simek wrote:
>> The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
>> the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
>> but a regex character class cannot express a multi-digit decimal range.
>> Replace the bogus character class with an explicit alternation that
>> enumerates the two-digit decimal values 00..77.
>>
>> Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml")
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Changes in v3:
>> - New patch in series
>>
>>   Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> index bef109d163a8..d843d95801b5 100644
>> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> @@ -116,7 +116,7 @@ allOf:
>>               - const: pss_alt_ref_clk
>>               - const: aux_ref_clk
>>               - const: gt_crx_ref_clk
>> -            - pattern: "^mio_clk[00-77]+.*$"
>> +            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"
> 
> What am I missing that prevents 0[0-9] and [1-6][0-9] being merged?

correct it can be put together [0-6][0-9].
Was playing with [0-9||[1-6][0-9] or with leading zero and decided to use 00 as 
was intention in past.

Thanks,
Michal
