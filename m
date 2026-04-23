Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868933EF0B7;
	Thu, 23 Apr 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949787; cv=fail; b=rX205Nvr28qAhYsZov0PQ28BBqDyZ1V8ZCXsB/8ALCsyz88nUEtH3csrPyP64wpGf4XnJXfpt0wRLIQB3IrkJl/doARjdBHDb/5CPHk2BysgDZ424VmNnd5dkQWsBJonIISxcsaUpO1aCem/lfLVj60WZWibNrscgY2DtNf6A2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949787; c=relaxed/simple;
	bh=1C+TugTbAGT4waMlxbZchwMeQPKKt+RgfSBXRR2HLVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YQYOjNNwI76bFhXw2F9WGfFhbkV2WDLHXD5ihvo8DpgtpTm5fbv7kWm2xOsf8obM0dPUOFZSmB5AVeYxVqMwJkwMfnVL2pa+tFBsvYBlbGuMUTTSypSZPwc/MYws5RrKDO0haBIv42a61guxarudd0CQ4nPslGYw1pbKVanLtBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G+Zt2opk; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G+Zt2opk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT2V6StmZ9SKAdkdTLRXNh2J4YkN2ZR/L8iwMgeAIAue1HwMua/azs9uWj8t+qaUU8Q6AdkOXWHlcN+043lEUqyps4XW+EYQF+7Ja53a+14fJUv9VSHodiAAvHb/X70hfiwUab8CFmSHUaZusfR8xe5t+b2luS21dIWPOKcy3Oge7AUCbs/H4UL97C7/QIGlxPyRCe5iSNz2QjS83r072gzGc84PH81kXfFJLrGsU3CR6d1+e/uVCVIV3uVQSe1ZYypVfLG5avdF26fuqxzYcaQIKD55OVZrmiCvXn0HVfDbNCnrP/dLRtqHWhBNUhvxtppO0VXNv3c93JtrHfg84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHuuNz6ptgQ8XmEhDBsMJrqEkVn/WMuAEJkDEJl0uyw=;
 b=k44Xctt2f2Ckh9Ah/W2SUr94yWwZfVuVYpmwW0735IifU9YiMBVp0p2Guv2HprfXCjGDQZH+kyxeo/fLiqwiXH3YccEmB2917PlMjYrHIHjPjI+qiwsM6ZS+ItuSL4BmzWgVnpOAkXNCGIRcje792s5iYLuUaA6xGfv8q/HcPbLe13ElGHg8ByrByr8LWKFsapNBIwmc3UfXLN2SRw5qfnx2ptHyZ9/62kDso3L4hrgx+0gyv2lcesyyArgn+VCdBPrtOU/x+mdngf7W4Kx0uNvXSPFhya4WTKWFgadDZPkeEig4zCcjbwEOu37gKiznASy/K6IrpzWia916MtZ7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHuuNz6ptgQ8XmEhDBsMJrqEkVn/WMuAEJkDEJl0uyw=;
 b=G+Zt2opkKRpi/rT9hRd/I554xayWluLVOFPJmIzoZ+nOTwekCpGZiKfywFfjcgenOCqDArwFlCPZg3qWF0q61wkLpY6KuBeNYZNyrlViv6xI4kTY4OmaSAdiyMt2HsKWfAACh2qFq4mNhMDkscQObrN4g4QlepPH0P43VHmPqSW+sW4Y75pEdhlhpUMafyIZrerMjBqUzZD6MjjKUtFIiHcTKB0DJcsP4dRjpbwLRiesjLWhv/E/hOT2nSaimo/joTGHmz7vl9GmAITS076QpYBmEliWJOuwOzkz/vdYVIpmwr5kIemalMceMp0q5JVCXVVSVf3Oju1DsQ5Y0IYB4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9935.eurprd04.prod.outlook.com (2603:10a6:102:387::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Thu, 23 Apr
 2026 13:09:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 13:09:43 +0000
Date: Thu, 23 Apr 2026 21:12:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <aeoarZHOTrinRELb@shlinux89>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
 <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
 <aejUd6L1AfbsflxR@shlinux89>
 <20260422-satisfied-rough-mongrel-aabca1@sudeepholla>
 <aelzO5W2HD8zAgxf@shlinux89>
 <20260423-pompous-hissing-tanuki-16c5f6@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-pompous-hissing-tanuki-16c5f6@sudeepholla>
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9935:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d22997-d1eb-41cf-7b43-08dea139958f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yBPx7MxO96rBNtyFZ9TTpCGsH05oxfFjdPVWkb2CvZbKiIbqG10kyhYvePIgfPp//XV++GvT73ws1OwXJepFzIGoA7AAzKe412KpHts9AyCdEB1fiQUcO1PUr5r1o0ryFa4Yb9g71PS1mq3XwzP2Oil1izlJr821x5aILDw9xxt72lPrOvzbuqb3ZD2ycfhPwaV29xznJkKC3GvkfdPZTW9zW1rIz9kZIJC03TBp09W8uguwEI8nIVOobH8YPoi6ge0x9lcXSlcMxd3GCyd9uV66Xw1bGCZNh9ekKWdbODlM6MD7i3fVREVG9zvGZcLxCCL8Ya/MG+KhDlXiePUtZdIFwiSXiZJV3uPTtRPxag6Bdua520Vl/O5x9NBSWAzBLicwoTqewO0vmhwlefyjY/VVlB45ygMgIks8Inck+KiKq9gSNe2Kp9vCDNyZRdNuRS4QzVfkBHShc1rtbWaxxjosZXpuTf1uzDjAWq4vKClQUVF56ac/PBg00uhvXYwba27SXYZwGTS1L3L9w8CHXPpOhj8cEUVg5j+BLSrGIegSG0wh6WWBLDM8UVpF04zP9EYRgXx/OSdgYbQu1EWuUSL6Q9Xwh/g+ZPxzp4vwscOi32l6RDM3QdPTIi8q7TNG5BheQKGcOPtj9iw0U+z5gFZCnr8bmmtzKHNkyB5IZX8gAXrYrv82M54noGPZ1Xd1hFjSVH6wq3d+6ZUcJc5SncG95ZeD4IceidqAx8jiIPy+lwN6yhPAovX9ia94+9r8vCOvJhlkbMHdVGPhhiFu1GQYk6HGt0csbYqsQMtcpmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rLVnOLVhk8Cjj+yhIlHlnr0S2okvHhJ393GOzx04YIukG/fu/hCPFKIQ30eP?=
 =?us-ascii?Q?J7y+4kdxxvYxwiiwAE8gbkxts47BEjKgmi1enOem7fVKVrjnN1M7oYeT74I9?=
 =?us-ascii?Q?2wada5mc75j+vcuZCD5fMrZv3tdgxX2kMQgCMp9Wnzf1ToocqDBftxF5EYRI?=
 =?us-ascii?Q?iK2WG31g6BGyRmQLedcu80s1/wwlb8uxKD9mDMWyKyW0Q/5DUetEm5gfbQEr?=
 =?us-ascii?Q?faoCcXjilI62WgqcXYrDGukpxOXT/ez/F8rVTIpKmlapzrGfujeye5CeFWkg?=
 =?us-ascii?Q?rD79qZTGbWX7dfmd+ZdUmBO9CT2Lz3rf8hB82UgY88/XBktsQfk3gscR1kia?=
 =?us-ascii?Q?DJAvrXGrjpPG574nMl7NUF9zVuAZfLQPulzvJbG616HGyz/ItrAO+MoI57Uk?=
 =?us-ascii?Q?e1IkUAqY7ca8CApW/mNZ3+OW6D53kYhNgb7Or6o7GjkkdJq0XMwNBsaheuUU?=
 =?us-ascii?Q?xVukn79kQorqLm3+bDHa5QanOBT3+6Sh9LOoYq04f00qRk26/ml4334EA4M8?=
 =?us-ascii?Q?gkDXOyel697Efx3nlJ3QFUgauQ8nWA7BE9FFRcXjJ+iGoAdqZbkQCEMIRqM7?=
 =?us-ascii?Q?58+60NWrPphx2/cDhqqZwuaTGBY74GXzehcKQSVLeCaZuz0CH1aeWPgfpLyq?=
 =?us-ascii?Q?usPQa+kWq3nxwMct5er1QtXDRMDVfrRn8fu0rYNl1hQMrit+BaW4Fttrf7+w?=
 =?us-ascii?Q?ofq0vRVNssGFdgIdJs02yBV6JP1kz9vTYVc/QpQtN8SLnVdjEEU7jRIlFbvE?=
 =?us-ascii?Q?gF3S8AkGNG2v24RFg5T5fr+FjiRiWpMehZMYfYHPkIhH6BVQfwosxEVR2fEk?=
 =?us-ascii?Q?GZvq/i1nUxX1Ka8tDe+5fVre07rr1FBFJeFrrIeD1P174APnXEKXki8dyB+K?=
 =?us-ascii?Q?+eySykNCExggfGsKD26ObMjpIqXaAzQLnVpgGfKj/S05zjlixi3Mw1Q4SIrq?=
 =?us-ascii?Q?HthVLg3MjXihmZZ6+5LePlLhej7oikv1Y2ysIyJm3kwpZjDhAXTpnzM8hEr0?=
 =?us-ascii?Q?Uqtz93hvuFepca7WTNsOwYuf8tG3HE5kcv0/jHSQ3arr6jRPX3vjf/sOXnpQ?=
 =?us-ascii?Q?tv3fp7TuBXbp0GDWldjaBLSxntSUlGehEETDpNxxfUZKT/dwdinmYq4U+Knm?=
 =?us-ascii?Q?jEvcxSka32TydbFp0RPo+yIQgtBF/VLz4DaNlcbErdFMsT7D00CPy1E7+aSc?=
 =?us-ascii?Q?zE289ciIZzMwOcP98nPUJq5pL37SLEJ7AX4TBA4L6Op1VfAIAw8176TY28/h?=
 =?us-ascii?Q?IY40EI4NHM7h9uRPDjVnsPbFzOJ2uvE6eLEqkmUoHPGmCKXepsUnD7xQ4JTI?=
 =?us-ascii?Q?huFdvniJPTUUW7+v+8k3Bgl52EKMRYDLyGuAN9pFGBW+U6HIaUa6RtuQ4lXn?=
 =?us-ascii?Q?pT38F8Sibg06PeEm8s+l06U19zWbYc95cCwAt+x8fIz4KZ/dft02fEBIa1AM?=
 =?us-ascii?Q?y36cxntXQWaWQq61hye/r+yyIumLRt+f7s9jW6FXWQBufI9pCNsKwNFNVRCb?=
 =?us-ascii?Q?6w85eBsgYqeB1tyQpvw2b44NWnEq9i3OQKkAba9t5vCW/oURpKZJk04X0D+8?=
 =?us-ascii?Q?pQ1o1pJIJIwOdO/3nzxO7ByX8BMy0tyBRAG30ocVpStSy7DlMjDEkHdOU1oH?=
 =?us-ascii?Q?1Dmhn72YcrTRjF4gaC5UJ+XjO4LRKVEjmKRAZcn0sfewC6AwHu3eZfuiuf6p?=
 =?us-ascii?Q?nUdGDQbfJarZV07gMb4inAANNO3Ul65Bq6/Dx/noUqmHb65hkN8Y/Or64wbw?=
 =?us-ascii?Q?0JKFGs3WpQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d22997-d1eb-41cf-7b43-08dea139958f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 13:09:43.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOWRM59NDEYLVJ2o5vVY/phiy6E8m7XcJqg1EvJxhrQYV1hK7PGONbZ0D7VyNxnhcOYTeStQ5Tau7H0KazFR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9935

On Thu, Apr 23, 2026 at 09:25:42AM +0100, Sudeep Holla wrote:
>On Thu, Apr 23, 2026 at 09:17:47AM +0800, Peng Fan wrote:
[...]
>> 
>> My question is: if the firmware were to select divider 3 and produce
>> 96,333,333 Hz (only ~0.13% higher than the request), would that be
>> considered a violation of ROUND_DOWN semantics, or is ROUND_DOWN intended
>> to select the closest achievable output frequency rather than enforcing
>> a strict inequality against the requested rate?
>> 
>
>We can change the driver to default to ROUND_AUTO if that helps. I fully
>understand the default ROUND_DOWN is not good but if firmware can't handle
>your use case with ROUND_AUTO, it is firmware issue.

Thanks for the suggestion.

Switching the default to ROUND_AUTO could indeed resolve the video clock
configuration issue we are seeing.

I understand the concern that if firmware cannot handle a given use-case
correctly with ROUND_AUTO, then it is fundamentally a firmware issue rather
than something to be worked around in the OS.

I will check internally with our firmware team to confirm whether using
ROUND_AUTO as the default is safe and applicable for all clocks supported
on our platforms.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
