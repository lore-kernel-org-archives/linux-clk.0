Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26234A77D;
	Fri,  4 Sep 2026 04:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496535; cv=fail; b=LiTfRNs0e3vscuwQDoAlCJMyGvFvo1XwWNs+riNuJe81GaUG4IRAlntS0MXY/JE0NJuictMIB578ZRTbGppgrxzEYMjipLBZDZT/yfSP0vM6XvVlkBRS6NlinNgklXEw1w51qvz5bB0h0l7ojlbv18LV8NKm8XHQECXWauV6Uus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496535; c=relaxed/simple;
	bh=Q1dsvsRSmDWXFyZef4RXe/CnXTTichQAGoVwomoqMcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k9aabozUt/p9DDRVaq0QSI8RBEQuf76TWgPdoCpV707f9LukiFkcJxkLWuc2GSvRvnrz8ChoLf99P/BWe3X8o/nKmO6zD/EgITmGpHVGpExyHBUE8o4+/1p8XbhqFTHisv+2lOEpvLZfXl6MEkDuNuKhSbW4IILU+G1849mA700=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HLxRX1RX; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HLxRX1RX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPcM/WUDnTK/gATnxOIF95VagxQPcU1MB8FmQ5+bkYE0C74HFPZH/RsQjglni0XmrX7USzLgHUS6SD7a+aCEPfS36UQQekrfQl7DpMakZToMLj+UKM3DahoZRT3iTgPEhX7+gKv5GiYVEmDbSaCXOf/+rep4qY94MZVS944eOSojsTPxgCunx4AXRKKrrIa5Y8Gi/5HD3RbTXjKuB5APsIycslR9VsF96IqfqN8ZbwS8ihh8fhKLyWQuWAghBnMEYdKLl25cUZPJSQEYLWw2UKKlBexZAbhADkxN5mlrXdmYSrfP4HUwlhQPSlwD+0TNMLmWqjnUhcxvX98adc62sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1dsvsRSmDWXFyZef4RXe/CnXTTichQAGoVwomoqMcE=;
 b=V0MtPH3QF3EhtghPL5GbVL2/3pSA2FmyWGAlJ7R9/UEl+Hbi+P40a5ClJyL2VsvcLz59+HLfgKApI13dDyVVwvs11aDlmuBHMbvYu+ySdxsBrl/+Qrh4KRI4pOzGOfnQbaL50YD+nbhV7p8EUlPmIUf2KJENJNa8HlRK2XYYjo3hKh38hRZdPCR97zWAh0MB7Jc9ImCSrfFEKAcBLmZ980S9F+9cHWcQEC/P9sVoKHid2ORsriyzFPQlIMxakqg9zFXvUJas8q11h1svhmt9vI1+tbhS7LHBqs0tCs5aMfjmGkGYxUgjOsJGcz4wTh65B1VVjBMu0GAGPiLGQMDyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1dsvsRSmDWXFyZef4RXe/CnXTTichQAGoVwomoqMcE=;
 b=HLxRX1RXEch5MYxrOhSdm17ssuDJqHhILkhNH3Mtk60msQuFk0dpcfvYS5MK+Xas2su4Csq16s7GS3hgvQulfEkdOXyqm+2tbAQQWmtzF6bo4XjPl2tSkZkGT2SXnxeE3bo/+2vJJCWigJxFbfA97DgYOEyGtJctdacv4RRJO17d/pET3hABSXeJLP7NON5WWvuW8ljLy1HiqbNsNypvAjZ58RQ1RmupYT8yIxA9esetTpsLu/WdkgGS3P5T3FErJBlctdGPlAg+JaHjMPX5EmoL+uJ1jgCvf7vqUfDIr7AJEEvt6gr5S0ZiICzlr5eE1ejSWLYRGVBntMIZAzgUFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:35:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:35:31 +0000
