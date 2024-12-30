Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D425383;
	Mon, 30 Dec 2024 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735518180; cv=fail; b=ZfEPG1LAM5jVtuGpBIjd1f67CplfZw0aywtLBEGTRQEir2RCwKdaU9xYBdZgBSX8pUv4igTlAKmTUkwnss5DE4278BLPAHQ7LKVpnWIA4WPwTbiuzo5o1mBG25VuVDnj9SSPh0JPSmnzaDunxcElQ4tmuhWc79aXQdfBqdaNXhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735518180; c=relaxed/simple;
	bh=Ll9P04odUXFkb22m9yOj8oupLoJt/mrCAkiJtbBZHxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SX4w5xOyCGZWaujcZ9q7aeiZsSY0w32IAe/zJtkyeBlvUo5FgzjSmH8b/CotdIHNZa9c2FJGdzSqIwWhSdK9LUCfoAmG8HVNNWEJoz6r05yh6IHod6glmynETlUzgqJ5RzR/zir5J7O7b9UmZEFoJhk/J2ibpw0Ivy0tMS/uprs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RgYdhRic; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RgYdhRic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6jDNtJIamTjnjGx5UrT5EMtQ4wsIL30L5PBJEbFxRrOnFh2zZnRiPoyD3kIUg1GZc2O3N0vSdFOzQqaMtRAMafbnQ2Q3DdYP3rX9bV4HVJ+qCqmcfh1cs6M64wePiiN48dadf7h5cjGvt9RrlyAMUsmnoY0rxJZwUC/LXSPyqrbZhdC+FFVqYPa124U9XE7bbOQxTm0scGLt+FYS1t33iCvjW4KayYkRcSOQl9Bo0DTXGnnWgtPhyQfKhQ9r/v9qTg8Srvox7/RF8z9iSspmoR46C/dyWaeIjYCtHfS/avcn5uJzmO6zeW7EsVaG5Dd0iqkf/rORAdiAjqUzszXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5oP8GpYxAzK21ofuRAZMEz4vLgJpb2ZpBUY8jGckhc=;
 b=mGgRX2000HRKRcbj1f+8JXgE+Q120ZBjDFV7uAhC/jaDwP9Ink654RK2hxcXgv2LuJVsNvYQZX4FUozFUM9XUrAPM3OuZZKwSyfwz8IPE/avAxkCzjGaxzbVE7vttMe1OUEd8+TmWXoqr+H+eWhZG0rcpzcBBl4nRrDXQm+T1nBGHssptiLcZxHPOgQnNryiKfY0m5UJI5W2bX1sHqgcwNHVO0mzo9aEsN95wWlR2zPI3ONLhp61cr6B0X9nLABVdDCAda21Jn8gcAcXoOoo4hlFqKlygkVlYtg9J2OtcRJ5RSq8doDH8tm5quVdyYLYL7twCxclGnJXu5/Fb8jLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5oP8GpYxAzK21ofuRAZMEz4vLgJpb2ZpBUY8jGckhc=;
 b=RgYdhRicHjZM1xP3xok90+0z8kRc4G6kRMto/FXD64l8pcYNQuN3HNMdrS+y+vvcTXSeW2sgCks5c7upV5SmK7MQYA7r0MB3BnBMmCKkbfg7b3x2XxLhU5rFrPHjQ+doRNsCvyFiBEnr9CVUwgYhrShddQaTiE6CgzqsFUNdkinyPn65RaGshQxR5SqRFltFHRoTsESzYSOiHIdsajwiAuX74lp+u11ULr/Q2Rz6XM4KN/r6Z7qdAM2t/s42m9D7HLr4+s0IIEr8cCd+sQ4al1vf+9WB4HC8Wlkbpwc8VrCTAzrMVtoL7Yn+3BiFLzNZdOLOmAaLV5GhL0f8nTnPWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9346.eurprd04.prod.outlook.com (2603:10a6:10:356::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Mon, 30 Dec
 2024 00:22:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 00:22:49 +0000
Date: Mon, 30 Dec 2024 09:28:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
Message-ID: <20241230012836.GC28662@localhost.localdomain>
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226162234.40141-4-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c9d961-4056-431d-7899-08dd28681782
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q+FdrflcMcopfAdVTvO4y8cW0SHNr84KdqVCyOllqsKBN2e2eyd1Xg8GTx9T?=
 =?us-ascii?Q?pqvv6V8dnNm0fnPA+dNwNSF8FFg6QOL4asPjxTSo+bwcF1+v3DQ8cVGzTWNp?=
 =?us-ascii?Q?UfQfjpZ6K0w3pofKvNbTC7iul3Mi0bJhciVrAcdcRi3IeRkuOchjWIjFCDHj?=
 =?us-ascii?Q?u/BcN0rtBM3HzDutwwTGUCeYwE3J3slhtkP4Q7qh3g9LDijsoHXbUQKFzogu?=
 =?us-ascii?Q?iHLtBZNgpKJjMVWov24c5XbvN33QVqI2z5COz6ut5tBLN3J505DT8JbMBFX1?=
 =?us-ascii?Q?KSWzxzxH65T7MLNdDlRMjyHxII6vSP6aX+SzR5kh4E9rg+ahFvRGRo5UO7wL?=
 =?us-ascii?Q?smah7bOKCa6/lwiX/vbNg0GeGh+aUjaIqOg1eBukkn78qsUhLZCp5NGc17RV?=
 =?us-ascii?Q?P03dJ+SDxmQq2fmOiXOAl7pJpnO6AJ48zLPQMfopUV2MpNgkKeLsmTzNK4N8?=
 =?us-ascii?Q?VZ0nYBqak9HC7zjJ7HmuFKK1Yd/OhA8l/IJ2jSR6Tb/Q8DB1i8KHwY7tcT27?=
 =?us-ascii?Q?ZXO1+K8ehKnOQmYPnKCMTSysRF8ReM7CnTrXAbKMpCY/8vm56BC1i1pyBrxX?=
 =?us-ascii?Q?ScZ5J3KIPDHECPbRDdY99JCVf1sq7s7vXKjqrMvHfMaw/S6m2b9qNNQFPjWC?=
 =?us-ascii?Q?PZkUXWm20Y8dv28weNH5jxiOszdNuemtyA1J2bVZsUp8Xc1MXT51UFaFngjt?=
 =?us-ascii?Q?yIvpqx3yI4wNljQRy4ydwvya5m/DJyOrrHjBtZ60tP0/6XojWf5voUa/Siuo?=
 =?us-ascii?Q?osSiJZgaW7SFjdqwuR7zRHnn+EzSnKfr15hw+EVjXDPi2K/YVOe50yeOPWao?=
 =?us-ascii?Q?DROJplC+8ET219nm9IOPqAbh37/UjyglRucvCMO0OfBSg5L2gdXNnEK8uNcL?=
 =?us-ascii?Q?nzqVgC8ZP/lTeL8Pz3I8y2AIfa7PbntQjLAAXefiC/h1GtLefn/ZjVNdmgdY?=
 =?us-ascii?Q?0y47jn+WgphbHAnP415hSSm4UEjy0S+n+3M12lRFxOEZDdsi94DyHwoN5OPz?=
 =?us-ascii?Q?oSgWdDjc5QAOpr8w9o23lIpDuku6HTX3CNk/73dbj9HBfxP8jrs6A3bsoVfD?=
 =?us-ascii?Q?P4d5HdjZZ5PWTDM8A24sxXzA38nZbV8GdhNlPULdRAxKAjhNdXHDrDsJHvZz?=
 =?us-ascii?Q?6rl1mwlQkd1sa14oPfsz5PmGRtf5gdehhja6v4fS1RDUISD07k3OBUNf7Q9U?=
 =?us-ascii?Q?LmEz0oaEA6W4Ok4YCDwyfQP07a9R+IfohF6ELxbCqDxT97qJMw6vnieE9PsN?=
 =?us-ascii?Q?4ENFb8dJx4PakpKM8rbqKPUkyxOtzu7znfzBH7xVPBS+YR64xYPUtvsLGByq?=
 =?us-ascii?Q?VPwJPwYgB6FdklcqktcAK01Hasi3CS/ypYFn8XzT/TWjlRNWCmhqmrH8YGIM?=
 =?us-ascii?Q?blun9JEMm/pTV/dI1W56vbhOw2h8USs5f2Qbg702HuDGy997tKs36ixP2RrO?=
 =?us-ascii?Q?VJSAcNwD4a/AoEfCEl0ZK0BTuxlQp1nL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0pUSIr81077Uq3nqjLMsrfzi0FQWIJTJnMdCyFx7SwH7mgrFV+/zCubSKoUq?=
 =?us-ascii?Q?f/hLr4HSqUIfXlFnBcur5MOBWST+eO8R6zFDr1BueHf4UDsZQbgoa5QaQOdK?=
 =?us-ascii?Q?j1BNS/FZ4Y3VO5qDGKdeCc6HUzNIFtsZWZleBBsyvtFcpWcUS8p9arABSGuP?=
 =?us-ascii?Q?OQgAy+XD5uKX8CiJljk4OKUv0V0TtuFJLxiRGqyaujrUKc6M0aMDhpf4xgMX?=
 =?us-ascii?Q?5sTzCLYN93/Wh2UlVvRjG2+vHbWXFfXoKFvjYG70c91qC5CVtqBsWHOgFGmX?=
 =?us-ascii?Q?m4032XpOOIgCfQ4e605l5H4+NjyHvg1g1p/zwCJNldqqrcglUUtk2668xqwi?=
 =?us-ascii?Q?EcmP+1zmXn3JpUqDQYcmYPaSFJrK8dGIRTlDEat/taJYzW+nYT/eWVw2V52X?=
 =?us-ascii?Q?rmAFhu/4Vz2gkoMzCF04sW1OYmjaXvq218iwckQ2SDLoxqpq8LSkr5d3WXEJ?=
 =?us-ascii?Q?PTnZ/BCON7RbQYjNYIw26iCTOKsyRrRh+9Og+Ljr582ReVAozgHgnZYRgml4?=
 =?us-ascii?Q?e4XJG9D+ZiJKCqw+2Aal2LWc3G5KvffFCH8miHr2+Iqfb+kH2KbHEw9u0z5k?=
 =?us-ascii?Q?mrFMbx7dVyiLBlSYu3nvOq9YRn7uTEtMLQKIirPK0N9kgZTGzfwGWR6ZhYGS?=
 =?us-ascii?Q?OBQaQKctpnpB5MIkgmXUAfjAWL6MNNcINxkbwATXC22xJCRPflyYjff1yRLI?=
 =?us-ascii?Q?97BeTgjqjQSaG9FhC3pqX7wN8M5fLCbdxCIswQ9RFSNGxJTQmaxwuzf3O5IL?=
 =?us-ascii?Q?zj/lAL19Egdni4i4VYFS7HT0zVk0w9CvAa/JAIg3WwKonsJ1FEs2azl/OtHW?=
 =?us-ascii?Q?l0AQSuJhZ9kzTa4iQf/XXX68ViaIeGlPTQAxpQjHiGX0nRe5knlVKHYR8E4c?=
 =?us-ascii?Q?YXMFIMZ5VeRq8e6sa7qu2bKYtYQmMRyQXkiCqhj5MKNB3bS1VzXZFG8OLloF?=
 =?us-ascii?Q?YJ8h05ofp3ZTGyYIR/f55ND5QDTl78MKPOLFZU5+pMgbrl847DtV6XbfvZb2?=
 =?us-ascii?Q?sEg0Y69jT+ZHBslGVfzZESRKolZsUeCftRyKpkuzQOTUAoUet3eHMq9swtnH?=
 =?us-ascii?Q?BsnFhSWg/9MAOxeXDde1LfgMgRxRDF0ek5Ba19pkrwKIOQJqb/4PtonHkrL5?=
 =?us-ascii?Q?0JXmhM6iMQy3jQEGY7VIdqggZOu0ge0VUt0zZAxCgLdPtfg++nHrUSRQjOeB?=
 =?us-ascii?Q?YCKmB2szCKsefvyY/0UobwBL/3HCehwqdYqHfa7BMI8oEOzKlNQX6yNsSneT?=
 =?us-ascii?Q?Iszxb/zSNo/qPNFvoViC37P3k3I6EZSX711xVl7dldWVy6DsC8XKnxk2JWGJ?=
 =?us-ascii?Q?95hzkhqhqQmRie3+naZOfwy+JK7XAf5rQXLQQ0fd+GCHiWYni0Ahv7pEVhiQ?=
 =?us-ascii?Q?JBe3Ypn16VyywA90wTyYWUr4x4ccFJ7Eea4NUAnLiDUUkD2XCQa6DQs2ihgH?=
 =?us-ascii?Q?qC45tLr3f6kXnSpl0Qksb3Ph1NA4YR7CV076/X/DDO70b8OIKniMaeZShUUL?=
 =?us-ascii?Q?OdAtNPU5igu1NYjTCs+NtoadjO0ovadBCQqC8PIGiX6pgSs+ENUYZMLwQWgy?=
 =?us-ascii?Q?ZxfQNCGMo0WzHbQYNRlpD1ktRCN9dljNe4wC4oSP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c9d961-4056-431d-7899-08dd28681782
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 00:22:49.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qml24sMun70KM20N2T3QJciprpadOtD4Um8IeN7I/4qt3gy217fL+KMAgrQF8W5QFNB/dK+c0NZUwGsR8l8gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9346

On Thu, Dec 26, 2024 at 05:22:24PM +0100, Marek Vasut wrote:
>The driver currently supports generating BCLK. There are systems which
>require generation of MCLK instead. Register new MCLK clock and handle
>clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
>legacy system with clock-cells = <0>, the driver behaves as before, i.e.
>always returns BCLK.
>
>Signed-off-by: Marek Vasut <marex@denx.de>
>---
>Cc: Conor Dooley <conor+dt@kernel.org>
>Cc: Fabio Estevam <festevam@gmail.com>
>Cc: Jaroslav Kysela <perex@perex.cz>
>Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>Cc: Liam Girdwood <lgirdwood@gmail.com>
>Cc: Mark Brown <broonie@kernel.org>
>Cc: Michael Turquette <mturquette@baylibre.com>
>Cc: Michael Walle <michael@walle.cc>
>Cc: Nicolin Chen <nicoleotsuka@gmail.com>
>Cc: Rob Herring <robh@kernel.org>
>Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
>Cc: Stephen Boyd <sboyd@kernel.org>
>Cc: Takashi Iwai <tiwai@suse.com>
>Cc: Xiubo Li <Xiubo.Lee@gmail.com>
>Cc: devicetree@vger.kernel.org
>Cc: linux-clk@vger.kernel.org
>Cc: linux-sound@vger.kernel.org
>---
>V2: No change
>---
> drivers/clk/clk-fsl-sai.c | 81 ++++++++++++++++++++++++++++++++-------
> 1 file changed, 67 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
>index 628e53a3a26fa..0f8e2f2662d87 100644
>--- a/drivers/clk/clk-fsl-sai.c
>+++ b/drivers/clk/clk-fsl-sai.c
>@@ -7,6 +7,7 @@
> 
> #include <linux/module.h>
> #include <linux/platform_device.h>
>+#include <linux/clk.h>
> #include <linux/clk-provider.h>
> #include <linux/err.h>
> #include <linux/of.h>
>@@ -15,27 +16,44 @@
> 
> #define I2S_CSR		0x00
> #define I2S_CR2		0x08
>+#define I2S_MCR		0x100
> #define CSR_BCE_BIT	28
>+#define CSR_TE_BIT	31
> #define CR2_BCD		BIT(24)
> #define CR2_DIV_SHIFT	0
> #define CR2_DIV_WIDTH	8
>+#define MCR_MOE		BIT(30)
> 
> struct fsl_sai_clk {
>-	struct clk_divider div;
>-	struct clk_gate gate;
>+	struct clk_divider bclk_div;
>+	struct clk_divider mclk_div;
>+	struct clk_gate bclk_gate;
>+	struct clk_gate mclk_gate;
>+	struct clk_hw *bclk_hw;
>+	struct clk_hw *mclk_hw;
> 	spinlock_t lock;
> };
> 
> struct fsl_sai_data {
> 	unsigned int	offset;	/* Register offset */
>+	bool		have_mclk; /* Have MCLK control */
> };
> 
>+static struct clk_hw *
>+fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
>+{
>+	struct fsl_sai_clk *sai_clk = data;
>+
>+	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;
>+}
>+
> static int fsl_sai_clk_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
> 	const struct fsl_sai_data *data = device_get_match_data(dev);
>-	struct fsl_sai_clk *sai_clk;
> 	struct clk_parent_data pdata = { .index = 0 };
>+	struct fsl_sai_clk *sai_clk;
>+	struct clk *clk_bus;
> 	void __iomem *base;
> 	struct clk_hw *hw;
> 
>@@ -47,39 +65,74 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
> 	if (IS_ERR(base))
> 		return PTR_ERR(base);
> 
>+	clk_bus = devm_clk_get_enabled(dev, "bus");
>+	if (IS_ERR(clk_bus))
>+		return PTR_ERR(clk_bus);
>+

This only applies to i.MX? 

> 	spin_lock_init(&sai_clk->lock);
> 

Regards,
Peng
