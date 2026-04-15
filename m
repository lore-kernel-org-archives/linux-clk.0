Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023126.outbound.protection.outlook.com [52.101.127.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A71EE01A;
	Wed, 15 Apr 2026 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776255681; cv=fail; b=OPM7qX5o357TuHQ6unW9xOIiCjAeV8TgU7ZLepM0wGJ5AXfQ2xWvK8Qn9+22IBF8lzpZlApmuhUrMe8HEFG4+WXyuR1rtTP7iVs4jQdhv8szYmZ9r9n/1nhIkATw/96zjqvW2X2uvvrgNO30+sfOWaBRHOCWQ8+p0FsycgpWPys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776255681; c=relaxed/simple;
	bh=p/5MS+FUzb5SRZyDVRl20an2O3h15+maDYPQyCHQmRw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qt9LIuIFiaauaIQnk9IAhnnLFWAvf3mC37gpRBYhvzLNXfSAa3hFUjuKS90UsBVHYyOs/6KmPOzITQ2c1VvJ6f5q7ZgNV33cWd4ZP+6/PtSrYCGhbc5Qi7NFLt0Wo79aYNvyfOow3NnmJqtMH4/CCExxuzvfGBftRvY5EDSKiPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=cGunU0Iw; arc=fail smtp.client-ip=52.101.127.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="cGunU0Iw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS+DSfXgLhFQb1ljFtU8SMMB83Sq2mw+LZBHIvD4hcGdf/8BJQkxGISzqv7/BuSDFcK6lBaMpv2S04dp7wDFt6K0qdDoqxrwS3qRnj3gdz1TxlXXyYOu1459TOD/kZc23iRmuaBxFcv6333tMuTkdW/ueUbsFxuIp3/sH9Ampa3CRTuy2vOIuelJvUwGsIxkHW7nojkYEZLuKRO3e5GA3lQfdDQahAnnQ2OH2Fnb5NZOjyCCqh819gR4upuhojB0WSQ5ACaKbLPDDvOiAdEEzVdLSfmzB9hImqKcWxTwCnj8cE5tHat9Ao3UmDXac0EKBNKMuUBh33q7vXaTBa2qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kanCztwFxnfQeikbXabPpupCn4lUt2Ah/wBMFBFb4g=;
 b=qrVxZ/+bvyJxrkPK5JA5PlzAd7RXDNRmLfSf4gO2aU6KaOa2V+ZkzEgFxErovn6MlllBZJ1PiMcysNm4l1hXsTudZytUCjOaqfk3RkZ4J9AvYsb3L5E6WbmwTF3cZOKnzZZOpm8OerlNAgOPMaA0JJI7D/jyOoEvq0kNYE2JPVGTXEPSKPTyFRDCGBRRAKLdXHZ27kiefgJRPBTb+mZNVo7ykOFSo/mvtJQRRqc9fD5zJj9FLazWEO/Oa2IBP3ByASTk2UZxE6pwE40kWIIvyIWEzKzjBnMwkAkgogvksB0a2EptcVLPV0/JfbvZGdAB8AVGcp4VK+PqVJ7/pg3IqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kanCztwFxnfQeikbXabPpupCn4lUt2Ah/wBMFBFb4g=;
 b=cGunU0IwB1+tOMTiEltfdCosoiHrg1Ie7pImgBgyZrrLTWJXPDyRzeBOQU1eMO0wqN0LyZccuXv0o8brEatcJKF96Hj/BMrdIbTjuT2MT9TrVyfDQkO1K6ePGbn30bQDDLWZSO/CEMrdoa1SqdY24jrwnuGsVqlP3CtkLk6nShjyLy6PxHfJhh21jocGbaltsl9C/A+Y/JWPJi51n0sSCJn0gZkIyCxqGjjbiPfgf+cBVIznxbkGokl05d/bjwTamPijcHiLvVqLCcL9T/a9QwhO1r+AdWhX9xDVHIQN1Cy/AHNjSefuBlEx9btmesMjOIK6jOyYeF2YvZRdB9s1sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7773.apcprd03.prod.outlook.com (2603:1096:101:130::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 12:21:14 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 12:21:14 +0000
Message-ID: <af833107-1fdc-4bfa-869c-8050c2a35478@amlogic.com>
Date: Wed, 15 Apr 2026 20:21:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
 <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
 <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
 <1j7bqhtkyt.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j7bqhtkyt.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 4444f5ce-3fe8-487b-8a69-08de9ae97cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AgcOQGasxVeYqRVg/ozKYKhIpsrL6TtTo+UoA/4HEEOYFW89ZBBuZBysRnuAPzXrlvFnsDEAY/o5Ze+Bc7ZFZPL7ueAhbMrLH01WzvBLNGiBgRjOEnKmquqpVW6baYabEQMGI7esbrabbQowhxDvL5XsO0bq+iY1ZvzLfp5RbTWn33sGtIcrfLDJRa1AefpJYZkRM6GNDJV5aH/FgGtbGOrEj0tXfCIO/2Yqp6ZokcrFNxA4RC6lR0CQy2tQaztvkR7XKRyIBffyCQuRHd/4d/dQg5uqElaWP3SIJStXtr0Ul9mrGOAxe6ZJub61oi4QocKDed5gAbw9YNPTB2N/CVWf9v56SSWqJBpzGeFpKN41N2q1X2q19MXzMUfIE9biUXvBv0U9T+4jcKuECmOuwfo7f/LbM2wehMEYAoTJuykLi38d1lNcKoxrjL4qAYaJE2mQ7s+sf1svxis1BBoY7xqbjDrU1H9djNylI/+bbIODFtuDawImMV1xBG5uyiB6okMdekSSCtJ5KdG32iTJGxr013WIspnUPE/dso/R5gtWSyjlA2qGpjomI8nTMgonr4Hrmdx43TTtjo4oyQz8E/ERAUtSgH2sp6Ab1dGWkg5KxyLiGwintp18Zkyv+tdgFkJR4Rz4xbNdJWLhLun4uo+XnY9XxlJZBE3objH/wIqNvlKbOnihw7esQGCLTytupRNhZkmCbpQODTKLWX2cDDiIOKm4YMiM7Z8CTjDBKYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWVqWDMwMXh2dmNlZjJLbE9sNjZDQ1kydzlYUXhnU1ErYmthZXQ5MlpkRTVN?=
 =?utf-8?B?bVJrSnhEODFuSkhDdHprQml1c2RiV3BCUE9xWUM2ZEoxbDByVHRjTUo0Tk85?=
 =?utf-8?B?aVlGNVpzU25YdjRzRGtuS1F5cDFlMS9pKzRXT1I5bXRoNEdjdXhZM2cxNEFT?=
 =?utf-8?B?UmN0RmEwdUIrWW9RampyUENaSEs5ZS9ZQXFibEI0em5ORzc1ajV3ZGZwZUJI?=
 =?utf-8?B?cmd4MzZ5RVVCMlBFb010UitOUlhsQzV4UklWSHJnbnlQRDJPLytaZmp5YnlL?=
 =?utf-8?B?ZlNIMDQvQVM1NFdJTGhLOURNQUNWOXc2UE5LTXVmaW8vc2t5TE01cFdjekN1?=
 =?utf-8?B?cnNkbXEydkVXNENUWDR6Y0U5VVFkWHNXOGdxV2k1dDkrc0Nhcjg5U25BcW9s?=
 =?utf-8?B?NitBazZYK2dPYzJoVDIxR01Da2Q5alBLM1ZsTTNWalBwMXRPVmlGNTlzSkYv?=
 =?utf-8?B?VWZYZzVocUNLYnlqTGkyN2RpbTdiTTJBS1pFdlFRVFJDS0dFekEyenNlbklw?=
 =?utf-8?B?dnNFN0FBdkdhdlUvVmowZ2krSjRYUU1CSWNvTVRreFV4MU9pUGpHNDd2NGNK?=
 =?utf-8?B?bnNZN2J3ZTN4cmpjc3RkMWlPSWNISXo4RUQ5YzQrZ04zTkhmZW0wNFNRMk1m?=
 =?utf-8?B?d25NeThURWZ0NXE2YXQrMUtqazZkellZaEVlYmQvbTNRN3B0UzJpdnFhd3dR?=
 =?utf-8?B?bHhJU1RwS1Bkazgrbi9OM2QvaHhYN281ZHFwemtaQXY1WTNNNTFncitjS21D?=
 =?utf-8?B?dHk0U2Q5eC90MnZQaXc0NVlmMGZadXhvZk02TXhxT3NvaGVCYjdTdWMyVDgy?=
 =?utf-8?B?TzhwSkpSVm55YitVY3Q1U1U1cnZ0dUpvWXl0cC9qSEYwUkdBZ1RFMS9HQWNE?=
 =?utf-8?B?dHhXSnRuVS9GNTJiczNNM0lyK25HcG4rOG9rS2NzWVpub2NHN0hqejNjOC9h?=
 =?utf-8?B?NGR2OHUrUnpOKzVBTi96ODUxK2NEdWtzTTNhQVVTZFFJcTdjT2ROcUNaZ0pz?=
 =?utf-8?B?WWc4Y2Z1R1VSKzN0WmUxZWdiYURTQkJyd3p1WkV0NngvV3ZLamJWTW1zNklU?=
 =?utf-8?B?d0szWHp6T3VtLzA1Uk9YQUhtQWFtWFg3NjZ0cnZRV3hwd3NKRENUQ1FTckFy?=
 =?utf-8?B?TCszbHljZ0hzRkpzck9XcHlGeHpUaVBQL1RTZWp2T3ZTMlpPdjBONnRyTUJS?=
 =?utf-8?B?NWZqbi9pM21FQk9Ob2hQUk96YU0rV2xVcUp3N0hMQnk5TXc2Z2dOUDhzbTZB?=
 =?utf-8?B?bkg5Y1E0VFUrZ1dTWFdNM2YvNHEzRFRSSm5sdHE5TDE4V1RucDZWTWczZXh3?=
 =?utf-8?B?Y29sRFNiNnROaDdaQnRuSnpQUEp4VUFndmhKM1V2L3c4SHFHZjFSMi9FVzNn?=
 =?utf-8?B?RVBCeE1JQVVRbWlFZU9rMUlyTUpUU2dnRVArMlpQSU83KzNncERCeEFDV2ZC?=
 =?utf-8?B?UWhWeG1teFJNRTA3Z2JTd0ZwWnN5QktIdVY4Mld5RGtITWpPVVFVazdGTFZa?=
 =?utf-8?B?Z3IyeVdRWDM3Z3lyOVp1Rjc2d3F1Vi9jajFsaXBKc2QvVHFDMlVVdlpNYTQ3?=
 =?utf-8?B?RmtWbG8xQzdwTlJ4U1pnbUVEdHB3ZEFHaHJCRXYvN1I5Mzd6SWszNFZCUEZN?=
 =?utf-8?B?bi8xbC9ZaExkT1pvKzlPbjBKcTJwTGppTjhMN0lrTU1GWXlzUzgweFJxaUxL?=
 =?utf-8?B?MUx4NFFFdWVzd3lHMC9raitoejhxNHArMERKU2tQR1BPS0o4WGtNWHl0N3VK?=
 =?utf-8?B?bmZFNHRiTEUzNjNQcytDdkFRaE1tVEs2Tkw3VkpVUTJuQnlRTEdraVd2RlJO?=
 =?utf-8?B?SHBCckphbC9vMExNK09CUm1MbzdpWUQ1ZWtENmRJOEEwa0QxdENVaWdGcFls?=
 =?utf-8?B?a2tYcmp1QzRvWkhXUlFCbUxkK3VIWHMwWjJVV3JhQUhwTzQxZVQySnNGMElJ?=
 =?utf-8?B?RVNXb0xMUGNsZWk3NWhTL3pnS2Nna3FUamNhNStIRnA1dm1UUWtjbHZjSVRG?=
 =?utf-8?B?UXl3aVQ5VFFYSHRua2NUeDF4blFtV0pCRnZrM3R0K2hocDhlOHdOYklPN2lJ?=
 =?utf-8?B?eWtPMjd6bVRadU83bzF2RnZuTDdleFNDWnBnSXAxYjJoUDhMSERPdDJRWFJ1?=
 =?utf-8?B?dlIzWlJDa251WkJ0bTFrS0dOQmRWVmZ6OUdmcC8rU1hTTFNlY0V1aXpxR0FV?=
 =?utf-8?B?aEYrSit0YjJUMDJ3YU00R1J6RVJFcUhNTnpHSE1wN3FuZFdFUnhIa2c5RkIx?=
 =?utf-8?B?K0hkNkQrWjQ0V1dPeEhTVDYvNUZLYVY5U1lMYUtGSC90L0ErN0VjUThsdTV1?=
 =?utf-8?B?bmZYM0tVSjExaERCb2ZQY082Qk00ZDNPUjB1THgzblhJWHd6ZmR3dz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4444f5ce-3fe8-487b-8a69-08de9ae97cc4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:21:14.6109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klrfxLyGkHfb/jGs/ayZxT3zdDej7H1vo0NxFeLR2gkXGmQcXcxKjFWVzkSt58epK4WkLMDncbUHim6lIdIfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7773

Hi Jerome,


On 4/9/2026 1:34 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On mer. 08 avril 2026 at 22:32, Chuan Liu <chuan.liu@amlogic.com> wrote:
> 
>> Hi Krzysztof (& ALL),
>> Thanks for review.
>>
>> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>
>>>> Implement core clock driver for Amlogic SoC platforms, supporting
>>> So how did all existing Amlogic SoC platforms work so far without basic
>>> clock driver? Really, how?
>>> You are suppose to grow existing code, not add your completely new
>>> "basic" driver just because you have it that way in downstream.
>>>
>>
>> Firstly, apologies for the delayed response. I had intended to consolidate
>> the V1 review feedback and come back with a clearer plan for V2 changes. In
>> the meantime, Martin has provided many detailed and valuable suggestions -
>> much appreciated.
>>
>> The original goal of optimizing the HW based on A9 and introducing a new
>> clock driver is to reduce unnecessary complexity in the driver. On A9, we
>> optimized the Clock/PLL controller HW to simplify driver performance,
>> complexity, memory footprint, and reusability. Improvements on the HW side
>> can also help drive corresponding enhancements in the driver:
>>     - Performance: Encapsulates sub-clock functions, reducing call paths
>>     - Complexity: Standardized register bits eliminate a large number of
>> bit definitions (~1/3 of original code is defined register bit [1])
>>     - Memory: Object-oriented design avoids copy/paste for repeated clocks
>>     - Reusability: Same controller works across SoCs without driver
>> changes (or with minimal changes)
>>
>> The old meson driver required compromises to unify legacy controller
>> characteristics and driver styles. On A9, we want a fresh start.
> 
> I thought I was clear on the cover letter, apparently not.
> 
> *This is not going to happen*
> 
> You've provided no technical justification for such "a fresh start".
> 
> There no reason for A9 HW to be supported by different drivers than the
> rest of the Amlogic SoC when it is quite clear it can fit with the
> current drivers.
> 
> At lot of work by a lot of different people has gone into stabilizing
> and maintaing the current driver. That's valuable too. If you are not
> happy with current level of "performance" then make your case with
> actual numbers and submit changes against the current drivers, making
> improvement available to all supported SoCs. That's how upstream works.

The new driver is intended to reduce unnecessary complexity, making it 
easier to support future SoC clock drivers while also lowering the 
review effort required for adding such support. It is important for us 
to have the foundational clock drivers supported upstream as soon as 
possible, so that other dependent drivers can proceed with their enablement.

In addition, the A9 clock driver abstracts clocks as fully functional 
"CCU" units. In previous SoCs, clocks were modeled as discrete 
components such as mux/divider/gate. Changing the abstraction model in 
existing drivers would likely require modifying clkids in the DT 
bindings, which introduces a risk of breaking the ABI.

I respect and truly appreciate your contributions to the Amlogic 
upstream ecosystem. Based on previous problems and current dilemmas, we 
hope the A9 approach can bring meaningful improvements.

> 
>>
>>> Best regards,
>>> Krzysztof
> 
> --
> Jerome

-- 
Best regards,
Chuan

