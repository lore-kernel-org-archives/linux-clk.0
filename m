Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71131E84D;
	Mon,  2 Mar 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489309; cv=fail; b=oRBpFSg2STqLR7SEm/vMngb5Sl+D9NxWZ83w5p2yasg333tFXoI/2CIzIqhrx7PVIjrBv8PiXXScBUryNKeZ/igwXt+U7bzESxAgHAZCVHR698WT79oPm6lErC8tB70+NHt+IxoRNI+kzIpa5ZG11MUZ/souFcTX5sgv0d8WhDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489309; c=relaxed/simple;
	bh=EPrHBsFOsPMScRvI1g6LxOUp3SWHy2Ag1k+LLb+xBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tMmGGW8u2+nqPDBfcX4uI2ocvX67zM7uOk1mHRag4cKmHLhjO0g7VF3GFbUPdWt+7kCbgvdu6ENTVCJDRTD10yMpMYfckBuRM1HKmyy/7JedMhkvJe5/qL+i2wNL2XPdeEEGiIaglPI5JTs/kghOyRBba2oc+2N3XeAgvG4Ts3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WkY4uxUz; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WkY4uxUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f63cTsRPz4oz+pgnpWTiVFweW7q7Ta2aQnq+GM7qMoaYpJW4q6YNAU4q0b4GogSF3emKHI9sUsICDhvn5Dxo8EbRSH6ZSJt5lGtMXM/YRpiQP0xlwcRoazcivKbgwoR4S2m8cfKFbuI3gfE+8h/giWyrpDCrEgV2w0cmKELDBfz15D/Nd9IfD1u7VqsPJlIqMtahnMtgHf/VKf5diSWN1Msuabq8BIA2ICDCRoFbtfjAXyUTJKDUl2kgM/SiCb+jdRUFOSQtOc8Ij0gE9BvLgC/Ff+HZFYwSkf7kTgWqDIHfDwoR6A0/bUShuEZttRRM+2G42Z8YjMcr8wF5SvVvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibdCBGJverBpK88AppCUBsWMqvm3/HkV1KDQEAS59r8=;
 b=Ni4NMsuoU+7reuG6SnktqYEGqtv/912HOVAbh/3jesetJ4iV+pMpAh9hvfGUKO3VRMNreb80WZ0LklpOedHKdoFN9OTej1e2B8tg1/FGOFCaT+IlQrove9ZZ/4NgDGABQ/RjDqQv+wfqcer1XgZeL+hTtzrE23EtUuokm1jYic8QBHef3Ph/fonpbYisGNOofcFBG0WGw3vzOKFcaTtcNUR9ZrbTyeOITe/H4G/vcpD1/IGsb4oem9jnssqbcpFvDkQGp6NRILG+9YcIU564DF4EVh8h1NlDtv/lSHv5sMMVTJ29M/e2X7l4SGUR0igiZ+063jBGPb1iof/K9y+iLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibdCBGJverBpK88AppCUBsWMqvm3/HkV1KDQEAS59r8=;
 b=WkY4uxUzCMf9hsOlphzAy6tSNEhLqPbcHF0+o17Pz0IKWu3o/NHaV+R9jnIOwrlLXpCA1mgm1oNTWozvw9wpdHPS/G9yJaQTI7PNOovY3QXQgkdviLNwjA1WiD9p7P446l4Gp73Vty9M3Ef1+Nh+WL37WUFXhAsdjcvwRoQoNS0Lim30ne0ejb6UADeakvy3uwEpkCk1BticZlwKsRFlOwL6eS5+yO4KTKUTEv8BvJn68omY+e+XK7bGoYBC/WefypYFYquhqrN91iWx/oNtF9bx3hidup46bU/JlRbxtdp2Z2axfxhw1JCfnBdkf6DJeXr7wnIYNFDNdpP0+XPsIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:08:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:08:24 +0000
