Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022116.outbound.protection.outlook.com [52.101.126.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3B36C0DC;
	Wed, 20 May 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262401; cv=fail; b=cPWYaUcB/NRN0LK7Oe8sVnHXh+ggZDT6WND5yYXCcVhIj1oYuAzdmIkLwhJHfJ39hgGq+ghVC4/as7CZLfBMFxNTwUtYBFaS3OIku7OQHntGyV9sFfp6weAR+ibZQC9Lt9YB4XAF+DKC1py3PPgrb0p52XL8XVn0VfbDZR2ftbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262401; c=relaxed/simple;
	bh=jmLk51jkOYvGPhOahZlRS4BXSZ4PbDJ5EINjgF7DX8s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AE5UnT2N7OXFSuuONR/5YiNicWgUuzNiRUw1x/i/QIIipO3TQfNAGoc5+3luwBAY+FmEtcvKPV7KnQPWDUC8WY54tvpS2xzCYDN2Hf3QcC6WPAR8Oj8rHzmm00+y1nK5yJ7+JFPDZRgN6wt+jxLh8oNucWxl3x30zTdWhdpYC7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=C18ETXcd; arc=fail smtp.client-ip=52.101.126.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="C18ETXcd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgMwizqgTdL+D3FJL/eWUSEkEc2GjEsDo9LiXsY8pYDP9fVV1V/n6UzMSdn3MWnNLAM04kPLsSEqC3OGw1IVB+Ir06NpNjNDF6BIMAwC9pXW4xIN7LJFIjimMyzK/pPq8xR0EkYv8Kezz6+xB5QfPnSlCqGYagPwXNlFEw6XdU7jiRFBjd3+XWbX4GtvZnEmIMZwGI0FIThR2VO/uZp3s6WZtFnK91vPnZXEXfOyA8TlF/7cnDy/NysjcRiftam7HPnCHICYXGlk/y+jaid4HUnwxZzvOKPs2m7p64mTGognyxLvU1YGMGHa6G2xYr15wOG6joTB75oZYWIvay+wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGF4VWsFW4c9p1rIOgeYQzAbpK3/GpsFKflbJkpZYmc=;
 b=kaw4IBsSqIlK3ETjld8j+T53mCxXqlZkQ1aHx0ydQo9AE2UKYf8Nv7xNcSHRF+hqbtW1KFJyS9VAQgpsmSBgkzWBGEHrU4AuBcpiS7JsgQplsDHD2VDj9gb6Z/z8ib0Y0k+6+Nqvhj0wN7BUEm3OZKWRym6zX7c9fZR4z3MejV+c9IGkj8yN6Y+gUXE+NsPOBip9sSGT/0HxA0UmCC/gE+Hg53X1Fe0vpzVO/CptL181xKhnbeemX6x/L2/+gbHVPmRgUfHbKW7splfuSDhYHW9klwlvyHQOSDyYHn2QheOsUy1GUYjBULwmj09vBXkLHHa67YcG+6aQUcE45ymvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGF4VWsFW4c9p1rIOgeYQzAbpK3/GpsFKflbJkpZYmc=;
 b=C18ETXcdnpDk5sIpauvCZq189YV+YbuypwFCDmpb+kkTQZkcWyc5Vr+uc7g9qHvqQXB/+DK2AcMN0i1l9/wpyA2t6cWYZqvCVTreCc8Tqo52cM2n5AqFpRhZ12kT+E0OcrUm9rc3DiCuUwJiwQJMpACFc1xGdmU8WOzvCwbNEfOUSMgd8388KeGc9Fh8suwWPJXq38tg/bqyZa9usSRcumxoxfkooNWTKDGePmJJGq9ytPBklGif8m+CwQ88DoWRjwzYRamn9s6AyN5VMd6LhqXCb6K6VBqAfCldk+doM/tdSvPyNMHdQzKszU9H95dlCJBz9g8f+ByESQJPe0x0wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PUZPR03MB7042.apcprd03.prod.outlook.com (2603:1096:301:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 07:33:10 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 07:33:09 +0000
Message-ID: <96aac0a2-7531-4a40-8a55-630e92012bb5@amlogic.com>
Date: Wed, 20 May 2026 15:33:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] clk: amlogic: Add A9 PLL clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
 <1jh5oa6kcm.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jh5oa6kcm.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PUZPR03MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b372eed-4866-4d9a-16e5-08deb6420ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|4143699003|18002099003|22082099003|56012099003|11063799006|3023799007|5023799004;
X-Microsoft-Antispam-Message-Info:
	IGgAWCxWUF++kqkqbcHH+8GvXqCluDtWho8MxCw9GLaXPb7ICNrChi9hHG6D3twg+oao9wQVIMM+NmHbh1KoScBBrAckOCDiEAnUkWvbNVa3SVLUVb9WL03khu7BEcWlI65evivzSbq+rtSJt02Six6q9WhyBKJL6d7OwViUPgWQP/8yBuOIZtihX1uun9ZFSZE79f8TJUg3yp2eL6qIcdLlZdHU3r8hELmkw+dkjA3y5lzo+UlqfS89Yww7GKk03VyxDMUuApIUIA8alO5cjb3DbYSFlsnl/+knM4UaupwMgcadVggbHdhcaamvEBdnLV+NuCtX0Z9yR/08e0RtSYryALkVAXrCQb77ZLoHhf+FLDozQQ69fzBmaIWErNPmZmTOO3nWqglPhLuFWjhl20BGcS+DXT9luDUNrkDtzGFpqXHdYQDAWWv+t/fmBEaTvGvneFW4WyJzcKasWK2BGl0vJ8PVYC9E+CFQjYQAJVkftx4MMD8iZTsDCcyyAq+edWXRRml1Ghhq+yvb3jpQAxItYHqPwBQ+BOwx5ssTAt+FdTQvf4S/HrAf7xFGhp1c3H4bZYQwjfvCpjLfC0lK04hK9CccquwjTiecN+Mru67oQFfiSiGJCkn4pi3cTJat7Hmotd3nqcXdfTQ1LmqXiZE0M86uRsNbyvmU+nX4Oaac4brZdetKnDvV5mBSR0Kp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006)(3023799007)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWZPSWNZQmM5S29GK1RzR1RZd2o2elQwRXdxTG5vM3ltUGxsZHhBdTlEdHFa?=
 =?utf-8?B?a2tsc2Y3QkgrN1FXRFoxKzU2TE90aEpkWkNSUUgzR09EQzBCb0ovMVpyQ24x?=
 =?utf-8?B?eU00bFRsbVpMcU1MNGludkdRVUZadldINkxoZzZacTR1MEhCTzg3SmFSNWVQ?=
 =?utf-8?B?bmwxME8wT2M3NWlVNWJ0aFNjd1hxeTBPQ2Q5MjFEYUdaYzlzRjN3dkdIVFJn?=
 =?utf-8?B?QTZhdCtRQVlKTHhiOGVvbzN6OTkvWjNqWHZRY0JJQ1lldS92SFBpVDVMRVkv?=
 =?utf-8?B?RWQ1ZHpzaFlQUURWMmg5bHZ5UXN0WG1maG9LY3RjN2FWQ0lHVG9LNlVoSUI5?=
 =?utf-8?B?dTFXd3lVNkJZeWgvU2lvQ0tBUDJxcjVwdVl5SDU2UjdyaG1kRXNRV0lFcVk4?=
 =?utf-8?B?aUlPUDR2UXJ0TzRpZFJtWkd5MkkyMFJkNDVTZnNUdk1QMzV3Q2lnNGNuUytX?=
 =?utf-8?B?OWNOU01MWlpJeXRSZ2t6ZGhzR3IwQ1lVZ25KMnloNHkyUkZYU002VDltZGdv?=
 =?utf-8?B?RTJxby9xckZ4dVM2MjhRQkNaTkUwM0tjSVRiT1p0TkhVNmhQMlRTaGVzczgr?=
 =?utf-8?B?T3JwckpDdEhlaUtUWjc5R1doYyswNHN6TVRyUXUvdjFxNmZUK21mQlNKUm8y?=
 =?utf-8?B?MSthL1R5MCtQL1FScTNWUW9ROFhob082aTlpakRFYUhPdThMNWVXUHI4ZEQr?=
 =?utf-8?B?R0ZZMjd5OU8yc3kvZlRuV3psVVJZWGZvZFNKSU92WXp4ZzIwajZ1aGJkOWJ3?=
 =?utf-8?B?RFZnRUZib21jRFZGYmM0NWlrYU44dWphWnZjMi95V1I5Y1E1aFhlTGpiUVhZ?=
 =?utf-8?B?T21udTQxWjdqaENkdUhwOTgrcDRKZTNRbXlybGk1VnhMZmZNWER6SE1oVmhI?=
 =?utf-8?B?Rk1odXBoRDZVRUFWU0JxUmc3NUljSDhQSHRWS3czZTZBN2k0WGtaZ0R6c3ZE?=
 =?utf-8?B?STJ1VjhsOE1PSHhMUXBQM0ErY3ZyaXZDdE9ZNnVwWUJHZ0NWb3o3MDdDdmZH?=
 =?utf-8?B?WlN0SjIrbnFaSGVFUnZpTEtkcS9WWVA1VjlCWGVkZjB5SjkrOEtjZUlIZkk5?=
 =?utf-8?B?Y2pHeWxjQ0ZYMi9JcGdidEFCN29RcVRHMDkzT3BZbVhJdjRKd2l4R1ByVk1n?=
 =?utf-8?B?RCszUU1odHdudTlKV0lSSGgvYXIxL3hZMlZUd0tOOUlkblZabFV2NUNIYW1S?=
 =?utf-8?B?a1UwTEdwQWhtUVZCd1dCN2NqOHU1dDE0b0pvRGpGNjdTV2xpamlMY1ZGQ01W?=
 =?utf-8?B?VXRId0tQRzdTd2hTUUtvaFljUXUxQlpXKzJGM0JBUG44TXk2RU1Jdmg3RG8x?=
 =?utf-8?B?UGdtcHMrcW9hamNkYmh3Z3dVRUFNOVVpbHdsWXc4NjAxbFVSRElaT0dQekE0?=
 =?utf-8?B?dHppM3FTajRnOGwyMWFFOVU3ZnRWaWg3TnFNbHBmNkNWL3VSdkZPL0ZMazRO?=
 =?utf-8?B?ODhrbzZOdmpHM2xiYitlVDZmWU9MTzAxRVRTWFZlYlVMdk1PcHFrRmNPOC8r?=
 =?utf-8?B?T0lRRjJ0elNqZ0Z5ak80Wk9SdkZpdVRtdXI5cFY5RFVMQWNTdnB2RlpBVmxw?=
 =?utf-8?B?YnkyK2FoYnMxaVJuMEhVa0IxUU9TR3lITnFqTWtjMGtHc3d5V3BicTM0R0Jl?=
 =?utf-8?B?clhaUTRBVzdoS2UwMmNFbkI5SkJRNXVjejM0OUkzRUx6L1FnSjJMYXRFNlVH?=
 =?utf-8?B?R2lva2lGZnR4cDhSMmNYK3pCaG5Sc3lxWjRpNFVsbUhCT21rR2dYRythbzRm?=
 =?utf-8?B?SGYrL1BJM3g5K25QYWNhcW83MWh1eVhaWlhwM0ZqQkxjdXQ1bGtOb0pjV1dW?=
 =?utf-8?B?WTlLcm4xNzV1RGNPQ0k2SWh2c01GTDVaNXJKQ0w0NElvNmx5WXZvcVBBM3cv?=
 =?utf-8?B?bkh2Y012M3Rma3J3ZHpCTFVWWW1Ld0U1aEJkRnp1Z0Fvb2hqbUFsc3c2enZQ?=
 =?utf-8?B?RWU3a3RpR0U1dm5MdC80Zm01d1NhY0ZnSDdEKzRLRGdnZGNyWjIwMkVSbkFw?=
 =?utf-8?B?Q1paYkRZQmFYU3FkRUYrN1pnL1FLZEM0NEVTMXRsSmc1VksxdXgrdEZjS1cr?=
 =?utf-8?B?QzlRMEltVmplcmxCUDhSRmlTZEhSQnpNSUZBRXNtdzdQWUMrVzBwNWVKQnRC?=
 =?utf-8?B?S3haVnEvUW9VM25pYm9CQ0s4S0RpRHg3TVJJcklCTDBJMmlwRmo0R3cyeWZE?=
 =?utf-8?B?bWREOVZEbExCbDJOMGxyQUVoa1Ryb1BLRlZxaE54QnZSc0k2dVA4VzM5MU5U?=
 =?utf-8?B?N3FLZFdOOXF4SllHVmdwRk9wbUtlZzJKU3YvaEhWK01CZE9GSnAzRmJQUHZP?=
 =?utf-8?B?SmZlTDVwY2M4VXhVYUtaYnRveW82ZXlGTGN6bHZ3SVRPcGoxL2FvUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b372eed-4866-4d9a-16e5-08deb6420ab0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:33:09.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5L2PryTh20ie53Y9DgAGRQsbkY8XWWgoVHXwSsFYEMfSqsu/NW9+V2zVFAJGmUiHNKYOSpXtfkb0L1ATzXVYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7042

