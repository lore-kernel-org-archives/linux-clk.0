Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023093.outbound.protection.outlook.com [52.101.127.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01040DFC4;
	Wed, 11 Mar 2026 03:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773200172; cv=fail; b=PRwuoIXY7kI5KVfdPtSOAmwb7vHRwEE14c14tinLeenxZXcH9DoA7UVSI4/3XOP5t3MxxY4Crl15RjNLkb4iUfpfLtHO9U/5BND3nY2yZjVK3SSN/l2kJJ12PjmGOIAzJ40Gwcpjof+I9+Sxm+vjgpQovztMnDkVxgVw08WI36I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773200172; c=relaxed/simple;
	bh=bQqYqfncD1TdoJm/IWJlxLtaefvdLxS/gCKVWy7WzRI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H6TMrFd9OYAXxKZAgA8BJ0UDcT4X5xKbEos8poRTuERqcw5GrvlBer+9LbzHatlfKHQaj2dJ+dM5lpSO5grVBixaTcUKtHA/PjrJW8zYMnjgrlObL19P1V2641CAY6nmubwrBI2hiI4CAUWVL9Ro9j2lkmYv8PCdxcVcIiX03CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=GzPITas+; arc=fail smtp.client-ip=52.101.127.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="GzPITas+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bH+l3+0KJVQqNII6hy7+Cmi5oMBtLu2FNrZvUxSXOPMEdO5PkN3OCmNEW/2tWW2fd2HsEPHpY9C6xInb9HY/InmCltwwa9brKLCdA1uuEscmnNQ3F7Tio1K8qNjkLQcnbQvnHjRZai2e3C5OcSlKkLoCXaOT60V3q/v3GrwOwBRUZbULuD+yrYfm2xjO++SUxIhk/Nr9bD8X8fKyf9VfT0SQgQBB378Ugw+62VPONbN+rX5J7zhgz1KVcltplymJ+2yPiMWf01yElPj5GvSD1Rx6jHpiWXb6JBSx5cjoIqaomqbN5l/nVP/Lz6d5b8nrYt4DXdpf4bRf9KsYn+lKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrKaXoRFfqxHevIiH/2xTdB7OJIj+1W6QJxXI2baUJM=;
 b=rLkXGTfdkFoIWJjKs4IuOqcCGuFm1CXP3zvdFhk4KXSGvUT99Mnmup0ct54bNUvcL7mFpmbAalGhBFYPbmavZhyN3aHJ0WxmI16Bi3nwhfyk396M+oIP0NhFTTHg3n1ZCulQT9hvn/rr+k+DzH8x7+V+RMgMU8gpSjp0gR9e1roGAyYVAdY+EpjvWPPcii1zPG5/cIXtxMVpZ678s5pE0ZNym8gJQHZMt3N4hIkQRZ7eTKICHJoBao9FXwuBOwMVHHTp9upEa0PTKeUW+TEPtmdlj8gk5A6q6eJAtN3b4B5IoO1dt3bcu0Rxq8+NZ743mz5v+ckVWEYLO4NyCoYEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrKaXoRFfqxHevIiH/2xTdB7OJIj+1W6QJxXI2baUJM=;
 b=GzPITas+yXyVBbbyEgZOJaf4YfkLMIGqk1HGqBhRo9lI9W+JVrgvgU0NHmDSkGtG/G7Mydst5KCAwYb+v0o9Kh4Ot9OMhLsLA8AUtr14NIVtpwxw2YFQIRfFSgnwveiGbKHLdef8Q1Lf1/cH54Ni5CB0ZUVLC++5vDM299givlsIsRKMS+GV/5rSPuhyrgLDBqBYJN5mS5FbqRE4m1lIuqwKfUKp3PU6I/LWu9TbjQXTb4ATS/nr+bt6Xe5VghTWPv81f8epKNbFYDnYjScKyP9qaHN6M5QKXrVDL9QU94NpRPYuHxnneL4YxDc29D3X5dAozY5FFoiUmAN8LfBU4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY2PPF94EB25A41.apcprd03.prod.outlook.com (2603:1096:408::9dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Wed, 11 Mar
 2026 03:36:07 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 03:36:07 +0000
Message-ID: <32d3358a-7f11-4d9f-8a97-ad7bf96f7dfe@amlogic.com>
Date: Wed, 11 Mar 2026 11:36:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-4-jian.hu@amlogic.com>
 <tbp23s.3oymu5iyepvke@postmarketos.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <tbp23s.3oymu5iyepvke@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY2PPF94EB25A41:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf7a5d3-089d-4cf7-2c0b-08de7f1f5480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	1ReK0KvU7dZ6Bj15AzYoCbNuSgph+TL1jQbbHA96hIWzUotILQnYDVDWBYXBQ96YIfzD48U1N402l+/WnyzOM4Vhq9c0Oyg06tpkTLqsMxnfaOrGFc+ziaIjEsBg+MzAt7Zs8T/M7JEGVR1ImNhtOHkwzjSUHC0gkhJgv8D9EUjn9igC2mn2/xYwChpuweYLj87VotQjXnQnE7nOb9aiIFSwBo5fHlUHI8g5v5buTH5tXftzpJyIDnbIDZ6/gQk1VHNHVwl9jOr8bcs+lk8DmroqyjWePm16L5Zoe5mlpjeRMBApWUOm0YmbXiSMAgLjqmvnrwls4sQfixWTH3wf0CskBKFtW8et73pe20Oi2aXpzO0tjVcQCSj0Idc6b9VAQ1QPqWrXOIvyFFiWtUciAg8xVKcXhjzqh45FrZgiHtMsx39jxlKMXZVd1mEFd2G99BTP78j+A/mSAV3GwN8F1UmPgVFUut6PPT8ITsSK0+u+S4ror9+8DdRZjfclHfjvzdqZMjtYOmiyazjzTLA8sdzj1oFS9KUdBFMiiPIlFvwIt4oc1D6qzBOsZkMD8QRvBgRexmszWQ0A0uTX+JrLb2m4mzJQBi8xu8vd1bdwud1w54IJLg8Ij7Zu1tQZ21Zudt2Zw1lE7l/AK9hy48H625oKPtocY/lmQVyKR7N6GGjwXbo3EFf3qliTJChuWxbYplqp0pKZiaVjCokRJOorWj+DrXe0JxnOJi7tpnXqMcb/Yo2HFW9XrLV4II3n3vEnpx3elUF5ivIi9XLempzQgMCOQ+Hiy3ZCcjGDIbkREUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZkamNnTGhDUGNKQjYveGFWYzJzeXlVTzZWVWlvYityWDVzNDBGcHIyN1Fi?=
 =?utf-8?B?TEp1SFNaZEJQUE9kMGFxMG9FYlNZZWFLb1ZTbjZiSUUzNXFRS3RBcTlndW1p?=
 =?utf-8?B?TFk1SjMwZ0lYeHozZFRySnNNaVVDQnNDY0F6aFRURkJHVjB2Lzk2VXNpc3Jr?=
 =?utf-8?B?ZTk4SUJ3NDBQZWM2SmJtVnFLa1RtMlNURzFRWG5XWmRMcTQ2SUdMcHM0NnUz?=
 =?utf-8?B?S2tGTUVqZEF0TkNuc0p4Wlp2aVZwdEU5RHdFMjRJajVPWlJEYmNjaUlJbk00?=
 =?utf-8?B?bU5DZWl1NUV2dW5zcmwzeEJqRVROZTFmTGNySlhyWk5ocUkxdHc2c3RVcUd0?=
 =?utf-8?B?ZHB5OVd3UEtvbWRlT1Z4ZlFGK081ZDByZURMdS9ZcmR2Z2RwZWRuR0dUWWVm?=
 =?utf-8?B?YTlsU0ZqTi9kRjU5RU5neERWc0JlMEhHcnpiWXR4WWY3QzU4dWcrTm5pREo4?=
 =?utf-8?B?MDliaWtrb2VNVWExNG5sZnB6K3l5akd0YWxLUWpQT0M1bEUrV0FGeGMwZmJs?=
 =?utf-8?B?aFVFYzdyUko4YllxOVBWRy9tQnl4M1hqWmlSSFQ2VHZ6aC9STUsvYmRrZ2Qy?=
 =?utf-8?B?SmdCWC9QSDNONWpUcjJPdExTNkR6YU9wL0ZEcE41bmdYTkFBMWVHU3h0VFlU?=
 =?utf-8?B?VnZkVE9ac2FSMGZQSVRYY0pmTWtGTktxTHJ3VllWNXJKWUJHLzBEb2UzVTU1?=
 =?utf-8?B?b2I1TG1DT2hhbzhVblpPTTR4aWYvUlFGbi9GWmgzVGpPUjl4N05oVnNqMlB2?=
 =?utf-8?B?K0dQVHFHS3ZKaVF3Ylg2MHdrN2tFOXFISUpZNG02YXJEcnBCWUcvanFiN3JJ?=
 =?utf-8?B?ZGxMN29Bc1hRWi9qYU0xRzFFSHJ2SUdhSmxtK2NUNFF6dGxwSWJhS1lhd3lv?=
 =?utf-8?B?MnN5bkdpUHFYeFdJenhEaGJFTVBjNmEvTHk0ZHlMU2YrY25XNGE5NGNKNlkx?=
 =?utf-8?B?RTVnMEFMM0tVWGtsSWlVUnVha3d2azZDazVYT1BLdytNSzBzVHZvK2h1anBL?=
 =?utf-8?B?aDJEMjdIdDBTcnpxQmZ3SnU4Nk5jZmwzOGtySXdaSGV3aDlITlBIdk05Ris1?=
 =?utf-8?B?Q3V1bUtZMEd5Z1ZGc3ROWWtNK0ZXK2xkTWVybFl3a0hpTmNPb2RSOHQwaC9L?=
 =?utf-8?B?YU5Xc1VmUmRiTWFUb1RTRnFvRFlJOHQ4N1NHSVlPL0NuUndtRitvcGNpbXJI?=
 =?utf-8?B?TDlaOXo5RVhQVlArK0lHd3ZyRVdOendsTXlUZmVnT3ZPallUZ1hNZXFiZDIv?=
 =?utf-8?B?azY1MEJWanRqRlBxalJLUEJIUjU5NmkrYWpZUXk0Y29yU0l0cmpDT29YZHlF?=
 =?utf-8?B?WDNoZ0hHNy9yZEt5anV6bXlqc1ZnYitkMVJJNDA5Tk1pL0gxVzhxK1BRYjhO?=
 =?utf-8?B?TEtSdDlzOFFOYzcwQm95RFl0MW1nbGYzaEorYmk4ZnNoMEk1VzdnOVl6QWEz?=
 =?utf-8?B?YWVyQ3pnZGhlZnZ2b3RrR2pNaHIyVk9XNWdNNlUxMDhBbGdwMW5NemwzNmRj?=
 =?utf-8?B?R25oWEpzOHRHcWxBSHlseW1yRWxyVFdhZ2w3cWJXRXcwd2dLcTN4T3o2ZTNt?=
 =?utf-8?B?SFAybXlnRWsyTyt4ZTZFWEdjT2g1VjkwSlBnY1N0VXVWK1NiUGFOM2Y4NjhF?=
 =?utf-8?B?WDd3M3hxVWg2aVAzY29KMExORXhZYlVkcThENVhPdEZlcHh3dVVhSFZVS1Rz?=
 =?utf-8?B?cXVEdXR0clVIeHgybk1WUmNzbzN0djNFN0wwbEpCcXQ0cnhyemk1elBFdzF1?=
 =?utf-8?B?RzdHYm81dDU2UTl0dFowL2tjRXBVSUptWFVyRVFNQVVlbFBlWTNqZWJVbE9i?=
 =?utf-8?B?dFdOSytvUHNxYUd2SWtJTUt1VythS04vM2J5QUJvdUo2bnEvUXkwd2NvbitZ?=
 =?utf-8?B?ZXZnbGFtV3ZKZUV5Zkk4L0tLclVOVUxDbm1mWTdBZlFuVVE1WkNpZ3FIaVMw?=
 =?utf-8?B?dytwbDRXdFEyTDJnZDZDZUllSGJKVjlvZzFTTWR1WlYyUmpzVlBYajJaRDFW?=
 =?utf-8?B?bDBvNTZqcnNrK1BYUGJRcjBGTnNDbjVDRFFaSHY3YkM4SzJXKzB3aVdtQkZG?=
 =?utf-8?B?S3poeGhTMU04REVGL3NrVUgvYmdzWVdONWpVN3NWUkFaNGVQc0drR3BhcFhS?=
 =?utf-8?B?TjRQMzdKazh2SU94cnlZbnAvK3pKTFFLSWhndi9kekI0SUJzdzloVnF1OWJC?=
 =?utf-8?B?TzFvTmVvZWUwamhqNllYVUlnbkJUOGh0Vk1MbngxdHEzQVB0SWMwK0p4MU1m?=
 =?utf-8?B?RHRERnRxTDdqcGRYNlIwRTIySThqQmlFUjRnLzU1TzBaaTl5S3d4QVY3djJz?=
 =?utf-8?B?S2FEOEo0VG1VZlZZaWxxcTlaNFdmVEJRTWZkY1EzWEZBQkthQmpyQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf7a5d3-089d-4cf7-2c0b-08de7f1f5480
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 03:36:07.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhR2ZkaFv6dgECM3+ncOh3NrBNNbqD8P81YSdzSHo20UxRkZ0+y4lJ53eHTlv4SqZDW+zsuafzSO84n50UNHTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF94EB25A41

Hi, ferass


Thanks for your review.


On 3/11/2026 1:30 AM, Ferass El Hafidi wrote:
> [You don't often get email from funderscore@postmarketos.org. Learn 
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On Thu, 05 Mar 2026 07:43, Jian Hu <jian.hu@amlogic.com> wrote:
>> Add the required clock controller nodes for Amlogic T7 SoC family:
>> - SCMI clock controller
>> - PLL clock controller
>> - Peripheral clock controller
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
>> 1 file changed, 125 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi 
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff9..6ea1b583b13d 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -6,6 +6,9 @@
>> #include <dt-bindings/interrupt-controller/arm-gic.h>
>> #include <dt-bindings/power/amlogic,t7-pwrc.h>
>> #include "amlogic-t7-reset.h"
>> +#include <dt-bindings/clock/amlogic,t7-scmi.h>
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>>
>> / {
>>       interrupt-parent = <&gic>;
>> @@ -201,6 +204,33 @@ pwrc: power-controller {
>>               };
>>       };
>>
>> +      sram@f7042000 {
>> +              compatible = "mmio-sram";
>> +              #address-cells = <1>;
>> +              #size-cells = <1>;
>> +              ranges = <0 0x0 0xf7042000 0x100>;
>> +
>> +              scmi_shmem: sram@0 {
>> +                      compatible = "arm,scmi-shmem";
>> +                      reg = <0x0 0x100>;
>> +              };
>> +      };
>> +
>> +      firmware {
>> +              scmi: scmi {
>> +                      compatible = "arm,scmi-smc";
>> +                      arm,smc-id = <0x820000c1>;
>> +                      shmem = <&scmi_shmem>;
>> +                      #address-cells = <1>;
>> +                      #size-cells = <0>;
>> +
>> +                      scmi_clk: protocol@14 {
>> +                              reg = <0x14>;
>> +                              #clock-cells = <1>;
>> +                      };
>> +              };
>> +      };
>> +
>>       soc {
>>               compatible = "simple-bus";
>>               #address-cells = <2>;
>> @@ -224,6 +254,42 @@ apb4: bus@fe000000 {
>>                       #size-cells = <2>;
>>                       ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>
>> +                      clkc_periphs:clock-controller@0 {
>> +                              compatible = 
>> "amlogic,t7-peripherals-clkc";
>> +                              reg = <0x0 0x0 0x0 0x1c8>;
>> +                              #clock-cells = <1>;
>> +                              clocks = <&xtal>,
>> +                                       <&scmi_clk CLKID_SYS_CLK>,
>> +                                       <&scmi_clk CLKID_FIXED_PLL>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV2>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV2P5>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV3>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV4>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV5>,
>> +                                       <&scmi_clk CLKID_FCLK_DIV7>,
>> +                                       <&hifi CLKID_HIFI_PLL>,
>> +                                       <&gp0 CLKID_GP0_PLL>,
>> +                                       <&gp1 CLKID_GP1_PLL>,
>> +                                       <&mpll CLKID_MPLL1>,
>> +                                       <&mpll CLKID_MPLL2>,
>> +                                       <&mpll CLKID_MPLL3>;
>> +                              clock-names = "xtal",
>> +                                            "sys",
>> +                                            "fix",
>> +                                            "fdiv2",
>> +                                            "fdiv2p5",
>> +                                            "fdiv3",
>> +                                            "fdiv4",
>> +                                            "fdiv5",
>> +                                            "fdiv7",
>> +                                            "hifi",
>> +                                            "gp0",
>> +                                            "gp1",
>> +                                            "mpll1",
>> +                                            "mpll2",
>> +                                            "mpll3";
>> +                      };
>> +
>>                       reset: reset-controller@2000 {
>>                               compatible = "amlogic,t7-reset";
>>                               reg = <0x0 0x2000 0x0 0x98>;
>> @@ -234,6 +300,7 @@ watchdog@2100 {
>>                               compatible = "amlogic,t7-wdt";
>>                               reg = <0x0 0x2100 0x0 0x10>;
>>                               clocks = <&xtal>;
>> +
>>                       };
>>
>>                       periphs_pinctrl: pinctrl@4000 {
>> @@ -269,6 +336,64 @@ uart_a: serial@78000 {
>>                               status = "disabled";
>>                       };
>>
>> +                      gp0:clock-controller@8080 {
>> +                              compatible = "amlogic,t7-gp0-pll";
>> +                              reg = <0x0 0x8080 0x0 0x20>;
>> +                              clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>
> I would separate `gp0:` and `clock-controller@8080` with a space, like 
> so:
>
>                        gp0: clock-controller@8080 {
>
> Same for the others below (and `clkc_periphs:clock-controller@0` above).


Thanks for the great suggestion! I completely agree that consistent 
spacing improves readability.
I'll update the format to add a space for `gp0: clock-controller@8080`, 
`clkc_periphs: clock-controller@0`
and all other related entries in v2.

>
>> +
>> +                      gp1:clock-controller@80c0 {
>> +                              compatible = "amlogic,t7-gp1-pll";
>> +                              reg = <0x0 0x80c0 0x0 0x14>;
>> +                              clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>> +                      hifi:clock-controller@8100 {
>> +                              compatible = "amlogic,t7-hifi-pll";
>> +                              reg = <0x0 0x8100 0x0 0x20>;
>> +                              clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>> +                      pcie:clock-controller@8140 {
>> +                              compatible = "amlogic,t7-pcie-pll";
>> +                              reg = <0x0 0x8140 0x0 0x1c>;
>> +                              clocks = <&scmi_clk CLKID_PCIE_OSC>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>> +                      mpll:clock-controller@8180 {
>> +                              compatible = "amlogic,t7-mpll";
>> +                              reg = <0x0 0x8180 0x0 0x28>;
>> +                              clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>> +                      hdmi:clock-controller@81c0 {
>> +                              compatible = "amlogic,t7-hdmi-pll";
>> +                              reg = <0x0 0x81c0 0x0 0x20>;
>> +                              clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
>> +                              clock-names = "in0";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>> +                      mclk:clock-controller@8300 {
>> +                              compatible = "amlogic,t7-mclk-pll";
>> +                              reg = <0x0 0x8300 0x0 0x18>;
>> +                              clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
>> +                                       <&xtal>,
>> +                                       <&scmi_clk CLKID_FCLK_50M>;
>> +                              clock-names = "in0", "in1", "in2";
>> +                              #clock-cells = <1>;
>> +                      };
>> +
>>                       sec_ao: ao-secure@10220 {
>>                               compatible = "amlogic,t7-ao-secure",
>> "amlogic,meson-gx-ao-secure",
>> -- 
>> 2.47.1
>>
>>
>
> Best regards,
> Ferass
>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
