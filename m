Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D927FD6E;
	Mon,  5 Jan 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767642629; cv=fail; b=SrCj84CyH8LQ6pnmro5KwLFp8ty/RN10rNwensPD0jScQAqF2es5Q3+mANdtzwCD8YgHvLGlpDTutROKfy6J0B24wX/pWrI0GvBmXYQGBNadpiOxaxDGZqzoRWABQHknGtAEm4r7ixpDfr4HTWIUq/0ElXS/4WsYcJDriecD7+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767642629; c=relaxed/simple;
	bh=FrTUwJ7f0TcOHXC5/fr0TuWwbHPDKuMCbexTm2LEiY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dXC6AFDJNeGdDg+qJsyElziM0YbyvcgDLPgjJ31W/DaFPG7TF7xgasSInKHB6M4fNSq9U8ZWFLKBo5iCL/kRdZCWE4SCDKyXP9KiyIe94WoBWQP8pNK6fmLrdQCFWNy/N/gfs4/VwE92HsRDJOtCp3HkBbQrFYQ4FdZg2pSZ2WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xo/thV7r; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xo/thV7r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRBa9RrCOTilnPpCsFvo4kBNoBDcf5MeQbp8WCv6rjIE8IhBVYWcQv0eeeVgDK1ykICNoHD2eZZdZFROVr2ruF/PGOkCu2HTMllnfyRHbNtJd6wuv21iDrvWQcQPwpNOazkUg7xZG03xqnCXy1shEj4Vzl6fGNeTGeHDqeBVOA7KuGZwYtPoh95vANhOLJX1hNfssVScCcxvlNSg1ShVPhK1XG4q/lbevOnwTBgOUjtWfFTaYThCivveSRyCSsVeeHgrGZ/tYoXBHcWMKn748YRnQEGILJy4JMac2NuLryCdgU5PI0y89B/qw6SDMfqU2O4HVOd78YuShqm71juShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfXcgVxntrPWw0v5WsfEWe6mWx25j+Gm7VnG0sDtYLA=;
 b=qd9RwMmwHxkYBdUEAGfN+9X6dQ5LmZ9uZszYojndVcln/E1ynAAGpP9rPP4IRN/D8ui3PP0QlPtmJPmy4Dh/EAI1uoQJoSaxMB3mq6/bMKQOKcBYP+im5fr6rT9EGIxYj7KUGrD6EOoO/IzWbNOKE3W/F/XZIKzpa8Kcpmge4UgigVzUhyecn5OLUq0it3WBfukpZtX1p3Bm8X4+/ldw7qpR7n97VD7SkZmJJyzWunzvdYMY7DTJSrjJjkbQUbvUhsdWr+it798ViF4A9m3pT6T6YCGP2o2EMf1EB3dZ6nCROa5nde7HfrIIJ269AdZe+Vdq5+LxVpIz/Athn04PAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfXcgVxntrPWw0v5WsfEWe6mWx25j+Gm7VnG0sDtYLA=;
 b=Xo/thV7rWOJb/hnLsKdeM7uU1DNh3x/niCCqVl84CFW3jahtcb0FYfRemdE3DdxsJ3XspbCPKYqxGJ7c7C3mpiArtLUSxVtNzJlMyfMUQ46z5pWQjbAgGCdz1R/djHI8q//tuGPGAHH1idLjitD3oExZJyalhE6G/zKWABP1dxfZcUGKJ12xdu/a6KNLo5tTct67Ik54CP9xLKKtVmg0rtHiEDT2VklFIiUCi4FrVw51fU+9Dax9/zISdMsj08jEczAeeBqTxhSrctnYvKm0jsabRI7LrIpQ9HL6cO6/rfhYZSYNxdLYuIZi9YAX7+LSJFczSagvqG1hkXrSH/XwSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by FRWPR04MB11222.eurprd04.prod.outlook.com (2603:10a6:d10:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Mon, 5 Jan
 2026 19:50:21 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:50:21 +0000
