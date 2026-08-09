Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011033.outbound.protection.outlook.com [52.103.12.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B638F62F;
	Sun,  9 Aug 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270296; cv=fail; b=snHSd0Uyt7ulfJGsN1EmI5xyawp+PbxASBJN7xQiO9vdTSSEx+DiOLPf0kl0usCA2r4u7He1yK2JWYXyY6t8Ta619t8Fpc0dNDi75RMx2TFPEtPmHuyChyIqlVzjcX46uDc61ae83M/812auZ6fzeoai2VwzJIov7dLMgOs340E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270296; c=relaxed/simple;
	bh=ci3ZWraRKIpbrSQLOqU/ATIRgn7RmGfxXc3R+f6xnQI=;
	h=To:Cc:Subject:In-Reply-To:References:From:Date:Message-ID:
	 Content-Type:MIME-Version; b=j/r7BIDjsng9fqRz3sOfUG2Y/X2oVmf/3PlS7sLxczsfH+VGB6o30IvtJTNkiX6hG1H9FpaZyHuJLy7diGR6SwFU5z4hOdCQ0pSPAW5Qy3mHWPhHyXqmzdAgw6zGX3GSyTRdF6Gog0IwIPKEXNPIeNKlzkhnqkbCwuop/gyEduM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IvUdv/DV; arc=fail smtp.client-ip=52.103.12.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IvUdv/DV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzq5VW82PYLbVLRY1KC3ql7tcRYNde/WvgUKQ7Dx9ZI8W/Dj8wGP84We414/y4z+tHvnews/aqtXJNqUYrsgxeYqsOD+9ZmnKKqXypjTxE1ffAw3rLr3NRHuHeVnK2K69wCdio0WbmG6BvK8WwMdFnpK7kdK2FLRMCzlQFp/clazBhimG38Y7i8GtPAYKyZothygj47VP8nog3EF+HWSJda1gH1F34Q/hWJib3GuGVsFCrP+z+0IxFj9V7igRAegLFCEq138lQJI0sP9x3xhQTXuGICwILeLqSH0xkhjWHmdRK75uQY73AnfA5OS193NeLz0mzkTKKtIftS5eglU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPjHmaF/HKJpI/igT29TodYQvCPLpSh84M6tpQNJg90=;
 b=itADey0abWNFjY134Dtvx+s6JDAHLSR63aErJVYkhDjRePxjxdQguelC/eCbMLuAYSWx64vErlRgm81NGogYFYHgL6M4sIP3HeAR7+qXadjwrjlzo3CEL20ZlxeUtBnAQmBFeVK7WHnq7v3/i74FXa0tg3LK5hmzrV+t7UOeyE6NDSPX4RuIcU+WlEBb4WXML8kBIF4p8gKB9zFrBYTbKiTWv2cjsnr7xFzkPTpGjrFXW5FtUr7H2FBEsBwRoOfoP07AwjoJBroevpNl8P8SZEfa3Vc4eTfxvmY8xZgUXv13HB5/skopI25h8FG2gcCEHcTBrc6f+baQoIwKhxqPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPjHmaF/HKJpI/igT29TodYQvCPLpSh84M6tpQNJg90=;
 b=IvUdv/DVsyLmCObFZe3lTFCP16YrLCZs4Fcz0kUQmtjMuRrICgPEHrNcaHIb0KI+FngHG3+fZ03GEZrp0dCaiIk7yP8jyLefLGTODFUMUKoZjLEBws/Wsj6DxQBikIgXFRGZhqCyRBXB9eoTP5cxOomTKSH5gfUhVHxfzwKVx2VexObbl/WvDA8xZjLAXOmR9BduZGNAkeI2WVgiTOLeji9g3nWH3aWGorO7/j3dL2C9K03Qm0Tm3OMebgrQwsBaDZ/bbq7I/4Tukhft/ueHkPbPNsu640G9XT4sy0CyVMl+nI2uUGuRorA/KnpdSZdl//MHvtVd/DGWThAfsDNNFw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:11:32 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:11:30 +0000
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 3/9] clk: stm32: add STM32H7RS RCC driver
In-Reply-To: <ami2UOZm0VoYRmK4@redhat.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB6091885F8E6F522600B25AB9ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <ami2UOZm0VoYRmK4@redhat.com>
From: Liu Changjie <liucj1228@outlook.com>
Date: Sun, 09 Aug 2026 18:11:56 +0800
Message-ID:
 <MN0PR19MB609102EA65DE229D83302B08ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::18) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178627031635.53692.274836010443076243@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 5607b489-1b47-494d-1747-08def5fe94f5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|704163111799003|5072599009|2604032031799003|15080799012|37011999003|23021999003|16051099003|8060799015|19110799012|24021099003|41001999006|51005399006|440099028|3412199025|4302099013|26104999009|10035399007|40105399003|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?viXXRvYCCOJvsHPiKJZePOUL7JUM53tpX1nPfA7G/kw3iKuCZFFLCq9cA0dS?=
 =?us-ascii?Q?uXk2U5ua7k/vw12kWY6soYb9xMSiUzMf+gcDZpAECR3RsdRVWs75I07Ep88w?=
 =?us-ascii?Q?r7MV+bCzsAoABZCO/XPsMQIbg+Y1nrHybIfxbvlFLsYLa1zHADRfkv+pHB+r?=
 =?us-ascii?Q?V7BzUYSC7CCVEhXV0i1pyuUh4fB7bk7JOErvPPKd/TxEDaRo74EWELeKkTFY?=
 =?us-ascii?Q?w2SKMYCBH0AxMp+ac3fzjRM77Wm+mz25zbccSmJ6LsqhHWoxjMz4+S1/dkLM?=
 =?us-ascii?Q?k4p/Z+M7LMVtUs9OA87SLb6n9MP/T3XJO3h40P4ymJfmQFlzIOosIjGC/JmP?=
 =?us-ascii?Q?y/UtrR/JCM1TIrcY+aq/3Xtzuwi6ilz8ren75CxYWLR5U7g7ykYG+ukXSIt2?=
 =?us-ascii?Q?crVsp4N5P/uNUnrZxlUs5S5zwpfDgPUx6geYtAhVjFFf3acr1MEIdqMjKM/h?=
 =?us-ascii?Q?/H9lj2iYIbyEveaSID+RDEZhKvw0yhg9qwkX+lPFBHfVaiIu2uwLjaDAzr+A?=
 =?us-ascii?Q?ztIdwRK8Abpb5Xd0f7cftrDJioTyRMTgvs0FkNNSBMoEI+nTNPe6yvhGDxVM?=
 =?us-ascii?Q?cF7YWDfeeasOJbwTxF9PS7i6RpE7SOeU9/wKIsgxZEXN9mlpk+08A13U/dwm?=
 =?us-ascii?Q?BVr3qLPyKx+GLm9RsHLngf9lOLrMsYBDd0fyQ3J94mLgeGtNSO5/Xhmm2Psp?=
 =?us-ascii?Q?zNXVpJV+X3QZiE02mv9K46s5K6Pz8IqavqLrsamwwUc8AMm1IhC2OSb7pN3f?=
 =?us-ascii?Q?KKy9QcYKQ24IIt7NMP2bYZio294ct9LsqK9OZ3HjkSLrnioBn+lAxANWdK+l?=
 =?us-ascii?Q?xDsaIBIi2ax7L/HiG0fZS1ri/DBTyGSRGQ/afa0I3T2tuq1z/R3ZTQwl4MwC?=
 =?us-ascii?Q?Igm3daaFSJVcTNlcPLFUaXsdYJ5o3cPPUPf330epik1fbDZS/MoXXDhZfFbS?=
 =?us-ascii?Q?1nRYU8vMxq631CyhmjjPzUexTcZynN+v9v+N+RQxSuAdPjk9jI4/hYr0MLLq?=
 =?us-ascii?Q?Ckrva7CeQXA5C2U+pCIbIqb1qXo6Ize1yQbkDhtnPk4e474xMY77zpLM241e?=
 =?us-ascii?Q?4aynql+JNeoJNFBay2ywVDosSKe7wPSePuLUHWFVzORyQoAmGsxMGBePSZTn?=
 =?us-ascii?Q?D4/5oxYF8C7Y5v9fJEHv4AlQA13Wj8wVfT8/3AXbaUKupUBVMj6aad6WLVMn?=
 =?us-ascii?Q?OV5yfaBnzbSARkpwtqcVmMVbRToOkJ4zW4acRw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xVRIWCEirbVK9aZT3ASxB7HxzB6e1YqvarbJFLVL7RMCye9tYtyccwcCT+6D?=
 =?us-ascii?Q?XwbYTAHkiROIozMntd7ofhhlt+dUMnbyThdtZfzbcwRqUZ6CTwv7hHiwnaku?=
 =?us-ascii?Q?TiVkorM05mL6+P5D3NrNLZdyarqjwiHYEmnx7SEcK9SI0kVNSpJV3/i5gy5K?=
 =?us-ascii?Q?tcS/f+rRDRqqkLIwsbH9nlBUPpvOT5Z7y2xSP84nhS0qvpAGsALcRp4KyjT6?=
 =?us-ascii?Q?IQjzydA/ZvfoKUerdH3hutWJCqsHQ9/WnEFqUxW+0lBtGbek4uy9S6XbxyhR?=
 =?us-ascii?Q?qQ7WbmP/E9itcnuX9Qx8CyvBJwXhamb4AmsoiCKRI8Oe4KZVlMHq5HwpStSE?=
 =?us-ascii?Q?usJL18O6iztS5rnycqGGw/kHIMuOqz8Ak8v6Z9inN7AZbftLiR/2id1BX455?=
 =?us-ascii?Q?UuGcS8MfIqlE2ZpfczRu3kRF6n0eeFF1KE+EObPL+1RWTT1JfpyC4IPFG+gA?=
 =?us-ascii?Q?/KFE5jphaVKiGHXAryckh/UXW8cFcc1mk9Y++aIGlKLK4mPgXbwsz/RB/jA2?=
 =?us-ascii?Q?O3urmj7/3mio8lzZkx/tjwXCZygAB/ALOKvdAUZesVO+/x6i9ASn8F/iBlGF?=
 =?us-ascii?Q?Lp6FjtIt+3Jo1FOX9E/+ZL2ecdQvMNlGwf03hy0lVMPCJr+Wocee4fOONJcu?=
 =?us-ascii?Q?wThU1FlN/1WacB/dhBSrPRH+i3lkE0b3EybDlCHsLe01Kjleqz6uM+zAiSjC?=
 =?us-ascii?Q?0Fvj+zLOPICeKL5YIKrXr6nUs4anMsBq6n2IkbP/LzuIld80xoou6hZ31G2D?=
 =?us-ascii?Q?Gccozin63vEvubobW0g3ebLTr+MIGXO/ehK2G9vin4SnwIKrZv8/g0G7nzB2?=
 =?us-ascii?Q?iha1UekOoshdC/s2bmS73/atnBvR4LfazFGmQh/XK106nd/xjdXrWSnOfbNy?=
 =?us-ascii?Q?icN7kLRqXKiH3Mak1C25fXWuhjhm/lAsgF/884ll4/fuf8H1HJVYTSHZ+P2D?=
 =?us-ascii?Q?SMo8Hu7+TSbAmLSWx06R66Oj4/NJAmB3EQjfa42XV3GfHcfNYo20m/FE1u1x?=
 =?us-ascii?Q?SH5Vw0xGT4WyRGxOBpsDPDRpu1L6Yalts4L1KOZmfxWrlLmMVQYCqWjrfhxv?=
 =?us-ascii?Q?1KtiM9UmEyejcuwEimjkIwO8EoJ8dWZ0gnpJ3VbIjoV6j+khZC5Aej5BfrYv?=
 =?us-ascii?Q?5oIG57yUpRYE8obVBsGPBDhlrgCJ5N4H0Lb3iX2LsDdic7G1VAHiFNTq/+uL?=
 =?us-ascii?Q?AUf628VZF0Ksp4Up1aoyLtImLd/WKmHspCpIAeudYKDhBUArRRrWxoBbKFiW?=
 =?us-ascii?Q?Hu3cHaE51yiSj09QF8GyF6REfKw8weuyjVIdOYstFPk25L3FARzqxro9+0PL?=
 =?us-ascii?Q?yWJXfwEDfnikGEyZujBlB3n2BdPwNMasySpHA/Xz7NI0iTvIsLr3Rl36jhUl?=
 =?us-ascii?Q?QDEWPTpMWgY5oFWn21HvA5zJYD5mxR82kJRAjcBpzXQpvwah7A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5607b489-1b47-494d-1747-08def5fe94f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:11:30.4590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667

