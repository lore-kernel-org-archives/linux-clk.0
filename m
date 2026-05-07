Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8113B7B8E;
	Thu,  7 May 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171694; cv=fail; b=NxoDf/jJCR9VMoIxbu8AGYAyrVAlBZ24XJI6cK018DQV6tU3ZTOx/uH0aXuNNz26NXTip9p3UAJn1/Or2AkOKpBao0mKRzksHJScN89uObDe+NpnhiR2HrU0Li6QkPg/kdNBlutDMqsCEzgVVgik0hNwgOyKpegtm80UMcLhb4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171694; c=relaxed/simple;
	bh=GT6EAQCC5JfPgKbzoLkB1NjFhTyEOLFglHxEpPCpwSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VhE9J1AkDU1rUGdEd1qEq7wNCtWFmfRRDjWfY7o59oaYS0obnEQB2PrgBwrO8eHoD1YZqV2VXuEaBgU4LLxBT5R3gHjkuvmpL7ewl/kjCLYeKyHeUxU/7JjELhxSWdwzeWv/x4YjvbUJqFnbeCzRLiKcdmTV85CVUCx3EdrbVp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iO4GoLI6; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iO4GoLI6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAQ0IIb0J4TE5KkLzK67FltSS8gjxEu0mj1Eto6YgKR/JerdYwr1fZrav5J2HvSerN2u5XdQllnJ7tBTwxfgEHieiFQQqUXx1Gnzlx17KMGrugKc22675LuyKGiTW8U5OF7KKtmngufGHlV1/I6tio97IljzoUoWqVrNPEdh3CqbxDmirHYjyx3cqMmflTSElMNwwVZS0S7pAOi7xbu8ED7MamYphvaukof4lmZ9dc1er86/sA8KaXEwjtH4DbaACx7X3ZdRleVKpTCS/40X84hNHmfRZX+gh3QT1vj6IXPBr2Wmo1LkqTSkAf6W+Egzug0PkIrDaHldRdPuiLTNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvcODc+nSx0zqZSg/UB84oN8VGt7eWDL+eBZlwTU2ig=;
 b=oCWDGXA59ie3ifvCy04jFt6/yxgwWj/0dFHnsmqmmIyjx7Xtmm1AhJS8Y3tBMbX9Ees9WTfHW3IBlkQ3bupl8U488s3YUqLwge+Vr4Vzl3hgjxB68CqFDU1dMG4mt6Ca3GhjFIq1ewXR8TMPUixAG71w6Skc3m5vSiPEL8MYQOimb/38rROcnXToFEgaOceFXD7lRUT/+WbX8oEcj9mAP0BsvvCYxxREVbYYnzLJAMMv84SeI1jk3uW9xTtshiXoU1acR9FqhbhfVG7koGB+suj8FWT9tJyQO1WknVaa99kqJDQheB6amStunf928xyxCHO0aqptxcwquB/+ORlW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvcODc+nSx0zqZSg/UB84oN8VGt7eWDL+eBZlwTU2ig=;
 b=iO4GoLI61ZZqWQ2d3qq3bt2DkTBKqimi+meMAEMUU0UULiPxqgkGcgSF6stiLkVu7Pz0ZKWorDDxprSjL4UzuJ5k+5NqROXWq5MTC7CAj6tNSSYUCkMtSljxNbJWq0i7zciHIGujzSTAXFbTIrkyCfocgkLgRcCrEjsU/REeg6N2fCyb1CvbyGAmozr1d3pKhX9tXiZ9ly3to6MaH9CO18119tCBbaw2+orZ5eBgHUe5vXAcmq0n2+qcwC3JFnFATIpxsmKGmEhz3KIJ4CDh+SgrtyMsK6YFH9TZZPZlQJG2h7zdYfbMonReDP/6XS5e0iuQRIWKHj/xvLUC1jdaQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA3PR04MB11227.eurprd04.prod.outlook.com (2603:10a6:102:4ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:34:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 16:34:45 +0000
Date: Thu, 7 May 2026 12:34:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	mturquette@baylibre.com, sboyd@kernel.org, tytso@mit.edu,
	aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
	romain.sioen@microchip.com, durai.manickamkr@microchip.com,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <afy_HKxmq2HUFI3b@lizhi-Precision-Tower-5810>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507084805.481737-2-manikandan.m@microchip.com>
X-ClientProxiedBy: PH0PR07CA0117.namprd07.prod.outlook.com
 (2603:10b6:510:4::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA3PR04MB11227:EE_
X-MS-Office365-Filtering-Correlation-Id: 447f23aa-0196-47b5-7b34-08deac568c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|52116014|366016|38350700014|3023799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9paEVfu6NuBDgNiFS9CXuWj5DNsLgA29WZYkvyq6qXaZykKJrZxh/OQ67VhQ5sqsVNipYeztl9lX79hq7mAfAzJvyG8tY99gbj0XZrLFQndKUvVQ4nxpQ2PcEyGfXfuh1vW1BlZmg2lZmyo1Dwvt8pcCA2oSptUO3vh4+E3tsF+IbxGos26EsUKJAhRWNpKj8zrdNYSioRQ7iYb3TxKh6iNpLIjn7E1LbpVQh+s9U9Oll++48S0d/flbZeFrs2/Eu4dqrFQwLreKpEx2td2gmWe0GxUF2W799uDLfeSt2ZeJIvUMqNHstT+Kq7hHvsUqBooozxLgIjmct/FD2dJRpCe7M+J6Avr4W76CNGtzIzp9H8avCawJZC6zd2HSvU1H3F1cTPOHKuyTj5JJU+iaA2KhIOAuI0di1BTPL68feDLOBMnqAkbQFGbHcjz6cZKtPO+1dqU2z7n6VKYc43NW77UiIQ5+/yxssDIm6kg00gVBcQMXUz0TYTg3oWNaZI3ILqP1F7AwEsMEPqy98iudGONye1/HZmL18Au5U7vLnG7+trLd8zXWO1P6GPyGPJVXQ4B/bOxwAodgjs9+KqOonThUKvT0jxtUn5eLXvmCyfvezspKL1aXCCPblHejOyDAh+XUScU8yjfy+qa8AbK4eEFLxE7HMWqZAMh7aVBUIPw8TE1va4x1hhvW1RS+AShBTe2mgq4hX4QZ95ZA7THeK2c4KXRFTO5GGb3dfLDW8itRe2LbdyMutWWglEjanQXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(52116014)(366016)(38350700014)(3023799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X84Tef9t74ALcTYiFN2cNYMkpfZqBiQp8IusDaqsYN7S9P9qTXivfPoboXev?=
 =?us-ascii?Q?w2Ts4KiRf5xXSt8iD5275JyyI9QdlibWD0wAJmcYkAfmS2y4DQ7dLiz4Lukj?=
 =?us-ascii?Q?DYRFfA13egeBeIUH70aAKd2Tjy4joH5+qoNSteL2d48kVoN/otdH8zLNZ3af?=
 =?us-ascii?Q?xLN4vCeJiZxp2PmjbHAN7/HIyYPtgHta3ZITphgun4ZjeTlmjxBwLVP/ZJGJ?=
 =?us-ascii?Q?dg4Ebu3CUoFg3d6JTt5cH+HsbxC6hiBdcga8BUnQNuKTsgjk4ZATJ6WlcRok?=
 =?us-ascii?Q?gfhEndD4U291vkjX3Tjzhx3emwE701EZUiibeATgx/iyhr2j3SC0ErRykeAt?=
 =?us-ascii?Q?SwEDA5R1+Di+V6VNvKEFtjqiWs+tv8YwM6vAQXPInlbFJI+tprZWeDIz47pg?=
 =?us-ascii?Q?RUOQZoZbLmf4CrrSf3SdhzAvfrWqyc9ZXgWCnpAIIDgtPjUSJ7qLjpwRjSU+?=
 =?us-ascii?Q?uLRiResXdiuYkHp+5h3IBVLf0CL/G6/ILDE2lfhrW65kOtS0FEwwDwDeT4dY?=
 =?us-ascii?Q?lzhMFI/ZQBunfIJ9XgmF3qfDpGabCM3SQvfzZhXBpdruR+BTZluYxpxAPmAi?=
 =?us-ascii?Q?OSNHkY5vO98tBJlDcr9+MvJnV5F/T3NJwgCID+KWSWBLa8Gzq0eYlDVc2a9I?=
 =?us-ascii?Q?k9VwA4MXXf855BxI9OlD/GLPRnU8AyOkHVOjQDjnGYe0nenBVS/TT2fJanxZ?=
 =?us-ascii?Q?75x7FAz53l4qWqQ6Nu0eIqpDM39u4klO487ggpcobqCDMCEHwgzYU8Jqk9Ql?=
 =?us-ascii?Q?UG4+HpYCDnU45DXvD52Fnk+shk9WhU10lhHF43AyQauxYToAcWoTlK/qeWm6?=
 =?us-ascii?Q?lYfvs86Ulx0jtkTRhKfsEZoaGnZ1dQqa9SF4LuDe47A4NhDyby/w8NnWqgT9?=
 =?us-ascii?Q?9HUXwli4EJr4SW+m5JmHvLL/7sdbRwWBCbNWxMz6MKva60RItJze8EOaXMds?=
 =?us-ascii?Q?ta6oTcYV/+u2oIxTwD253V23Q3zd00IvbZ3X4BSvjm/KiVUM0ioXCvPBqlO5?=
 =?us-ascii?Q?UrtGA1qJUcelfZdxXrPYuMiA5TerMQ9kyk2BzkW4Mth88bAIXIHnMZ8yfcn4?=
 =?us-ascii?Q?mnx8dtHF0pd1rVujfBtT+o8n2qDly5eNXNLksjOyUSTPThcmJaWul3xq1UrV?=
 =?us-ascii?Q?ucBzsWHR15jv63SLdmQuUB+oa9xBwiIq3z/KnGn+57x+cwBwNn5FZuC3m2Kr?=
 =?us-ascii?Q?YHyX5p3kqMYPxAkzuXtFXDs1mhQubeyyX9ZufH4RKfnOBQ3P6/6c87GMcw+s?=
 =?us-ascii?Q?hJ4Fd5uRm6TtvOv2uYIvlHVkkwfyxi0KEFsxm1Q2RzPuvhVanEcdqJkC8bjP?=
 =?us-ascii?Q?8ncfoBp8V8tHrcp2LfIN5eQn+0Ei23WdV1MHtEXY0RdN6KSltHQlGwSp0nBD?=
 =?us-ascii?Q?c40aUnYKpAH/3adAzoXW2X3JPF5tXED2Bt43pYx5Bzx70dml/8pyBKkIrbP5?=
 =?us-ascii?Q?1LUsfz+yQ09GN9KmpJ9SiLtc48gKJtNP/FVoWpibMxPYWeNcdDv5T+PL09Y4?=
 =?us-ascii?Q?Hc2ROE8jobATSgDuubvN0PQpOai0Lwr0uW3T/tMzHj8xNohOgVUSdYRPuuPb?=
 =?us-ascii?Q?ADaWQV9ny2OmendT6UCiMdx0+l+6PnYJJh09Ot6wAeVJ6glrNfRZOt/PY7PL?=
 =?us-ascii?Q?6BsrJGNmP2q3lQW1Bh13qsxAqR2KnR/tFARLIpQZOcneGrgT/i9YMEBNbElO?=
 =?us-ascii?Q?ClrRCc785DTBrKf0WJ0IGAtE/i5N5DAoH+9pFaQU1RElHEHk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447f23aa-0196-47b5-7b34-08deac568c53
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:34:45.6429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvuK3d08g8AowhD4uVTnxvAThnZDyRspiXuwOG46eecJh8zUrH2QW+oogFZvxESrMPILo0tNT33jbPeJyNKJGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11227

On Thu, May 07, 2026 at 02:18:01PM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v5:
> - drop min/maxItems around clock
> - use else clause
> - cosmetic fixes
>
> Changes in v4:
> - Define and describe the clock in the top-level properties
>
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> index 39bb1a1784c9..d488fb420945 100644
> --- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -9,9 +9,6 @@ title: MIPI I3C HCI
>  maintainers:
>    - Nicolas Pitre <npitre@baylibre.com>
>
> -allOf:
> -  - $ref: /schemas/i3c/i3c.yaml#
> -
>  description: |
>    MIPI I3C Host Controller Interface
>
> @@ -28,9 +25,17 @@ description: |
>
>  properties:
>    compatible:
> -    const: mipi-i3c-hci
> +    enum:
> +      - mipi-i3c-hci
> +      - microchip,sama7d65-i3c-hci
>    reg:
>      maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral bus clock
> +      - description: System Generic clock
> +
>    interrupts:
>      maxItems: 1
>
> @@ -39,6 +44,20 @@ required:
>    - reg
>    - interrupts
>
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sama7d65-i3c-hci
> +    then:
> +      required:
> +        - clocks
> +    else:
> +      properties:
> +        clocks: false
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.25.1
>