Date: Fri, 4 Sep 2026 12:39:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>, Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 3/4] clk: validate spread spectrum configuration
Message-ID: <appLi3b+G9CS7eV9@shlinux89>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153836.373267-4-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: MA5PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: f65d22cd-f01d-481d-a210-08df0a3df40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	noG2sCnRrDpMgLxWhGEXUBlmaqI32yvX0RuvnBCyhROCvDyXEtV25RHWSAPNNg7a4eiGStgwCY1yshZ8DgUZlD6Y0HIV/quOn1X3i8UuQ7NI7dV7hEsR8VoEmCXBoUuVTrePHxXcwvGPf3wkPSplzHFKF7iXvq2VcnzM1NjbNmHAA+TM6HLbbEoTX0FAr4f9LSvlJWrV7Dw8hnKr3TctbA6fe2qU4BLIDY5wLc5wR3WiiTMbidKtuXsv9uqQ9/SfeeLb/dKt76dFpKdNwiaXSugSU1zZI0x49q2LWIZrj96xbu+D3Yxs6CyBhB0OLuejik4CwABL4CSQLNtCiYW6wRUUoVd9fWuIzVCu0WnNmpQ6LL/pnylXgTSDYyVDCWEBH+WIvsRBXFv96TnN4ePwSK4UOqYUjyVzqZD9Lm4AimjWvSDONgLkhGKNPcBV08C56ihoO3PqdkdNTmDWrYP6nlo0aP/gWKmF+YElMsdMZFiJFXJP/AY92pV69hUJ8bvI6xoC6PDJTL2Q+gxE8OPxj99zmXIsnr8reWQUOXrG7Az5K+mt/0QJPPQej/iHUuzNyf06ScZkiKsUucQG6HYg+gAFfjLTXyTzgO39pHp/zss7BaZuqPq/7HNizOEyDqlwm9jC4pyoGjdp8wOu3QjJg06pOVTB5WccbZNWuFN9XPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phbfnMawZQNr5oQZSnu9nhIs7jfqzCdD4FJw2Pp1zvuS44iz6dUDNn7v7nBy?=
 =?us-ascii?Q?vLAlGP9kUD7+uIndtQ8EcW5aBIO884W4wP5j2VkHM84NUK496HPxqM1hCTSf?=
 =?us-ascii?Q?79VINw9XlRReHV1c8nu6Wjo1l4MaAjZIozwXcJyzIwchEkaSmYK3tNIMCxHp?=
 =?us-ascii?Q?kflaDgubEzf/R+9EtgH7PaYK1nsRKxxGy+Is4/AHQ9dP0H4kId9xb+X1eMeD?=
 =?us-ascii?Q?CyqhTy5E59P69odIq65IhCOphB5q+go11pMkcUNOuBV0onQK0G/yj0EStOXM?=
 =?us-ascii?Q?4K4ZqvPwjV9dsM3DagjUknOLN3HdnjIAChq6KWPW1LoGrCnZ3pqIO+BZ+JR9?=
 =?us-ascii?Q?ud36uEDBz5M2GLbi2dR4VHJUVoeI+NRtee+h3RB3EjhznB8gNMs/AdIvb8Dk?=
 =?us-ascii?Q?1HMRP56Np7VeeAP6i95TgoZFoi286uJjL1fOmkL4BS/wssmfqzBq4kr5TYLF?=
 =?us-ascii?Q?dNgNNx/pE6VulCZi3fMWm61ywP9rsym60qaQBJBOoHkxouJr8000KNu9vUCH?=
 =?us-ascii?Q?HR7h0WONgX3haYWpTknzL5pBGPPVemfUUeP97VO0mp+8B3/IRKJ9CBhQ6ZLp?=
 =?us-ascii?Q?AXkQ9aO8jIPrQkGHdKEgH8zs0AqdiMG2xvtCYNfdfgBOFtwHXDAB/BtrbIkm?=
 =?us-ascii?Q?oCrYUir+d03qfyk1Oz+lvaYvyEagwyJpyDx5A9ZvVFHHZpUxaR/ohU7lX2qo?=
 =?us-ascii?Q?40lywSMLBvGul83uzauCXuyF5nrseZFugAmxNV2g7PpBfEAH9UsqMlFGl4XZ?=
 =?us-ascii?Q?EJOfXodD+3hyPwxEqzdiNBOhf5v2ioY321yxShCWULP0q447NwDicqCXalL2?=
 =?us-ascii?Q?hHFsFTDaxVdZoJM2cKfG9DDPQBM4kOz8gX7eO9NWUXH7Ictx29X0Pv2wybf5?=
 =?us-ascii?Q?3sV2BgdrCcEnrChtnY3RRZ8LqJSdN8SBBlLg//Tdwv1JvuwB2taKe0Af4XYB?=
 =?us-ascii?Q?U6guP60IGpLHeAvHtN/w0fwu8LaAJO+yvmAJGwhIYmAGMb7iKW9q71rT3AGn?=
 =?us-ascii?Q?ydRS/pn2bU7o17hYAxVoGl5LpZtHo1wiX3nJAoQSPOeksqa5LJ8stXN0RKSj?=
 =?us-ascii?Q?RgSuoAjrypHdt5Aw3x+Wz4dblnlRkFXL3WbPEgsPihE7MJ5OaJzRR+YjW9DT?=
 =?us-ascii?Q?IHD4mesqLtypUxGKuWhEZup7zofSxssi+k4W1rIAG/PgDJ8edHScmSyeWBHZ?=
 =?us-ascii?Q?+ZO8+0E3udZMUBmtub0Fsx86RfzTMAXvdVviu4rHZS99BWyZPGR4+wsjBfxi?=
 =?us-ascii?Q?pjrnfkxrQESC+aoXHEubcbPK+oWZwitd04IJdECCnXiiq4HjViWVeoe5ggpM?=
 =?us-ascii?Q?SckxHtL6N0IcyjHQIzHXGftFlqyHNh1eeywTg2gIzjGEeeiyXYWYk2g2n/oo?=
 =?us-ascii?Q?tSjAqUYPKqo3UptxOcqv/pKtMaiJLQojRL+3YS+KT45cHpiC347endxJjtvQ?=
 =?us-ascii?Q?skd1D9CPxfaI/7L3YY2JNN2MrrgL1URPmmtL2zROu1d/Rv+qftGuVn+65Vh+?=
 =?us-ascii?Q?gpb1YHQ88ciyMlaMld6lhVACLVX4ymBkSBR5Yg05dtNpD7aOWkuPQSSXYWzm?=
 =?us-ascii?Q?Ys7fFyqCeuWysa+dnDLhkaL5jyLo6WqDl84VvV4Y2Kfu5UI+IdAkymOq9/sX?=
 =?us-ascii?Q?Ha84pfU1kRdfJRto7iF/vev4dV/RqE1i0Uz9zGZGoFofxcYvXseJftTRILJP?=
 =?us-ascii?Q?PW9G0kSsX26trHQLixOxGq9wKu25w8HPFA2SLjKGgHChJ8hvVy4e2pR5sbLu?=
 =?us-ascii?Q?BbQbujLbugWS23WlYi13/cA1DWHHxmTu2P1m3jrG3y01BFGxrO6g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65d22cd-f01d-481d-a210-08df0a3df40f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:35:31.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I/QEqwbP4P+Gz57S4usHgXaXY3FpgoVrcmYEk8BQomo7KeClPhmisOGJug5JqJeNnFRWrR25YmvjsG8fCW2EntT6HQIn/AOgMOkiosKKpMdJj6eNiioGH8Gp54v7WB6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676

On Thu, Sep 03, 2026 at 05:32:15PM +0200, Dario Binacchi wrote:
>The spread spectrum configuration is passed to the provider's
>set_spread_spectrum() callback without any validation, as clk-conf.c
>only skips all-zero triplets from "assigned-clock-sscs". An invalid
>device tree can hand providers a zero modulation frequency or a spread
>ratio above 100%, and each provider would have to add the same checks
>to protect e.g. divisions in its rate computations.
>
>The KUnit test data for assigned-clock-sscs uses spread values of 30000
>and 40000 permyriad (300% and 400%), which the new check rejects, as
>reported by Sashiko, so fix them to 300 and 400 (3% and 4%). Also use
>a realistic 6% value for the initial settings of the skip tests, for
>consistency.
>
>Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
>Reported-by: Sashiko <sashiko-bot@kernel.org>
>Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