Date: Mon, 5 Jan 2026 14:50:11 -0500
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
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|FRWPR04MB11222:EE_
X-MS-Office365-Filtering-Correlation-Id: 6207aaaa-f2f4-4a97-4287-08de4c93a8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?47ZreI8lZjqmoYyrizmuK1BEAzWepIN/1p6nE1ZYg4BBSjsFNSAXXgbGprqO?=
 =?us-ascii?Q?gt6MF6hFFIRkltCsQ/fMlRP6wThhhBmkRFPlBQnzVz2I0xQo19zaMsJfbbBu?=
 =?us-ascii?Q?n9O35q4+lsQctOhLo7FUoTc5RoCGSflAbezIOhZva/ssMqtRv9DPBDx+NF+9?=
 =?us-ascii?Q?Dn2taAbfTlDE3ksXImGJCz3fO8ozCTD2YnHGS6fFUGQ541LtxLVWZzUahSM1?=
 =?us-ascii?Q?frOKSzcZgcZnhCZA9RGjI1BEHtEAZJIV9pRVotPY/BcST/x0F+0cNIYZO952?=
 =?us-ascii?Q?vYih/Z4kBvCmMWgKIIxqUckguHC1G1USqkblMWRVfkxxTDJ16qZmojcItc/D?=
 =?us-ascii?Q?srS9czNRShicFxjr27BrDjBtVCHz72JT6ZieAT3okgb1siNifyI4hR0CNhWT?=
 =?us-ascii?Q?scatrZjNQMDubPznrwE0ZMtPTFaNX0fjCcwyp+t/VHzWEaNaPdhnu7sbxOKh?=
 =?us-ascii?Q?HHZVkLm0sQSPndB92QxCIfK9Ex6/OmfJc6AVf1qsU2occV7GCw9Jvn55NAbW?=
 =?us-ascii?Q?Shlr/1QNFCBsrb//USOZ83/jokUCxfKDeF13mo6dloCE6uk9JGSZ2oSdL4sb?=
 =?us-ascii?Q?m2BrEeVnJWNE58THTsylqGXwR46y00GGS7PIPwqaJbaXqwsC9EBPdV4S1Nax?=
 =?us-ascii?Q?pGrDNC5me+KNOtWTarIGuHs3UlOaqTI4ySg9+GWhLuPb5NPSAM7/NhWAxrRe?=
 =?us-ascii?Q?TJEbyKIcoLuDumLXHQ+pnWDDT8Ozsg/4jJ6Z9LrXMfkGvDMBhJEQpDwjk4vb?=
 =?us-ascii?Q?TGyagNm5NHMiCJsKArrGpHnsovkOQsX6uUn4EdhqFaXayStpjT/zmgOkPtsO?=
 =?us-ascii?Q?pIis9UT9r+pzC36nXvuC0flYJRcoMCb9ajlQJ4r/zR/J+wglhAsAdN77uRDm?=
 =?us-ascii?Q?jHrKirhS21yNi1yuHhJl26ApCw/b8fMERVaLeEyYmzb+G/ttY2G4KGlBkpxB?=
 =?us-ascii?Q?X/bvD/iH0kWQU8g1q9IGy+V1EMOAV5cfFu1P8j1EsxK82PDKzLxMBWyBw0sc?=
 =?us-ascii?Q?8WyGTSQ6XFzh0zq4LxnpusjHWpquuE1Cpz7R2PRSMqGGSV7OOObBsLXqNQyj?=
 =?us-ascii?Q?L1/8UeiMuZfasg8xC2xMghqm0OIsxdy5kURMHyLVfnV/yHPf9G5mH64UZDQ0?=
 =?us-ascii?Q?RiBt0XJm8ZdzTOwqwgIb71xmetNASvLk9KPqrSUQIlLy9XJTk1N6J3ySsaSL?=
 =?us-ascii?Q?6NtbMdC3NdHF33NoYMZC+GMFzGbUePQxNUV0qvDeVa5z1iogZQv+7KbovGS0?=
 =?us-ascii?Q?k63KFSAALFlZDn+1PvYfTRPmgC4o6uE4djhNuVAI9wn0NtGZ9G1S6o2BPn/3?=
 =?us-ascii?Q?bDwrNlBPXNoM8624s41+e9c+IvjiQGLhYWvB9IZ7lz/aPk6PBaU2aAKFTPpc?=
 =?us-ascii?Q?kwD+5wxGgYHiJwvQuBZz4i7NLPFgrtnAb/R2irm+dCcCLXSY2hzp5uVlIvDh?=
 =?us-ascii?Q?ylnelJ7FkPQRyix7/zGBLZv0QtrZIsfRDV3Ijx9+fuTRRviINJSn4TbF0bY4?=
 =?us-ascii?Q?ObwcFZ7kUxNJf31qNfssHVoUXeRHvhsNDdO/lpBycSwUnFCsRq+Yf+y3VA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?78JzZ1WEquj/0hhwuLKFwhSrJPFA1dqhp7kPORZMZu4t7SUsCvpGW3w/uQr7?=
 =?us-ascii?Q?dBFUfz5ZpNI1vMLJQYsEDnRBa8we7/81bW7Pfp4WeJxIORpV0qbncquBmHnZ?=
 =?us-ascii?Q?2j3u7874qJYeCc6LaUflx9rYWZOy1dPCZgWxysDpz87dO/hMrt1wIt6nlimi?=
 =?us-ascii?Q?vinUT5S8OR+rK+9I4kz4Sx+Hk/BmND36bsCKoYD7AQ52iVgMbUHZX9+1HfP9?=
 =?us-ascii?Q?G+xcd4oTfPooOHSEIoJv1JLBzVsGYIb2rv9j2ksF+4xOnW4pN36vND3XLbsh?=
 =?us-ascii?Q?RIjfzu/a1ge6DtoOe96eAspemMYyHgQwgeoQNSEV/78Fjowz792ExXUSiC9C?=
 =?us-ascii?Q?Y37q7WCT/kEPCORBXMS6GDjLKyE/DQcEbwfQnaG7B1enMJHZRlxwefM5WUUS?=
 =?us-ascii?Q?DvlCgmw5UB+FKqvcf2aQgmHYD0gsW8gftrl7/Jupv0vz8QjmM5w6sIIlyrxJ?=
 =?us-ascii?Q?A2ingjVOmgSR2Rxmp1pGQnNmngW9LlnDoiGP/cbqB0in2WfBL210YuAbMHCr?=
 =?us-ascii?Q?yrE9xZVXkMhbq+CxbhpbGs4dzSSKeLLi/MX1fUfctGHkR405kdaevUHpRBmp?=
 =?us-ascii?Q?QManinYABepSQb63vtG8wAei2OwZEymcfZmFl448ieDUE+0Fd9zRyoN8BhmL?=
 =?us-ascii?Q?zrXQ2dUSgGbQLRi9TXPPh4SW1lXLsnsF59ifgpuL4hVounQIkk/Md9PKDpBc?=
 =?us-ascii?Q?MlPFI2Ze1gybvb9IvzvxjSMuKHyy0sWFXBEoCkvSUb3Z3xWmUTY1t7XUNZoJ?=
 =?us-ascii?Q?LAsdtT53RV458sQRSMPw7/wTDM0u2/ft3i946pHjl8ROyoxTKa4OhpGeuYFq?=
 =?us-ascii?Q?wBs3RHytGIBbhzHQ+AcBzjclxtrFayda4dre/ex0/8FkLCiDdd9bLIhGYRMw?=
 =?us-ascii?Q?CA6q5ivEW2+AQE+g8c+FhVb2IoJ53eOx4qmcI4UrT0UIDCAqdPM04wYXLxkZ?=
 =?us-ascii?Q?zPLI0EN0KEPk/dul3MFPFLs3VNyVXgWs1nG0NC5IwD3/iA1vytm37SS5rghc?=
 =?us-ascii?Q?UHvUP8kKqvtSQUvEU2vwHsbc0jpjDkdvYS1kyHmNBawIKQWAiRQQkT+XlY3v?=
 =?us-ascii?Q?ptLfcxio6TySlgIlsk9txaZzNI9m28015iIRCIjHhvn3/7mVl1dlQCI7jP2c?=
 =?us-ascii?Q?DvjExtXvzdkYjnotN0LFbX36fNcTT5Qzly+H9EVmGln05dCBqVNn/aW/SfI1?=
 =?us-ascii?Q?dW/S1M2yKdnFOGAHpMm0CJIHNQUixUb7it+lCZtJG0isNOgwb4IpfByh58dh?=
 =?us-ascii?Q?aTNkrhTgn7Hx6vaxBK8lsCYO5wZ5hYjOrk8FfzVEBzimFb5HszJJ09MpA+Uv?=
 =?us-ascii?Q?dAE7dGYKkJc+JRz7ENUOWjjpEa0OKHJc+hTZJMfjcU/AStqonLRAXvl91s7H?=
 =?us-ascii?Q?Mha9VqZG7vZBoxXhPvoGoJmtl2SfrqIX1TlvSjXsuK/npD2jSHmz4vWBJ4lH?=
 =?us-ascii?Q?tHfzeZ/w/aIsQk8Mtv30b7CHA5FyId71Gt11NYkXG8bOKlx92AMdxLcTmMBX?=
 =?us-ascii?Q?AEQZOXWLovh6yOEgqYWlHRCwKepu0GRaHdhnLxhumIskyHHsU2Ghi1cY+pAh?=
 =?us-ascii?Q?EXoQu1hYOBVut52JTeMBFn95K5SjG+cOUXvQb9CizxlGA2lyYwJH4JKNy4Uj?=
 =?us-ascii?Q?ya4cBPulsYt2oNMTXBCbhGz3COWt7qQv2WgA56bSgTOQMeS/9DW7ftYGrurN?=
 =?us-ascii?Q?p7V3eb4VPeIpzdQ3+2kir5Aq+yp88qIz9qIP4P/8JK+NHrBAKfhuWmicLonk?=
 =?us-ascii?Q?c4G51yYn/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6207aaaa-f2f4-4a97-4287-08de4c93a8ef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:50:21.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvmJqzxYBYez3Zi8OkFq6V3R4dlaF+DPQWPHohiy6BixC6cjtLSCnJucGYa4iSkn0cAFnGllsa1rioQKQ9LH0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11222

