Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022092.outbound.protection.outlook.com [40.107.75.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537026FD93;
	Wed, 13 May 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644408; cv=fail; b=F5D24CJVJL3lfWPiFeGtHdX09elQG4stn7ujYEU5EHXPJILNJA2FWyeowmNETUqwqCFtaAEHjK+S69vP6nKJanuilagBTs+TWQOwUL+azNlEe2w5ii3WU0JhFPkGEdWt4Aq5PP/84u6moMBMYchGNODiLK5ME4uZ1gGD4wHQuGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644408; c=relaxed/simple;
	bh=tGhCh2OQkZFdnv4sRHIHoYbKGv1fjIyVUxMgrDgsNmM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cuEQDhCyDUvqqlGGiS5ZgfnULRhSZIlFh3UH5TP8Dftm/SVNiRcaSsfqsm6t8O65CMmc4BCZaimte+ayy3gh51K8K8gMK0fKlzCvVg8Xf0VTZcF9yF2HRaKZUVNHqUeS+yo3LnvZ/VccPopu7IRT0tQiMLO7O95oNUAlHKietao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=rUkd0Dk5; arc=fail smtp.client-ip=40.107.75.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="rUkd0Dk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1iIWI92IAEkhLob7acAxoAh/dPPUxKu4cfKT41N+jjHwppjhNHvgjCOwIjoqX205qULY8idNIW2PwkiUHR8WLYXpf7tyJYyvmzI7sENCyHZf958i56mKHfQaszhuzHkeGxIovyVLv61i2ct4FrA8w4I7m77Tg19HtYSa3b9Fy+r6Z9gtf2dZQQeUCj5grXfL/+BMP0JgI7V0EIuQ4IieDAnDyQyPVrG4a5F9Eh+FiSsPsn5lX5lFvLgjSIWZc5arN4w6oOOFo9d3qC4lsfNT7S4MBTfyccoeHpSw6NoiiM7uuPdD8SfSiE7+Y2tvJUusYHnfZmKNPHxkuAOT8NDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGhCh2OQkZFdnv4sRHIHoYbKGv1fjIyVUxMgrDgsNmM=;
 b=PEp/m9R+moBzezYIhgig21CAG8Yu/TCBBXihFlYVuCl7okBPnb42oMeOXTvjz+PZErohymEZTcnCt5lOZhEMwiOZF71obLeiku3Zvh0jYtS/G/C5nUCjrcFXMkD5XG0OsRyeeiPntw1qlLQyCxTUFCxaRk5t8Rhq+L/lXydueZXoCENWaZxrlSQggdKzZwm0fEgTVb78hFjIsdymkHE6CeNiuTpWiAJaokOtRilRJGyrd5hS2Lz04O4x+30nArz1zFHTjjcx3rZ4eAJhnBNINuwufCJNuyI3JgCPhDqe7w35J4L9laQ0T3+iXCfGFtTTaRv7CfL4fPMBMAZE+CnEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGhCh2OQkZFdnv4sRHIHoYbKGv1fjIyVUxMgrDgsNmM=;
 b=rUkd0Dk56Mqk3wuoBnSf4sYc1TRbZlciEo6sJepvw4ITBzW1dZMilKOufnviRIf65M73QRSJybb0vuIwdZQf+JVjp8v+09NDNuwcQh/uIb9ih8hV2ZK278HEpZjqHAbYE1PG1PWZXiKB3T5YUwwnvmRedBzqFd/w0CU2Vm8clgdsyH98s3Y4xcerGJyLOi7JFi6QcVaPBXMDR/X05z/Ws6y/UyADmVpXcKMXHDLjSOmKpukdAIF9C26ypSWUfilw24BCImPQaVDVwE50DgB5z6xpkYLiqHE4XCvPoCpB2ou+8mPI5NYU7DufNf6Np2oh2zUOHWJCxX1Fn/9mmk5tsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7837.apcprd03.prod.outlook.com (2603:1096:101:17e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 03:53:20 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 03:53:19 +0000
Message-ID: <f597307c-d1c0-4add-b3f9-34ee1bda0a24@amlogic.com>
Date: Wed, 13 May 2026 11:53:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
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
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
 <agH0FMzku3QRlB50@redhat.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <agH0FMzku3QRlB50@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0007.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 305aaf65-63b9-4d3c-afa6-08deb0a32bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	R68Uj9LQI8rj5Dla3KklwfvX7dOQkhruxEpUVggFQw6AwQRLVbvNfz8RF0QnFx9XubmqkUs3OBHq6eyeRA18HUvIs08Tj1vzkTbANpUXkY+IrAEPBT+VE+6ttbAuSxDiQQp8xQvymYP9/aU3kaGbUSP0f2/pinsjeikysP2lgFRT6YqOOZpkbdyKZyBlxyzOkzemczLlx+BMvDDftee3doo184WZX51YoD/wlt0Se7dSG0q6yuJOdqc7AWS/D/oxMwFh9S6Vq1QNbTksqRTjztjqJBzRuyIV+Y32T8cZzRvei/K3vHfPIJnvpwtdtuJZneGie+P5yu+BbypjRoRYbZdh8Dq3Y9j7bvc+7vaU8gdfwRi7HjPNmr8bQV/UdJEaulopugOT2a1PRyDd+Jskgk2cOX6epW2M32JOsRm7ARex2+9iebVClpv6GkgcQFxJZjUQ+XVVSLjHXiVhwOUBLLJdM4WrLKdLlOyJfcyChTLcA7qg/mjW/s5VUSotzm7siKT4KS1xWToMXx7sOofsJWqNsXP8he1W6UxLqoo8CLXnuZSCcmgwb3U+24Yyv3o3AXRgY1VRRH6RolFtIOjP/+y8wn/4jbFo/GBdz44/Ny5dycM2brZUBTRLbdMjRuljQ+ArAphTXdY1VAwXiItL7JM6bl4GTIZMk3wYnK98lfxt+QQZCDyoUyfFZON8CYaf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVja0dSZVZPbkVObWFpZzNkWlhlYWFoUWxlQmh6SG5UY3FtWWlBcGFrcWdy?=
 =?utf-8?B?WnZNa0Q4VVRKZU13RWl0WTVJMXl5a0xlZTNOV0JJbTFNL2NLS0FkRStpc3hE?=
 =?utf-8?B?OXpmUVk5TXM5aGxQd2NVVExBUG5YMGR1VExCcFFKZDBGd1d4Y09VUnpicXNu?=
 =?utf-8?B?Y21GSnJqYkZTUTZHM2IzandIZTlrVGY0c3gwUE1IOVJ6TFdOVks5TE4zLzZt?=
 =?utf-8?B?OEZ2enVqenliVTkxNDhqTUJyaXV0cHlLVHk3MXhoQ0w5ZzFQc003YXFpTktj?=
 =?utf-8?B?ZElyRHJYTTFUTU5qZFVXWWhmUjBEakxKUkgxVG9zLytZTjNzWDhIVlRxc2Ix?=
 =?utf-8?B?ajkydTUrUW5nNlJyR2dWanhldktNeC9mcDdZVTlKTWdCTVVra3FIeVZCeXNp?=
 =?utf-8?B?NEl3SWtzR0F4citnNGF5U0JGK3JTQUE5NnJVZVFUMnpTWHZ5OUpZZkZsbDlT?=
 =?utf-8?B?UlRuWTh1K1VPd2xMMVJ4T3FqR3VKTGZQY0x5ZC91NVpHclFNSWpwak9LSnhD?=
 =?utf-8?B?RG9Jbm1sRTVzNUV1VHhlbG1Ka3JWQmc2MmZQVUJSbERGSmptbnV3bzNHWWJE?=
 =?utf-8?B?THlHS0g4NkFmRDlrZk1NbEg1aU8va050VkdpeVV0ekw2K1hVN0lHVk9GQ1Zo?=
 =?utf-8?B?bzd1ZGZvZHpYR3puaDJDSStsV2tLY2l6VXdpT2lpb0JCUUNudzMwbG1KbUtz?=
 =?utf-8?B?ZVNVV2dtdlZ6dlRoTVEyQk9TTXJRdFdMWlNxR1lkckdkb3JjODgyM0g5OEov?=
 =?utf-8?B?ZlFCTU1PWlAvWEQ2RW1SdHZLWXV4Mlp4RTB0aC9SRUxMZUtiRkFodmxiZ281?=
 =?utf-8?B?Y21YOWNBbTF2dG1OSjcySWlPY3JvR3YxdlVOOXFwMmJ2UzFRcGJ6THVvTlNz?=
 =?utf-8?B?L2Voc3o1STMyb0xVR0RTSVMyZ0xyS2lWaHNJSWlYVDdHUGJPUWFPcmhKSDBs?=
 =?utf-8?B?THBES3pMYnlLckgranBNSXJRN0o3Q0VVS0NTeGhSYnpvdWtvZ2puR04wZ0Zr?=
 =?utf-8?B?TUxkMS9TWEozb250dEpKcU9WRnRMYlVWUC8xRWQ0c2ZBamdHM2lwdENEcmgw?=
 =?utf-8?B?L3JVNnBkVUJ1SHdYbzRTVk1JdVJlR2lHK0poYllQVGtCbytxR1EvV0ZwQWZD?=
 =?utf-8?B?UThHY2EwRHJuSTdFbmlwMVgzUTlpVXFGWW02bjZseDF6M0s4QkwzaFRCbGNk?=
 =?utf-8?B?cEIxWTRwMGNERWlPR3FxT1hWdmhzdDlvcThpbTJMSEp5NUNOQnJBeW9ncEFM?=
 =?utf-8?B?SUFZODhqeG1DUXFZakpYSnpZYlFsWGYxeXFaRmt2SEtJWnVzQjcrUTI0eCs1?=
 =?utf-8?B?RXQ2Z2xDQ1RUbllLYTRlVXRtdzJ4M2YzdjVNbUlCb21LamhaNFMzN3ZWYnY1?=
 =?utf-8?B?NkQxZkVHSlFmSGlFdFF3ejh0eHBoOGpNZWFUaGMwZG1iWm1Fek85RDN2Z3hF?=
 =?utf-8?B?czgvQUNJLzRSS0dLRWNCa0sraUlYNTNyTlRQeU5lOW9QbHV0VEFIN3FwZUFi?=
 =?utf-8?B?U1pTQXh6WXRISjJTSk83cloveTkvSGE1aE4vMjg0R1lTTklFN0laUGV3bm1a?=
 =?utf-8?B?cmxHUlRNa2xHNlNjMUZrcE5CS0ZUa00zbHJ4dU5vNHNDNzlOV3JOS2s3cjQr?=
 =?utf-8?B?bUVKK0ZoL2ozR1g4T0I2amd1R210NHl2T0NDMkNkUWJmUWVVTTNTM2ZOYkhv?=
 =?utf-8?B?ZWN0L0VTcFJDMHdsbEh1SkF3ekZjeEJXVFcxTng0VDh6VGZucTQ0cTYrTThG?=
 =?utf-8?B?VTZIYWVCZ0VmSUFuSzBHZFhrbEJnMUI1aUg3cTBqVGpwb1NZb1I2eGJTZDNx?=
 =?utf-8?B?OE91VjFEZS9mTEMvTkxxOUFNZndvOUtxYXMxK0RKTUNZY2wwSnBSa01hQlNU?=
 =?utf-8?B?elRRaUFJUUFzVEhZY2U2ZHZ0T3VlVGF4Q3FrdnFMY09lbnpEYURHZ0t5eHR6?=
 =?utf-8?B?cGw5d3N1UnVSTk5kM0dFNVhUd3QzckRqZGFSU2lFbEtFRFhQRFZBNmlJSU9o?=
 =?utf-8?B?cU1lTjZ5cEpPZUozTllKdU54d3Q3NXVSTmxqNUV6ZDJ6TEJZWHl4UGtETmxW?=
 =?utf-8?B?SHhhUk5lejNSSW0rKzVOUElaMHdjQzZhdlZRblFlWWUwZG1odWxVMzlMZjdN?=
 =?utf-8?B?MXMyc2xTS2RMbjJJWTk1OXc2a2VwdGZYelhYY1IxVXRiR1pvQlp5U0g5TUps?=
 =?utf-8?B?QlM4c1BoVVk1Smgwd29pbGxtUVJNQ3lWUXJLRDBURkdsQ2Z6ejRGaXM2eWd6?=
 =?utf-8?B?V0hPeVhjVUZSeGZZTWRJOVF0dG5NbjJpdUNJYXRsYk1qcGx3bGpLc3JZUW1m?=
 =?utf-8?B?anhQRm0wVlIxeGpiV2dFVGhGRzR1b2FVQVNudTRiUHFpMU8rOVBBUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305aaf65-63b9-4d3c-afa6-08deb0a32bee
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:53:19.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5GXOJP2k2mXLOUI6eibXRa4Qm29OcGM+aS12J30MTyveuOa1cugoXHVCos0k9J9nX3bEDxh/EQuZBfwlQRzBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7837

Hi Brain,


Thanks for your review.

On 5/11/2026 11:21 PM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, May 11, 2026 at 08:47:28PM +0800, Jian Hu via B4 Relay wrote:
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> In the A9 design, the PLL reset signal is configured as active-low.
>>
>> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
>> is active-low.
> This flag isn't in the patch. I assume that you mean
> CLK_MESON_PLL_RST_ACTIVE_LOW?
>
> Brian


Yes,  You are right, the flag should indeed be CLK_MESON_PLL_RST_ACTIVE_LOW.

I will fix the description in the next version.

Thank you for pointing it out.


[......]


Best regards,

Jian