On 5/15/2026 12:12 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the PLL clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
[...]
>> +
>> +/*
>> + * Compared with previous SoC PLLs, the A9 PLL input path has an inherent
>> + * 2-divider. The N pre-divider follows the same calculation rule as OD,
>> + * where the pre-divider ratio equals 2^N.
>> + *
>> + * A9 PLL is composed as follows:
>> + *
>> + *                      PLL
>> + *         +---------------------------------+
>> + *         |                                 |
>> + *         |             +--+                |
>> + *  in/2 >>---[ /2^N ]-->|  |      +-----+   |
>> + *         |             |  |------| DCO |----->> out
>> + *         |  +--------->|  |      +--v--+   |
>> + *         |  |          +--+         |      |
>> + *         |  |                       |      |
>> + *         |  +--[ *(M + (F/Fmax) ]<--+      |
>> + *         |                                 |
>> + *         +---------------------------------+
>> + *
>> + * out = in / 2  * (m + frac / frac_max) / 2^n
>> + */
>> +
>> +static struct clk_fixed_factor a9_gp0_in_div2_div = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "gp0_in_div2_div",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a9_gp0_in_div2 = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = GP0PLL_CTRL0,
>> +             .bit_idx = 27,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gp0_in_div2",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a9_gp0_in_div2_div.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
> When document something, be sure it matches what you are doing
> afterward. It is confusing otherwise. Your comments above clearly miss
> this gate.
>
> A fixed 2 divider followed by a power of 2 divider ? Is it actually how
> the HW works or your modelisation power of 2 that's shifted by 1,
> mapping :
>   * 0 -> 2
>   * 1 -> 4
>   * etc ...
>
> ?


