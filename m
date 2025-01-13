Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F3240225;
	Mon, 13 Jan 2025 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783950; cv=fail; b=s4XKLG1tF99M1//LEiuMn3aVDjdSTi51JlYuchWrRLwC0tvl8M7UPQosrfvcgpinb6UawdIR9+mOt8ifN1LnFUd925Lt7XDFV9lB6XSF87+UtmGamIAskD48BQqkldiGqDBsCXab9pg1dfB/jLSGqSupaLzUWW4es+4B9v0H/X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783950; c=relaxed/simple;
	bh=UMVUZPqWitANuiR+Prlf9tgVdpgVtt2ax3xFOU0/zUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WYw0qqiGBfDdkUDNNJjPZmLXm9gdLpcA/CvKpcbxfVjpNTSqUCJvCOccawX6JeoZst2cmlQTjdSAYFiHAUzz5Bf7GSzCOzo9TJpkTfgUDL3OzPPyP1l2hHMboOEvHkp5oF1WP4vaoSrsoGY6oQKhkrVqhuWGQA/yOB1Pie4i4kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=USF+JZXP; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="USF+JZXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWvKGDvUo22K9c3xp5ASvUmggddEEsa/dXIRiXNCPl4ruTS8572COOtvULddYwk42GjaHhf/kCBVEHMrS2tJG1MY+bCdhrs56omsh6B/UdSghgx2DLAxqKBDz8W2yydW9lpCXFA5RNsP1EJbB//TNAGKx60B1Z6DVKVqjHLA0iwSZD8G35Srz6Q2vTvZA0gheeXp0Nzm+7ahpLur0vo+zhAexXUsEkucewSwQWBJ92WpBzxX1sNATCv6kCeHAyVki2G2olG8izluUnALoTw+Yyah23GanBQroqSughKRIVT0iqkZrIErMFL/pna++hVlUBe1DLPBg09Yck9qMm61PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nezMZxOhlW+0IoTf+yjMA8pi33Rj5p6vC7o1VNO9Do=;
 b=sfQkH0AwaZGE+29dK0i8U7zhX+qAgICveKCuSpQ9J3QLiLYAKG5IAI5dO8emDX72N8zdyLTzbqm8xBkpNiEzog1lULW7Uimpp6ODogviE7V/qF5o6L7OQe5yr2l5NLh8luf/0CaGACWJ/tSGsVLkuDPHXKWn6CLDWxwPIslAJ5yAhzcsPjcBSzgxbnL2jDN6QUbAB4QWrwJujEqvX9c250cEq4RVh/i4Jgss8D0VkMtgm6AorGdz7c0spKWg1mCq9tj21hBH5Z3MEsQBfaomgb3xeXcSwYSiINijwjZmxQT/zYc4pCqyvIDTYUcsdUsLdOVv1JIlGKKTdOexo/zzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nezMZxOhlW+0IoTf+yjMA8pi33Rj5p6vC7o1VNO9Do=;
 b=USF+JZXP87Sf66PMeWoGDbP6xhmePB6oXe0qf2LufSwQFSC22q/CPu37meN6LrmWVMoEc6H4I5NJWImiS4wLLfutMAGmNyWJMCKqFv1KzGHR69G7y20MB74k9dUnDbZ9fZMgC8BJVO+MeVrFH9ML1b2Q9baInjHidODV/jVwSTHEQHo7UFizmyY7XGB1SY/CPdvq6KpSFNDAnA7WVOKWXmd4XHL5BbneHx/l5hxMWNNzgdHOVShPL0o8cIPZslxImOTUst+A6MT6X6s5i1EDfaOfuNWS5HBaGbFOLgVfat/Z2ia3HZF0QnTNg4TlFAGsdnJqq7OrVM9QOZsADKb0IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:59:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 15:59:05 +0000
