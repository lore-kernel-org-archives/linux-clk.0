Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C513CCFB2;
	Wed, 11 Mar 2026 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242319; cv=fail; b=qkCQ3LA+IPhakgn42xrPehe4sxnGC4jW/eeZ9P4bbVR905CSu6cn0dojSMlf8TiUiTBedj/wyGgZSXv6X54FxM+3U21ahTgZ8TPoxxKeyiYeoaho/EpKd5bC9AFCYd28frKU+SSk0ApL7g/pD8j8f3gJovDMR6q4j1KSXn8KBCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242319; c=relaxed/simple;
	bh=1cN9tT/hVE7lRS+inR5y+r3E8FJFqeKSDSvSMUOtIg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N9PuwOJVzJy/yI+gRT+bkUMUcIWhz78aHQbo3lYYzud/G3n8xiMAdD7+xKxCIMms9Z0v5+i9MFl8KiDp23UXEeyjcews4lD770/1+cjFOusuFxkr82PVzA3xNVudujIWACKcQCrdeOxQ4WDdsJCEGZqqZ+FHRfxjS+OidHY/Q0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lddbrw22; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lddbrw22"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgGLwzUG3QSXUhiUk3TN+qjkHGu4hFgkzut5Do2/DMtMZ5edRbGXUXq0Sa1RXRLPJG1XZS+I20YwKa4baliTQ2YXLvuFGE32OeLdbKYmtB7nGvqny+IJm/JP9CWmGgyaF9XJLN0B1Fb0zDTt9a/kUYo2Q5KKOPrfRdW8Ipb2PD2iPNwyVpA6qpjqGc3u88tt+x6DzkCja7TAd92PJmxStyl7/g7pnS5476mxRc8y7vNipa/3qpXY6/0nA6ozThNfO3cyFtlNYRLIN1aR5pwxJ/LOlmHg5hk+2g3UJ5qBxVCZOsd5xktYJOpCLSAWkVIUAcSYwFnwS7cie+RnS7hocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/ZEzSO5jKdND9QB/vNLbsNUjY5W/s1PRjiFVGsgnk8=;
 b=k9eEfn2EgQiaNvR+x7LIqan6NMpkASdxK3e7ozQhNLI9QbQ0TFZmU5IXTg74AIelhqhTY6ykw9PwiPm+QZ605DcEhdCqG1ipwJG0EDQP9FSb6rJmiePqU/BuXfm3Cr4EyyUKmPk20yYnBrDVRBCbAhI/W3MWJBFKa/8fN9znYmX4UVhFarFeQsjpKVs7DUkGNht05qaxh0O7KSu9ZvG4UHO3vW1vtBDnY8HBdhAxuDSkTg1bAr8P/6YmUAvvxRsXxfYllcdSxwfsWcrjVQTG6dafEMLpgBawUe4VU+dYDofas+jRD+NP/rEJ/vgY7dkYlneWSNqo5o6zGTm3tXKTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/ZEzSO5jKdND9QB/vNLbsNUjY5W/s1PRjiFVGsgnk8=;
 b=Lddbrw227NjiyzbWLuoLXOYboBLxpikcUUoephm0A35c7SruMS3LlIt4Xc2LHtxIoCRG2eMD6VygLGYgMufZMSHnvGjeces/RU4j19jU/uQVGAnrVEMFjawPuf7kG2rHZ21AANi7ytWKziXjovTwBQXGVgjDtOGYYetYFqRsiMaOQF/8NNw0HWrmuw3KjCvj9963YGHzviiWSb1oNB9skzLqtConVP4cyUi/G55kTI1zq5RTmeY+/0Zw3cLYauFmshSUbXL76EWpkKu8e1kuqRf1rkxhnGu7XstFDw4D7lSMfwnPVQ3urw+Ey4e+2xjeFU7JMKyTmWw40lmnxfvJFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8614.eurprd04.prod.outlook.com (2603:10a6:10:2d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 15:18:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 15:18:34 +0000
Date: Wed, 11 Mar 2026 11:18:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: imx93-tqma9352-mba91xxca: Add parallel
 display overlay
Message-ID: <abGHwrcVjmg2iPik@lizhi-Precision-Tower-5810>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311143217.1700704-4-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 530c6892-d068-4293-6eb5-08de7f8175f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|376014|52116014|38350700014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	eR3+n7GKwkhSttq8LTwoXnNsyycEvWXQoKB2OwmYnXLq8RWM6nP4dmJnJ3JKpdEWrz9+SW954dTRT1FTk1yhX8P1/3B1jylYE5rhD+E/hZke+vKgd3xMdKt4h7rGNEohCp96Zu8s0Am0IDQhcBlVFLI31d+miTmG8e8WXSB326q7vixeOLWvroxjGnbzv0w6YYZgPSAFqaWA+J5n4Y23KIHsn9d1Pr6M12XAojGS7hrAwJzuMBVDK9TMOsQge0fFfr79Iw/Y1Kx7wGU5DfqUSH6rBEmHlq9iGyyvBiZ7gLCLwyZT/je9Yh8MYG7Pi+ccBo/PrUzuuSN+KlexTfpL8L5gpm1ykGUEghbILYNlP2yQMCXk8ZiyT4008ZMJglRcAOl28K6Q5vU2uKGcRvfmQ22xIISdUy4eae54bYi9kRF0UgUFf7V89e/JgK7+SeLBX6YK3IPql+UUEtRX10uf4c42a3xhJ0nJjOprwlaAndKPt2m/7p2p42dsJczHdj3fc4k/qPiRf5VRKXOwWyAbf5LTuVzdv/AftDhG+oV5JangqG6t+nEyxMIuePhN5y7dsOq6pmdr2wgCwAOW39S5v/xOea6cO6hMmEuSOb8iIQaz5fBIQm8YapDA/eY8o/PvdarKwXyYu2Rvrva9StXtIUqfFDLyOHZt83u+3pyWSufhKmM84HM1tZjio6AbrRIHKA7U9+X0Bs8p6Eno2YsZhJZvIbA1Hid7eyCKHdtH81wY7j09i/gsWI154qeFxL6U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A8Diqwp0sTSfM2AjSHvLUhKExeo0zunLxkzhXBwO/1P1yF7omAwkdL8HDEJ6?=
 =?us-ascii?Q?oeIYrA1cymxbZcutlp9akn9sATH84z1DDoskItxd2JOEI6jT2Q1J8LvVwous?=
 =?us-ascii?Q?wuFG7UJBs6lJJgFM0uk+HlSRzB0hCQK4xE5WT0vjDMyKQQvsBDYonkUsjwCh?=
 =?us-ascii?Q?lOucWyA6xFXyQ+SSXCN5KO4vyII7emLDjEtyzAR/YFHuLTWJ7tNElhPLqVKP?=
 =?us-ascii?Q?kZHVqO7+bRLbgzx1hbfW8EMmRb9Tui/W12wgdbdK5AkAO5nCoAYnN+WxVO6z?=
 =?us-ascii?Q?+Jap2+hRGdcmgfgtCl3Nz7/Zu0xbND3CJsoc1moFt1Oj8Mc8CywyLCZpZMAH?=
 =?us-ascii?Q?1grhZJ5xp6NLPsuZ3pmImPSnmoUAmVBxZsLj8Qa4zVSrGIKmwPWmGHr1PD9N?=
 =?us-ascii?Q?UUqJDKrrTx2UwoNInxJVWBBIXvepONZiRFXY8hMujPxB/tek7ofCsKaLIyWd?=
 =?us-ascii?Q?+PfZDXBc5TJhuazY105nk2a9fp+c70bJOYZMujNxVRXqzCNN1FqcDdsfZmEd?=
 =?us-ascii?Q?9lr0OyQeumq2iwlLC4/W9yObIxEQukfgQBYSvz+N45iPhIZDjYLaQH4CbC2T?=
 =?us-ascii?Q?aWH23ak8TXZ3pkupR1O4819B+KscsJqzxSmcggHypXR7clo1pN9indgl2Zys?=
 =?us-ascii?Q?PRQ1J3xCrtWqatCbYpy8icvvC9P7oCXU/dqvM83A29A9YV6HYAqkLMN4iXJs?=
 =?us-ascii?Q?ydfujypZo/KH/Py/CYFKMqW92g0PoqXejW/VB83QJfKTiilmpjiSagHH65IS?=
 =?us-ascii?Q?rzwFrCC/O8sJDz5Ka16yxqMzr3pYm+UdQIXuG2Njn7iCLbJJgpC+vEZyEmSd?=
 =?us-ascii?Q?Pt2qLnx9R3lJMS5H3hyE/6bmt0PTBFI2EtDjUPTNz3i1JpYqR+wod6snCK2D?=
 =?us-ascii?Q?p4WxKUYdCJNsM1ttDkzAjQH2DwxSuZGXBm6m3M4pcvGoPoRFq01KG1i78eyF?=
 =?us-ascii?Q?G58EsbAicE3jBIh8uMGmlhPj7OJrvj+hDCBJSqK77Rwp1d7zitW/Unoz8rvv?=
 =?us-ascii?Q?R2L5AbKowPwrRacBdX/C+fhslqLVPY84wodbahYvud5jyLCl8eXK26oG+8q3?=
 =?us-ascii?Q?htSfe2H/wpTSUGtXnmNSL6zHDJicFfxSZld4VYcXxfIG5yUxo0/DbQ9M7nHa?=
 =?us-ascii?Q?1oqKc04w8ggeQ34xAgw+wbf9BXQO/edOlf+wCm6krj6+KbmD6IWenunrKRR5?=
 =?us-ascii?Q?C/03MpYXX36q7mzn1zxRFZ40jGbgydnMiYb8baVpHXg/xJruzNOsiLEu307a?=
 =?us-ascii?Q?AkwjvovO21IuhY17COwOEjgnnuHkzO0anD/3dDm57DXbHrTNbJQ5FjybmFkk?=
 =?us-ascii?Q?V2bLsTpkXmNcQDUqorLP/xVqjV7mxkouxu0V+0RBkklN51u5cUg1AhyVGndS?=
 =?us-ascii?Q?jENFaKgNiVXvqoKsd9vtLPrBYVAswid3HXJhm6Liq+nN/J3nUFdGnh24Vw7N?=
 =?us-ascii?Q?JIc54YS/cSNdzjla3RPMoVyIsspQQ1GkMg9ak9grd3I8u0KB02aDGq8EKv+4?=
 =?us-ascii?Q?/W+bR843ax9kFVgSQ78LglKDBQ29TUzFZ8uT/YIOWSaZHK0C/Md1sZPiMLIb?=
 =?us-ascii?Q?sMWpQKGzG5QQnMa/g6FHmM9X7ZNlWmob/BNLOhpMUPVBB92NEJ+9VXRyZHBL?=
 =?us-ascii?Q?UB+a5BMON25PjkjQttdFODLCVJvbCFbzZ+eWVdv4L+TJoqnA97pfDwQOvQ2W?=
 =?us-ascii?Q?mK2uA84nRL/SvS3XsePndbCYA9DzC6+MNq5YlXr+ddjHOq4c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530c6892-d068-4293-6eb5-08de7f8175f0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:18:34.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXrVEO3QUDFm+YorP7OmKq0DBPDveL8UNjtncfCkwcuz5oXqsRx7NzOdoXbGJeX0flpCphIGx4ts7dqW3n4wOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8614

On Wed, Mar 11, 2026 at 03:32:06PM +0100, Alexander Stein wrote:
> This adds support for CDTech S070SWV29HG-DC44 display on parallel
> interface X3 on MBa91xxCA.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  ...93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso | 66 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a6fe56bb93aa1..3547f1dd84467 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -455,6 +455,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
> +
> +imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb

New file run https://github.com/lznuaa/dt-format to keep nice order

Frank
>