Hi Brian,

Thanks for the review.  All six comments are addressed in v2; the changes
to this patch are here:

  https://lore.kernel.org/r/MN0PR19MB6091BCCEA08218EB99DE07B8ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com

> > +#include <linux/slab.h>
>
> Is slab.h needed here?

No.  The driver only uses devm_kzalloc() and struct_size(), so I dropped
the <linux/slab.h> include in v2.

> > +	u32 divr1, frac = 0, m, n, out_div, source;
>
> Reverse Christmas tree order.

Reordered the locals in stm32h7rs_pll_rate() longest-line-first in v2.

> > +	numerator = (u64)parent_rate * (n * 8192ULL + frac);
> > +	return div64_u64(numerator, (u64)m * 8192ULL * out_div);
>
> Newline before the return

Added the blank line before the return in v2.

> > +	hw = clk_hw_register_gate(NULL, name, parent_name, CLK_IGNORE_UNUSED,
>
> Use parent_data instead of parent_name. You can use
> clk_hw_register_gate_parent_data() here.

Done.  In v2 the gates are registered with a struct clk_parent_data that
points at the parent clk_hw, via devm_clk_hw_register_gate_parent_data().

> > +	base = of_iomap(np, 0);
>
> devm_of_iomap

Switched to devm_of_iomap() in v2, along with devm_clk_get() and the
devm clock registration/provider helpers, which let me drop the manual
failure-unwinding path.

> > +CLK_OF_DECLARE_DRIVER(stm32h7rs_rcc, "st,stm32h7rs-rcc", stm32h7rs_rcc_init);
>
> Can this be registered as a platform device instead of using
> CLK_OF_DECLARE_DRIVER?

Yes.  v2 registers it as a builtin_platform_driver() with a probe.

One consequence worth flagging: TIM5 is initialized through
TIMER_OF_DECLARE() before the platform bus is available, so it can no
longer obtain its clock from the RCC platform driver.  In v2 TIM5 is
clocked from a fixed-clock in DT at the rate the first-stage firmware
programs; UART4, the GPIO banks and SDMMC1 continue to use the RCC
provider.

Since the RCC platform driver owns the RCC node, the generic reset-simple
driver cannot bind to the same node.  The RCC probe therefore registers
the reset controller directly using reset_simple_ops (the driver now
selects RESET_SIMPLE), and the RCC node uses a single "st,stm32h7rs-rcc"
compatible.

Thanks,
Liu Changjie