Date: Mon, 13 Jan 2025 10:58:48 -0500
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <Z4U4OElqJMeuF1tw@lizhi-Precision-Tower-5810>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
 <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 350e9688-f9b3-43aa-0f49-08dd33eb32e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2R70dhk8LeCs6XQ1odmK8Daoq3JK1ZnDCXD3kr84I1GUKc3toUiMTjY0NlTY?=
 =?us-ascii?Q?PAm6NlR7pU9GSstrt6kv8VRGFG/6DtrlBFn9zrls5rvjX/BPvVZK9OTEKxgh?=
 =?us-ascii?Q?T2GMyS9CNB5Z8Gn2lqtbVL14D1lNiOcxA4/nRP/FerPdr1PdG3HMpb1WqKuS?=
 =?us-ascii?Q?V9+8j4SrsfWcBhSy7zFQCooKFSh3j6HeiBKjL3NdFoMsH5X7zEeDO5U1qX8o?=
 =?us-ascii?Q?8FIQ1WYSILtuQIcK6y9HWHVX2XZfArkNxu1v1oT69609ixOMNEFUzlf2EOyW?=
 =?us-ascii?Q?J6wa0dMYqX5/BBsa/gs3lnfrI09PuP10sROd/PaIz6BuzSWMEbT14dxIqikQ?=
 =?us-ascii?Q?6NdzAtKZ9vaO80XFe7WwQiwlpb+gz6LA4eMfDv2jTlLQLuSUfr46ucPcGVgM?=
 =?us-ascii?Q?wg9CRDR1tIoaEgleOHMs4TAvMnT+7mDV/kTVpkPBaZYfusFEfRm5+NmjLIBB?=
 =?us-ascii?Q?Zhvmmmyq8o38ZPoT1QegXqU/JGcvbI395efOwwMrob5hiN3BfUJmpxVSlRaA?=
 =?us-ascii?Q?Gsb4tWPPMQ71PSxywaihGgLcKjvOgYs/SH94/3xPBHhP12dNOrCuSYhR1cb6?=
 =?us-ascii?Q?ZM95djKSGpgJfQR2UqeH6tqN8fMRup1y3B0DkGieIxCgPlPpBkWK4gJOOqys?=
 =?us-ascii?Q?SUUvLAuSasKZmy+JR5yF54FIjfpcp2Psgut2nvllz/BcBEfVcrd21Z7QIsQF?=
 =?us-ascii?Q?VXaI/HvoK9b0zN9asscuAu+Rt1iIJSKtQwSbz0e59yVsDZ/vwlm+XhfzRlTF?=
 =?us-ascii?Q?uN21Pk4RL8/Cq6TL0SKifPHDkTkM9LZrKguAJl1C2xhlVkpkxm4j5TG1U2aX?=
 =?us-ascii?Q?k3P2x47WWjSNtLdaEWaqblv6YFAnUfkmEvoNQ4PHd9X9wjCChES631z61lv4?=
 =?us-ascii?Q?NKg9CFw6xtxhwSyNyePUxowpYOKz67Co3mmJQPi6PuYbqDEqcMylgvvMEpRt?=
 =?us-ascii?Q?EratHUg61MYz7vyBfP9rRX3FAxJB6KDcDBlMJSPwz5YZg0vwRf7aLHtHB8+I?=
 =?us-ascii?Q?kFHsIa5IjOV8zSlcyQZJWtxSU09QnBtVR7xRk/7RKrle4OX1kKPnEVLqu03q?=
 =?us-ascii?Q?Ue+EnbX8FcwkvxRbxcik5B8kWoxkOnRhT7YdV+CnFk0+V4L/FNU5zslEFPjx?=
 =?us-ascii?Q?91+b/I6rLkAwDeGV59bgg5BNVES7jEKh5xWQj75qq7kCklMplxRtyF45zQAS?=
 =?us-ascii?Q?W/Sw6OqJ4gVenbhWrgowOOt7WD43rM9xuZYv3MdvLPh3T4HShVvWTBMjF9LH?=
 =?us-ascii?Q?MggzmcTtpSPohWEBO4tyHgkeLAugCj6RwDL1Iiu8A6Hkml430kHINKAMdWRv?=
 =?us-ascii?Q?a0SX2ObWH+sf2MqVaxI1wb2KU3NyH5ew5PXTaMtzHixbLpdm09gqPOz/y5Nh?=
 =?us-ascii?Q?sEWnAKQ7OgvuOxXlYdcYZ/2mxnupmyWkhoW2I/vmiHsGV+6JLxtqcNV1Jrjx?=
 =?us-ascii?Q?l5miLO+I8OfrwVAfJbhwqHu6z8kJzQkD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2hkaFQxtwlUJKzlIJNCGgHz6DCOP9iqqU7oOOJ4oVrIM93cknnu0fleZzn+F?=
 =?us-ascii?Q?CoBLspnVgLfZT673cL+X2LCixBmWth5RdIaDugAYF3qoYSJEVFaBIxb+Ffq5?=
 =?us-ascii?Q?1afBrlzYZN/b46jbZhfRxZgfwgDWspzj9+/rCVtyHsstyuMXMIPuTXElNpK5?=
 =?us-ascii?Q?JewgFQEmCkZD9hR81NcnsJ7vnOtBP19cpo79u6vmASqRendhEt4JWHGCd8jO?=
 =?us-ascii?Q?x3lH1cJWK4X/XSWnc44/NZalR/Ofq+l3p0Coyw1mspvQzanePaJEzs963MTW?=
 =?us-ascii?Q?+09nEp5EL3CNnkYjpfxwDTF+6wRDr97demcxfEPg3Hldj2cG7SiZbCj4NAUA?=
 =?us-ascii?Q?vkiH2CizZH7xS7/HxZIQBvVqISHman+tquwVdIcuim27npCot78uM9Mib/3c?=
 =?us-ascii?Q?ZmNIdVg3IKQ7s6k/eVkje7lpdHRlVi/moydeJmVgtnZTGp5Z4IsAB71wBbOC?=
 =?us-ascii?Q?+cElD5v4MivBbga/u/CqEKs6eZTJsOHa3+WN4oKAdnObx4hQz35a0huWsnTG?=
 =?us-ascii?Q?tV6EZ5mAAEte22dnTslwWZIyhdtBkxXx1APfxrovkba6vQUYojOOR3YdIr52?=
 =?us-ascii?Q?yyngRsczkUPi1Q2w7WSEGJtzdgBv6K25+iUxHDqxhyN7wS9V0zjMU+bIjuPr?=
 =?us-ascii?Q?5sl1ITRGlQtPpxeQPTeZJ8hiM3+scxpMamD7FGy/dMePicCRQjSMWe0vhrKN?=
 =?us-ascii?Q?g9WeP0FJIr8FXPHZg4ePVa4HIIwjqD7HocGPk0U37gHGag7Q5HcsLIRycN94?=
 =?us-ascii?Q?/rpeMbaEmmXJfirno5flx9QCaKDGXZzrOQcZQFW7b5A4eUKmAoNWQX33r8xF?=
 =?us-ascii?Q?xExTG3bU3LEaHSpqpeEIKQZIuMRt3IQulRWVIWVhyCimukP8/ZJoQiwDwD5P?=
 =?us-ascii?Q?ibGsFxOOtg7jUMOsUzZd/HUwdRTsxml57f8sQJRhpMxr2Ap+nga6GuKZhc/Y?=
 =?us-ascii?Q?diui079FbZEb4vsCU+PUTryU6VLd+S4YDcHj7ikB7aLtUM54tsdWE3/oOZjC?=
 =?us-ascii?Q?wg0JYI5xR2pcGwiUVl5buXYUli5AO5xvwC4D4aY/gu4yZCq6U7WXF2wOz0mq?=
 =?us-ascii?Q?Z+RMbe0+PPqIIk7ZRRq3UacmcAOsOWYu8LwcXYsIjkR8SQoKfucJdz+x2v3G?=
 =?us-ascii?Q?0QBGkvz+pVwhvz46JerIlw6b2BSTxg9i7RL2zY550UahyYl0Dv2OatTpqOfk?=
 =?us-ascii?Q?rqxI6VMDAl8G0V2rBa1DkLrazwKx79I/qhKcQ5YBtk31R8v8sz89ETHm3JNH?=
 =?us-ascii?Q?HK14B3PLkZbKMSvf+6MU7XVKAiB1cO5zLE+SsTR0s5szQ92Vsy12Gsv2K1NW?=
 =?us-ascii?Q?gUVJUbVHwSLZsWrl5jlwMOy3P77UfK6RZ7lja8nqPFo/2ou6HG2QwRHvfqSg?=
 =?us-ascii?Q?LkhdYguPDgHVj6WZmseHzRZ0zIAxcgoSsvwbIEBVBeKLfGZ8xwgf2XtIsAjA?=
 =?us-ascii?Q?Ljut+PEAG0H7YQXcwuOsRa/KWsdIlS43GQixCWOHFBOR3H+dIdJA30HfE+UQ?=
 =?us-ascii?Q?24RT2Ybtz9kiDTLcCPAZsKFMkj68cimG7FljJ6fhwyqZtd0iPxJNbJNV+ncd?=
 =?us-ascii?Q?DjR7xPknuMTRiwdYRBAy8l2TRUdDl5xYODUZfQ/W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350e9688-f9b3-43aa-0f49-08dd33eb32e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:59:03.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgMMztxif4ulEDP1S9LwTlI6QzCl1p4XCTFrb/Nm62ug9kv3kFUTZ5cBSsvvzRCU4VaQlZlCMlbz3IYeYfsUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

