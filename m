Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EC311952;
	Wed, 25 Feb 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007429; cv=fail; b=pevm9us7kKojwEEC0fOaPCbP6+ktmDO1jMERMAGNDv11eCtOtEEiUQNP1wWESOScP42QR2csmaNgNAFa1RE/CsggL49WP8PwduaGQ74v1BxL+oNpSCP77lgBsmhA5qpQJwSHjvJgdH3gywmpe2q7cEa2BeCUAFAPUhRBtTzd+90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007429; c=relaxed/simple;
	bh=Bw2yyo3R5yMjsS5Fdh8xtgOObW4PDoObQfP8SP359p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KBDI6R3lDU2OQxmasYUs6+EZgc1Jp6AYp3M6mYzZtrOaU6BGGIVtZPYAm0xIK11dCvc7k24Zk/QS1W1EKDA5DZRF8R7Tsl6DP97mlSvouVTNzVBrq0p+0m0vNJNyGfND6za/IP0PL0z4ODVYWbQum8AUUaq+86XketTyeFHUDbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kuW57SlM; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kuW57SlM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnorMgZf6RqjrCCQnygrALu4nC/sOU6VlhZWBXdl9liCJioorUyidq5CT4TQty/qScmFh3o5pFV+0x230xNrFGd6Mwt6l0x9yQ0NiylK9i4aSHXtsREVG7RyFY52nKknpiMtKWdEn5KEPPcj6Mj8B01d9WZAssopGwjAbXujx8q7uQ2Y2f4aVROgdRzWS7ZslPt/Fttlnsu9lgkTxLINCkwN3s9PhIoVy2zBPUcPwS75Jqo/9DKWw+4EzAFyS91UaHWig9yHDSTSpw+SnQbxNkHXfw2pl1QENoN7G+Bjl69FLqSeNnyWVfDY6yOl2qh/NJH19j71viD52vAVbU76Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw2yyo3R5yMjsS5Fdh8xtgOObW4PDoObQfP8SP359p4=;
 b=u4W3UKPnDpI3wYMwGi6OqTdqW4R1ABCIKexkq0jQoRJCBygjdxzjdSlQHX//4Z4Es/C3kGkD6gdnaQCQcva07thaytqQW3u+rmzf8iiwN509MvFkFzGbw7B3ONzgVEJcIe6xPXC5r/8Rq9JG4Ak5xdEdokrELijMA2Y/J2B0D7Pa+UXm4MU3+LAfhJPEYoYcIa8jhwkxDEXjjs+S3e7z3JFRzrBtXT80pdkxEeSKpeZrVtmTQvbqTpfKiYILPMGpmA/SMvgg5+l8qYHA0Rnoh9OUYqpv6oUuUlIkjtOvNENaJH245ODudVOF4q5ty+BltKuxtBJdGf45mBYr85KJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw2yyo3R5yMjsS5Fdh8xtgOObW4PDoObQfP8SP359p4=;
 b=kuW57SlMtUD6LAeafh/CIZQrwtRhkjUAYIaSnyFe98SVazvFC0WccUhxrxnqeg+ZJVax7k6Gk2h/9oAOwOs0SiVeoBTM5+pvVIDvVR6Wa72yQ52Yjxxu+1FRORpj8Rj4FDfUtUp8YOQ3EhuNCGeEnQkmT1rk9EMxiyf9Pky5MkcK496Nq4hxxcAbYY+cD0nXVNdAbm8nWVeMf+V2EPRbX+2utcdGgZAZ4vu/o9/ZLH4WyxXM8y8Q4uCE8cH71z7fZZf57naVesxOSwSPgOcrltrH/NnUIn37etXaQU169DMvakz9ajJpgaTfDznn6H827jdP5lUJfBPM9UPXYdATYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8121.eurprd04.prod.outlook.com (2603:10a6:10:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 08:17:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:17:03 +0000
Date: Wed, 25 Feb 2026 16:18:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stefan.eichenberger@toradex.com
Subject: Re: [PATCH RESEND] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <aZ6wcGntUQmwt8yk@shlinux89>
References: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c55ee2-2e02-49b9-a431-08de744641dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B2bIHm6GqJpksc29JLUfaHoGWWtmePIHbkxbm4xewdvQPVjq5Oxp8OjsjdVy?=
 =?us-ascii?Q?VrU0UCbdJDfge0QG6OfCK1hmtw3HhUuAdy1tqhMP+mks8u1hsmr1tPP2nxvn?=
 =?us-ascii?Q?vFKMTdoxjIkmyabSjyNYeGuxKFJgxwi/WIBPYI1HTSNsVylOO67utxanhUA7?=
 =?us-ascii?Q?Ruwvs8o5yNAUiT8WxBPS0rOA/odUrO8fx4RVDptCQjpXDaUGap2pStwfjM4w?=
 =?us-ascii?Q?aVxspfHFNKa91KVzX4RnFxITNcSZQZfq6XniJf45XCYoyDf12fm2+y4qqgWx?=
 =?us-ascii?Q?RIwvcWKTJC8yc3Ze681+AoVwOuBwNag7GCooy1bKBEdeY19WR8HuMMXu4hzn?=
 =?us-ascii?Q?cBAPy5oAqHPtQdTRUXQLadjrw2Fwi0bonlshLFKf7WgR40uoij4msVb/NXp9?=
 =?us-ascii?Q?AcXQSa15M6SWWGR4wuQ1EbQgjK3x52ZYmO7BIquo6kaJl3lAy/BCbLCP6Uxq?=
 =?us-ascii?Q?0dmmlm7TPGReLXr4UOqzoQrG0JdMlDLCm4W5TkiLi9EarDnY7nxE/fNGZnzp?=
 =?us-ascii?Q?IrZh09lOWnMuZOIzQ1ZEQkI4eS+WUr67hYIMQdd+oHMRgtKuvYGf0+oU2xkQ?=
 =?us-ascii?Q?ZHGmLafJEh3bY1hJJSUJIL5Xid4FSX9ZOYcMt3QfTApl1qoqWRE4jdsKdesI?=
 =?us-ascii?Q?dqyi5Vr8INSlz7PA1twpnIWi+UrD3DSv5d4UigX+M4TeXNBc6ft8mplvus24?=
 =?us-ascii?Q?WHNtdERQStmITvwlDz9xbty+Fx/gNRqOhQbd18f6pn3Fp0bIlD6AoRz0nYZF?=
 =?us-ascii?Q?CUe6iTRR1atlj937OQFY9k1kOvpFhgKOsHdzdqbCLi1rrmZHcNtbPgb1e8Nr?=
 =?us-ascii?Q?HbQMN+o7n8twJrlgY0KQRCs+Cba1Kvbbz+WR4u9bmEFB3q7Odo7qcvCCY5B8?=
 =?us-ascii?Q?WHQ88n2EAUn3fLRFSlb4Q8A8UCJScrdkwjOCzk+EJJS2QEr3gRvcL5iK7Txv?=
 =?us-ascii?Q?MG7MaQkdoFGxGe5bMXsjTRT00ka/ewXJ/LOUsSePOSoNRHId2vfQ0X2tVepZ?=
 =?us-ascii?Q?dvDWIRxUg08ZTOQHeRZRji+w/J39BURRFUPEaDnxhYGu+8+0/a4vA0i7pW8m?=
 =?us-ascii?Q?xX1O88Y1pXeSXS8lSEZ9v+hlxBljPr9lS3t6SXDTPXh1skpB47HzMSOoW4xL?=
 =?us-ascii?Q?w2I2DLy63ku9sSlzVDozvaVJ3QR3BrjwYQhXOl3y0O0CyCFRzduko9oLqb4I?=
 =?us-ascii?Q?mzEsyF+rydKzulUf9W5e64qWyPcZ1cou6sOdsQmp9+tdjocQhhA+lusY/Q1i?=
 =?us-ascii?Q?VVt7kVcJcBJPeLsR+8lF9SarUFk4QBr6XBcKUeFKhkSPb8jdY/aU1zIOOIIU?=
 =?us-ascii?Q?R8JfpiDVKH2JytqEUKZHNNTuWVWcEpi4mlkFM3CdbujvxS1oR35qGquIxPdu?=
 =?us-ascii?Q?cQS+r2gj0jvsrNpI3aqwCtrvyRDng+hpfu85OWwbYExFcZ8n1GWM/Wk8RmWd?=
 =?us-ascii?Q?5wICIbc7H4jZmV+ETPEaXdcoAgQBiGWpKv6h4XdM2Ngd9tb5HSD9q09ChJkd?=
 =?us-ascii?Q?sIlf/STjt7PZ6D/MtgD83vTL9hY0JWWKSewTEyTD/YjVztI7huPUc8Kff2Va?=
 =?us-ascii?Q?4wKFp/Y7kfDsjoKOHysGV+1cGpiNf6rWFfaqFTjFyqDJoCXgOKg/TSDa4qSA?=
 =?us-ascii?Q?93yasWhqM+KxcqkSssXfI1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FL3q5AZDyg5wSay7QCPp3cHB3pj1K4lX7cQ6Fc8ojbIM24DLw8s60tB6pmd+?=
 =?us-ascii?Q?ek2q4XD0jZ4lefi+B/wviqnaNs7l8HHNQR9PGtzitE9RTjog+5LLq7XaYvtg?=
 =?us-ascii?Q?nwxNPNOviPutG+ihowH7JawPOwQ2I5raJ5jQv2IZkYk1R3uCNMo6/7tGrzok?=
 =?us-ascii?Q?aY0uu6YKoL4aAd5wRbwgzRH0unw80XOhRspNM7cklpwIaORFpHq1ry69V4MU?=
 =?us-ascii?Q?TI0HyMO6CzwFmB6NZlVX9dv1oONP7NHisd/oeAWdnNpKZgXHCWZ8fLkBmJo+?=
 =?us-ascii?Q?y4VzK6hM+Ow7OyIbNk+ac3TlJGVC1U8Tdf8Ge/9kMdw+ti1x/Pc9Y3mGem6v?=
 =?us-ascii?Q?Q1tOBv+HCACT/ua/IPzF24nBuAsIKkDMtZYMeyeV0qR4XLsUmgdjvt7SNcJw?=
 =?us-ascii?Q?EjBRdeG7KPdnV4UmYziO4PObxCqWshED8ghzBMCcl6wc2xubRCc5YtNAf5AQ?=
 =?us-ascii?Q?ig9KaofbZySLetGXK+ld8m3y+VgVOayT6pAwLGJSL9sQIFhj8Eva1OBkQItI?=
 =?us-ascii?Q?FnDDttKmvyZdR0iHyR4QxEQsRqGnLijIj16nqaFBOfiIizDjY2YWjn29Om6P?=
 =?us-ascii?Q?5vxzbhUCN7YLhb5xHqb8nGF7PDTFO6+c5mBPFxJCxOeFx/eQmi3s9eUJnkQ2?=
 =?us-ascii?Q?3eEeYdf7joHUfUuvuGrqsrFxlYiA25xJkkxGJAxIvTwQpeTtN2k6D/mO+iDP?=
 =?us-ascii?Q?BVslUT+RK7J9clkQKpPFY+Jny9t2hi69QOcy52NrcBfeP5Ih3RJfq4nD70Fn?=
 =?us-ascii?Q?D0rTx0jIV0mQHamSPLFzNiepKuwp5s5Bm4pKyeZlU/Wn8Y3TQri1nCI+VVIY?=
 =?us-ascii?Q?VgzeTuU0FQmUYFFsEXTd9sHlEOMjcxRQ96mqZpOLlpfN3nbhHm9CFwRVyd/v?=
 =?us-ascii?Q?Aqqm0EDWr/1GK6OAdfK5aPPwlHZcbfrFe7SfQzkbr5K22vRUfwra124gbUOG?=
 =?us-ascii?Q?Wf+3su5qE0uyi69WH5zEIA9ZP7hQHZrGiz5F8BEOM1kcbQ80H+9XiEoIpl+c?=
 =?us-ascii?Q?jR2kiuY6w7nn+eJCKcp+qhigDfZPEjr0n377ktTY+aYAiCr5fhBKbon9OEx9?=
 =?us-ascii?Q?NtSe/XgnCpA6tbLkp9JmYc/kEpsWQF6/CqbQdoGt3SYY3RAZUlg//T4Qlr05?=
 =?us-ascii?Q?6OSzixQZKafecMVhxwe4JrWjrUfXQOcvShVZ65uxJRFqBfkX4dHsr/dInQKX?=
 =?us-ascii?Q?2xs4ZZmnySmAStrt7GPUCyfZlip9yxin6kwIysJYy99YYO+HL2juQYRqtY0w?=
 =?us-ascii?Q?7H8a0cALiu0zvVVKQ62Y9XOdwpM7L+jrqEhtvaSP8g21Lz9IVHPQp+ZMgp+v?=
 =?us-ascii?Q?sZd459bL0FCBm/JPTpYPthiIGZWY6yp9wxuIAxbc2gqR1m/8D1D/MUX0HNEW?=
 =?us-ascii?Q?oJV9v0gxF8DguZTcWX5Q6scz5bRCJJpUczIJ7g8VtlXi/G139ZB1nmmjvUmZ?=
 =?us-ascii?Q?aoY53MtwybwH9GJyJu6h/7talLJbgMDihfzWilM+0GnYR0cvJwKVm69D5N6o?=
 =?us-ascii?Q?7K3VTDsDNMRYx6IQSashXFXcuagP5wZNdecmwOumJRJplU3aDSEO5pOdN3tU?=
 =?us-ascii?Q?LVlU2H1yau/Hjy+EWrETb2unc5JEaw2UCQOKXNcU2sMMcwbMu39CR4d8LTVe?=
 =?us-ascii?Q?G6ZRLlYDhtnSYPAevpSKyIslT6cWB2+Mu1ZWA8tFpKsNzvOJbvLmbym63SyG?=
 =?us-ascii?Q?18D7IEZQVi7Kp4dvHZaiXGusw2DTF/SmkUtH4v77hB1AEKeIShlMz2XI/zUh?=
 =?us-ascii?Q?XpIowoGehA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c55ee2-2e02-49b9-a431-08de744641dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:17:03.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Qj0494NDTLRR9OeBVFxDzdwkkrTxy063AB3zxL1vlZOZdLm7WsxTWn5Q43H7iFyGrxAuMJ1p6as55+550a6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8121

On Thu, Feb 12, 2026 at 04:57:50PM +0800, Shengjiu Wang wrote:
>From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
>Currently, the flags for the ACM clocks are set to 0. This configuration
>causes the fsl-sai audio driver to fail when attempting to set the
>sysclk, returning an EINVAL error. The following error messages
>highlight the issue:
>fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
>imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
>
>By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
>driver does not support reparenting and instead relies on the clock tree
>as defined in the device tree. This change resolves the issue with the
>fsl-sai audio driver.
>
>CC: stable@vger.kernel.org
>Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
>Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