On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> which input from ENET ref pad.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Who will pick this patch? Abel or rob?

Frank

>  Documentation/devicetree/bindings/clock/imx6q-clock.yaml  | 4 ++++
>  Documentation/devicetree/bindings/clock/imx6ul-clock.yaml | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> index cd3c04c883df4ab02af29582369757df36269cb6..e78a493ffa59050a1b4974c62b14cfd9c0eb86b5 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> @@ -29,20 +29,24 @@ properties:
>      const: 1
>
>    clocks:
> +    minItems: 4
>      items:
>        - description: 24m osc
>        - description: 32k osc
>        - description: ckih1 clock input
>        - description: anaclk1 clock input
>        - description: anaclk2 clock input
> +      - description: clock input from enet ref pad
>
>    clock-names:
> +    minItems: 4
>      items:
>        - const: osc
>        - const: ckil
>        - const: ckih1
>        - const: anaclk1
>        - const: anaclk2
> +      - const: enet_ref_pad
>
>    fsl,pmic-stby-poweroff:
>      $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> index d57e18a210cc1d8a836b50058613dfb0308fbf11..035002721a3b3b65fe67734e13b686b91539f328 100644
> --- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
> @@ -29,18 +29,22 @@ properties:
>      const: 1
>
>    clocks:
> +    minItems: 4
>      items:
>        - description: 32k osc
>        - description: 24m osc
>        - description: ipp_di0 clock input
>        - description: ipp_di1 clock input
> +      - description: clock input from enet1 ref pad
>
>    clock-names:
> +    minItems: 4
>      items:
>        - const: ckil
>        - const: osc
>        - const: ipp_di0
>        - const: ipp_di1
> +      - const: enet1_ref_pad
>
>  required:
>    - compatible
>
> --
> 2.34.1
>
