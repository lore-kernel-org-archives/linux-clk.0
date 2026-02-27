Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371D2BCF5D;
	Fri, 27 Feb 2026 02:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157751; cv=fail; b=dTiCNuy6cBlUqj8duA45jV2mBWWpC+/M/yXv1vs4YM5G8SWFGVgCpD7Jh9H6/H7yDL2EW6WVwf9JsGj6mIXD/PJC/B+qc81yJg6w9F1oyvQI07mAUwjhRfiPSFl959wgK13cZMhvIW1OErt5HmBKS3FcQSfBLdxYBRlVNlbHqGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157751; c=relaxed/simple;
	bh=xgRdkoNIZIId48Z91wUt+30VtnQaWiwZjP7IOhiEJkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XiDMHyb5RlQZN3xgQXqoUVkxhg7LBQTEZ1vrQesSomG/izv/b2fA2Xd/BCI++OTCrCs/dGmyTM5OIMIWiVZtOgXJ+QWGas/enSR48uTzHrfPopCpcgBUi9JHlF+G9o4p0aodTFntTTVCN1zJmwaf0hAQ6Ri+OK3CUV0ptPcRQ/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PzmLaYGP; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PzmLaYGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttrhixgdv2VC3Lp/ne3uy/MiTisgieGkymuvTn2nYqZJHA0vD1IYfYlVZpCce/Rf4I7eO8S0XLTve/r5gf7Q2iFuAdrdUEaZYd3+PzwlyhQzn8u8rhYVIk1q6b/TzctJ0NL7V7xNYKMoFQFudYcYuOO0gl57nk/KrkR0vQ4/WaEnupvz3F8QM2rtbVfFQcBe+C0rRVFiOvk67NXcGN29beJvkbd+fvlaZZsMkT0TQSU9Xmbz4rN+F0paCSIBavxMARfL/80ge/heurKNbRlJ8iMss6DgSfpRl6I7nQKrNtWemoqPaV3jKtYIGUsz+ONYaModCJJA4us95UX5BxR5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgRdkoNIZIId48Z91wUt+30VtnQaWiwZjP7IOhiEJkw=;
 b=yQWWBBbnWe3MVOQcUVoTbA4GavTcj4QfrqEZ2XdL7/RX1CtXtMshMSTDmxInqszkxbgDFoy/EB8cy4noRWl57166qIBij67Pxr4ZFoE9zh1U4sSUl8+4cbZMj1x48e9i4QcMDjSJoYikSKBd/HyVGksScgjdTsTouYNxrqpynAAZTQiSL2ig62H0yp1Tujn1sNUlJudCiVnHoK7aLZPXoRMM68ejXL8ByGvDw2jAjezoqicBdHbMUXKjkzafE7MicQNQOQigpwkWc2icXBPncIhpVSDPyXqLrIdHAMH3Q2TMcQ7u53EuYZ9cDVdBUfOvRmyP90e3u9Y+TFnRdCmG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgRdkoNIZIId48Z91wUt+30VtnQaWiwZjP7IOhiEJkw=;
 b=PzmLaYGPc8ggBnPzRY+ru67Td6a4h/I4dLggQlcXG6gyGU6BeFMNFIhqoIXyqJQxUGmvadfFaJ4qtcBBRe1H4UEcpRPHgs8E1UeiY+ka5Hceee/KOpuCL9C9mTCRbRsH1953i1RhTI/VZUTUcffCNpXG+pNH0o55nv3bkBxLKaD4zdBXhExGorhM/yTK1HvzFsaaNVacW1GVzL9Wt1QGOmADfqWxF+u6sPqBBP9e4BkN1HmwFCtpxfW3kG52B5qTxcPrEUteRmMmdU8YWwuyvbB1WQ7BKfHGHyu06VYnobRCT5sXVhqt2fgZ7bCZFqV315FbdKR+vrVPuzbsHA1MBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11291.eurprd04.prod.outlook.com (2603:10a6:150:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 02:02:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 02:02:26 +0000
Date: Fri, 27 Feb 2026 10:04:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/13] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaD7pts7UrWqj3Jr@shlinux89>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-7-4421dd2f6dc6@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-7-4421dd2f6dc6@redhat.com>
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fab6a42-04bc-4778-954d-08de75a44172
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	BBZ/6jvuAhC54t7bpQasa5t2hiB5JHMUpF5lb3fjgYiyAi25WowrvPSoP6KBCmsW2jcPJFQtdpwjYVMJQdv7j697Jk3R8FuXuQX+Nct2PolKBM82FW4+BTyY7nJL/ATxQ74CxG/5xFvMWNiB9yXiXPwFOZbRNagn7eJIVHFihRv3kmrX8xHR3vREdWVKgVRosTsK8W4DC4H7lX27JBPmapQp/2VbwNAXPZd++eohvIDStFXPAGtZf26XiDwI1Ijv3CR2tjXNukZ3/nC73VoBi5bxweby+xmNQun9dG6RhAaRNncOJ/3xGZxHxhi7EcRXtxouGVRcpR+OeRJZmuA3YHsHc4VSULAi01qYS821deQ1iB2di+4zLtj4L0hy10nME69hF2ci8zImm4DTR0MA274ZtDARuxI2soSY+9q8eA0LAl9xlhq0MbXYcSDJ9PPKwZoc5FBTPkEjCnNT8BFUUbwZNbcX9mvzXft83i8u7t2B9QoB4egyVTQtc/E1mGrnewdsVvnjNgADNySMIMrkNMPe6Xi9xmmHgMYkINRwCvxftNjjTtaKsIZDT3HmB3SRG5iFc0wHVp4l13M5OH7q4aql3FtQLFdIZBIJmSuWFCYgh/lMJcOfyZlQjQRVzs/fbVC2L5nbo4wQWw5qYX3bOhREOZQtFRj0qTJmXfz/75Kk+UHvqztO+e8AWQCWms4JGZD81/pJcHPdSNbR7yfPHhIjMVUuZhxaBiUvggCBQmf3S8MMLbiQU4hjC7qcGbA5YG+XeR1gXbc6mzdA0iZR8t8TIg6xQXTZHg8U/T4/rXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iPVKqklZH/qEG78Ju+5IXNUJyi3Lf/MAjkx9GR6sAVi7nhnjh9zt/KMNranq?=
 =?us-ascii?Q?5RRlXXLGjVqZMWyNQU34asa2cDNlqwIU8xxZKxF9sCbAd2PorPmzxCLLzi0d?=
 =?us-ascii?Q?gjvLSV24ao5PCZGxLgIe2jVM6jOYkkJ0aCfaEO8uiHhrfh3BBAh6ajdcowrb?=
 =?us-ascii?Q?IoanAKOydJNx7kGP2nvmwyozViDMlx0xZkIQ4P3zS2Ys0zkktAu9lh4ZouOs?=
 =?us-ascii?Q?FgvjYs3z4PoKYkEb8kJCbMlFSqkxFz9Bc74ImTkluqHc2nMwEYzLkCcpskb8?=
 =?us-ascii?Q?bT4q9Ri9DY8hIby4yYTLriEIs6CKeVVOFYSqcFd0rJUWPguXcezVl0TeT9vd?=
 =?us-ascii?Q?SqC+0pcMxu4oFDQbK/y4umu21/vjFbytjq/9FC5/p62S2JYTKRMjVB2yu4cD?=
 =?us-ascii?Q?jUrZcvahRogFiZ9GGGv/V89lfWLyC46KMsoT/TRlOA5Su/Ygy1nPZZKoC/aC?=
 =?us-ascii?Q?1qYE8gAcVot4m2aOkCe3v6UCVUKvhMACW2JdLWfRFUDoRovuxwDFy2xWrqVo?=
 =?us-ascii?Q?PTrBFauNliUzlS4+3lSDFtbAjxYETSpNht1pIJaxKIlAJZcx+BpPA5S5RRLF?=
 =?us-ascii?Q?NpkL38e3YbidaESmvFilbWj62D/GncWnghBSIFa8MljYxX6U+LsPTIHXktzj?=
 =?us-ascii?Q?kqzN6TcCXfpX9VgmEWjM0cgRKNvzsafNVhzJpSFureeiMNypF/1CCpQFwAim?=
 =?us-ascii?Q?yRWjIzILWgrqfJH6O7Axf1lZrFj8UMzC7N2OlEmsK3koK7+ylsk4pxB4z19l?=
 =?us-ascii?Q?P5TAWKeB9OR0+/m5NA/yh2iH+IqYl+uMO4Ic8od7AlQST6Bd6PJeoAcPFtmI?=
 =?us-ascii?Q?d8EbYP2kuop0RSiu16DSZqItemOjEYjLp880gIpbZX/VBhwRT2ouKzaO2WVU?=
 =?us-ascii?Q?5SZtxWbpXpjJC2PKWB3w0cxepHB5gv1nKazHVtjHCYmcPSXDxuS0HPOQn2ix?=
 =?us-ascii?Q?/psTkL9OANtG70Xw9Jclu4/OFlNBJuiaf6CAtb2rtg9BdHVxqYtuixFpAMR/?=
 =?us-ascii?Q?7dW1nXg7epe+T/Sa7DUezjk71JnQcW6x8DFIpQ8Amm3uH5Wz1rp2TPdxr7KX?=
 =?us-ascii?Q?okmZrHdOWnl/fdAqpz4HNQGeuwVXlpEZ28qb4v9VvRsMh0+HcMMKZBcVGL29?=
 =?us-ascii?Q?d020IX/G7qOEUuTpDzpXUXyjNgR3gL+F4HR4KcZotqR+THn4Kj8+Sk2xrBJI?=
 =?us-ascii?Q?FUHq2v7Uoj4j3A4mPrSgfX/sBVQrnPrvJpw1OGyz4+XeVU6WddWNRyzzewhm?=
 =?us-ascii?Q?lxV03AWrVk11ivko0zCRyBLOB98oQVayBfzEXJZA0NhPWgrpjbKrHAMutA2e?=
 =?us-ascii?Q?cbEK5ftNV98Ts7Jwka/x8Tr8yN74VoVk40gv/MrQQtI4pLL8i0WUMK1A3cFR?=
 =?us-ascii?Q?2+V7tkQ19Ddc8y//3zZWmfldU6PeIm1IyyAz80COLd9mxgGfVr3GLbhT79h+?=
 =?us-ascii?Q?hrwrK1KU6S1sDsY9yHjw4pVS8B9lOrOLdRIKVNKVl5gFoczlq9QlVMHpprX5?=
 =?us-ascii?Q?+ZFGLomYAgo0h8yh3kO3a3hRiUZ7QPZnDe8WgWq6OJDts8lL+/I53+oqHYzD?=
 =?us-ascii?Q?fw5mV51jyag0Si26TN9wW2B0puHwFfBBuw/WYfMDizcCfPN0SqOGJpRis/zY?=
 =?us-ascii?Q?sxp0THMm9Gsd2Sg+T1DTC6nk3CZDDexamdE/GGxZTq67EImq0983xWt9HGow?=
 =?us-ascii?Q?85ByO8qax7Vf4lrNGUr0e9SbZBgEgWG71Ohd2/nUuwwuGzWwlz3hA7nKsgwJ?=
 =?us-ascii?Q?c4mB9NzNAw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fab6a42-04bc-4778-954d-08de75a44172
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 02:02:26.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT+KBa7gtp62qs8qhsdUm2WfGdGOxnikiMS9dJd1WMLJLUWtkz5B+ViW5W9kECmXFgtySFnpeEi72+IN6UsfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11291

On Thu, Feb 26, 2026 at 01:16:51PM -0500, Brian Masney wrote:
>This clk driver has a noop determine_rate clk op. Drop this empty
>function, and enable the CLK_ROUNDING_FW_MANAGED flag.
>
>Signed-off-by: Brian Masney <bmasney@redhat.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
