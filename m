Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BA2C1584;
	Thu,  9 Apr 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717360; cv=fail; b=W0XhBll+qP8rNGUKIcPWamY2pkCN0fa36kn2bNIuCbnyeprjdvw8o8hW4bvy32jZMFLoCgD1qk8TcI5KCyb+oDTTfizGPWzua8Ax9InkUKWtm00jRAxKeS5mfdiyQx59rCWghx7WpwTEVjuPu+tizJvxjDZ3Ko4D2ucKCaVVXKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717360; c=relaxed/simple;
	bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ihkyD3ElpKNs04sVj/hrNZCOmaPT6not+WacdAw2jmfxVlrsEzMN+KsXvvipmaFfq8rP33Z10IYxNvjRkwpjxhOVYi/R0yO3cy6HnA1HiO+Bl57EMwdfzikEfQNL3re4wtq3N0dhEeQaSPQo3HP0U8YMVKyEFldmEKeLtBCaQjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ir501jcA; arc=fail smtp.client-ip=52.101.69.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ir501jcA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtQ805xvKA6WIKtaR6V9cjYaVhFpc0CoqQ224L3Yiqwe0nwzfYyeZdmgDORQyIECMVKPFwYj4q07DZO5CLPOjgRjNmvrWr3i/IutYMJzdolRJIt9LG50uHvV4KMvwxr69N9TqJ3+peX4VP77E2Zb7mUfOhQe1nFLaI+1ZZHeptvmSw5l9cEiI328/KuWybGX3e2jez19oUzv3Be1+R2J9Kzi0ClQj8emu6IgPruGXRcI2tIL0xJF+VWrMRrGeKaCA78dJQca/s7uOrWukHwZESM0b9SgYJpktxSEcbb73s4xNTnChViwI8Zk33DQhw4dVYqzKFTTts1eEM2CU7/cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=;
 b=dMgk+YGwUH6IPAx02L2zWHTQm0OuSVyqKDRelcTp5Q90HVE3BQk4z3BqdmwEZNBJDbouOpjlfUrwLcEIJB1zZciFLP55YAuvbr4LK3m22X/ovLPeQGUNdhWQervmK2NJ46+GaFl5Vtrg2LZXljVTfMyJg/vXcDKzqE3K63bPyTHHYZyV8dLCeyjQFyDEUDXHpc3q++tL1+IAbN9RDY9shjwmZ+ikLtzOkUPizRu4ywRxRHU/UBm9ovBayaTECBHHIjNdVC8yX8JpV6LKAZ1NifQjigBGp/ALYCB5B8P1utzSYwDBwWDBydwSoOWNCMztM0AXEYQAN1b8IM9IEt+4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=;
 b=ir501jcAW/bHKh1lvziZZVZUoxyM4hap2XxI33gIie/dv3wq7VRWCIwCC+nIb3WP3rCkJK3XfxHcnThLpwFC23pBCPlhfqprU1NmjmZE2vnlXaIKJzVSia+Ca494YFFUggbtrChNE8/HCApOgS9w5ATG4HDoZY1HzitEUZVo1yWARhh4TH+F/njU2gTgqb80lsie8yx/tFhpyataNEIV/Hrk6HSop1pGK5MgNJLRP7+B3eMi29P/DI20G18p7TDDWEdQ8Vy05XStqMnHgg99cgl612noDHOghuGWQHOXAVI4V27uN2ysKRqqvRBC/tLZVypHb7rBunMiroGk/o+aCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11172.eurprd04.prod.outlook.com (2603:10a6:800:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 06:49:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 06:49:13 +0000
Date: Thu, 9 Apr 2026 14:51:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <addMdwvnDkCMJxhx@shlinux89>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0883d1b7-4a6b-44a1-ec42-08de96041c67
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 MuQGYuaI8x1T7P4XdfqU6SknNX9VcWI1h2hYdLp1JsUkOH1N3DVBD380zVR42dOLOubZnGfAI2hUJmR7L2C4FmKhbxm4iJnqms0Tti2QJ8/3RGh0+ruC7eeJS3s8jtFsMuM+V7faNMOM5OIyZ4o7pwirZuvW0K1fMD0agxRM/ifaKQD3NG7QIy9BL3e6n/L0OIO3OuezICf9qPKHRZtDnDF8MHtMzMSPNaMaLRg+sgKisair/NhWgQn8kG64fWzGw+H6CeJbaP06/fjFc6BF9g67lgDoIWjwzZof3AojlNQuJA2fw/cPI8TaQXA8eaq+jnanzfaSwViJ6m3z21eXHVtjbgmVL4eSdY5uAAWxpLoVayEE5TO5Gn3b1/12wkFEa1NQYTJ0ABuchJDDk0iAQIwP7lrZwYqaV5cg35yhRK+KvrJ3p+2F0b0x+JMwJg+IuNp2kGL8RowpmH7uTrQn+2aX39i4zu+gu89MixV8hYtlLSVES/ANBSRmcO+7J6VQxU65muBQP4Bp8OGlKTWYVknVuxb66y/seLrOg1AS330LE/vwieHeHmFx/AJ4V41Vg3n/ipNEoWsOoxAn5FRN5VR0r+ghG80pMheThononoS8P+VW4MI/hjBwBTlL7jHwa6mdkEYmbuRj7Ffdz0WRIbB13sLuJuSx7TwwENif4J8GbIDZR4avGSEQd1FDIG86/LrsD2H0Cady2eouPvn+Cn6Q9UcECOFlJqYwxYcISSRdQH5ngTHLPohtfsbv8Gq2B3o9sx+e6MWW08zUNy306jIAu8E6nQ6tn2XyNFxJ9ts=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1AJ6rz/ermcST1MJrRBFrpKJyKP/MdvQvRThmHAzQv5ABL5QS0LjfVb+3wKh?=
 =?us-ascii?Q?insMmJ8lvt6hM0G/JDgCHSxYpM+ksso/jVY0mtV5M0Vw39kU2LsBsAAnXvUT?=
 =?us-ascii?Q?/FJvO8ORzGEiSVOx91dqwDtcP8DpZbbaVHzl7fo2fxzjV6YSBQG4bx0MY0AR?=
 =?us-ascii?Q?pKjsa6QhrC0t3nkxxp8gsMYfgQ9aJUOGYY6Zthuq0ESo++/W6/lOC+Ev7tBM?=
 =?us-ascii?Q?GaIUHhjJ3DOp/wSBkoW6ya8crCByHtskyGEyzCGFe7qM0ABzDc3v1cA8KTOe?=
 =?us-ascii?Q?Tp3jwCDA6L4/aY3+peHRhuPt7Fe6d7BHSpnHYgkp96bJrgFyYr9cLADxmFOh?=
 =?us-ascii?Q?bRkQjezbJ7p9kgQfdX3gVUj9G0pTjT9/vC7o0Mw9c4bXChQ/6OmsTb99hXuq?=
 =?us-ascii?Q?SBLuW67Si0RSrFxJkvOhwMaYOzlLDF6I2nR50bhdfx/oROFbleLDZ7/icpqX?=
 =?us-ascii?Q?7IrZjk7nALQEfdqR6P49aN3TxxwrczXX3zEVYBjMcfuiaQ8PzkqTZZVp0XnW?=
 =?us-ascii?Q?gkA9q+NL6M70DYmVb+o/T2Z/xc1z4QFDZMlMYde5ZqQFktg8kXgXvueOBl2i?=
 =?us-ascii?Q?0MNs2SXVZlwnITo+lqky3CJlzqG45IQ0QE+YCyUvkLQ63utv0M8zENytatL6?=
 =?us-ascii?Q?tLRJCLsh3eMI5MXX86CR0ZyhcG0XrT8ihkbMTsFZqAZqIFFGp5re3g2weZqF?=
 =?us-ascii?Q?Dn513xAXU/Ajy3VcCLFbJWciJLHxO3PmqF301bH0c55xXDlY1qIN9ZMMc2TR?=
 =?us-ascii?Q?ZnzLl5jbSI07OEr8LfBDuF6Abuflj+Tsv/TI2Mb4PuE92R7kGACDtVQORfRD?=
 =?us-ascii?Q?UxGh1PQoyZmgJXGigQZ6NHleiddYiJE2U4TJRau2Rgi5efO32nBIdelsh323?=
 =?us-ascii?Q?gtpyAyc0XQizce+3uXtGb74XT3f3ao71UriLwQXAx68V1ECblBxOICSqG1SE?=
 =?us-ascii?Q?6pz7UvZi/OZomlQn0g+fClvKZm2nbJ2S/B15OIf/VRwhq3Es9QqkQBY090+8?=
 =?us-ascii?Q?OIBUcNuNnSPexa2krLQ/mLeEQnJ07dFbg5IWXw+PQ/i8z/Xvn7Fl0ro9RmCt?=
 =?us-ascii?Q?FoMje9IewAoj6ud/N/Fr9/47v4mmI6xRPsFDVI4NYVONcSamjcb5tKQQ5u6s?=
 =?us-ascii?Q?P1jGiRvB4iw3+h2QHNcuOE/9RjhILqzpbm5rEjHDn0SiHe6cq+KMgAZe5nbI?=
 =?us-ascii?Q?Xp7xjslsMWv309GDHe28TnTTVNQDlzN4INJv5cGLO8zIp/j4z6GB5r9YJnfh?=
 =?us-ascii?Q?fP8pEDe90qWXV4wi3sT8Xv60tPT/zy6do8b5aYb+xQk+SfT6ZSE4dEhzbIHO?=
 =?us-ascii?Q?95VDgsxOBsYZdDtCYS+dj7yxVSuxrYjMaAmghFMNESju59RRJc0jni1/l4Or?=
 =?us-ascii?Q?KpDZQB7LLLTLAuG5V4oA5DsZmvYWMwxFF7e6GgjapdBlVzeA4K6DjmaGsMix?=
 =?us-ascii?Q?DekByw6BIpmPkQFCTVRaAcl8Fjx0qPsqTB3RVF46evRpal3QoMCPld8jF0pA?=
 =?us-ascii?Q?l3W9qkZ0PZfdT2/36Ed9yOyITfOigu2Tv3lCubQcmneREnG5/V/rwSkcO0V0?=
 =?us-ascii?Q?Nl5+b5ua3+M/D4CYOlHROQ2TtFensfos5A8NJZ74X4IrBM/lhjCeRMV4yiyg?=
 =?us-ascii?Q?rM5xnXT74hwdAFVY+cksYrBqc2FmOJ1eLXUmIrT059QYKE80etR7Oj4dqnx2?=
 =?us-ascii?Q?Nl4xNl81FAU13WN8/YoAyxFpH/MIo9RKoIjGvH904E1DqNGAsvb7LpA1r7/n?=
 =?us-ascii?Q?4XqXTimXsA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0883d1b7-4a6b-44a1-ec42-08de96041c67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:49:13.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCCXWxZgLIHvr3XSHbsf5dvLQiOAnGIDQLUyprbdm+J1t9ct2/D9rXY5ndItxT89aEvX5Our04u9DhQM6m+AnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11172

On Wed, Apr 08, 2026 at 12:13:13PM +0200, Paul Geurts wrote:
>The i.MX8MM clock driver is implemented as module_platform_driver();,
>which makes it initialize in device_initcall(). This means that all
>drivers referencing the clock driver nodes in the device tree are
>deferred by fw_devlink, which are most of the i.MX8M platform drivers.
>
>Explicitly initialize the clock driver in arch_initcall(), to make sure
>the clock driver is ready when the rest of the drivers are probed.

Let's keep as it is, changing to arch_initcall() is not allowed.

Thanks,
Peng
