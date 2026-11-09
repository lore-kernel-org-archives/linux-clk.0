Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794228210;
	b=McwKI3RUi3FkCv2aqJ5XyAA6GjDJUWtnVCL1XP35JJFxT13yfKf1O5ZmmBxQwCe+qTDW
	 sqgPXKT+y5WbLlqQT0LnfpWg6feFU6HUtUZREqiMvo4GXXwcIn8C5ZRiTUhVqh00MwkIk
	 Y/mcWp3I8b972Y+sh+9EwmcI8OfS9lAh9GeFdaCe9iwNpUa8znkGy/bRXzP6rYgyRn2aq
	 VSuIIaaU/B5ZUtcHjUPbtxyF3TSOg4KjP8GB57Mt4Ekp1HwYVXmbwrPvF37buqWA4Nad9
	 v8Vis0w8rkxAtQhUZSA/FiO/oQ0G4DP1TcvqiUsnhfPOTI17Ih1zDSXslZExo1UV45g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228210;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cUyWPvJ98/4vuvj11Rbhn4AhGbIY5R8JsLMOMOD5l1s=;
	b=beA6lx9m1uSuF+6GiRcPE4eC3vCFfvAEWzdJLD28K+3XBD/qCxZUk0NRw3OpxEDX/huq
	 uzYDlDPnUWOnxeRTKoG/VvlErqRrUfmD+2h/bHv62OeyRTVNK/c/Xgx3qxOncJIrMb7mp
	 2By2lOB4DGWUjIoi0j5TqLlXONdDrlQdMB3Cvn0b0reibeeuY84L5Lg5kuDke/MlQl8vu
	 DCMnPfVJI0aTEuxhIuXlshRJx6bnWWtRwvqWwHuG9lufkDXIBy1Fv5M7FGUUUVYv/DDyc
	 hAcB3nUu4dMgbCI4fUkZWIXgxmG8wbp/1ra3zN+4VXC+yERYzjxuUC91E63PftOhQgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ka0C4DKz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.31
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C901606A31C;
	Mon,  9 Nov 2026 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C901606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ka0C4DKz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N17ilEMcu5Ngpm5FClFNmP10KEYMxoB5MEnGUpWj61YZrR/IhjtdDPZXQbCGe60Yvlvc/K65l4IrGc7eNgfLIdPnS/gJRYYFNjKMTZ5GPZJqJGh8gS/iAlWHcPXoL5KvBQo1KF3Y6sYRpjXiFznPPe6v/leiLVS2kczE+5Q63vcsXTeoHerjFHJpr66ZNhvX5ECnuDthGY2tDd6WoVqtmG2YZ6zKNZ1qZmEk+9K2Z56/gAVart5FtWS/n4ZCQFg5xMnHzhsZdBTxGlKNe0jrxivILM7670weTDXbNTTPW3TN5s6VK6/ZvwE4JHSqdgVx10N9hDfgVklTEOOLl7+unQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUyWPvJ98/4vuvj11Rbhn4AhGbIY5R8JsLMOMOD5l1s=;
 b=hGuwAGVxxv7vZZjhhNCCD8fMzviBfMzjyZhhoj3l5kCH9B0U/2HSMI5Paxydkn0SOHHqw6kIdSmgA8+iwYROxxBeQsMy5ktTl2ltz/Vn68tJlm2k2//3uVHdDGzjrrJSbpQSMe3k7bhkVVjx1+tDCdbZkolQN+zVx5jVXi5Wu5BopvlCmGU2aaIvixAI3JmRitB82fTxT3vgaNn/LPcDoaUynWWvEUo8qFepuqvP5iij4+RDH2S93kZlCS8bHi6+69Yh3af19rWrUmMpegS5v4St8LEBdNVdXjyOiMLNss5XJBMgEs8kY5KLWhmVWILxcIYw0pwDznXITMhrJGCp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUyWPvJ98/4vuvj11Rbhn4AhGbIY5R8JsLMOMOD5l1s=;
 b=ka0C4DKzwjaXAlrMr7v9XoRK7Cm535gL/5ieAmtlGbq5zVLYRNIT3TeK+3oe46SeXAUjAGKuE+gWgzaBZ4ExupCtP54Mn/Jw/VYY5jEnhrU1B2DpcuffmUZbwwufJLnibW8eccQB5a4owsA6U5Oq/c+dTcolz1Q2kcVrkCqNxfwnju/C+9HEK3bp+VKFRTxINA7Ma3bkdgz5cGJqQZolvdQB37n4bDZJ67LdcH7ISY0WtTIkwVGUG2r/AwdkAVucTQ+wZhhjA+8JVd62+IBDrwnM9anrpdWlWkTsKD8gyGpt9wzOh/Guq7OE71TQzUzmsLkJz+b/XejwlKmcaM/X9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by WA4PR04MB373110.eurprd04.prod.outlook.com (2603:10a6:1d0:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 12:43:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 12:43:25 +0000
Date: Mon, 9 Nov 2026 20:39:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florin Pavelescu <florin.pavelescu@nxp.com>
Subject: Re: [PATCH v2] clk: imx: pll14xx: Fix potential integer overflow
Message-ID: <avG_HJDImzvZnoFS@nxa18884-linux-1.ap.freescale.net>
References: <20261109113138.10845-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109113138.10845-1-stefan.ghetu@nxp.com>
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|WA4PR04MB373110:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b6d910-569a-44eb-cd26-08df3e5f0c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|19092799006|1800799024|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	p8LxeLXr2YWZncfdcScdrqtNu0k0gUejS1FPLDd7BMHKuOJ+msSBT/l4Lch3W857yfoUNcU7p7tAEjBimFwxvtmRTof1T35+qqImhYmZOn7e8a9DFLgMrwe04bSAam9PVRnGpIGBAOD0IVQoodbUmidkrRmq5Gq+TZ4JF+XZzelFifybv2EoNaMbxR5EQFFR6tDiYKVOKnCg9aUFWS7ODOoRsL60N1387hufyRanARFLbwlVaw+2k1aswrMUj0U9HeZ/4fzAaa2hJSOVB44XOBHfyrsF/niZPESp2f6GgWSWo/PxwwAjKxn+CZNb2vvInk0GJiSVgwnm9161OCYbFJSGECk+/cHG87gNfrEZ0dMOLv7J7c0Qf+F6Kttp4uqUtaAJwDNN6sZApm2BQ0KOwjBvri8nEX+pJZn56QyrwfFOX4Iew39SHmPlUNFlJoZtBZfc2vqzRd2AaN706hv24c06YG45knaLRjlIbLfWWl42Mr7TkbzZjk7DL7L4VztKHI8sx9B/blbKfBUdWS2z8VO2LRklf0Z3zLoOkD4wI4nw6eeHHIaN8qoDgfFnmaYZtJdcWYWVEsrdugkifbCE+q7tXpOnHCO68G/pYyHboYHK3ZSHZvsO4FImHCK8bPGG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(19092799006)(1800799024)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g84Vfp6m8KNSsCqEj0C/Xms+Un+eq4p2qvTDIJlbwzcTj9zDTqeR/0B2Rf7m?=
 =?us-ascii?Q?7HIO4r0JJpltwldQ8Ygus/TWY9aceMrpNxEEJxeHnwvk2JLiCWHaKeMCug3y?=
 =?us-ascii?Q?RYmdjErk3I2+zkI/PbC74SLb31iUtAqD6LY+t41xdMxMyqL6U81hTfllVF7k?=
 =?us-ascii?Q?KAwcnkGiAO0S52VnhOGfImaHLnimZAXL7yJABYGUwMv+v/IVuCiUsQgsrJ1j?=
 =?us-ascii?Q?ti2UmU6moxnIvRzScgpntTipg9eeP8EDGXFfTFaFyYyiXexk0DFgfsDOsk91?=
 =?us-ascii?Q?qlW5zvu/i566EY7prmK1heyQIlbiGPyfYe1nanAUM7P5JgbUbrYq4IO2ptZ8?=
 =?us-ascii?Q?yNAGW4oNDas/6X1xMJi5c79nh3HRFBrSiFu3Xi6IiW6q3taiH+sGcEvaKsqs?=
 =?us-ascii?Q?FDs6fgCfNmKVDjZaPyILEaYW/7EYFmq9wwC0BnD67xqyoEoe2DVdCUz1ajFR?=
 =?us-ascii?Q?s8lqNRLx1+dz2wf+d3ywFiCv0dtEoYzEEBvx+t0VQcDl67w09Iz+par8EYLv?=
 =?us-ascii?Q?ExN3TqEsc6opO4u9ssPUZlSOSp9ikSAhBoE77A4GhrVdJPESIe/sdQ0NCzjP?=
 =?us-ascii?Q?aCfCLa+Pw0XsORXRnfntutg5losLQu2yifDFp7dYUr+nugHKnr3DIBdySqNT?=
 =?us-ascii?Q?9ytZA3mKLi+CxWjuC7o+4l8Xp7tqPjdVXLs1onrXVztgQt/5GYWSqlCEXqKE?=
 =?us-ascii?Q?lvRLTXBGUr2PFQht16ME4xInUo4iq8wGB4mtkmUuOvotG8F1Mf3rSsAJHkxG?=
 =?us-ascii?Q?SUgRg4hoqKzlMtzawzIfTuM/Ut+Ste64ZCGwxT9ZXu/0h/R5eN4Hsecqqw0B?=
 =?us-ascii?Q?0oFHI8+JsNVo0i/Xiw10CtMgak7QjW+KJqmwUlTfgoEjUm6TxPorcsOznbrs?=
 =?us-ascii?Q?6JzJScSj7leiAT/CKMyEkr1SClLN9s9R37NfacxkkogOSauyfgLo+xPeNDwj?=
 =?us-ascii?Q?korplpi8uXXgLb+A4K8UqIOUbRRrPRKUl2XF7sZBJsp5PiqyNxRWFHAcIfVe?=
 =?us-ascii?Q?YTEDXUPgPORwgOZmmxHRa4CBSdcGBEKw3NjBhXxKd8PoNkp8hVNNloawPy0i?=
 =?us-ascii?Q?DMHbeQnQy/OjpaZFL3w+PYQzodh6V1FqwFcAYEtEv1FHhSYdetHfewkx9vPe?=
 =?us-ascii?Q?a3GO0WnrcQFnksSp9u4d3r9wqwd9SwuetHw85grW9Pz9FPfnYnqnWfV7jMxc?=
 =?us-ascii?Q?rfG30lGF28JHZV/ypDCV2zn3INmSkpn/n6jstmEtpEcLqrXNaGBvjTc6t3U/?=
 =?us-ascii?Q?uknU2BpQXfVnAHukp2+PKKmD1fRHyGSgI4NE07HhfXzHbq6j8mNZQOghYTmn?=
 =?us-ascii?Q?BpRhWebWz4HVTkk1q3QaggErRoraFz5JYzWWjNfE5gWUUFsmS03lW5n5NyQU?=
 =?us-ascii?Q?BtYGKIcrLAOo/DOxzSIR+8lxCywu6cnrRWcftVSropLTLhbyf1cB2BwJ+siP?=
 =?us-ascii?Q?UGNk0tffdRwGz6XsXlZqU9XJV7hKgUvWwbSz4qHhNmzzbGlmFXYwRnA6GkGa?=
 =?us-ascii?Q?CaJ7Yj6nptfU3cnkkevnGbVp23kaFuFyrLuCh/JJrh0XMpMXEK9wxYFkmV69?=
 =?us-ascii?Q?aU7Uwio7Uo8zMGzDTIfEDsGmjmIhBK+lXrawpLGtTL1gpvKH+OgrPF3obxDU?=
 =?us-ascii?Q?n+yV5AuesNSqScgjyO/OuEkjRx96/ZTuv6HdPUafz6G6OVfXVYM1WtVAc4pT?=
 =?us-ascii?Q?pL5dpjxbiM+LHkC9FQjRTHObJtrIatqDEP4xWDaJ4a46mo2RkRolOYJtgDFL?=
 =?us-ascii?Q?bwYN/OXYNzZUoV3EMROBrTuf83At/E66XiFD1dsFi3NGFAgHv5Xo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b6d910-569a-44eb-cd26-08df3e5f0c1a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:43:25.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2pc5iJ46gKgbJy5AKy4N6cvSZxc27D/YO/+dDe7KKwsqTLufayC6VVE4MoYNS75cW99ooSTlaOzRoUye2W2nH/M0OsatT0CSjMu5DWI62qcL0VivRZmjo+S/jRDykkP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB373110

On Mon, Nov 09, 2026 at 01:31:38PM +0200, Stefan Ghetu wrote:
>From: Florin Pavelescu <florin.pavelescu@nxp.com>
>
>Cast to u64, so that multiplications and additions will be done
>in 64-bit arithmetic and the possibility of integer overflow is eliminated.
>
>Fixes: 53990cf9d5b48 ("clk: imx: pll14xx: consolidate rate calculation")
>Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
>Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

It will not overflow. See this:
https://lore.kernel.org/all/6181060a-ae36-4d0f-bfe0-c1e5c8a8ab3c@gmail.com/

If we do want to silence some warnings from tools, drop the Fixes tag,
and update to commit message accordingly.

Regards
Peng
