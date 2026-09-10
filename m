Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAC48EC90;
	Thu, 10 Sep 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055175; cv=fail; b=LgJgA7r4+5avRaBUoV0/1uNC4nXQY1/jGkE5PTS6yABtGVUr9YmrhxSWO37humfEvxVUAckyolsfqPYCRw5QVg1av5Dgu9TfeZwLvlhL6PBD+NcccVJ2tmQ7FUknsqrZkGMLcZHLBqY9rLNQPvCFtz/k5+1AWlI5tHPDwgietN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055175; c=relaxed/simple;
	bh=D7Lpj/KLAfNMyaUO9Xo5Uo6rqPtbNeRhuvVca72Ly3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LlXwqqcAdFWXLU3lfscidDvlyx5d2M0M83LF29bFKo6l22bj2gex9SHqIAzj9Lmj/vAx4AuU04alCgKyiZZfefhd6Y5xKJMWAXQL+HJzZeyGgYpKdmcb/1guSL4O31d6/3gr90ivA91ek0+hoYxsPsiuv3JGwS2hNq9Tc4jUeck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t0zHjkqS; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t0zHjkqS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXBRfEi3E1g6cibKTigPWO02mL1+EAP1yNx9PsCT/bqvQcZdWx3ZgcXRLDOqc9vEGwNNnqh7WksxHyBLZL86GptRezuIEXkBp5KroDmtv4MQyi2Uprx5AAJQNLIx5tDbYOdUseqXnlXBR54tE9rLYS4L85GTeVd9AdDEyU/MUoMwqlqN1uq0KnH6doUG63oFf+1aH8o5ZUu7EULpbfP/s2hA6BrMOPRaLZf7MZajRqSgaA2VjKM1wV73QCZPJGdGazJzTnE6B7KKZumCexeGTS44JHzZEfHAYuOanEN/yTAYv5eBdpwfCEM0lKFWwdwj961w/pcvR78xAVbggcjX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhBW4neUTy3SQWHZrBijHwOAD+/7np95Q11BFjhZEzo=;
 b=PNCeOc3hpS49skTWYhWShkObO0NEvwk4qJNl9zIsFwvbTkvuX+2QmJ78KasToPAPw4jOc6somcG16gSuccJ4qpPL/9o9nWhC1JDiE+vW6rbBIhgqPHHSjYmaqBvfgUu8SAMPlgf6eJtDXTyK2qqQ1zMPbrde535GwmWPLRs5Cr1TN/5Wjc5L5sy6hEsl5SrDu8IhpgW9iMXvZFVdcn47r6pU1FKGXF7EuiXoq4EBKsRPSgPNFJsupg4HCZ3tXHPBa4G4jAt640IDQZim+H8Nv2OC2wi+b7wwtDOuuRuncYQJEwBbyW9wbnfSxguMSbj06OsWKNWYpth8oiKf+yQv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhBW4neUTy3SQWHZrBijHwOAD+/7np95Q11BFjhZEzo=;
 b=t0zHjkqS72fK32O4km010xg59ToB9mlsAilF8R5IAA4ih6U4Dq/tWaUgqZeY5hss5N8/aJPzMqMUk/ExWb40ahV2WQgXd30Vu+Xwr5BDmpNF5no5e4W7RYBQLMDUP1h1qR7VTLcvn7I3Bc9FmHSvzR4G9fAzZ8GUURgro+HEll0A8DERM6QJhbT940tNRMAkOY9Imc3wP17O7LrsDzqv+Y9Cs2d+3ezr/xK/iCX6QAejRRxhkcPWpkrdEaVp8Hqf0+32A3h3cqlorTRaQZhA6AArV+c9Yc3npuY2MxWwrNPHyfpw3bPPuPqhmk1d1ufpCkF5/NkAwrvQDZ7x2eFBUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 10 Sep
 2026 15:46:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 15:46:10 +0000
