Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B0BA34;
	Mon,  6 Jan 2025 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192557; cv=fail; b=bjnAyX1C2+DvnHCwajycAHp0NE2UmpbLGjUf30e9GLCGA6JjldhfgDHCQVQboqg+cZnOq66SFAi6UibVO8EJuIEUrEtIYrVOvHoYYrpRw+OGaO8mYHqo24XmUT1VFiGxf5BaD79wbkSJAYhNo98pu5mqs9Xxhl2L5AsX/i33s5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192557; c=relaxed/simple;
	bh=lEV+pZwHogFSaadEKWLP8MvWw1rxFbfCJMXuRkmOLCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=brc29Xj15Q89BO7d2sp5zjSIK0A9NzIyLphz8Up6TS727Ih8hvkZ/+gImWUerI/TWRWEFxfeKjAxLNaFVRDGYKZm9BDmqfOuc9oSKoB5lfUtU4NWHxL7rOiD6e5xbjzDgx41wSVRFwZEMBu7p187xWc7c3DT6hwAZMtwOrVxEVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SayecwFc; arc=fail smtp.client-ip=40.107.21.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SayecwFc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8v2SMP55OhLm3UL24a6pIjvxpqvU0OtyDnCfL+eLM9lQZNBOrRi2ouJO9sTBX9YLiMFcGXw1rMZNagQH57m+b9Vq86GIiwzQjMDeVjSQuP6NUMhdCV+1jEWhkDH8Ikj02EG61hanlbz+aVVBqO8Eu/9fVsjQy4fG5iYISlkDyEdrE3vMmqt6OYRVLz/JoPuI+5AXv+OoCDwpmfUlJr0YsX5s6pgSEwoHza428LeMa9DZ0AvqXdKlMMpRJGaatZM1MAHjOBqujAB36gz1DN4pywwsD/VEiaX5C8WLtwFCEz7MUD0W+MhpbfESv+N/R5sc1TiS1SNhnur/1ybjZqs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRSmbcJ4rSTTT4g5ggXWB+UhS19YIT1s0xckEm4wd7k=;
 b=IIkKzMR9NWiclGwTP+ayimk+De7ALCMNjiUXV0qzTHaWn5042GyYaKoPV0q3cR2uUBzOYxr/OLXFKtPrjkxA8+rVh/O7V6mpzOa5Z6/Ny9qkiv8R3jOE0SzVSiPNw8/5IM5K/nVp2BSOlwcPHKMaxFKzdRls4+qqXmoL5end9AoYQZ0V9fuyf+tmYZa28AocH/iJFJlrXkDU+tC8dN6Dpf/xVCrZ2DsBKNP3L6zEVSNWMXh8OmAb5EosCSrPTLSXZ/uOcoCFT0yD5R9RJKjSiTR7kW2diQ9f1zHxeFSBpFTpnvaZ86PhoipZPt9UN4zhZx4YPlP4vSUc4PxfMp62LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRSmbcJ4rSTTT4g5ggXWB+UhS19YIT1s0xckEm4wd7k=;
 b=SayecwFcPmj9NyZzbN0bQtDWkOWf29JkFct83Y4mkGYDWDSTunnTPPTTSZ/IzoRC0ZHPZa0L8Y/9BvT7iYFKRHtZ35XvesC04VgzhyaGdgv8v7tgLAd4YIg/mwyFmu7ZjlKzJyHhhTRoahHrnnTuBGCr+lMrJMQLU+UMXNXMhY4OSIgIzZwu1cZ9UykjpdZdB7e9Sxkw+44AXDjwPE8yNyBbHYynSDOC0AZUiOAyFtOvfFIjpWRm1XAgo9ODZO0ePMpukIVs2tRdtHlsZWnxfIzaiujkWpvZ26LXBIhRtb5n/s4EBDDn5S40mQPlyqketuhjyS4/HTrsoCuk3ax5Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 19:42:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 19:42:28 +0000
