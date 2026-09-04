Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3837F33A;
	Fri,  4 Sep 2026 04:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496471; cv=fail; b=RFKmSv/XzqHCg8ZEC5auepnufb7XaMYD2syrJ8AO0Joes5bmCOiA0Fx/tc2irWhbAS2OPrAIj7nYGhCiMDvWTGTzgM3nc0ysaLW2QjM0V56h+HjeIATYY7wGg+XFqC26Sl/bo3R18SvBvEY2JnL50abzAU9oNM6CVr6CWdOSW7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496471; c=relaxed/simple;
	bh=6CQU7gL14DM1NKBauuIUkhAYORmeAxvUjtSLrefRHdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XggYVCQGnFrpNimqtGGatLGbp/5y6xDb/Lmxg536c54VCB2StUCb7tysaP5K3RIpJATXwd7/Qh+b9oOAOOn0raLCNynlvaxwEdpNtLc79QmdG2O+1j2Xqw5S7BkeHrrVHpuCpRdjQVPHMTCctY4CCOV+MNZ3h3ZrMuj66ucJxjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RqeIYa//; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RqeIYa//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+RXw4ipTFIcOgM6GhASfgcYMp3uAhHn8JT7V0KYEKxF10Va86+tdpd3Dj/Jffrr9kM5H5VZ00Cpxfu71Vr6Wd28vOqfxFxSXxwMNYDb3K0+cB51mPF+vSFk/3UcoaiXn2/zLBd7tSN+nO9rGv/5Kz3hFZTssdc9rITNGgxbt0gYLKHaEPJGmGFrYmS1edMIaw6GiFm4kYP//voRTuS8ncHMcJqWz8+rJtM2Z2pBrklixDTtgktp7Fkyh7ZU5SXSnLlXSpilyT/5ZmcYSUE0+Tj7kIONzkLj+t5NFGsqWms3+ntAnjBRyH1Un/v30EEiS6jbMfPfFgM9bSvLKXugpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu40Gk07x6eMgJ3+g65sMu/nXfXUSUUOKYpzZ++/mZ0=;
 b=Ce8dTg48HrY/kwudUKWdKUXMOhLbMkkMY/s/soaYFzvEQpZmRvQYQhMwxIQF5jUnOzv1NJ8nkcgi4mI3mbHedZU5b3d4t3WmY1KAYAM/EIXkUu44d7SPCoNN8KlQQFzv4dOLAfebsjkUVYPJT2JQXBw//bvGu/eyYzqYLsWDvk64nNAtygAuw13mmYcH5ESQy/d2aboWUCw+C4RvDSlCskpMGw4Jjnshd+kSmPxtVRBahE+pvCpVr+TmReE4VWzQs34ZrrzyyVoFT8DZiRPmHknhKkeQ48Gj3y0vaoqG5W+Kd0M4Bj+06tQajfzvEOWsCtDa9rU0DbTxqWIVyt6myg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu40Gk07x6eMgJ3+g65sMu/nXfXUSUUOKYpzZ++/mZ0=;
 b=RqeIYa//a72nsMwlUo1OLv8ziiwbaVb9D1x2IY+rwvk/KYBncj1roI2IXXK4akzieh9hq6ECnBt5cV0QuV9HkW1Y4h/AhioofQR/yZpH9LG9uVbXJE2wbum9j2guIh6mvfUnT+BrNWtT+KJ5Y6d4vNI8/I0kKbM+3CChjVzdjou/DrukK6qubbRY0HxooxTZBN3N5zsoKhas6Gkp7BAUv3Gy4ljg6TP8RckMKBnfXl+L8ARTTyCJTeHE34C8EjuBcaR/BkAJSH4nFSsaffvPR12YWvjFNCl1WrE2TNYL2t5DzQshsUZoKT8P/vU1krZFb6p0hqMaN6qIWu/YXB0AFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:34:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:34:26 +0000
Date: Fri, 4 Sep 2026 12:38:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the
 OEM field range