Sorry for missing the gate in PLL block diagram, above block diagram 
focuses on mathematical formulas.


A9 PLL is composed as follows in fact, M and frac have a 0.5 weight factor:

                        PLL
           +-----------------------------------------------------+
           |                                                     |
           |             +--+                                    |
    in   >>---[ /N ]-->  |  |                     +-----+       |
           |             |  |---------------------| DCO | |----->> out
           |  +--------->|  |                     +--v--+ |
           |  |          +--+                        |           |
           |  |                                      |           |
           |  +--[ *(M + (F/Fmax) ] * 0.5 + Enable<--+  |
           |                                                     |
           +-----------------------------------------------------+


         out = in  * (M + frac / frac_max) * 0.5 / N


  If we ignore frac and set N = 1, it simplifies to:

         out = in  * M  * 0.5

This can be rewritten as:

         out = (in / 2) * M

The 0.5 weight is hardware-controlled:

         For GP0/HIFI PLL: controlled by CTRL0 bit27 (gate)
         For MCLK PLL: enabled by default, no gate bit

To model this in the clock tree, we add:

         A fixed /2 divider after input clock to represent the 0.5 weight
         A gate clock to represent the enable control

The resulting structure is:
         input --> fixed div2 --> gate--> dco

I would appreciate your guidance If this is not appropriate.


>> +
>> +/* The output frequency range of the A9 PLL_DCO is 1.4 GHz to 2.8 GHz. */
>> +static const struct pll_mult_range a9_pll_mult_range = {
>> +     .min = 117,
>> +     .max = 233,
>> +};
> If PLL restriction is actually the DCO output rate, and only the reason
> to keep the pre-devider in the range above, I would definitely welcome a
> rework to express the constraints properly and split the pre-divider out.
>
>> +
>> +static const struct reg_sequence a9_gp0_pll_init_regs[] = {
>> +     { .reg = GP0PLL_CTRL0, .def = 0x00010000 },
>> +     { .reg = GP0PLL_CTRL1, .def = 0x11480000 },
>> +     { .reg = GP0PLL_CTRL2, .def = 0x1219b010 },
>> +     { .reg = GP0PLL_CTRL3, .def = 0x00008010 }
>> +};
>> +
>> +static struct clk_regmap a9_gp0_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data) {
>> +             .en = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 9,
>> +             },
>> +             .n = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 12,
>> +                     .width   = 3,
>> +             },
>> +             .frac = {
>> +                     .reg_off = GP0PLL_CTRL1,
>> +                     .shift   = 0,
>> +                     .width   = 17,
>> +             },
>> +             .l = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .l_detect = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 30,
>> +                     .width   = 1,
>> +             },
>> +             .range = &a9_pll_mult_range,
>> +             .init_regs = a9_gp0_pll_init_regs,
>> +             .init_count = ARRAY_SIZE(a9_gp0_pll_init_regs),
>> +             .flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
>> +                      CLK_MESON_PLL_N_POWER_OF_TWO |
>> +                      CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gp0_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a9_gp0_in_div2.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +/* For gp0, hifi and mclk pll, the maximum value of od is 4. */
>> +static const struct clk_div_table a9_pll_od_table[] = {
>> +     { 0,  1 },
>> +     { 1,  2 },
>> +     { 2,  4 },
>> +     { 3,  8 },
>> +     { 4,  16 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap a9_gp0_pll = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = GP0PLL_CTRL0,
>> +             .shift = 20,
>> +             .width = 3,
>> +             .table = a9_pll_od_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gp0_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a9_gp0_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor a9_hifi0_in_div2_div = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "hifi0_in_div2_div",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a9_hifi0_in_div2 = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = HIFIPLL_CTRL0,
>> +             .bit_idx = 27,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "hifi0_in_div2",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a9_hifi0_in_div2_div.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static const struct reg_sequence a9_hifi0_pll_init_regs[] = {
>> +     { .reg = HIFIPLL_CTRL0, .def = 0x00010000 },
>> +     { .reg = HIFIPLL_CTRL1, .def = 0x11480000 },
>> +     { .reg = HIFIPLL_CTRL2, .def = 0x1219b010 },
>> +     { .reg = HIFIPLL_CTRL3, .def = 0x00008010 }
>> +};
> It look like GP0 and HIFI PLL are exactly the same IP, you've even
> documented it as such. Yet all the code is duplicated. That's not OK.
>
> I understand that way we statically declared the clocks so far pushed
> you in that direction. That's something I'd like to fix properly
> someday.
>
> In the meantime, you could at least duplicate the memory at runtime to
> avoid copy/pasting the code. A minor change to clkc utils as suggested
> at the end of this message could help you do so.
>
> Same probably applies to mclks.


You're right, the GP0 and HIFI PLLs are indeed the same IP, differing 
only by frac_max:
     GP0: frac_max = 2^17
     HIFI: frac_max = 100000


Each clock requires its own clk_regmap and clk_hw structure, though the 
data in
clk_regmap can be shared between HIFI0 and HIFI1.


I have tried duplicating HIFI1's clock structure from HIFI0 at runtime.
Most members of clk_init_data (except parent_hws / parent_data) can be 
easily copied.


However, I have a question regarding dynamic parent assignment:
For example:
Clock B is created dynamically, and its parent is clock A (also created 
dynamically).
How should I properly assign this parent relationship?


Furthermore, how to handle more complex parent configurations dynamically?
For example:
Clock D has three parents: C, B, A (in an irregular order).


I would appreciate your guidance on how to handle these dynamic clock 
relationships properly.

>
>
[...]


Best regards,

Jian