Date: Mon, 6 Jan 2025 14:42:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c685cc6-9790-4143-b402-08dd2e8a4103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DotKAgbt6nNr5QIxM5gfhNb9tMysKBmMdouyyPklXxic47A1nMp11qK2isfU?=
 =?us-ascii?Q?jFfQgAIxl2fI96SAah6F6e4+GgV554XOBZcg800McwAZ6XFTpfrZ2DGC/z42?=
 =?us-ascii?Q?SXls5kEj3jIvnNVuBkitZMFvK0fRKHs4rYPhrYOWpgSj1DZzZO0u2I65U/k7?=
 =?us-ascii?Q?MtHS68jFH0yECWCkBpVV05MssXSCjTzof5huSBYoQ8jkkttli2as3hyJbAOu?=
 =?us-ascii?Q?rlKcxg74ZxDVUC0V7RIMw7Thh3fmOeuIs0A560ib29qUbV4VJAQa4nCXdJIr?=
 =?us-ascii?Q?mPnHzALZSGnTAp4fGD33vaTCrtEOSkEeh5DiCAIpW0uztkxMZj5Xu8b+ZONZ?=
 =?us-ascii?Q?0Mh9ez43ce3lgcD/OuZGoNIB95eMJOqBveMD8+LIdt0pzbMtMIlKnhkrkAFk?=
 =?us-ascii?Q?Y0DvVJjzHJJocg2SmtRjnUbtfyTFwlN6sIZKuBrMCpY4RFDrSCgrsrgw+aXR?=
 =?us-ascii?Q?FTF5YULfzGiSfsyLwWmHGbte2+Y4GTgCyDMSmF9Liz7LWVA0UyCiplstQbKZ?=
 =?us-ascii?Q?NFJCt8n9Csc4pkIYSF7Us0P7k6T/v+tLPkGHQwg6cjzMWRn21h/NCIg0lgZo?=
 =?us-ascii?Q?1BNDB6hZVrw8qkkcmSJRw9HD3oqtF7U5gQIaH6w32W6iXiCikiwgmQWcopVG?=
 =?us-ascii?Q?5lAt8vHKaDhe9OtT8ZLYhE0l6SzFgyHGH8rtrVvMGlAZiQrnsuWmGnkyOEP1?=
 =?us-ascii?Q?qUS0VXLiua9HGn1mjkDDLOd+0Xf+IKyD357a0BNPWZGY08rQTH/D/Mxvo1uq?=
 =?us-ascii?Q?7QpKyBPAx2ZEXLa/4wMQBdBi0wUldQsdl9qzFik2MiuNhnQmV0fQU1b6OZbI?=
 =?us-ascii?Q?AG35xnI2XVHVzZe3mXc5YhSZu6LBWB5GkkF6pK0qX97QAcyjnRmZ8gOAaaEx?=
 =?us-ascii?Q?gd22IGP8I7lkf0I8+Y5X9982GZ5M2iVV0ks/RehYCqXVcUETy1xa1kiHbcAS?=
 =?us-ascii?Q?5wW8NFhMJEQlkfHA1TtHhSRlk/rS6Gn0SA/IAu0KbmNfs9US4WtTK6u+Z8sf?=
 =?us-ascii?Q?2B9jja+BIovtXIn8d6GpFxNO6/47WrNzD0zC8TGrouxG0+a7BYQ6pmjfEWdZ?=
 =?us-ascii?Q?99HOXKZXI0Bll283KZvnsmaGIRg1pXFZ1SY8eWHY82X+PxE3Q70ryK0SzfTA?=
 =?us-ascii?Q?nfp0SlCkjV6RRmIDu+pCn4SFV+Pl4Sl6VcMsL8q0OcBTf35f27Fu9D1xvTWJ?=
 =?us-ascii?Q?E57kxVLzP5hZ3t+V6oDbbiMq1vSAKMgwyXT1oqMteLEWhFyVcXTG+6Jb+BhV?=
 =?us-ascii?Q?+WeEP3qMlyUI2mVfi4TAe/s5/Wm1kKkcd+T5U8WhDPoOO7Qp6LlwgR5kbbQc?=
 =?us-ascii?Q?wDLvOCnr3CeKu1busdMvquwB/KVTs7KTik79i9F5AP4CusxBaQUlBIl9PXni?=
 =?us-ascii?Q?gesyUbfzw3egI3/H1ytretomnWqj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ujfssestsK5DzzaUSDtA18NKLAH+u3kqTFKpH4caZBGq2g38mCY6JFxYqL9?=
 =?us-ascii?Q?zfDiBrDmYeHM5G6I4H9c0T2vR5wmQuKxkbVpOcGAHGagNltQqP8riSaOgUr2?=
 =?us-ascii?Q?REiaYiPfHjIvI0GPApjOjsB/lRrn/CSoBXICjnnyL7WrsBmV3uHYnlcdza6I?=
 =?us-ascii?Q?LhTTwkE3j4qfJuj7l3UYxWWlRVpoOeFSZWTLudZPYHRQsbm4mJmK89aqe41q?=
 =?us-ascii?Q?kxZCtXm8n96fShfkghsZnpSw4cIwf8Swv9vQVEi8g74k+8B8qdHWNMkNlzad?=
 =?us-ascii?Q?ujrWwwW5URwZjG5Al/vN5ZgpVy51SfqXZn3krN2NS1GhZBq5m6S2X+v45yRI?=
 =?us-ascii?Q?ERThSWfT3idJVVDfS5YA7LgeoYEEfez0gW1Fd8Ty+lvRPT7hF/1yLIciyzWn?=
 =?us-ascii?Q?e5gleow2ziLC35U0OCddRgb4h3IVi8iEin4qeBxx/KAyeoFY9Qwza23i7BON?=
 =?us-ascii?Q?BB0siYhY8kRJ6C4fjtXyQYbLCX0CIoTfLFDslsLmVfcrPiwFA2mxujEzuyro?=
 =?us-ascii?Q?PaDrD/w3+f9ikb/R+ntgSfBqmTUM+0eAZ+qXXm2ZqNm9oForlwPts/FG+DGM?=
 =?us-ascii?Q?aot2suct4b8Rcl4OWkYS+wqdB6PlohtV8ykVuAiAPqtDrCvGQRMgXsucKJJd?=
 =?us-ascii?Q?aTz6cofgVyV5RMZZXZM0KIZwOUTbl3ioqQMZCEZBIqhPSu6ibTwjwaiDcYjs?=
 =?us-ascii?Q?xcHKTRtX/FswNdalyrJ+bkxsqjGGU5QYG0t4n02Jgr6cniPFGlKhmQA1hypY?=
 =?us-ascii?Q?dY8v83Axtm7ClrAeNsuTTUEvhS+K0twmBJMmgQ4y84s3W+qQLpe7dMqPVKz2?=
 =?us-ascii?Q?VjD7oZEEorbsYfSxTcLhxxF2eQqyearq/ztw79XBG4nJXk8NVJ6bP1aPVVyR?=
 =?us-ascii?Q?7KplpFTbUk6q20qHqY1nLR9Z4zjWd4vhSDr6laGwkxJslmzOZdCxUjlFS+hN?=
 =?us-ascii?Q?+9AFUNQx/0U/9vMJ2aV1R2ZJUUOUw2859ufDNEWNlphGUAmwa/khD8Ro5BNt?=
 =?us-ascii?Q?6NWb1MsxdtEpIa6pa8c9tRciFFs7zUKJHb7doT2sAuuFK2oSV0FHzGU+8c4d?=
 =?us-ascii?Q?ix47MQsFgKB07xezFeAxTAPG7yHoU+z6WwEXOZXQE/+Zo9yJxfR++iNqHm8z?=
 =?us-ascii?Q?FwQg75i98F1KP9tZz4vt7yGfmomYqFvHhYZJKBFiT01KOwumSij6mSUcNLzP?=
 =?us-ascii?Q?mp5fiZFLn7lNSpslQLkUTrqqePAxx9Ad1Jz70iO1tabjwS8eYDCIQRIEd6qu?=
 =?us-ascii?Q?l8JHS2XOojMZlKAR5zmPTh+hCwe1mJ3FkP8iSLk+XlOYuuB7O1WIcBjG/XTy?=
 =?us-ascii?Q?GzS7nycpbM3Ay5U7gPg1+C5mXOhZiPb7J76LfGWdhpbyz7lOOcI12GJNXiHw?=
 =?us-ascii?Q?NFH9DxQOLrHWrFoTxKToLXpD9Q+nAM2xNw1V1TrWlGRxHPDUrLKUNOqfQd1D?=
 =?us-ascii?Q?jIOJ3d7cl61/wsn/3Q+MT7QsjH1EoRYQ8j1L6K5fn+jmpUPjwcZLrA8RwhXD?=
 =?us-ascii?Q?J5BZAcchL/XJkoc515Y6k8s46EjZxbhCjyGdx5JYqBiSRCdvlbBBtEeVTi1G?=
 =?us-ascii?Q?W2VvAaHMU5CvU/gzOn4dcYTHBPz6KcPLiTQGtm6o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c685cc6-9790-4143-b402-08dd2e8a4103
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 19:42:28.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wqSSN5qlaHiprFduWPXwfH4dvZAFYfnnpbZaWuR0+jd/wVK2g4j7QUQ1bLNHRaun/5ibeQIHMUUSLKfV7MPfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

