Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D70C8C1F;
	Tue, 24 Dec 2024 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735006385; cv=fail; b=kPKgoGVYN+mm0iIAZAnx87cc1H8jSTBBRdJd1fotCfg1Rz7/VGDaI2VO6k+NPC1Xp5fCTuRu6RZDxOxRP6xGfvB+yEkIyyn7nxmrdgM1zTyqc9LYlFkqXlSoa7tZSc3+e1S7JwQUZCyipRjNbUujLdxPXEBry953lg63n1tL6Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735006385; c=relaxed/simple;
	bh=1cd1lIAcwQowGy3e70X6yD53X1h2n6T2NVzzEZd4bKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VU0I5ncBXzH2oGS4PVbLhfNJZwOWiWIN5Ic8SQXX/ZAlvA0RVwNN13QqMZxuvN4n9DHlHnXrVgDpnizAoSrgkTHnrEmxaB7y7ZDMudBv292w8Et7Drez73rMIznOeFS1GOq7i3cbc1XWnijs1XDpVeBA09CqCAZ9wWMfZTiZmSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zdse7yZy; arc=fail smtp.client-ip=40.107.247.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zdse7yZy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfXrkqGvYE/mdvJKXBruJf7NaDZ8z96+1yQvKxbcgaSYBMkDAUgT5aNO4yV8D004ziOU4oppKai6MhsSt5Ynseh0hkpGf2c/wAaphmwzq1kAIAlrI9lBaPLavhTCwEOXLfZPX17hrX7mH8T1tv6YCYi1I4Hho6eGQ0ri0SYrL8B5CqS0OelC3hKzfuDGN5CQsQ3qU+BPo62Dz5/tvouDRxsFaMaamUKprTn+9HZGna2xbYKlpLsmd29fYLlnjH/s6ijHaq36kHC2LUkcIEeWBO9oAJyDLO+eaGXy8QighDplr9moREiyYcKm26hPLv1QQXsoq/DAhVaH75rlerOg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cd1lIAcwQowGy3e70X6yD53X1h2n6T2NVzzEZd4bKA=;
 b=KspKdUpxakN5EA8niI31z2CkjG/DNtjDyz5pcXnaO+mZa3//VASOnTIGlKMEKp1w57mb0eNHbaUeI9IjDOsl+3KFHMAFf7tpfc7PZJk/qek8uo3VfAwcG2oQ8uwz50hN3hA3lRXblyPMDkns89du+hE4dCYXv5+W0l94N2DGA13/uqNoDXT3OPEXUaA36pnhOy0xOcRg0pC4KaLfnnJelNrmrwUe2HaRZOUMQBclgZCiberQxSejTM9hWnTdsGmf1wB+3g3SwzM4CfT+QZYOQy/XfW6RA7f/iU2LCgh2iWo8Wl/eShQsqwtM4VAu8fjCPsAjb003PwY59hTBxJ/fQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cd1lIAcwQowGy3e70X6yD53X1h2n6T2NVzzEZd4bKA=;
 b=Zdse7yZyu4FA0VTBB0/qShp7STwXUzjuh7nmnH0syW8nYpuLw9jq37h2UVtE68cU7IWcxd/sjciNn0hpGqJVCTJfbpbhlB5b9LGzkVX1O6Zr3tI+wA7b8BeCeSoFnw4kYh7BLyZGAqz9PTQhvIR5EfhhrYTAUicLKgLN0idFEJ0G0Kc9ld1GSKSuSZkvxSmbVifRXLfsuC8fipaZA2Nkbev6MVwDg+IlM0xT3XL3YeLeNYmdEfMj0ST4v4TyRXR4dS1feI9w3hjMtuyFJ5JFAjiNfdIvaPSb9ecM1kvAmkdG2lfw2qo6wvXAofFwjcelBjHHV3mgixhp6jpSBaClOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.22; Tue, 24 Dec
 2024 02:12:56 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:12:56 +0000