Message-ID: <appLSfbVZMAoXkab@shlinux89>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 97761822-8b39-4cbc-63bc-08df0a3dcd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3oG+W3lkOJY+vh22re2NJDnZso/kzN3S11MaOoXVmm+xvNkI5w/XCzexKsBMmhr9ZaMrNy3ZglM5iEuk7T2hhKOiCGA1l2f5or2eImiZjn5Sd06irW3UMwUY6TrvuyK2GrQoTknToDorYNCG65NDfYchmW0B/5OIiDZKVW3U3RiqzTVsOQp/iAeKFFKGbf7BB9HfARBZB0zSiVtq1RbC52amIM9pKi/YFhEXaGTTu+Cn/7EQ57gIENHJ7NhFxgZVupnmqqiw1Yk64GHKz6qF5BuJGUA+1YsLQ7PPtkTA7iWwTM4cw1DvSGMPX9F0y/jkDI/7/YtJebg3wUrVXIjT1MNp8ATocwCGXz/kcjzk364Txc9u/Gn87P74m0xcI+/ggsgY1WVuFKE3O6lsoPnRoiziXpnHrG0COvg4U57kLbtJ5C4catu36DJTwgUZKVonYXj+m7gApq/D2uZOkzodRNbqRrx/UkDIpXgbc7XRPVbcvE6GlABt6f+CKhBUGvGnBiJSbIg+PCkz3a0hUjy+/79OWI30jcna9sK1/rBNv/XeJrzYXRe54MppOz0/3lEscgMIw9GcdtPXoc37CIuszr6qZNTfkM6jDpQZ95WiZaHaFgPBNvYEXLucd7qhan9hqUbGnwwPc0em35CSNantyD+YsNQ3oKuggpURyMK+ee8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TInwBX58shYBf/as/L1rVUzMFn6gtUHOXngq+frNGCkGAT1su0CuPLB3tbJM?=
 =?us-ascii?Q?ijaYixGKaV9m5KgkbVRA6wnXoL6BD+lEVWLQPcn0+ZtM6l5pvf3RsLRgpdS0?=
 =?us-ascii?Q?cHsfznpP5/eY1PORD5AKJrdfEAKIcVpiH63z1pw4Jh2gkY55u8FLmaNMv4sR?=
 =?us-ascii?Q?GOEURV4b1tzugYnLqB9OAmdTglEyGIDLSHaq3WnB60HNQkg9YofUVOPCCRu9?=
 =?us-ascii?Q?h4gaRiG+UyScljT+zCcXd/Ypzb6aYKy20IO5Za4z16ESUkhJDMRKVjGSALpC?=
 =?us-ascii?Q?yXqAd15EEno7dbCv7LkzevWpqz4dD7rJBDfXKLAlecj3+oOTGi/gguBYSoLR?=
 =?us-ascii?Q?+BB2ouzdTXPWrbiWZh2KGf9IC/ir/kB2jozE0TuWoAWsl1a5TPK8vm0xRUy3?=
 =?us-ascii?Q?mtzlKrQdhq0pE1kw+1V4RV2f+rZlWXc9LlMF9usccpTkyKjKGbq86NjZRwBv?=
 =?us-ascii?Q?6jTvy9K9y7llhTOxzeOuQ6eZcibC1dBE6+d9MKJUodq+Ljg2gwzUjleOHHve?=
 =?us-ascii?Q?QJj23kkxdON8rFzSeMCsCF4vZkNi3ZYFgwZZGNa6lKgAQVKC66Lgdq1STnxg?=
 =?us-ascii?Q?aERoqSpeGCK3fETgZIBSBFiz7qeCDQsGateoXRmXBQDSkanfoteBCR/cC0yM?=
 =?us-ascii?Q?P5PUUG2LgBCBysuuhluuSgouObdw+q2NjQxAo3SrGfS0rtnXL/K1XTDrRVZD?=
 =?us-ascii?Q?ENMNNYcCQlnzNmjgpB4ShnH82pLhplb8fC3nSRKD+O5PwgITjy1qE8iO3zoC?=
 =?us-ascii?Q?/VkDlZKzZjmzKR7gSQ0KGMN26annZ4Ms0WvoMtHPCtkJOxu3hXLErdCP7ceN?=
 =?us-ascii?Q?D3GGJIC0NxGBjJArQT1MzZ3TXb9eYXKLU6Kh6i3V+lvQvQ8xGw9k0L/Uodly?=
 =?us-ascii?Q?JvuYt5DwY3jSCYExCfh5t71dzBb1j81AhWQh88YfPSzEfis7n3pa16Fq3wHC?=
 =?us-ascii?Q?GSf8GzucBfj5IBKVX0jMZbOJtixtpJBV9zAE/OsvGvj8bQAG9ooHqbqadJTg?=
 =?us-ascii?Q?EkVQVxI3w4lnxBGKM5MFzGM+Swqq7Mw0iziG43gUrmhg3W+Lod04qq5z4rhJ?=
 =?us-ascii?Q?seQvZ4O4CE5Cu+c07kitoqtcDW7LqKatfo8FOHbSyH5P6GUEE8BdWL35DTWA?=
 =?us-ascii?Q?LKcYhcOQDtN7xH1/TVjjzOUXJtZYr2SdYb98T+0DeV7zwCHPUzMbpLAQEANs?=
 =?us-ascii?Q?qPPQTfd7R4T+MKdYxkmWnzGAMSWmxHtpsqWoeJdE+6+Jpjmsygt5DYVsfDXk?=
 =?us-ascii?Q?i++e1slhk3vO78V7OoXRl8zkEzk0llbIhm3b8ZQwsTXTaBBwh+/eypfpwUBi?=
 =?us-ascii?Q?vR13dspjNGqbnvJGQMGlYeea4l3n2H+98+MiQ2/phAZUZfrHNC2EGSgWgbd3?=
 =?us-ascii?Q?6oz7/5uxWFfA+L1fE2anLo9mJ4HnYyNniOqgNQHHSVdDPKgRI9TsnWl5KLtU?=
 =?us-ascii?Q?RqNU0vw1m8dYSQYZzN/qg6dsnXwiEvg9A8Jjcz29Qa5sa94t0jBbrdE+IKqN?=
 =?us-ascii?Q?U0rX+21LUyt8JtDsjPxW5yJkunSMAosh98wU1bvLoEf3mYKdpDvKW9uH3JqI?=
 =?us-ascii?Q?gSWAFiFKa5qyHvF5q7uuAb3ZvN6x5gxju4Ufo60KYqn5uWjN/adczVEjftKr?=
 =?us-ascii?Q?ikFrLYtayTNMgKmqXxHFvq8qauzAPoHbynjsLPvFobqtXApkJC3ufsLng5nf?=
 =?us-ascii?Q?nJgHl2alupSPOHXYp6DnSpmnEwzyxA0ZGjXXX/hF5kpMAD5MPB3PAV84yZmn?=
 =?us-ascii?Q?mR8VYVGm9v+wMwxYqSIDwkCLAAaMa4p8w/6Zq2Y1vOxkDe60mlnq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97761822-8b39-4cbc-63bc-08df0a3dcd03
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:34:26.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLnL2JyZe2cb3yIMKjmL3OnE6YmX/oMowxeDxSlniedDJW6Mj+8lF7Q67GMR502kqTWFoLxX++6+16YfE4Qsgx3QdsJm2lbyi3mtzwd4xjuMhBr1irqRZ6pgvbtjrxzF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676