On Mon, Jan 06, 2025 at 08:25:38PM +0100, Ahmad Fatoum wrote:
> Hello Frank,
>
> On 06.01.25 17:41, Frank Li wrote:
> > On Mon, Jan 06, 2025 at 03:21:42PM +0100, Ahmad Fatoum wrote:
>
> [snip]
>
> >> Allowing for absence of both properties is
> >> needed, because there is no default suitable for all boards:
> >>
> >> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
> >> that are all achievable in nominal mode. For i.MX8MP, there are some
> >> rates only validated for overdrive mode.
> >>
> >> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
> >> may configure at runtime, so it has not been possible so far to infer from
> >> just the device tree what the mode is.
>
> [snip]
>
> >> +  fsl,nominal-mode:
> >> +    description: Set if SoC is operated in nominal mode
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >> +  fsl,overdrive-mode:
> >> +    description: Set if SoC is operated in overdrive mode
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >
> > why need two flags? suppose "not set fsl,overdrive-mode" is equal to
> > fsl,nominal-mode
>
> Conor had the same question on v1[1] and I have addressed this in the commit
> message of v2, see above.
>
> In short, there is unfortunately no universally applicable default.
>
> [1]: https://lore.kernel.org/all/4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de/
>

But there are problem if use dts overlay because dts overlay can't support
delete property.

If one dts file use "fsl,overdrive-mode", dts overlay file can't delete
this property. "mutually exclusive optional properties" was not preferred.

mode = ["normal" | "overdrive"]

Frank

> Thanks,
> Ahmad
>
>
> >
> > Frank
> >
> >>  required:
> >>    - compatible
> >>    - reg
> >> @@ -95,6 +103,12 @@ allOf:
> >>              - const: clk_ext2
> >>              - const: clk_ext3
> >>              - const: clk_ext4
> >> +  - if:
> >> +      required:
> >> +        - fsl,overdrive-mode
> >> +    then:
> >> +      properties:
> >> +        fsl,nominal-mode: false
> >>
> >>  additionalProperties: false
> >>
> >>
> >> --
> >> 2.39.5
> >>
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
