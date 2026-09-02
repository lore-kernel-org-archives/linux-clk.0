Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91BF37DEAA;
	Wed,  2 Sep 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336934; cv=fail; b=DAfWzb6l0Pn5kty4M4g6XZSy6aHqXHzpv41BIL6V5FE3pTQWn39XH2Wlkca014j34miUFLJY7tWxgyqHzCo6rkgG4jN06ixNTgig8CvSVE8t4ppARjiHyjSv9bNraiWbi1cV31iydpTx/oYq7GuDtwgfgzax6HgfE6vnkTNdghs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336934; c=relaxed/simple;
	bh=6EVEQxjE36r9d93d0mB8PGQNNXYnU/xWj0l7/pB/K4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=udlzlblkMu+hxRwR510YIPMZOoJa5h36uBNKxNHHdqk+XgPp7wtnv51THOYlVEm/V0jxBD9NoSdhZlGlizulzHLwMEVE+L2Mt+aM45ViVCNfYg8ajg3mY86eAclGfGs+QtbpU70Nhqq0zmz4Diy/HQW+BqSrHhc1c+fAnpFzVnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ygq0Yt6S; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ygq0Yt6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfmTX8pOpSow7wGRwFozOuIV+8cgmtktUTT63hokGZ3QuNFo4cj/M/eAK16Bqi8mrztRLQOSFt+nmg+Rr0/brlptlWpSaLmFGBvWk82aEJKoQmThdx1sHZyFWjheCGX4XLYIfAvJ96nXaw9US+LHttdm6307K2l38Vi8qVwiJuvMFHJcbbBbu5M8SuRXb/yRzE1D/QqjY30Dl5YocTuZ/bHzwoghybMYaKABp/3D8mvnN7jyL+6d0+2AMVIgHwuIHMaaw5YhaNcNKt/TmffjhY5gxtluOlRL0+yKDcAf4m4EhjZVOimpzuC+V4M1bbfY/y+aRUO4oK0vnfqWwjcUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EVEQxjE36r9d93d0mB8PGQNNXYnU/xWj0l7/pB/K4w=;
 b=kjGmp2P92P3B7jG6oFiEIagrNCJTp96IoiMEFXNQLg5XnxWJXsQ3jldevKB3tB1dMv2n4MiPvGFAnPVol9C7ykz2HmY5Xbf5MObeuiSJTMjK8tpyruT3eDguF2Ii6vaSsQHMZdv8TVyMixzj6DNoPTyrw0n9hdPkvSs8xK3UbXRLvgEYmNoV/o/Cf1tXRIBkQrgkhINfuqkFLXieC26+4AEYhlXAybtSWFSHEw+sl8kieD9jnz22fpSbCC+srCeWsDS3AWBI9zW7P3xeljh4TpA0TD/nA6x5vTDNjCaqCc4p2bwPmi1XVsmo9qFLz/3LNEY0X++gWcU0uqHvdwAuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EVEQxjE36r9d93d0mB8PGQNNXYnU/xWj0l7/pB/K4w=;
 b=Ygq0Yt6SWZf1nab1g8gl+uQy46E2OZSlrl6lrfM7qOqaf2r07b9FtsmGcqtRWZWz/d1Na9HswJnb9oVfG1NVkYV3kvoKRQ8U6EhFvrZAT5O+2YdQi7xF4U8B3UW8HeQwpRgiOqs1dEGHqbQNplHaSY8TMY11qFsKO1sQXtJXurk39OlQ+7YnhuZTafvQ2efzIinBUa9M1B2LKUNZIXrrh9U0yK0hrVFPM1SCjfLS3BTEs/t8VX0X7jfYqEmoDQ/c268q//gkV4mMVRAAfFIr7g2mXvreOUwBEaQRZ0ummg+DfiPf8YUYsYMRo3pAiYIZXclFyOYPOhTpZLEr4JU3bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MMZPR04MB350073.eurprd04.prod.outlook.com (2603:10a6:190:52::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:15:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 08:15:28 +0000
