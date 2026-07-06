Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EF236F90B;
	Mon,  6 Jul 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324005; cv=fail; b=n/zB9dekehRgQwzIm6qdVvLbXjdfykKYvZOP23fHNbG2AbJfZkM7uCCuRB3HjSH7had9eDzT9nx6EBe3zwD7wjfJkqrZzSlu8bovflxtSZPuK7KgqLWTSq6jsNHLmkASbqHIbTFnDyTAc/zlTtWtdYUOFOZVRnQxho/Kv2MgOzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324005; c=relaxed/simple;
	bh=aKGFl7B1m0FC/X4EeQ2TioIGVNdTSoaFmU6MkAYdEig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C1kYRzkoJBocZ48yjRCm2nmwgIcyu7ndo0BSuIATz6a4SlhqbpdfHrkV0hYVM+WUZQ7BVZBLbujLQvX0fTOfbCpNYNllLY8B3b7m0/jz1ZSZ7S3wA4rBVMTh/u3iZ1OMpLpB16/oERuRCGnAVS81J7NCLCzPciBjHz0jSy2I8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=esIkGWIU; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="esIkGWIU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbDuTSZYAPNCYiXypsI6yOivZ0NxECZp3PxGGQ3QtNcd8JTDGCFd8mJBO/PufHOYLgokKJmIbz2FjuLaMWLebNHNyoEfZOmgFCp5G29moNw6/BwaF72afkWd3P3jXhpdQeX410dr/NZMrAznW00gSofRIM2MZ9nXto4+FwAjNB8BPvQeMgj846x/3so8uDyVg0tFZEvSNpXhgEaAMc/V0txEEfhDCTRZXg5RRgxQI+smo5BQgD3opWVo38HR08mgRGkWyRhhwwAdLKCbsj/zETAs3+lbH9hAQFZIcznpfE6oH+X26axB5GiTVxumtoPgbYDhbKRRr/JtSv8dnMNIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCYKCK7vd15WMKkl1gTAroivug6uWX7Q4zMDrU/BWTo=;
 b=P0PAT3xBBVolAtprCiD7ZUgK3Hbz5NzUDJCiHNcBHXeNu7DpjUlJjn5hTMYOSvPo0Y5J8eeBpFS3C+B65hr3ByGpUTIZ00tmIReC5U87wKA3IV9JVnx/DHM8KqyXmxY3IKoW9wXHslr+c689aVZliwtP0tThG8EPrR0/TFSyqk219kDX6KpXaikG3AI4QcE1p33MVS7/1nIeabVdelFB4BSwVX9tJ2fQEJFOzN58QXXD2kO1sjAuTsyeXW1mhJWm3QiOscDPqVcgpaQu4IihEF5SasRSZ6L9D+DT7rXiTU1RG0xa0aL+2qvez0jjfdsWvLN3TPviifL4H1BMbHjrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCYKCK7vd15WMKkl1gTAroivug6uWX7Q4zMDrU/BWTo=;
 b=esIkGWIUliZDBw3swyAqynePAUeCPQqNK7+Pl9Vf1v4SWWEAuLx5IGJ+tyZXYEUfANBqpk4YP6o6Gbx9dHFyjcP0QuXAyPsb8ydyW8zSn/vSydIOBswu1eD0LyG3aNMH5zA2HSQNQ9ml3OFVcTniYmAgpXlGOMTwllXUQ2fjgdRLhq1GTS+F35GnsMButN/TvV/2y5H4WaU5TyweA2Tv0helnAIOn0oZH3ap1lLGkD1BwI+zSsyc0J9kuLzeKfE6dEZ8ynsrQMMpEIVxwlERe1n2QajSmA73ShhKfLXuBQCVQkSKABJsSFj6wPMesWOuqObs07OtJ9mHYc0J6BOk6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB12049.eurprd04.prod.outlook.com (2603:10a6:20b:740::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 07:46:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 07:46:30 +0000
Date: Mon, 6 Jul 2026 15:49:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Message-ID: <akteJV32+ZT07emG@shlinux89>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB12049:EE_
X-MS-Office365-Filtering-Correlation-Id: 409021e8-d416-4402-dd46-08dedb32b115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hKChgIuAlmPqdKLDE+y+YeL/6Pr0pm5DzMDCwP68lgZ8K0R1n5oxtgsm50X3T+Xt0oeYGtf1IEvt3vtagM4N/aTMwmlc2Vw/lUSGdhgJ+2f+AguGy6OJvXXiz4mFgPvOHY7KuICwXUsIZpeZTZPkDmGv+1dI1g9AkqimgpZ3E4kDCR/7PWpdCtZGsz/n/KERLm4NqkkxTXPhqtE5gtGgpK6Ubzbi/Mmf3rVWqfpgU1Xle4X6p0ko9W8WPXQ52CGHiruZ+ch+dqRJ9t0n7EicGrLOnTEpo+UJ2PG7FfaxDSVUL5L39YScyBziUI/wil3nTBoxdLUAuMCsgjKP7jJNfIKxPVKnZZ5xcrzvUt5k+DncXV5Etd5jUjpZBp22LxHPRMxmdTV31KvYtTvrrjb9wMKNxdNzAEw2x8tKHUA/uDwuBymC9qGveF3c20/5cQQDQymBG+QgLnHVAuLprwQ2lp8mWUaf8J/ekU3PwpM+TB5SGyOu9q9nqr1NMutMZ9bFGsGC+8bBRN8DSH5BwhaHMZK8pXe20ja4TTuchTNHj2mfU4XFxrlSpOciqNGcl80GQIKw4JANvSlB9e/nIXN4kamqSj2I+7QKc6vIg2OdhcBxYsAQNzj1WjzqwM/z0i/hkTv/bF4yzwvE+OvTjzP8d1xlCNDoNUfbXnLsYc+KWdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3kQ2BBYSdZ0b+6kEhTRBWFwdc5vqiPGVPvwzQ6N1/BuyYCAghUxRXqMhKo3X?=
 =?us-ascii?Q?fSJw1JEhkRojfzBrulbCXdab3+fpWGYvozRCBlbewc+PUzmOkOUcz3GG37PS?=
 =?us-ascii?Q?Tthdl3tfQP6gs0N8rFHYOVOV5OFvInyO9jemrCc5WCsRTIVE9NokoVp4/Gws?=
 =?us-ascii?Q?xyw9i6KvFCC4nXOzGmgZbUSLvq2ABhqVrdyAboUy7eLNvu8Dkvh9RIsNSnSP?=
 =?us-ascii?Q?kFbViqZSPk5NIKNFYC830U4KlU7qjnLg3OK65HlmzJtypXxXdILgoi+FyvAm?=
 =?us-ascii?Q?5Fa5YzSy5zPDDlBu6ksvZ3YMXXiRCzBESG4/DCV2OsLz2We6VdOfkBdFNK2a?=
 =?us-ascii?Q?ZUOo3NoyXM68VYSjlVWoZdgCh9BHTZtlMZPA+/psyIRKXpYaHz51OoX+LzI4?=
 =?us-ascii?Q?cLfz2q8te2AcEaDkgiPDCRbO5snumG6NXWaK+iaaEHO0Jd2lBj7ythNkzHxj?=
 =?us-ascii?Q?yFcVpkB2ZR7yBGH3lr4acp9uPMt9cfTWG1BJUtdeACOVAG8yK+hW5C+Dxvdh?=
 =?us-ascii?Q?FvI7J50FvoyYjzS+O7UOviFNBq61h8MvZVwixLic+84d7SosFRAi03Q6Odwh?=
 =?us-ascii?Q?E5AqBBYz7RBWAjPyKknZKrtTLjJwgisvYHiRb/i/tt6orBrOdVVJirmNynEe?=
 =?us-ascii?Q?QcRZ8ucBa+rqO7aSB9eATDS3yQ+1pl+OBQ0B2uyIHSCmvFx2HLqFM1aGq6za?=
 =?us-ascii?Q?iCHyU8dc/vhRDTANW9IhkTOmODD6JHro2eFq4SDLKip9PgcTFIY/jcrrIpb6?=
 =?us-ascii?Q?t8A6BYXk3xwkqcfmlQ7dGUR2PNKV3eW6znquPazrVh/dct9jiZDnfoqO+rdJ?=
 =?us-ascii?Q?wuNwUYe0Lf1wm/C7Eiv35K7g1IFeGwVAgKq4G3I3h8lWUDTqn1X6HNS0yIBK?=
 =?us-ascii?Q?dKcpnFvntgo/qg3vMrFquviJHhNMcYlXfsP5U8tif4Ma9OysXxHHgOE0eFqJ?=
 =?us-ascii?Q?gjElSYTE/nFdCarx34PaIkctHFg9JRsZUqzZfZVVR9rBmiAm1C0l1dilZY+m?=
 =?us-ascii?Q?IvfB0iDJL953NGSBkB39aqWKupjb0rJNIqNRz5k9vRQt3KztJLBEWiIscCUL?=
 =?us-ascii?Q?UTMLtN1THN5kx4Awsne1H+uO0tIDDeqa0cGBlvGvOSoF0aADkap1mFalPaIt?=
 =?us-ascii?Q?i1e258s6kwDmUlI+ax9orkDjED1tn0PFqMSAgyf3zzKr4lCeeX+aszK3OYp+?=
 =?us-ascii?Q?Qj9kXfEiLcTp/90bWoArA2qoN5ek/WjG8mgdNz3ciQQ8mf1NK8VxH4jVeGOm?=
 =?us-ascii?Q?iyi2N22vRHxsijT0ThorICoHLmVhI72vqjKc/9YWLIDDxg08nx2PqH8VRV4O?=
 =?us-ascii?Q?8dJRfzgON4vQaL1U6enDuJ862JgBz4AFLg5kG1BBrg5Iks8mZuvZGVMkQLBd?=
 =?us-ascii?Q?cSm+dduBZsoBJrlZ3Fkv9VVk7Rv3vXKBJ7jo86qAIiA3Tbi0/v1z8jSuw/iA?=
 =?us-ascii?Q?xZDMMcc57Vq7WF9fN1BuWysX5Rp/y5xcj/XS7+NbZwQR5hN5rkxlsMmvfhqA?=
 =?us-ascii?Q?FPBa3wk151CoWvUHcyq1KFsFqPgTo4BVkLGmCYAUou8OWHpmGC8D8JTuGZqf?=
 =?us-ascii?Q?XnB7hSV9l5yVIwMXl20qAdS7TWFGY9zsXBsqH+48tt5ycE7aDruXiHtH4UFC?=
 =?us-ascii?Q?fXTK+Gaz1KVmPxm25jimmx5ZFGAZjjmhtt/1sI9AF6Gx7JRrYztbe3ECEIwZ?=
 =?us-ascii?Q?JqFy6Ll5MgsOoOJfiUXtgU2MQ/05qsGHhPT12WPDxq06dHhBKjf+OHAMPYKw?=
 =?us-ascii?Q?HPh/vHV5IFOLZkpb/R5HnnuZoaJdrQoGaiDvLDzA/EjEAzWjPD3+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409021e8-d416-4402-dd46-08dedb32b115
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 07:46:30.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y92kgMGnAIfWR42WVjyski5xFPdAO0poU9sAbEcNGLO3JkCccCDkgRi2aoBL+NiOZMz36lcgOi0IHF6F+oSHX8CM2qwW+PheoPeaDrfAoirCRfqEiYokwb5t6FoM9zpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12049

On Sat, Jul 04, 2026 at 11:01:41PM +0800, Pengpeng Hou wrote:
>The driver has a match table for the of bus wired into its driver
>structure, but the table is not exported with MODULE_DEVICE_TABLE().
>
>Add the missing MODULE_DEVICE_TABLE() entry so module alias information
>is generated for automatic module loading.
>
>This is a source-level fix.  It does not claim dynamic hardware
>reproduction; the evidence is the driver-owned match table, its use by
>the driver registration structure, and the missing module alias
>publication.
>
>Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