Date: Thu, 10 Sep 2026 10:45:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Message-ID: <aqLQt3vAxqA421qc@SMW015318>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-ClientProxiedBy: PH8P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: bf99f35e-fe67-4f66-7392-08df0f52a276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bR9V7faPYDULRugLpdI3V8j2YHAQ2E/odXa9gkdBHz7/OOJZNGt7weMkDq/wQlYztKd2fOA93BxDc8oVoQ8+3CM8+tlcSrdwmxZg7ic3lnjmp28ZD0HWj4HdGJ1drolE82k7zbcNJXSWrSe2hM4361OpGDTbOXi1j9mRA6KXKFi4TrbnCUHb0W3RjT7F/6e7Ci9h4vAoFzG23yG8lY0VZxrpGpAwWsAH/78s82U4kEQ+6Qk7JX+pqse1+uddQBxueNZuWrHp0iy+hYcJWUSKQHwfDJ5/fysoxb551yUGrm0Dj4+d1YGaqansQQ0IuCNEMy+lUBnrAKFlvA6pz+AwcH+4a1791EeJKv4Wvtmxp5aPXi5B5wmPi48gZPUy7kdesnjDwfrfHeRc59OUAY5EoSInGIV+4azqjX7RCUHAup9r+f+RtvzGWKS0mCB8kgGX8Y6o386t9I1wCKkPTD+ptq2UzH+exk+yjxBnhJ29KutDKu43mm2hKFgEKeSxT6FjrH5meIWbz5yzTZgjT8NJoeUr+EPq0VGahfh4nuOvw2Yus43uxTygDJWoJuc2wIt9+X1dcmJxlGLpW31GxhcDxO9B6t61FIs76eBqizfBqO6StVVZIdKzQH37I6NZK6fUZQH9pJxvPYtOYJ0mXOGfWfCOoNlT0zmHgqAc/KnRtB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xyiE6lGUBeA7fTFUHwzws6U0jR+3FIwzXDD4bAnsOW4zKiqJ7U0/dzDMssCb?=
 =?us-ascii?Q?NMHgNkycZekPcTZNpo21Vd/aVRNgepRvkPPK6KkAnryHvNJULdmpmuuZyMIy?=
 =?us-ascii?Q?AaeEnTE9BuEcfmcAOhTpSH79yt7ujphtLKMLPOE+aenkcjeNKKalI0ZosnFc?=
 =?us-ascii?Q?PHQL5jRIF1CyhNt/DPmEcR470qtE6/VN28IE3BHl6LIMomeZdqVyEsjNUZhn?=
 =?us-ascii?Q?2EUjSpm1Szr4AXBoAw90qK5IFHueG6DOSLZdh2fxNaESaItDWlJf6M2QukhV?=
 =?us-ascii?Q?GfjPDztk6MR04ps4niYyaBLF+ilS937EFK/tAqzlwq14kn8saT3WIrvvnOSi?=
 =?us-ascii?Q?u48s67LGrYjgzVRbdBNCo0LaTZkdnSmZmjfuebxZd+VEhSZJAbhGgmyo4Byg?=
 =?us-ascii?Q?oS9GUEwLKSHCMiN4+XxFVYhgpeuG7ZGNPviJo+INc9Uid0dbIwccW/ZgKJ40?=
 =?us-ascii?Q?VFl17g7ZDJWS6YOMDoJqcZwwQzaLv0uE6f4ey0z0gAUqB2ZonnLKhw37BlVT?=
 =?us-ascii?Q?umlmDh9StH8VEc+u8uVDg8O2kZ14w38KzcTn1uI5am/iqlh2tlHUFflc+GJT?=
 =?us-ascii?Q?WUVLWFyVzim8+wafJkXFkl435LNLdBWFuUYWDqy9bS6cbGKwLaUq69gjcSLA?=
 =?us-ascii?Q?DVcbHHJxAbbYjOK7/ZjnE9kl3YIOYVVz5qhUVUF8hYcFy1lZbCVzZVC1Tq8z?=
 =?us-ascii?Q?bwpdOfvu0a0FL7JjPLkZHQWp0ue5Jw9MczFkXjxsbasEU80iguGyOPsern0c?=
 =?us-ascii?Q?EY7rXDivu9Z6bZdUC8EY3AQkcVPiuXKS8v3GwfsDlDjUwxHv71lZTPEZPQqV?=
 =?us-ascii?Q?mH+cI7Ac5udYbzF7386Ep6hp1702cOwBG71afr4FiWRdVEehc364QM7l+QhP?=
 =?us-ascii?Q?VSBN2blOmMvCfonlXnpZD3ZorsDBdaRDzOoF41i4juAXzscO6qCFQ4gi7XFQ?=
 =?us-ascii?Q?WnSc4TeCFNSzwyn15HNm2ckwu4H5cSeKR3tUDvCX37NqNtAmba92z5QzJU0v?=
 =?us-ascii?Q?WxH2rHEZ/F8Q2REF4aJB/iT06IiQLUH3tjSQPKZcGyLuUC15rabxRZfzdmQn?=
 =?us-ascii?Q?4yjeg/mKsYE45Xw7r1/kva8WhL8kJawLZQzH1taFHhohTHLzpHYbfLdyut6a?=
 =?us-ascii?Q?Zz6MQAWu5nD5KeyKUHFdPziBNDNFUzcj6CuNnNNomUCW9+w+I+KzqKNykHtC?=
 =?us-ascii?Q?yc4yJC27gXlue63/81I7+UfXLWbXkuFmj06zLxKPJe68kUSK99VT0LGyhxoU?=
 =?us-ascii?Q?y5UjvsT/Ezv1J3e+44znbE/MuD/Viktja1uzkbUBrI7QSlV5vXcJ+Oj95YIu?=
 =?us-ascii?Q?rRyCu7Y87cHuDOrPGxq8vGYy4GvnjKg5SfAl8Cb8K2e4uCX3fTcZLSGT1ZP0?=
 =?us-ascii?Q?3hoqltj+u1yyaATzDPpp5IO6dZZfKXMEq/go6m1XbOgbciWKdAT3j9QDjQXL?=
 =?us-ascii?Q?GY7bYiNtiNtvwyvVMQDH2SpfD/9COB03lMj3pg2VYAtN1Ua5zkL25aNXGiiY?=
 =?us-ascii?Q?5C33p+jmB6kFjkD37Iv+SLGbbCdUn5dQvQUeR19YHihfTQRo1TTxIu/LsdiX?=
 =?us-ascii?Q?jApuW3q48REiMUDrA5TzLSWjqi718As0MKgxUlghFi7gGMOGFU6b/b3AKrXS?=
 =?us-ascii?Q?/SIs2Vp2lKEUGHMrqLX+83qStwzI9E1dHVgDZd/d+7Tac9cNdNEy8fTJg3m3?=
 =?us-ascii?Q?p7nZtX7wrgPMmxMqGAxDNK+dR/DVUoYJ2E+UhZsaI9M1RFrNj0R/IQn1bEHV?=
 =?us-ascii?Q?D2qTI8XDSNI0sTsebfYDg2RQgJyYWe7AF6AsUPjaa3HRyPY45zMe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf99f35e-fe67-4f66-7392-08df0f52a276
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:46:10.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YK3IuMkZGDzBo55xdDPGPbVRN+OuRG9WFpu1mNP/amKU2fab0zDvL+Z1XRUso8cTwe8YAs0iNSB1ih2aThaCyqXUivy9+CghN8HznmZO7eJ5+0PRSREJu2pOTmRZCjGG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On Fri, Aug 21, 2026 at 04:56:16PM +0800, Linkai Gong wrote:
> [You don't often get email from gonglinkai@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx93_clk_composite_gate_enable() always returns 0, even when
> imx93_clk_composite_wait_ready() times out.
>
> Fixes: 4a3de5aa7743 ("clk: imx: clk-composite-93: check slice busy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
> index ef20ceb2d255..953f67d13978 100644
> --- a/drivers/clk/imx/clk-composite-93.c
> +++ b/drivers/clk/imx/clk-composite-93.c
> @@ -43,11 +43,12 @@ static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
>         return ret;
>  }
>
> -static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
> +static int imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
>  {
>         struct clk_gate *gate = to_clk_gate(hw);
>         unsigned long flags;
>         u32 reg;
> +       int ret;
>
>         if (gate->lock)
>                 spin_lock_irqsave(gate->lock, flags);
> @@ -61,17 +62,17 @@ static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
>
>         writel(reg, gate->reg);
>
> -       imx93_clk_composite_wait_ready(hw, gate->reg);
> +       ret = imx93_clk_composite_wait_ready(hw, gate->reg);
>
>         if (gate->lock)
>                 spin_unlock_irqrestore(gate->lock, flags);
> +
> +       return ret;
>  }
>
>  static int imx93_clk_composite_gate_enable(struct clk_hw *hw)
>  {
> -       imx93_clk_composite_gate_endisable(hw, 1);
> -
> -       return 0;
> +       return imx93_clk_composite_gate_endisable(hw, 1);
>  }
>
>  static void imx93_clk_composite_gate_disable(struct clk_hw *hw)
> --
> 2.25.1
>
>