Date: Tue, 24 Dec 2024 11:18:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 04/18] clk: imx8mp: rename video_pll1 to video_pll
Message-ID: <20241224031833.GB20573@localhost.localdomain>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-5-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 417f3bc9-8b77-465f-dbec-08dd23c07aef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nu+gPQNGsv+qvOs9ipqmBR0B4nLp9h5Bl2fUM3nzG73z4CpmeNldFthmTcqj?=
 =?us-ascii?Q?MdI20vlL1Y8EDX2hNaAm8V/eihPs0wUJ7+okSIrpJxZjCvS1Eh0IhbbVfSKQ?=
 =?us-ascii?Q?j3s28s/prfxKLUr4ZeQV4xUdBqpeZ2yHF0tm0gwroyn0qcq4yPtvkorB6GZ9?=
 =?us-ascii?Q?deO+wemhxQ9TWSQdGCxC9kBVX+bHLX3/ZloiEUL5LriXQXeUmkqYUExb7Axw?=
 =?us-ascii?Q?Ur46Ts8QVsNXQv5731OHFbt5Ah0g/vowez6u2wW82MFCdt2MqRqXXquJjFe6?=
 =?us-ascii?Q?CqgjJK+F3NIGSIBn4FhHkXhxKvbAL7x6xS8Uf7X0SzE7UZmlZY9Jvw3fgBY+?=
 =?us-ascii?Q?hfJ2a89fBUcd5RsUTJXxslQpetLiB5NcS8Iu1ADR7a/NVXVRowCLOT/NNxc+?=
 =?us-ascii?Q?hlzoHUbQs0V8XDGL76rC3quMHZJ3GJzcVvOZ45XZmUdMpz7dmXiRKnHGT/VQ?=
 =?us-ascii?Q?DVE33IVBJFQO3p23lEb2fmod+h+ZC697fwU/NR6Rw2XydVE1BS4fYmgxav7j?=
 =?us-ascii?Q?f74R1uabz2PeB6r9YLJ6RLKSwo/ie1Leu+e9phhFeb6ccS9IViajEcKxzYZn?=
 =?us-ascii?Q?k4bTgFFUm+2YWTDkdxCnSUESEDTB320pzQxTJorF92xLHgo5PBv9Gd4vEhuF?=
 =?us-ascii?Q?rPyiIAI4FFW8zAyV9ie/E4Zv6JCFljEZgvv3kAr9zECqYSepu6/zIw7ZcURJ?=
 =?us-ascii?Q?EZvN8+QnOTI1zxDqOtCcPUuZH7e+Q1Dguj16+jATnz9kThDHO0MX5DB5pXal?=
 =?us-ascii?Q?ivNMpnCmI4rM3rlbtosCaER/LTTfaaurfylUU06S6OZwkeVFV/nfPWSqA++X?=
 =?us-ascii?Q?nQa3r65te2pTP++keg8W8fGxxGCWUJrWohYfrCuRNZph3f4wVPk4QsThe4UU?=
 =?us-ascii?Q?58lpblbfw0TGDzNSpcqVCOfzGIWFt845bN55OTGH9wp7gbx/qVpyjFc43wyb?=
 =?us-ascii?Q?iFNQI832+vlqxVHXnocKn3Xzv62hd1EfO6k+fl0hoMoXLJLucGLWasGykwuf?=
 =?us-ascii?Q?+uGN2wCWPUoXyATUz1VFOodm+M8Dx92e7u4VXlhPZoDTaUDNIJXjkaQNRmDz?=
 =?us-ascii?Q?d4dpni/ocUqLIV0KVNBkADG/HKo7XL4ymTub1QBExM06+sZ9jqLffbedosQU?=
 =?us-ascii?Q?8r3gBf6ov7Pc7Fbxoy5YOtG0ykpYxL4G4zInvC8DYGDON8gI5gFqHfczbHzq?=
 =?us-ascii?Q?LPGii88lGXCU6ucTDuD3nVyNa9jJw8MfIUgT3UwZeWbr9Z+F4Q6fcNCMd0IH?=
 =?us-ascii?Q?8mpucFaoFmATF90m6KDTgCQMW6Lcqn5p1x/2ZThA58qt2kdTVt64LMMaYxHz?=
 =?us-ascii?Q?qcUHH39i4BDnSRvWEadMLP9bzii+mJJYfw+r2YUGEVQJCG2LqMU4eDJh74zU?=
 =?us-ascii?Q?9O8wpZj5EsQ84c0vzTf7fvTDBsjMgSngRHASNuGLuPFZmO7x9gxb0Ryhbp1q?=
 =?us-ascii?Q?PnKEe7wV2Jef6YqHXwEYl+AJozvNroDN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UaW+9hoeTgmTt6gE0YLaXS67HQC9F+t11x0aY8960Z6rFMNuItXZec99OouV?=
 =?us-ascii?Q?7qXDAf2JlBvCmfNb2Hc0FvgYaINLJcrDuKhdTNyUlSEeitKpafxc0NtlE2UP?=
 =?us-ascii?Q?HU4DYQlp/5tE8tTl+NAsgwzS8jQTHziYG2sxk7hfeS4DUaKce6Y66Gs4RC2M?=
 =?us-ascii?Q?ohiuIqrGKbIIUB1Z4DmVVrU1Mxesp2igF26TML1DjoEVhXc/GwbMxFHtU+gi?=
 =?us-ascii?Q?7JddIX9RdDleazyfvEPfmEujP9dmGc/vob8EOIFFsJYBQe2DvSDgdxrQFW+u?=
 =?us-ascii?Q?4cTmPtX6pqRzbSvaSzf00on/dFL53/WQjRH4qnSFNM1sC500cyEgInIR1zBm?=
 =?us-ascii?Q?tmnYQzcqxTpDilo01cpGoDtZtzrWAyUa6TXHEvaAdXkrOAMTssN5s8fHD5cJ?=
 =?us-ascii?Q?GD7Lyq6EoRDU5HwKihZ4lJB6u3a7rh5P0WPGS0cyIgh87HpPOH/PqGljE7Kw?=
 =?us-ascii?Q?LaZ614gxrpf9+lf09n5yLk/C8O4X1oeayTw+4y+dmc6/1lNsv++hzLNVu6Bm?=
 =?us-ascii?Q?iVDV+z6UiDdvSzZAy2hwW8A15a4g2qyyGO/evDQpxMsg5exd0QwEGcrXB/Pu?=
 =?us-ascii?Q?bO3T6+WOmJdTzRA7GzQdAqojvrkiajg17rJ2mDrQRrnVJUxgVnsDUN6/ex3u?=
 =?us-ascii?Q?2yeU2DBdNscn4HIuxKmdV4m7WdupymNl/4gVISCH2jriseifCokssbnFhKMh?=
 =?us-ascii?Q?PIYtkQKVEivW/qm7dWCsTMjqcJWR0sCkNNpEj6lSCJff/j9AyaVg2T28w/LZ?=
 =?us-ascii?Q?nISp8rsZdGcjFBw3LcLQep4qde27SDKwLEIRzDTLI2RamZV42BZrc/Cm878S?=
 =?us-ascii?Q?qNAL6W8Sf69zaVMok37+JEZo3N/jX0jHIgg+oIquVhj1/0fIiCYKK4WgEYBz?=
 =?us-ascii?Q?LBo05ozUEfPmnscrdbeai5O44iZ1dCUyNZ4ML07Rtfms4/FAFzAnkaQlW/Ry?=
 =?us-ascii?Q?A26457ffxOMnv/4QgzCtas2QI/+mDPAj65nk4xnUCTsP2cr3Wz5urkLUHur8?=
 =?us-ascii?Q?JZqTJDM26zqw656w2OU+xGViNSbpKtCe0OVojGJkCxWG5Hn7B0bnsWl/SaBN?=
 =?us-ascii?Q?0so5+rdHJVAWo93YoS1vvscxS298Fj+6+7t60oj07G2Y95z/Jw8Iqo0xpYYS?=
 =?us-ascii?Q?7lyB1WKPgCFvC+s0x+yqkgYjxJ0dcfHuxVaqiKIczqL9dxP7hBkF9melYhDf?=
 =?us-ascii?Q?/kFxRP8K/HtycXGLxjsjyKkFA0L2ooHhclLJmFKUwykqrDyk+F6By1dN0PJg?=
 =?us-ascii?Q?yzd5/VXFRDaF0wJdhg9LvR15+an7K4iB4t5xgoBqMTV+JAVJ/NmPvqMRKb4Z?=
 =?us-ascii?Q?J9cl9Wzx+fvRQSQdWhKrvJT92t49/Y/DcBTTrCuUdu+GZOoYAX3lWShKhifw?=
 =?us-ascii?Q?71lGYj0xWzW4X6M4FDkS34Z5UUqyfGht9gGNv6SFRpPWo4yGEH4vUxs7d1ah?=
 =?us-ascii?Q?dWRcExwxhd8EgZmA7cGow3UY7To6d6ZD8kBK3y9qDL56BvLaA+TvNK0+CytN?=
 =?us-ascii?Q?OnMXPr8nOOWXVYFS5qu+gQLa+DqKdZajjyj5cWWr5gHaOGsRkolA86L/ExZ8?=
 =?us-ascii?Q?jewMlbbJIAF+bbUpgAmjBv63QPyE2xk+WwqXee67?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417f3bc9-8b77-465f-dbec-08dd23c07aef
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 02:12:56.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcRJ7h8LVU6SXACu9jDXV5aMWDC0HAO1GgQ2Bph9/2seE/lW79+BnJcXya3sW59hXsjl/k+Rot93kx8KIe6SNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017

On Sun, Dec 22, 2024 at 06:04:19PM +0100, Dario Binacchi wrote:
>Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
>name used in the RM is video_pll. So, let's rename "video_pll1" to
>"video_pll" to be consistent with the RM and avoid misunderstandings.
>
>No functional changes intended.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
