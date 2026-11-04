Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783240;
	b=W7gQxY+us4NZ0YSrDRdLKXeHDyAI+b6MAHS5MKz7s4qq6CZPniXOX5ksKm5GnXulTDiL
	 RK6xfM8Dv+itlYxbT8hMNH4INxWzmv9fRsRS2H1JLn56l7adjtq4821lYY/B9SA98Y746
	 k8nSNQvlQjJpuCBYmXd3VAALSC+Dj+gi+rodzjJCyLSeD2bMfNLPHlepgLHNtqMUEyw6j
	 gK1RR7hX3an9cqbt4yTBMIy2GYzkfT7VKpKqUb57kTXVLBdYMTsbqUlQgWQOj459zBLBv
	 o64eHIXKrbRC6T4SJyWaRqrbzGYx8xOqI4ClYLiuI+ic2YlfB0vS9GVi6uzqoYyRwdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783240;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HICuV7lH3pDXmPd6wqQKVkamtD0Plu+bx3wEdAw08no=;
	b=152YMXNb/hDwWJUVgGFGn983MVAAV/PCvcxQE3cw/75jdZRiyDVtoPguTEkLLWy1u1yQ
	 xs9I0kAzyWjQOGPh/eFKuwlLclc40p3j+msz6uy4EUGvYhNAal8zgeITdS1TeJhxUsUw5
	 bkgE5ajGmhl+ZBWydaW6aTRY+P0WeigIN9H5DnSphi2uoYQ+wPibT50BTjSAu4nG1ZLbm
	 WixSzCtb8GtL71nwJ6U/IOOmaVbUejtjKCsrVIcRrZ+x6hX9g/OqwvnoQlWoIJTA6o6m3
	 gumdRLdvxGBjPqBnVn4t2jV3tKQUPF4u/W6lx3hiTajizIMyDlAoI1ar+EOxnNcVV+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Acb0NIjk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.91
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022091.outbound.protection.outlook.com [40.107.75.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BA4606A31B;
	Wed,  4 Nov 2026 09:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BA4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Acb0NIjk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+B6y9g/nkO2Xk+HLxxhTdgFohFz4RMdN9Q3/ScC1C+LAyek1LuLBh2eKj6dVgEkT5OBu7uNwFQgPLlmX9kpUoX60KPA1NIhqj5n16BeOLTQHN4Pj6bTd07NwUU+IDxPxA2SxCBd76bsMbKkZZf/DAMyoEtFmW0IcJBrzB8WrTHtbZoBACeL+L1Xg2gPPLHy9vkl4D2yQNAFG3noIb+DH63MEimV20OzaH/vmK+RmN0F2qQddFYzBgkLUXoAsFG0NLRviqC2bWhZzTliGW4WJCRSFtdXC6PUhzyVc966VHRFoPpsoEiqU8BX5leqny3AaPrHy5d7hF5F+2ES6IVo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HICuV7lH3pDXmPd6wqQKVkamtD0Plu+bx3wEdAw08no=;
 b=D4lwVnS6Gnq114u499QtReYwAtiPkepAXlrzkwzWbiVgfwRyflV/4nPOWwE85xDMSyjdY5ZChjv1Xa4FUvHVrrWO0Fhgx/fnlTX4vyxL1aXWpWKkTPiJDErZXw+mtCzuHSu1PHc87+Wfb6+y9Xn0S9IrBQYX+L3lJdHrZLMLrekq09PnOHvEvehAlXGzdkRAffBz+mU0iOmAew09ZyDkZH59k4aolgGlq5VH20JwJZCGptPDXWjT/8yqxXeqa7BqaXHmNCSV8+VCVYhcSfm8Bc/BUIzzWn8ucIfB6l5O9wNVPq4NTxcXi/W1cXFSqkPsGIXza7rFuSraLv5CQWsShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HICuV7lH3pDXmPd6wqQKVkamtD0Plu+bx3wEdAw08no=;
 b=Acb0NIjkxGNU3AYaBsg1ZMgcuJRrpPdDhz7VGGrPj5NXgr+sJqt+epuBpGRCJ+UbnXhSaI7hx1wHH5e5jgB0MWVNxiivZlj6VBTzA+08b3OxALVCiW1kbxhBykDJAAwzaBM+1UO603xuXWdsgwgAM5er2W8dwzRYPZle7usLIxuN1AZVjNMUsqbh6757toOvizA4123ae3lzItOO6kRtqMtoBfOwFUhrgeoyOjgTnAX9e23YqiwWFfgW1fGB/G/UXbJI4+ahQ+7JNUKJmQoyEZBbpbHlKYoEM1N8FMTtIaDTB+xVOk4TEUmlCHq/ZbWbVI0qdnLls32XLQwxJInxgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB7507.apcprd03.prod.outlook.com (2603:1096:101:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:07:14 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:07:13 +0000
Message-ID: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Wed, 4 Nov 2026 17:07:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <sashiko-outbox-189068@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0131.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 67941dd2-c96d-41fc-c893-08df3a530407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|261022105027099003|5023799004|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261021121427099003|261022075727099003|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	CWSL1/0g73kJjyEEQdKsGaeciR9bHLbs5YVynNmumT6sc674vkYoMYwCHhTwl7ejR6MvgQqpMVLtRexv9sqQtHj4i13rqRnfFl15QNL6XUwN3rvndOHSLixLUD4ijL89EFpRB7vuF8Ve7+DQWPzHttCaMQ2KGsRw6aCEHDFa6B/aZrKA0lJIdhzhhoK83chr+qOq+RAC9MJbuDV5NzM9xSgyjt1J80ZQusFew+CXR5h34lsyX5LwyLQsHT8hBQl1ZR61b3AT7zuYURSg/2n6CwVL/qx0xYbOp44m3LSItuERxycRGo/uZRyZuv6+/ALzH1m33p7Nsh6bIi4/eniuhXpc+VVbTYQrcTeOWPAZC+S2VPw1ZoYHJ+tUDafKNB+MbCdSDu+YEoC5aRO2wTKWFvjpn+/aw65QqoZHgoN7wpPQ2DT52oOoFGOWL9C3Z4AF7dJTWY3wKOt+P3XCtS1KCon+F3BhEldRb01Z6Qg16neCgs14YN4Ls6gwKK5byQBchZI3Znjw+ei6fYU86C1r0Nl3ky0uSgtzhXWdomk+SChvoaZXZEpR+O1DA8L1j+Puzyj9auEPfAFWKR0CKyPhuix/m9o+jSWJcoOaGpfkBns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(261022105027099003)(5023799004)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjZnZ2pVYnNSMnFvaTZweHhsQVFJM3ZqL2pXZ3hLaW80dWx4b1JSV3ZFU3E2?=
 =?utf-8?B?aXd3OUo1QXg4UCtBT3FNRlpUbEpFc1lSaHZpT2l0ajZpaFNaNUlaenYyVlNY?=
 =?utf-8?B?VTNPK3NlM1pmOWkwOXBwNS9wdFhUMzgwWlo2SDZ3THdaekRHMHNkSkIza3R1?=
 =?utf-8?B?NEp1RTdTUlN2UlAycThhV2R2elFHRit4dmtZdmdrYUpMNnc3MzE4eGhlOEZq?=
 =?utf-8?B?bjdud0J3WHRGRmtGTXVacGJUYitoV3RTOWtRKzNzcDhubnhHZW1RdXdyRXds?=
 =?utf-8?B?SWRsUzRvM29EcTlpVXM2ajdldnFIbkZpajQxbkF1eDVuL29EUFhsUG1BMWRF?=
 =?utf-8?B?K0NVREpuK2piSWpNbTNvZDErSHJOQkdMTzVkZHFxOTJWRVRmdmdSa1pRR0NT?=
 =?utf-8?B?TW9EMHRHTXFlamZSMXRBSGNJZ3p1MkIxRkRwUU9kUEdYQ210RGl2dUVnZ3Vs?=
 =?utf-8?B?TG15UW9WMjJzSHB0RnBRL0JXVXJ2azB3d0JHbGpoTXUra0MycUgwRHBIaWhn?=
 =?utf-8?B?ekNKK0pucit0aFBJenBoSGxRTDl2bnZFZUpEbzJiWnpFMktYUCs3M1daeTR1?=
 =?utf-8?B?NHFTWVhQKzJUNWFSQW5YQzk3TGdONFRqa2pYY3hoQk9qYktueXpJbmswcktm?=
 =?utf-8?B?cGlKMCtYMjFVR1o1VDhLSXNsZ285WWs0N1gzc3RqV2dHVXJ0aTA4dmJPRUdL?=
 =?utf-8?B?ejA3K2orTlRwemRaSUtmLzBneWdnd1RKRHpVNDlScW9hNFpSdlVlSkxhUDFr?=
 =?utf-8?B?VDJYODMwUlRHaXRNaFZjejNGS25oRkpKVU9pZmFvRVBYbXo5NVJ4dzRraVVR?=
 =?utf-8?B?b0RSYzV3T2d3WVAwTEhUQmJ1V0Y5ZFFZekluakl5czNLS05xN21DZnVJemYy?=
 =?utf-8?B?RXFTZWdydk1XZG94S2xwZ3luSGlkUWk1U1YzNGZGZUxnUEs2dXNTL2ZFUkE2?=
 =?utf-8?B?TlU1cWhPOUM0SmJhN0VzQWdMb2l6VkJUaXJtcnhOQlNDdmdEZTBUTGJhNmJx?=
 =?utf-8?B?b2lIU0dhOTJNVnFYTExSdi9VVmw3YXhBVnlEdW5Hd3MyZE9DUFo3NlZ5L3V4?=
 =?utf-8?B?ZnNIY3ZJL0tTNTUyd1ZrT0JPWHIzV2taM2F6Y2s3aDhtNXdyZGhDcHRtZm1Z?=
 =?utf-8?B?bHQ2VE5MVjVxbDMvcktscjVtZUhzQm81UnR3NHcvRjlwR1VxbXAxdys4ajFK?=
 =?utf-8?B?blptNUh5SFR3MXNpRDhBaG9IYVY3SnV2S0prY0VVVGMwVyt4V0hNMC8rQ1pu?=
 =?utf-8?B?M2lRN0t0NXMva25QR0NUMG9GWXI1cFZIZ0o4SnBNQnM1eEQyTnE2YjlwZC94?=
 =?utf-8?B?VkZySHZ3bWZGYk9TeDNScFhseDc1aEtDUVROWWhjRytjQXNOSkt6THZvdzB6?=
 =?utf-8?B?dkdVNjgxSGt2U3QzUk01UVU5NW8xRHJNaVA5TXJGRi9IYmVwOWlvTWdJMFo4?=
 =?utf-8?B?SGN1REcwU2laRnNyNEJSY1NtcDNrOGNCTndyTzdDZEl0Ri9rUlk3OFJyMnlY?=
 =?utf-8?B?Qm4xN09tUkMwRGJPSkxaTDFYYUorSVFSdFh3aTdIVEI5U2V6Y0xxOEpSbXdj?=
 =?utf-8?B?S2xWYnJTRVJmUXhJajIxeUEvYTNENWFQeS9GQm9HRFYvL1hJOFhJKzdWekxF?=
 =?utf-8?B?anFJYWRQazJHbnhOOUVrMnBCVGgvV0VxMXEzMDZXaDB6WXNvMURId1lQcnZu?=
 =?utf-8?B?UDdXTGRmWGtKSCt0RXpodlJVVjgxZWJtbnRGR2RoVmhLZnFjRUt6elB0MHZS?=
 =?utf-8?B?SDZrTXJTQnh0TlRnbmJPOXcwWS8vT1NhOXFDWWNoMVJsVG1oZ1lpRytUa2lO?=
 =?utf-8?B?YzBnQktIWlN6Tk90ODRsOU1TTXErSWdMYklJMWdEY0x0OFJXY0VCczZtZ2Fm?=
 =?utf-8?B?NlVoNFd4MGZmSVJkYUwwTWkzbXcyN2Zkem9ySXRZWjlSbFRUWDVudFdaMHA4?=
 =?utf-8?B?endoampUazlZNmRBUzNFd3dEekJSQktuTTR5QUdvTUtMNUVad2RHRWR0VldE?=
 =?utf-8?B?U0NsM21iM1E0ejk1TTN4MUdNMklxNmtiOVl3L2JpbEY3V1VyRzN6cklYZ0VE?=
 =?utf-8?B?ZUVVNi9PL2NsSVlpRnduQXBxL0xsaFUrdmFsL0FQYnpqQWpaUWJVZDlDbW5o?=
 =?utf-8?B?bjg1ME01Z3lyMmNPd3NKMDc5MEIwTkxwM1pNUzBONFVzdWI5U25qOFhiWmZ2?=
 =?utf-8?B?OE9kbnlXUys4TkxnTzR4QTFvb2J5bHROUW5GTU1tWFo1NHFYN1pDOEVieGpk?=
 =?utf-8?B?dTJ2a3hseHVkbHZuR1pQK3dvdVBpZHZ4MkFXRFBUcW9CdGk2SEJnRFN3NTBh?=
 =?utf-8?B?aDlwd2RxQXJnT011NzBiS1pMK1JMeWNPNVI1WG95dHlXWlFpU0NVUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67941dd2-c96d-41fc-c893-08df3a530407
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:07:13.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQK2hsa35b9oKTbKt5tlXiiCqhNZmAMGowXVEIH5GJIOZtAOAhZtbep9252xjkMOebT7x2GNx7g6XHjRdHAZhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7507


On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
> --
>
> commit 5ec3118aee2f03855552c58a4a8533e035b565bc
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
>
> This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
> a zero divisor value represents an invalid hardware state rather than a
> pass-through. When this flag is set and the divisor evaluates to zero,
> divider_recalc_rate() returns 0 without emitting a warning.
>
>> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
>> index f68216c65d3df..6c1523d22477c 100644
>> --- a/drivers/clk/clk-divider.c
>> +++ b/drivers/clk/clk-divider.c
>> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>>
>>        div = _get_div(table, val, flags, width);
>>        if (!div) {
>> +             if (flags & CLK_DIVIDER_INVALID_ZERO)
>> +                     return 0;
> [Severity: High]
> Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
> a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
> set?
>
> When a read-only divider has a register value val that maps to div == 0 via
> _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
> CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
> CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
> clk_divider_determine_rate()->divider_ro_determine_rate():
>
> drivers/clk/clk-divider.c:divider_ro_determine_rate() {
>          int div;
>
>          div = _get_div(table, val, flags, width);
>
>          /* Even a read-only clock can propagate a rate change */
>          if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>                  if (!req->best_parent_hw)
>                          return -EINVAL;
>
>                  req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
>                                                            req->rate * div);
>          }
>
>          req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
>
>          return 0;
> }
>
> Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
> !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
> in the kernel when div is 0.


In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use 
divider_determine_rate(),

not divider_ro_determine_rate().


divider_ro_determine_rate() is used for read-only dividers, which do not 
have CLK_DIVIDER_INVALID_ZERO

set in the current implementation.



Therefore, a zero divisor caused by CLK_DIVIDER_INVALID_ZERO cannot occur in

divider_ro_determine_rate(), and no additional check is needed here.

> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com?part=2