On Thu, Sep 03, 2026 at 05:32:14PM +0200, Dario Binacchi wrote:
>The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
>tenths of a percent, and the modulation frequency in a 16-bit field.
>
>FIELD_PREP() silently truncates values that do not fit in the target
>field. Moreover, the conversion from permyriad to tenths of a percent
>turns values below 10 permyriad into zero, which is then passed to the
>firmware as no spread at all.
>
>Reject these cases with a warning instead of silently programming a
>configuration different from the requested one.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
>---
>
>Changes in v13:
> - New patch
>
> drivers/clk/clk-scmi-oem.c | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
>index c1ebbdc6bbc5..4dac608edd4c 100644
>--- a/drivers/clk/clk-scmi-oem.c
>+++ b/drivers/clk/clk-scmi-oem.c
>@@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> 				 const struct clk_spread_spectrum *ss_conf)
> {
> 	struct scmi_clk *clk = to_scmi_clk(hw);
>+	u32 spread_pm = ss_conf->spread_bp / 10;
> 	int ret;
> 	u32 val;
> 
>@@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> 	 * extConfigValue[24]    - Enable/Disable
> 	 * extConfigValue[31:25] - Reserved
> 	 */
>-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
>+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
>+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
>+			 clk_hw_get_name(hw), ss_conf->spread_bp);
>+		return -EINVAL;

sashiko's comments is valid.

And patch 1 & 3 have fixes tag. Patch 2 and 4 are new patches.
If you would like patch 1 & 3 to be accepted in this 7.13, better post them
as separate patchset. Then CLK maintainer may pick them up for this release.

Regards
Peng

>+	}
>+
>+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
>+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
>+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
>+		return -EINVAL;
>+	}
>+
>+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
> 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
> 	if (ss_conf->method != CLK_SPREAD_NO)
> 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
>-- 
>2.43.0
>
>