On Mon, Jan 13, 2025 at 02:42:51PM +0100, Ahmad Fatoum wrote:
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
> To facilitate this, extend the clock controller bindings with an
> optional fsl,operating-mode property. This intentionally allows the
> absence of the property, because there is no default suitable for all
> boards:
>
> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
> that are all achievable in nominal mode. For i.MX8MP, there are some
> rates only validated for overdrive mode.
>
> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
> may configure at runtime, so it has not been possible so far to infer from
> just the device tree what the mode is.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a814786a1fc7e559140fe58911990f71bb..b03672255cae9462013a8a4e7a2adaff440f1420 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,16 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>
> +  fsl,operating-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The operating mode of the SoC. This affects the maximum clock rates that
> +      can safely be configured by the clock controller.
> +    oneOf:
> +      - enum:
> +          - nominal
> +          - overdrive

I remember

fsl,operating-mode:
  enum: [nominal, overdrive]

should work without oneOf

Frank


> +
>  required:
>    - compatible
>    - reg
> @@ -109,6 +119,7 @@ examples:
>                   <&clk_ext3>, <&clk_ext4>;
>          clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
>                        "clk_ext3", "clk_ext4";
> +        fsl,operating-mode = "nominal";
>      };
>
>    - |
>
> --
> 2.39.5
>