Date: Mon, 2 Mar 2026 17:08:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Message-ID: <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
X-ClientProxiedBy: SA1P222CA0109.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9850c220-e6a6-47d6-20d2-08de78a838f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	9GibGea0qYbOfMgFwN3buiQcKHMLmTz3mfD/1gxUxxDqhY9pSmsgYGRzqnArfp+Bua4EY4YH4sQ/orX8dVzhtjc4CCBYoqLOaTIvOshgJyLDtzUppCHn9dVLvKHABVs/sRYXA+IpZWLcgZC2uaNJ7eh58/p1GwakRPsrb9WCxBRmrrb9KgDbG5NJ6xenjJQ6Qv22NoH8U2wQWHVUSe2WmTo+kY5fnvOZIrvm4k5hI5TyEGdj35HHpT4309TIgTDJ/NUwFkyv/yB4St0Qc3rccxO0NFk44AoC4RkwBKtgfheghkIX7X2zJvpMr1UjepgmlEPL6Mps6ZPNuanA91CS1ILbt0iP2TOypgyX7K7IDFBb3x/8ws6NUrvFUVdqrzoo1EOfr63AHVzuvAL8rRivDqoZTLARtj58o2bCYzK1tdx1ajkpLwdkAHz1SUOjI3FsYmqK+pRqTyvxmaKyQn0NSt4Pf4xQMTKs/+KOmKljvqH1h7UnWNtq5NS9MZEdk7ZYrZaW4PR3QQuLJZJcMixtNn5rbPtwelbD6uJL1qeGhCBmwMXXUz6eRcfHIlW0gvYpTVnHlk4YW39oGTGwVHGkzvRYeBUST4RXa+OqXrFGKrjd3pXn/RpLtV9MDbM4DAW7IrE2rb3nW1DIkvvy2mERhLOO259UpmxA945H3eRSgxYLAl6/dXsrFHJp6bAAWeeH1EMTBqyo00zod9Fx9O6DecFTDgAtuL6q0Et2sthl5ou7i6UWj7tGc+3Zx2FuusZthftJbqNAOWFUYUaInoxrKOxwBXQIh0OSzBEMBgGTX8ySpymSPTbtSlGSR2ndQfjW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ysaaF77FDvPjjmpXGayI1f8qqsf6O+EcC91CmkpRgRcBlDcyMLqPvLT+lUzR?=
 =?us-ascii?Q?V5RsXYJz7WWYIO051SWOfwnU0IkDyqWzaPHbKyKDwFMVOJOYr/qC/YJe5O6D?=
 =?us-ascii?Q?rZTOHruW+n2a1hes7CKbCwY7lnFLCSWgy9JtdpDpjc9hczyaMOtKeI30bCnT?=
 =?us-ascii?Q?Cp0SvCvdwvvA7kboms8ePHccRdQFbDtol5tGLfs28iE5cDw9SQVZ6nUTQ0Jo?=
 =?us-ascii?Q?v9VZ8+lkYWqRAHTleRiJoANaZvu0MkQ5JN2J7OztRPXfrHN9d45c1uAFDChE?=
 =?us-ascii?Q?fkjlOWcFEX493x8q0eTJoaBu4u+2x8CVaNN/LIkdmlBPz4LMZ8WbTvaYT8Zc?=
 =?us-ascii?Q?KPaZrPDHkbj/ZHQDEIr7Q1ImqXv9Zq7e895yIE2cssM7R8AdhLw7cbMv1Q5j?=
 =?us-ascii?Q?SbNazaUMdKhVDc3Iz4AZpRTi5Lw7/DbZA0OjqoHB7PpCE0Hs4QHdiFBrwdPO?=
 =?us-ascii?Q?qFZ6t6zM27RabX+L9yGESPl99aUZvwegXDWQXQms6XBAW6+LmUiTiyTIBa85?=
 =?us-ascii?Q?2kcnMcM+jCfaR6Kii+Oth4UqMQzHJesIYyFQKyHyzoda/qJJlh5djwRwy4P8?=
 =?us-ascii?Q?GtiVWGzgXe3hWdhZwohLJcKQ7fkkh5WfHqS850bvFk0ycytHuJVcCl2/nEgB?=
 =?us-ascii?Q?6eaTrN7Qyjn4FPKOA0OFxcBZEb0/L2xzVXCdj54pWfj9xq1zHqYbHpjkebIc?=
 =?us-ascii?Q?jk0Er2Jgwuub9tQpqIMHwWyJYWEuZbcDxwfU1Lvta2eg4PKxHssbtaM6hlG5?=
 =?us-ascii?Q?MJODfs5vecn1sqUvshg5YDl7oOPlPp7Dyj92cx1wWhcA7W0n40e7d9HwhJ1d?=
 =?us-ascii?Q?Xud9vZVH8OVmNXM35hZOT4rcH1WrbqkcekHzVXlg+wUhnXwHMvIUSOb8cV+d?=
 =?us-ascii?Q?c7FgFGJQakS5KjC9CNm+Llm41VPlv19ULi+7FZy1x2GCM/Jmv30wU1wwsuXT?=
 =?us-ascii?Q?7wqbpMp5ZRQAPkHZnzTSEbReOd9Nfk8VLqZdZzGOBkIPtNPgukIdplumKY+R?=
 =?us-ascii?Q?42p61KoXOIJExUxX3oCRrc0+87YtvI3SZ7Zy3N3bolf1cgU5z8+xHDJQe9Lx?=
 =?us-ascii?Q?W5+EvSxXTF8S+aSOqovuxW4KvzhgFXu0RJr0NOUp5qKIcUizckYrr0q8HvsK?=
 =?us-ascii?Q?OBesxr/8PFpgTnIjMi6uQ7qxooJszg0NMh0GkM4/5LoOfu5czeqxCObdsQkC?=
 =?us-ascii?Q?Af3MH9Z4dbVhBCCCY6VqTxnBFL0lKDO1zKOOo5eG8hUkvL3pal/dRQWG9MtG?=
 =?us-ascii?Q?A3yiuUJ+nVhbp26NSO9GpfyHwG4PvBlnz2rL90JwT95xhpce4IvOJSxzBvE7?=
 =?us-ascii?Q?pWAh1LvFBByTKORBFkNTsbznWZ8vnzaVzLYhqKPPDB6glKMWlKJ+tWRItaFB?=
 =?us-ascii?Q?jWG14UjDi3VvBNNL2sF3LnvN3wTSXP0Ukt3e8+n+dOe/ZHH3JjFL4CDFpqWK?=
 =?us-ascii?Q?bciohFkd2hzmfamdZWW5VvWjTW8G7wJP0qT1+xiKiVW25OAAp2I3Ihu6ejnX?=
 =?us-ascii?Q?GCqQPZt60FAJBJEf208pj9fj6FDBLOSjWlr53mp2dTkUHD4zbg4xhufbLTH4?=
 =?us-ascii?Q?XNIEigxFrAZrB+kzFMkIyqZr7Bk747KN/a1+OtgvQFGghpZeQO3/H5aa7FZt?=
 =?us-ascii?Q?7KK512VLd+cbn9INbGlWZ6+ePNb8q1QaqgOj1YTgJDpUuFTP2l/aamxsYd9d?=
 =?us-ascii?Q?4pD/eTw0xuFarnz4abmgWQ8nf/evIj4YH1X6eJ5MREEObdNLcfgLwC8pO9G8?=
 =?us-ascii?Q?4o0teLGJ/Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9850c220-e6a6-47d6-20d2-08de78a838f9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:08:24.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/fapHC3PtsTeNo8RY+J9xY0tbDo1aEoZ6S2tS5ezAkJXEvY6vCxxIj/jB1FaVrXzoK/XsS5fnryxJgyaGB90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581

