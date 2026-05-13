Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023099.outbound.protection.outlook.com [40.107.44.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C23A7589;
	Wed, 13 May 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657145; cv=fail; b=ryh60BpGa2jgrQImtMeLMB9zh+UoGz+zlTNG1gwtQYD9unJKgNj0AzbWAqNdrcw0aFq/jKBw0w+kO+Zci8C6avYGRWuTEggmNIkjN6PAkQ+tQBcNo3QvjgbE5K845ePZ21T4AbNGsVOyEqil2RYjDZyeCdVcSBSPRfUWYCSOAMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657145; c=relaxed/simple;
	bh=/8gWaG1IX+EWIH276XyZxsUwIjayNA09uf5PojIERT0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aiBJPh8cv2kawx+G30xobR91QOLJdanoatDdBm2gJLVNuEGDK9Xvj35aPYURVFl0KyrB8ecMyXYmx/UJV/eJF0SNYosD+Rb40pe3O5cx9Vjfoe3G4aM9hGRO4kh3bCS5LzUJQrK7Q8T3j4TYNZF6XPA5wDSBoRj/UhMCN4Zwy3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=tvHOHW6P; arc=fail smtp.client-ip=40.107.44.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="tvHOHW6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEKVIewheX41VaI8HsSmvQT03FRzjJXlBUdRCjx4c6elJM4KopFG9m3xTI7LeMtBaa9RDLzw3bkSH1tW2EVSIQpLCmbkOVFVisTO44cf8BIBIcsf1fg7wLMGIrQOyINXRNIBuyuR2wCYitn05lpPEuIJstX/nccdY4WREJ8AVttOen6WyYmT3pa+foIjURq9zIpZWIulf7w3TUPxek98y4PYxhdFzjL/dFtzwCTlW0ZtPMdrR4s9hYL9AXifYtI2nP3RRwADOazQwtYTbM7nCGfL6vIYcSOHdvfSA66aSEOnfvI5GKt0po6Wmn4c/Ju6aJta5cFE+M4vCF6EVwxBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/WwL7N/OvpByCUycYChuqKva1z9+4Ra0MlaDDK9xZU=;
 b=lKNCAXNtY82fkawKK9iJRZa98Pe6xkS3h/Yt+iJ4JIy5CsAuMTWG1FLO2A4RCGuGqytRcIz8f7cFlZDtFneL511H6OB65Haxf2eWvO3VbSIdjNSSP4D36qpQIcoQlLuc68oze2zfZubCpz3C+gQd0mmndqURQZ6jjN0b0K1xpzuRecZXxzb69ygHFsRTeNrvLxAp3E+bEyGJjDiReCFrnfsjbnsDl1Ddn4ioDEpAXikeyhEfutknBf0ZdOYZexPZyG+kGPeNDyzZOJUAYfiQt76abxZTH4VYUltvvphNbdV2UZeTbGNcuQrvEIgpNOe/KLDiiYi+OLRj7InTJpTlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/WwL7N/OvpByCUycYChuqKva1z9+4Ra0MlaDDK9xZU=;
 b=tvHOHW6PDWGzdFJpOuLAUm3lJid3yhiaWyD81+HqCnk92lMrWEtxblokVT9afVlG0cShmrDIOLDOZlU2+jjjQnmYzN4EhDK8g95clhshNI3Psma+QT9j/kh24c+QbfkHqsxSYaCijporf3jt47YMt7CcXC/cA5Q4DnR4Sbn1nqXVXfX72mSH9w4uVkO+GowLv/aBNB4rF5ieP8Xci+0JUqBUocta7EwJnBJUHkVNnOnY7NSMEWKZYkAd1OfsFDGuEE1HqvqyAG3ePYqT/4H11Mys4/jG6tuP9JuXA+nc57oIqRBFCyIjhMG1oZpU3PFfG/hrTGApiaZwPzIQFq1xKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7914.apcprd03.prod.outlook.com (2603:1096:101:186::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 07:25:40 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 07:25:40 +0000
Message-ID: <5aa307a7-bd01-424e-87a3-1c7b4f787a1b@amlogic.com>
Date: Wed, 13 May 2026 15:25:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] clk: amlogic: Add A9 PLL clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
 <agH3f3F0pUNOzdPB@redhat.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <agH3f3F0pUNOzdPB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baa01b5-cb5a-434b-6d26-08deb0c0d5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|11063799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jv2whWq5RjHfJyoTHpyVwZijfpa/5i8bMXsIN1dJ3lsj6eNbEguA/O5gmg+W8uXzkng+3BolpYGUl3UNrYU+Bknj4bOnqVcanL3ckMlXnEqjG//82FEVEHeCptb1QFL4DaN9AB0ThEcriZ7H+pZo34XfZBeGQ+YVbLGreCdavkgRftflRwU5z8MPWB1ORBz5ThJhRjp8CXBPUeDTbEJcVBuNjtRTesAGuz2XuKhVdZFPmE71p7hshNFkOVzpvIIwsHjMOH2wuOYrdXG9Vp3jmKZdJCY32VFUZTv1IIjS/QQQvik8/imY0xlvDu6vkqUgHh3y4qevK0A7VUQvHql2gosl6eYnoETJFXj+HuNJEpyVc+mN04h15NOLoubdc+HZ/JNYodULQofAA1sRV6hHaS5d6XanE6DESQUAgk0Y46+KhgNXPVxxM90AlG61W/DVhgmAuwzW/BmtLOmc+FKhp8X34+VHJm5kETU4JNMGeuViqGM/44Lys7Onr7D6fDvgKMdWfVmgWdzl3CQSeSz+lXN1fLZqtvcicZjhCbvSYkPBF2YkL9vBDR6tbgUFlbuSQfjY7duQIspCARPbXRb03JaMdsro3E7EVydEqtTrpZsG+UFC0l2s6VcfjC6sMKx1WS1veDGotX8F+ZdM75SXstLav8uE44uDgjYajejoJwn7CyJZsqdjB3oxdpUriAGo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(11063799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0g2STBtNXpsNFhLT0ZrVnBucE05d1IzcUFYU1k4TS95b1YzYkEvVTRIeGMy?=
 =?utf-8?B?NTNXNmpEcVJucUNOM2ppcnVQUkNlQjdDWS8yTE1TaTVuTjN3NGtEZEc1NHRn?=
 =?utf-8?B?VS82di9JWXA2UVFMZStyNHBjcTRiM0ZoL2E0dnZFbnpoTEdldFkzQTcra2Rn?=
 =?utf-8?B?MU5qZjZEV3J4VnZ4bzMyMnJVeDd0UFpwQTBQSjUwdWFqUzBoOTNoeE5VOWp1?=
 =?utf-8?B?WkhmNUhUdHByWDFYQ2V6YTMyL0V4VWhzbnFBUWh4YUQwN0pyVU5DUnF4VEdJ?=
 =?utf-8?B?M2J1UzRpeVlLV0JPcjI5N3R1Z0RSYnhSQVZZOE10TDBDZ2tNNVdyeVFDTXY0?=
 =?utf-8?B?ZW14Y3M2azRINXJUMjdNWVpYVmlyMW50RFN6alJJc29uREo5Y2dkSjhOdXNs?=
 =?utf-8?B?MW4ydjA5TS8zNWxzNDJpdk1FdmNXYWJRbHNWOXlTSW9qaDRUeHNVQkEvd2Yw?=
 =?utf-8?B?VTkrS1BhV2FmanIyaHpwMHNnYjRhT0xVN2NmcXkxM3VrTjZFQnVIRkcrV1FV?=
 =?utf-8?B?SkpCaGFDREorRHlVNC9BMXdXeGNKdmpDc1Ftcy9FQUdOWVBTY1FRalZLNDN2?=
 =?utf-8?B?cENPczRzK3R1R0tKQlNZOUxIRHEvNnpqbS85UUN3bjlqZ2tEZjlCNjV3N1Ju?=
 =?utf-8?B?SEk0N3ZuM25rVWFoTkE4WXc5M3BWa1FOc0xHOTZUU2c4ZnljM0tOTm0wMEJN?=
 =?utf-8?B?ZXcrc0YzOEVnS0xlSVNxMzlrQkdTSHZZUnhhcGQ0SG9mektRZW9nRE1aMnRh?=
 =?utf-8?B?TXpLWjN2Ty85M1JrVlZCRmJ5TEorSEErZGJWdS9UQjUzcnVyY0VjaytyV0RG?=
 =?utf-8?B?T3Nwa0U5VURBRU9RZ2s2T2JwUExRNzdSQ2tlNk1RM0N0SHJaWENnejNKZzJF?=
 =?utf-8?B?Z2wxWHQvcjNTdWc3UXpTUm1ubjRUeENtMVlQejNSL0hyYkR3UU9YcEg2ZFBa?=
 =?utf-8?B?TzNpOUJPRThnZHBEYWRpdzFVR29UV2c5RmVONVBZZWU0bVpEbUVjcUdkeUE2?=
 =?utf-8?B?ZWREVml4c2lxSFNRTFZhU2doZklkRGpXWWQvWEVFNklNMm4rMkJZbUlVdlJU?=
 =?utf-8?B?UFdKUVFPNWJmZ0VmNlBnbTFrK3FraHVMMDNMRzlPUXZ0bW9MV0FGNnF6ck43?=
 =?utf-8?B?OTlwTnVsdG9sdkVMSXhaVlBvdjR6ZC9Ia2VyK3c5V2tibENQdUx4dFBYazlP?=
 =?utf-8?B?NGhHN1p2WHdyOU43VHQwVElqM3lzeXFobjZOVXUvNFZZYlNUS2dQbHAvN1pE?=
 =?utf-8?B?OVFpTVlrVFFmY0hYWnp2dWo1R2NRclFScHVvdGRaNjZqNUgxTWJkaU42NjI2?=
 =?utf-8?B?RDBsQkJCSVhkNzd2TmUxSFZmYjZUYnAyVWNJenA1djdiK3h1YjFPcDNVa1VL?=
 =?utf-8?B?UW8rVGdkQVJNNStTZnE0RFVyVWgrbmdVNVhsTXE0bEVmVTZrU1M0T0RqZkVz?=
 =?utf-8?B?LzFROWlkY3pPN1pCVStndDVsTzkrYjZubnlCaVFhbERIOVdFakhMNkV1elVE?=
 =?utf-8?B?K3JqZmxGSCt4cHh1ektmeFhuNTZOSFQ2TWR2Zy9BT1ZDQlRkbUZpM2diZHY1?=
 =?utf-8?B?K0RjaExTMEhYYmtqZmpoN1BSWWFhMTFrakZRRnh5MWFPK2xQeE9mRUtJTFBm?=
 =?utf-8?B?c0lwTTJLM29sWDBiMm5EeDVCdFhhZjg4QTFrV2l3eU94MnNRcFExcGswRStr?=
 =?utf-8?B?aGpxSlJUZll3RE91NzFkc2RUY3BicXgrMXp5cUgrSElPYm5ETmY3QkJEdlNU?=
 =?utf-8?B?aWhFTlRSRmREeW14UXpoN3Vwc2QzdWxMazZjWTZOVHQ2SnEwWFpTRUNna3BL?=
 =?utf-8?B?Zk55ZGU2SkF5V09TcDl4eU1wQkI4S0tuWjZiMUVSQUtlUHpudlp6elRYK1VP?=
 =?utf-8?B?TEFTRTNWQ1cyU3RWMitncCttcU5ic3lMY2xHZjF3NDd2cHRRWFRSd244Mkpw?=
 =?utf-8?B?M1JoYXd5amZRZGt2UXZSYUgzTXRmdW1INEVBS0ZWRURqdEw1bmhySUgvU1JQ?=
 =?utf-8?B?K1NtTVBOTSszeWo3ME5oZER4ZjhsaGFpUDFkT0orOEFWQzlHaXIyRE54QzdR?=
 =?utf-8?B?UHcwRFlkTWJpU3dES3ltZFJUTmg3ZC83N29HbjJ0MHdYQVU0bkpBSHZrZ0hT?=
 =?utf-8?B?QUM1a3ZOYTVLcllTS011L255Yk9mcDZDbmQyY3ZFbnVWRFdtRzZpNGZmTkxS?=
 =?utf-8?B?Ynlwck9rZ1Z5bWdLOG9qMUlsc0lkdVhWeGR0aHAvNm5mbG5kTnR3N3ZFbkxU?=
 =?utf-8?B?RVVkTGdYWGlBSlN0VXJXS292bXhTRU55MC9GbGE5amcwNjZNaEpFY3I0cVox?=
 =?utf-8?B?Z1ZBWGpNbkpSQkVIa0c4Sy9ES2pjUmhhUi80VDdud0U2bFczQXJSdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baa01b5-cb5a-434b-6d26-08deb0c0d5df
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:25:40.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vhbUZm/Z1BahPP9WowulNZ5H86394Vwq1u5BLDO/ZItgLaxCCWOmyxuXruiIXR5K/yHLURf/oV9bTHAyp1GnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7914


On 5/11/2026 11:36 PM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Jian,
>
> On Mon, May 11, 2026 at 08:47:30PM +0800, Jian Hu via B4 Relay wrote:
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the PLL clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig  |  13 +
>>   drivers/clk/meson/Makefile |   1 +
>>   drivers/clk/meson/a9-pll.c | 831 +++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 845 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index cf8cf3f9e4ee..3549e67d6988 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>          controller to work.
>>
>> +config COMMON_CLK_A9_PLL
>> +     tristate "Amlogic A9 SoC PLL controller support"
>> +     depends on ARM64
> depends on ARM64 || COMPILE_TEST


Ok, I will add COMPILE_TEST in the next version.

>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_PLL
>> +     imply COMMON_CLK_SCMI
>> +     help
>> +       Support for the PLL clock controller on Amlogic A311Y3 based
>> +       device, AKA A9. PLLs are required by most peripheral to operate.
>> +       Say Y if you want A9 PLL clock controller to work.
>> +
>>   config COMMON_CLK_C3_PLL
>>        tristate "Amlogic C3 PLL clock controller"
>>        depends on ARM64
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index c6719694a242..77636033061f 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a9-pll.c b/drivers/clk/meson/a9-pll.c
>> new file mode 100644
>> index 000000000000..84b591c3afff
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-pll.c
>> @@ -0,0 +1,831 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/amlogic,a9-pll-clkc.h>
>> +#include "clk-regmap.h"
>> +#include "clk-pll.h"
>> +#include "meson-clkc-utils.h"
> Sort the headers


Ok , I will place dt-bindings header at the top.

After updated:

#include <dt-bindings/clock/amlogic,a9-pll-clkc.h>
#include <linux/clk-provider.h>
#include <linux/platform_device.h>
#include "clk-regmap.h"
#include "clk-pll.h"
#include "meson-clkc-utils.h"


If I have misunderstood, please correct me.

>> +
>> +#define GP0PLL_CTRL0                 0x00
>> +#define GP0PLL_CTRL1                 0x04
>> +#define GP0PLL_CTRL2                 0x08
>> +#define GP0PLL_CTRL3                 0x0c
>> +#define GP0PLL_CTRL4                 0x10
>> +
>> +/* HIFI0 and HIFI1 share the same IP and register offset layout. */
>> +#define HIFIPLL_CTRL0                        0x00
>> +#define HIFIPLL_CTRL1                        0x04
>> +#define HIFIPLL_CTRL2                        0x08
>> +#define HIFIPLL_CTRL3                        0x0c
>> +#define HIFIPLL_CTRL4                        0x10
>> +
>> +/* MCLK0 and MCLK1 share the same IP and register offset layout. */
>> +#define MCLKPLL_CTRL0                        0x00
>> +#define MCLKPLL_CTRL1                        0x04
>> +#define MCLKPLL_CTRL2                        0x08
>> +#define MCLKPLL_CTRL3                        0x0c
>> +#define MCLKPLL_CTRL4                        0x10
>> +
>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>> +     MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>> +
>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>> +     MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
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
> You can use CLK_HW_INIT_FW_NAME() for the hw.init here and other places
> below.


Ok, I will use CLK_HW_INIT_FW_NAME instead in the next version.

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
>> +
>> +/* The output frequency range of the A9 PLL_DCO is 1.4 GHz to 2.8 GHz. */
>> +static const struct pll_mult_range a9_pll_mult_range = {
>> +     .min = 117,
>> +     .max = 233,
>> +};
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
> You can use CLK_HW_INIT_HWS() here and other places below.
>
> Brian
>

Ok, I will use CLK_HW_INIT_HW instead for single parent case.


Best regards,

Jian

[......]

>> 2.47.1
>>
>>
