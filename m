Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2065.outbound.protection.outlook.com [40.107.249.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA51216F8E9;
	Mon,  6 Jan 2025 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181690; cv=fail; b=Xq/uIPVGdgFprHZntGBLE7BqPpou+xmceYTNP7WYxdoeM+WBA7l45AYTsGJP9ZQG0+aSaTyiVlSKdhBErklPG1YiUDGn4VwfpAQpUpDXJVAgA8NwgM5Pi+4d0NYlwNL5/ebG+EmwwkCV1ojFRyzRCoLQ7/5hBhusv1cGED9rW1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181690; c=relaxed/simple;
	bh=e7tLUNWfj9cQ0RyfkA/TwKyDA7hN4niRdlTFMtZPuv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=snPVzNUysfxQdz/yktm6oTEqTcI6v9pZw4F8qoKZO6nMf71lqbKFo8pBzm+KFKwLqMLTmx5DJ9SY0rc9Z0c6UnzO4bWXioQA2Q0E5QT8dthjuMO12BbBaqKbgeOsdNRe4In/WwhxZTMcz4nmH6ocNgL4llxILvmxrKpzh7h//FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e39KPEyt; arc=fail smtp.client-ip=40.107.249.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e39KPEyt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWWf7odixQII/7wvedLULj7iXaab46Pdm7m5HcE6YKYBQYHcg10v8gN8tXR3S2bmaIkYcf9bLmBQCocOY+RP3PmSFLweEgmC4i/BfefMyeAkuAvwcwQ0NsOAGNUiaC5Bw2fCBp0kVcOxWD+0RhbJn347sKXXtsXQG7U4Gd1loc59vxBws+6qH/t2pOw4pahZiAkTNlNJ56+dKnUJMILja6eBVcSFi8pJozRip2BHI1TJ92TcbTUUIVIHSCvJftkGoVQnLtNKy/gOIhMtCQe+IZOGeY/fi+b8E+dO+n8Mf3VTvYBDGazUzGDm+Xdsaa5qNjrEprxZrd/Els4LfOMW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLtaA30x46OOm+qM0sXZm9uumesTb8ZvPVaSoItN0AE=;
 b=Cn4nR8unLHIVE49wCyhmLRG7l4pgI8FGFvrZ9S1W+4gi05EKQCmo6wrYuXRTaz+Zcqf2IiR52+OKqczTHDSoDtLSyroyzstyokHhx0YIvlQ7AZQMqFIRejTWphS90ixbOWUVZDd/7aGeuzTNqO37y1Kf8XW0Rd7i9a2pl8jwplDGX1OTUhxCk2tohE6Qf4XKoMiZJYjDjgWMTNYssevdZwGud6PbIGuEjPbFg+DCkJ8xi1qQ8uFZDfUDRUKsFUkzem01BupfXXsTo9OMyqVlytzRYaJavoqccgzFqfCd5RbUvq3In9oGAlIky7Z5zZDFsrasg0necTQhTVtqfrLdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLtaA30x46OOm+qM0sXZm9uumesTb8ZvPVaSoItN0AE=;
 b=e39KPEytvH7EfNFsVsdFB3p90132xv2LUmxF1jNx40Xebpu7b3Pu7YyoHjSqbR1ZYrEr/uv4eghe2lu3IYMNRprbRmxw+AF8DK2t3ZNs67bhNJkieSsRzHECrcQhDDU7rkIPYdnQbRN0EyvP1rXVcr2By333XdvrzdKAfc+XLeuskJvrg+MimaJ6q0YFKUJupWn2iA4AffdO+zpJdj+mUMtd5mJXn7hZo3DbmoebKtfY5HkjPpd2WpNgDpVzRimshn17PCv1BHNC5r2pzut4JDG9IDTPFWFSceLv4qZnH3BpAAivahriteEO4xFo5RhcUDg2pCs/GdBwBBtM9kHYDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 16:41:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 16:41:20 +0000
Date: Mon, 6 Jan 2025 11:41:11 -0500
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
Message-ID: <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcb2b4f-92a5-4663-62f3-08dd2e70f2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RecqRILwGSZsbJBHWMjqtIG6C5IIxZyT85Gb+ZPJaqTmH7xML4bBJtANtonF?=
 =?us-ascii?Q?ft/x8QnL5iJ0Sm/nnA+kt3ISJ7HuATSLylcOscu4zPqSljx2WRpSjTGw4Y3/?=
 =?us-ascii?Q?ODdpcstA2TuP8/0I6vkW2Nmq4uOD1+WRcjpci9fz9d0ReGjlENP7AJzJOKET?=
 =?us-ascii?Q?IDwCxk9Z2He3EpRD8o5CDav648PNCoiM9uYMPvxjE9i8gTbXUJMZnCx+IgbU?=
 =?us-ascii?Q?a0dpQ5wnmQIgVTc0wcXhsRyGDkco3Ng9VyoJu7cHZZLvsat3RzO/UGy97MFk?=
 =?us-ascii?Q?bKkue66+9B/f+5eRGKTkEsG/SJ/qNv1GRvvX+nyQEEW3F7BSFd9kKmVQk7SO?=
 =?us-ascii?Q?aA0nbIQKq2tkWY/MtbzZL1RwOdRVmi7YRzoDtGPLD9jIe+YBZSd773dvrru5?=
 =?us-ascii?Q?teQXf4bQwS/dsmkRDTAjsTYWELBCJWLrCHi/0OqpPMI121GIVnAe2lWTU5AO?=
 =?us-ascii?Q?eXYFnq/4BYpOuzVQCRShV29zOXJdOgFBdpfJ3qmkELI+IcVlFUXLZnr8xT5q?=
 =?us-ascii?Q?73UriSLd7wWmzp2v+pYUVMY85cNE++hislvY6Bv1MeVp29sKdbEHylgBN/tt?=
 =?us-ascii?Q?09ewBSFdfVto5TfZTrZBwaB4vpKqAeBjGJwLYiQN6pjV7UIojRAmxNwEKrHt?=
 =?us-ascii?Q?rG/WpKwIacTGCVeHGJtMl/FozowbH9k6G9Vcb9qWkT015auiv9pzWMZhiWqM?=
 =?us-ascii?Q?QiCpHGcK0r4mgrlczOp9PJNvliXD6Vsa3domhYl61ncHu2mdt11OFI45dVde?=
 =?us-ascii?Q?fCnWScQn+ta1odEkUVInNsGsVyl1sx8FKz/+QB9+dEB0TDnJ1Tqd9L79TxXf?=
 =?us-ascii?Q?ExkoVLAfGDQk2oRsrmkLkW7jzpm0Ov5VX+Yw1gypYz0HWECaqxY12ymTzYa/?=
 =?us-ascii?Q?WD1og3pTlK13OANEjJY889nCMnUHKfwV1MMXvDoxwVL5MTVrHbFH2N/5EaLi?=
 =?us-ascii?Q?IqufXTKrporXQBTg97Q8BXgwvdPH7MIgkgBXP/HVbV1ioLz/skFWGTMtSh88?=
 =?us-ascii?Q?UiJ5oZ0dRm88sSuddBif74OPuyWj6Vw6LNCvAcwsUV3o4M/KNcxGYnHyv9+c?=
 =?us-ascii?Q?HqNB0EDvWuRKg8P/88xyYRGf1IAZReq3jvlsBq1VcILuy0ydS7kWBawcjFVe?=
 =?us-ascii?Q?3oPqJe2teWcSVnnDKF+3PdgOXWnj5luURD36yQMPH1OFD7xmVx+rqC0sK/bF?=
 =?us-ascii?Q?FRDLamjQI3CXvsHjv6A9lClCiqMjKwM5sF/pqcNR5GYaBDn1wTldDBsry0ft?=
 =?us-ascii?Q?6M9udmS+Ob7KkvzMByEhnEzY+PZ3GdqxyG3FG9v2OBsuE51GmYy5cFAEV+n3?=
 =?us-ascii?Q?/H3z6/VyYmgB9WujVZWEnd2jHiQ+yQvpIQN4ohAKPW8lT2j5Y4ryn/7+AM+p?=
 =?us-ascii?Q?z8m3Vt3MYWBj3FDQXcL9lvzTTNfZEesYFyLE7ernvDVaLbmsYz3g8zLniKOs?=
 =?us-ascii?Q?ECfY0kyeR7aBGlrRqon7VW6TC0vql30x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vKC0+xzaPLtyLQHquwpBD24Df3fKC9eIOKyfo1Qk8Kxk6SeTBkGFDh8DnT9O?=
 =?us-ascii?Q?w7kHtNlkqNBTxwqVE9Zg1ADubt6pt57NGUXXQCCYcfyjqn2uWIRa64TQB0zN?=
 =?us-ascii?Q?6t4vD0gYudZAreDrEj3ZS8gRqc+QqK6us5nEFZUzm0eVv20EvkQp8ly0kkKX?=
 =?us-ascii?Q?JLGEmFI2T5oE0qYS36ayZEANahrRUr+jvZcZqPR5I0zAdpAby4UNVfsXZiZf?=
 =?us-ascii?Q?V0c3rXzyE7X17o7HRpYFKt3hHhm18uIk9ToZQfJnkhEj8m9Po6IiR/rd0hcB?=
 =?us-ascii?Q?b3QoeYZL4YHzHLGZ7e6uhHrk5HaDJXwzx2+jo88h8ZerCDDAU/M9geHUaQPC?=
 =?us-ascii?Q?zq8OFgVlOqBpUAJGJefC19F+QPuoVJEJ5By2ilk24/1xsueC83bJYTVhakxc?=
 =?us-ascii?Q?1SaI6ZebNIFmB+/35QsSPthJhju3nMhjd+YutcHRD6zOHOXfxqOdT7lm5UwA?=
 =?us-ascii?Q?oJgSy+4kEWp475QeOn5Xs/E5p21lx6/Wkyi8LaLL3jzahXGnmpuGZZ3c4pAA?=
 =?us-ascii?Q?uqmQOCQquaexs19AC/tdgWQVqVchnGvTrOsM8FDx4l7PeK6c6cQfESWQihff?=
 =?us-ascii?Q?1Fwk3zWiav7sVm+CKoPbqJRK4vc8u/LnGq3gff1u7ueramJwwUcYqKsiylYB?=
 =?us-ascii?Q?A+3JHYjJ2/mdatKMYyq5ijvM51bS1Lezo+RYvC2cRp8U527uK4u4VyZV6o1k?=
 =?us-ascii?Q?uvdHUx4Z4KfMPaK0v+nnPQ6K/pQaWoAIO3wwRju0bEKDDBvmymc+uV2m/uqC?=
 =?us-ascii?Q?qjvc/A14wPK8/e4pEO04uKG/GLzUJnZBP83JVyn2oH3TfvQnznb2fTca52yq?=
 =?us-ascii?Q?sFxcenmISTgyN6ObNq3Bnshj/OHwGMyumkaEbY4TAhhHFWPcFDXlPaKtHJT7?=
 =?us-ascii?Q?mOSx83ozGQhfY+tTooDase4viq8Mq7N5hU2F+dVT7PGS/UongfeGgBnq5UwA?=
 =?us-ascii?Q?BnqqmDNy+LpAoX90RKNlHJFAZHT+TpVt/tph2EZtdfP7GCaGFnB2/GhTLGS4?=
 =?us-ascii?Q?03IdamOJpFKIOwdTOzYihoJEGImxx5Q8bHboLDbg0HjquVFr64w3mZvSNYNm?=
 =?us-ascii?Q?m5ivoG7MSykreDia3LDVtTkOKT0JRNckzHs9qwhpjx+m8MLRw4o4vpN3ZDQw?=
 =?us-ascii?Q?qWqwSICdrjfGpnafB+OtuuG95dSM1gALZtRgrRuwjAnPH88ShymcfZcWHs1Z?=
 =?us-ascii?Q?zV6N68aCP1a9mBxWDA0hG95Qrhcl5gmzCtTtGOTaX4RU/hWCRhlR4V47kY6U?=
 =?us-ascii?Q?9PFKr3CifutQd/o/kqlflI+gLlApWKt6032F7sfkTHKXoVKXjaz2nNvfsbz5?=
 =?us-ascii?Q?cqmDUB0RJRNJqgru6kbjVJkVDSnlfeAhNnDJPzn7il0ehInTMTJzYu7GfOHz?=
 =?us-ascii?Q?T8kQgd6VE7DORvZpTpBK+DuiqiQ2ft6hG08hrrr9R+/0g6IQFSMG7zcQ6noW?=
 =?us-ascii?Q?20mz2uMsOlsM1VD8fTewapXhZN2Cx2gOODX4OyhVpkPMA+cdFtz5crB6I7qs?=
 =?us-ascii?Q?srngLVU+5aUkssb2B8FaUfJIitBrIEtwVSqZajgUU9RUPdxxSlo7kP6T5JaC?=
 =?us-ascii?Q?hZwZEYOXKOK45R/23UA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcb2b4f-92a5-4663-62f3-08dd2e70f2ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 16:41:20.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnXU0iGZsV/4do9eyNsH6/52rEkCfIsTMYqUH1Y9x25nzuDdCS0OU6m1FwmVwejFdUMd6f4IT4GKnlytPzmamw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125

On Mon, Jan 06, 2025 at 03:21:42PM +0100, Ahmad Fatoum wrote:
> The imx8m-clock.yaml binding covers the clock controller inside all
> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
> support two operating modes: nominal and overdrive mode.
>
> While the overdrive mode allows for higher frequencies for many IPs,
> the nominal mode needs a lower SoC voltage, thereby reducing
> heat generation and power usage.
>
> As increasing clock rates beyond the maximum permitted by the supplied
> SoC voltage can lead to difficult to debug issues, device tree consumers
> would benefit from knowing what mode is active to enforce the clock rate
> limits that come with it.
>
> To facilitate this, extend the clock controller bindings with two mutually
> exclusive optional properties. Allowing for absence of both properties is
> needed, because there is no default suitable for all boards:
>
> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
> that are all achievable in nominal mode. For i.MX8MP, there are some
> rates only validated for overdrive mode.
>
> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
> may configure at runtime, so it has not been possible so far to infer from
> just the device tree what the mode is.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a814786a1fc7e559140fe58911990f71bb..a6ae5257ef531f3fa8506d515d202f5b7842c4fa 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,14 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>
> +  fsl,nominal-mode:
> +    description: Set if SoC is operated in nominal mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  fsl,overdrive-mode:
> +    description: Set if SoC is operated in overdrive mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +

why need two flags? suppose "not set fsl,overdrive-mode" is equal to
fsl,nominal-mode

Frank

>  required:
>    - compatible
>    - reg
> @@ -95,6 +103,12 @@ allOf:
>              - const: clk_ext2
>              - const: clk_ext3
>              - const: clk_ext4
> +  - if:
> +      required:
> +        - fsl,overdrive-mode
> +    then:
> +      properties:
> +        fsl,nominal-mode: false
>
>  additionalProperties: false
>
>
> --
> 2.39.5
>