On Wed, Jan 21, 2026 at 01:04:14PM -0500, Frank Li wrote:
> cleanup imx6/7 CCM related CHECK_DTBS warnings
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Abel Vesa:

	Can you help pick binding part?  So I can start pick dts part.

Frank

> Changes in v3:
> - fix wrong set minItem to 4 at binding doc.
> - Link to v2: https://lore.kernel.org/r/20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com
>
> Changes in v2:
> - rename enet_ref_pad from enet1_ref_pad (only 6ul use this name).
> - Link to v1: https://lore.kernel.org/r/20251105-ccm_dts-v1-0-6aadcdf97cb8@nxp.com
>
> ---
> Frank Li (3):
>       dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
>       ARM: dts: imx6qdl: add label for system clocks
>       ARM: dts: imx: add required clocks and clock-names for ccm
>
>  .../devicetree/bindings/clock/imx6q-clock.yaml         |  4 ++++
>  .../devicetree/bindings/clock/imx6ul-clock.yaml        |  4 ++++
>  arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts  |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi             |  5 +++--
>  arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts            |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts             |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi                 | 18 +++++++++++++++---
>  13 files changed, 44 insertions(+), 23 deletions(-)
> ---
> base-commit: d1d799fccb5002df8cd355c0a849cf4efcda4ac1
> change-id: 20251104-ccm_dts-504ea501251b
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