Date: Wed, 2 Sep 2026 16:19:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Message-ID: <apfcGMg4aDLU5lBO@shlinux89>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MMZPR04MB350073:EE_
X-MS-Office365-Filtering-Correlation-Id: 324687a1-a59d-4732-e542-08df08ca58d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9XZljKzZeg6T1MR4FLjCJk1m3xUIcfMLTCNUyP+JeoBzP3i8/sDN3lJdr6R6tQQGSX6vRPIYWCwu4ngEidIAmC4qzQOHCGEs5CN2d3JrTHr/Q2XcNNgLWcJv+VB6EfPelZbSBNyGTMXHrj+nE3+KOlvJdwfDFWq5UsCj0yd8hox31hpqXtCcqUKRo0ba2kXACnTpiIXb4AkcbuLYCfP3Yui685QhmryuXf3aQO462G7vI8M1MsqDOaL6tbiITYnkQtKkxb1ZwkrNsDrxuXBwS4Jc3zBiMajzRuKKeVvgrcTLHm0UsKyP2RPFv6q+zTF355xiXY14RqJq4loY+Isd4wpRdA4E0PCvRGF+BmMu/sWuKT4LBVggisVToihmsqjSWk6d6eoA4ZYIDzjEfpFsuYexMpqQvSC98onQe2KatXD0X3RaCoiisJ5LqH83zIkgaj+fIDhTWehF25ey3jBEkYWelsEaSe6cLZLpYY9L0otrRcGxeSxA74eY4CcoxpRtwUFh2o7pp1G8Xm0VeNVgfP96x/mmWAvPiksH1j5JakYy7TYXyOiLA+lA7uijgMG86HFka5hzOA+60iHQGhAH4694BEaZIhLZp5D4tXsnQ30NH+pf6wq0HaoRRn9qVv7++y/Pm8+9gfZO4b3v8HrhW0SRkGND2rNDQUBIIHja+Us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DnWJ0PXRdh2RLRuL1x+O6PQ5O5xOoCKYNjdeJ7sZFYFtaLX/rSePV/ntpBbz?=
 =?us-ascii?Q?L/WJKQ+SHitukbh3t3rAWnx0DJ2QUJ4br9AH0nq1T+7zGiJZHLD5SmPME5Yg?=
 =?us-ascii?Q?K+jBstYkdTdSBNDBqH5FrIayPdgu8B2c87kz/4NpnXvfR+tV68KNIYY2mrH0?=
 =?us-ascii?Q?EzZ8L0iXjYLMZBgdxBK/YogwVS7vEDAAlNsvlosaowWuj79afVLILXDsgHux?=
 =?us-ascii?Q?5Aacpuoy4T4J/1xyl1b4tybx6T6l1SH+JCasbgco5XNkqMs/SlXcZDP26vzz?=
 =?us-ascii?Q?HNhH4naEsqpmsE4HBg29xuO/XrJ2PcI5s6xu4nb14epl1YoNsa6IHLmyeHtt?=
 =?us-ascii?Q?+KhADbuuat7+hvvwod2n74yZ8IYX3ayFi5bIhaNwq8iQl0fT8UVNvXia/GTm?=
 =?us-ascii?Q?nEwByxgor6flpqsSyqNVEPz7vS/Tx5MJHM18KehORw2AU0c4WYmFfoQp5DOK?=
 =?us-ascii?Q?8EtylcdFJMMOdyXaCmTjJBCb6n2tBLNw2ycSa3o1yCfIcWD5c1umye721AXz?=
 =?us-ascii?Q?MX4S4eZOgGcYg8OGXWvMZKXMzwFuvOHjTP5iqR59IiBlrDGkkh3thZTEXSwH?=
 =?us-ascii?Q?Sp01A0EnzlT/UcxlkXgyvIqFYL1OdV3nkc2SmWCNJXN5qtpQxIH/+tSAFvgI?=
 =?us-ascii?Q?MmEAUNhJ3fbllvCETAeD3dQ07BMptmMDizmO62lD2k5o8wiGwJaxVKTKYzbO?=
 =?us-ascii?Q?LbKS0Cfplq989CI0iHkeWxELSvoNMnc/Lysg6amAvv5K6o3sRMFQMsGignLK?=
 =?us-ascii?Q?DEVl1hzSXRyMcWKyiFYGTTLsJg0zO7Ug4JvcZ3Pa+ehmaob+vthfSdXRQEqa?=
 =?us-ascii?Q?HWR/69e2XoryFIIc24SnKFMksK9Vdcsaykmk0OxaJB5nkd2MPvKuxbInSzJ6?=
 =?us-ascii?Q?MzY7LNsqvyHq7HNw+SRyWrK0S3D7EE6Yw3R7hs5mnppluWapYACvx/r41tKx?=
 =?us-ascii?Q?dDSmu2A3F+hu/VA2ZWriX71iS8TJxwEzS7dE2jjMzsg+VUEIIUJn4ktWMnmw?=
 =?us-ascii?Q?OFlnuL2Ot9YR7+IEnSMe54Z2SU15vKxo+O6kVeVfDyB87de8qaHozLTP4Py0?=
 =?us-ascii?Q?MKo/G9MRTGyUpvuUK0KAgvK5GATDeH+kSQBQWWrXRIG2ICBVCo3TN6pqo7kp?=
 =?us-ascii?Q?ZCSze11wTBho0Bzy7etsPDsP4RIzg1tSfVYIlNrjeSfOKgqU4yBAnN7BIkl4?=
 =?us-ascii?Q?B7Un0uqIVm0WP30D/aHp892mPPkEIt4/PF5wrsR9DFJ95EkY+AU8VO2y6Wkk?=
 =?us-ascii?Q?bIFlTjvc5XQtr8ZntcxJoCdTRzvAvbIVbmj23kjWQJKIGNf0FltYP54k3Cvy?=
 =?us-ascii?Q?/lL+JQOO9twl0l2UgVi367uVh4GxRb7eJD/9Q7NcZtVMWTaa+WYSaybZSgVA?=
 =?us-ascii?Q?pYuGS/nOt9LF4fPItviB+XZFOFLdKDdgVaLC0Rz5k8CGAlRG8ezGWjXElfS8?=
 =?us-ascii?Q?K6fBtlB/v5G5t5tZFWQCFTHetRrnMOK8AYAJ6jw6GWg2t2YGJ1fa8hWeekcw?=
 =?us-ascii?Q?ChH4a0xCRezwm9dTiOcLgima+udnWVDTPV2cpYqK2QTFbBBNysbY9V5Kbey5?=
 =?us-ascii?Q?Nl2I9ib0PwKc/CfX5njtl2YwHhrWWuj/W40byjkJ5j7JOrbG9raanNowvPy4?=
 =?us-ascii?Q?Nr/0ZDldg4f2CJ26ty6g+Wv9tu7qHAzK0OfI95GZHpjExqS2e0hX8z8UYXVm?=
 =?us-ascii?Q?q6suzfE6SO2M/Xi0Rw0XiNP+CJpA/C/PpA2p3AOTO2lsbYlGt90IpzaiqN+m?=
 =?us-ascii?Q?JgW65apTWSzZNtcsm4xeObzPjieSYX/fYkzUfTCW+d7i7ZGARVwQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324687a1-a59d-4732-e542-08df08ca58d6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:15:27.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3Imtwl3BqldBsYSWP2c90HPr5hgiqfDNms1Kg059i6gKQiKCgtTfPFTOtcNQ4AV2i5ogVoFEe5SBxXwldsHdwrId+8eO86sphpDtVBQRra1Arhk84hIdatOiLwu2Acr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB350073

On Fri, Aug 21, 2026 at 04:56:16PM +0800, Linkai Gong wrote:
>imx93_clk_composite_gate_enable() always returns 0, even when
>imx93_clk_composite_wait_ready() times out.

Do you meet any issues or just code inspection?

Thanks,
Peng
