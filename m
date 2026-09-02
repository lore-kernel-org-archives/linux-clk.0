Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B036EAB1;
	Wed,  2 Sep 2026 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338040; cv=fail; b=ktz2MfAgqwjJa5D0kFoqAQTgEx1c3gJlj222u6dFDD4+TpHJnsr0iJUDgvc/3rfbCAvgmXRbaNERZzZRuWLM7tZ8tRimwy7m5IedxwTQFJqSZgmmW9rFmO/rVSK4QFU8GcPhnXxF5T14zK8Wu+FSAAHKKCAJqEVkMaOVdco77wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338040; c=relaxed/simple;
	bh=z3tN1lUIzhzhFG5ccr3HXDQ7aMo2FXRcf7BL3XIBiQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a/vkGxmv+Vym53yIpPFZRyFg6cyE05BrJZTL2wNgTzqDgQX0O971kM79MyIvN4eOgu8DDxqI4kb7WJWrMXXiXiGqT8WPDVWGlZgWpjK47gj6UwkM7mm3iIhXZ31QNuB6VHeWANdBTInz9C2cC1aLlKWOi0bDXY7DpFNUn0qggCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=blFZWQ8K; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="blFZWQ8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe7TZEpHMLY59r0PZbCDH57Vo0pE127+kCrQrWqR189ZdYdStJHfvsCV7xpdUP93BY/W14p98ciInQwZnpqDOZ6Az+gabZ1OZLVctDUPe75EamKisEhegmmVEDH05hWJ2r6iHmyG0ManSt88kh0c1rEG/YCKcLgKNTaCSjIdQwLRu4rHN5lxQzUtzHPkGMf2bfQkqt436+qquRS/MkYzbfNpNyfhMIi4kEDi15DG9tpgMpiO2TXDFczg3x7i+4487pisajoeUdyelJOVyR4zGetqy0foj8w7el4k3WkskSXmIwbWXxMUGbOysjpffTOswLU0V8H9gfW8QsPPJCG+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zva5KCto6d2hrK1bDp/rYd/QjtZ6Sp/TmqOoOuTZ+Ss=;
 b=cZdHmY6WrLnC6L0WB3bE15CrcV+18Hbt4IGESDXbgksBNs1rniZ92fd+vKtpNPDkZhgwsCi9CB+oYjhJv5ZL9lUgDEQ8bLCIKE6Q+WeCWnspUWX0cmY8GX7pYzJv/ybIL214Hf+4nUpSbAT45pV3ndFnNQIlZ1T3kay8T1T/nU3agNpTh7RTOn023bEopzJHlyPXmI/bbQSh6qKtCFzD4y8aFFhjeJVRrOUmEdsXmUunu0gMfd+dA3UQ5Dw2D+YEPqQFDqeAICQAOx5O7AfLE/oivmMxzEn0S0JXnBeOobzF82sThnyRCaMf77vcAQOeMWb+bQXpFJ8kk1A8T9euqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zva5KCto6d2hrK1bDp/rYd/QjtZ6Sp/TmqOoOuTZ+Ss=;
 b=blFZWQ8KLXMCH+j0kDXbr77gTPpPE+3fBEq6XUQRMjJ+GF7UTeVVijVkZfq2pkNHyJiB+QroDzfZ5HsKGDzQ0AUTDvu+ksWUZoAxCl/SGpnD7Sap7ckZeoKdkAiWZlldlXqYu31Y4CRGcmepYx+yjHVE+UPEewMEoFwn5jNFaK/maubsas41hAfuTpvyhOFc97T71NgdcNBCwApGv4SrSXH37twP31aHHDio6p1N/XZgrDFVri4k+Ziz8lnFUU+35VeSalnTYrU2VHNGD6Rp5jYZmB6oZeTOBcxgCVUMgTGNKpELbSw0Hb7xmmP7GRFX0HaqYr6cGSr6o/AT5uOhwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9404.eurprd04.prod.outlook.com (2603:10a6:10:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 08:33:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 08:33:55 +0000
Date: Wed, 2 Sep 2026 16:38:01 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>, Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 1/2] clk: validate spread spectrum configuration
Message-ID: <apfgacuyUC96x44N@shlinux89>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd6d976-9734-4227-3823-08df08ccecc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	MJBVEBxCRCsrrjMySMvkn9SDTyFwHYteNHFWpzI6NWr0lCzxytO0BKWBsOfKrVROgGOuVs1q5EbENLGMr2IxqZoAfeLNBtBZOr3f3ZPKjKxiEj2nIKWnomTTmTYlAVL8eugoQ2YRSClCOwLaJ+skjsOKGNFw0VAC+T00cIkoJe90GkoebUqvx0xQrFraMuqoGS3/nNJBecXD3B/EXEKTcW+bxgdJ+SKfYI+unaj+Anbsfm2Sg/G5u5us5a0Q7TSycwcGPZG121IvjXkGaa6S5gT2Ow16hJekDdN70eOSObNIC5bp5duqvNB8OIxw1d2EJZM6hTWJ7YPoEwhuEsuawZOu23OTMFBZbrmT6us+5DXHZ5zu4lPxC8lUuCdsW7L+l6moiCOSzxr96YKMw8AMVoTHTAg4r6hLQz3XpAK0fpjrIOWGeWoqys0M9kkPFxuuK1ZbexW1kyK+WJPdmr1TymC7QDwMu6eIrlVpF8pM2gnzPtIH6j5nD9OADjtXkL4V93mCJ8fpVaANtxYIu6id1wHfwJU4vlVw35hCLwy+xo8e2osNFWDXoy6EUqAZrFXzqNRvM8toQ7XhRwKVuqaWR0tLAakTJ6amkaJo03obADgTjvw6lFayXDVf3y3cgXvhD3qXjDsebfZWz7T7lwATZGGvBSw5Ej/i9KR07lXZ5UA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8b2QZ/9FY8U1KI9Cuyaaer0pa9oK3+bi7vykA935mGNcez123M5+vY+vFfFM?=
 =?us-ascii?Q?78PaU3dlkNVcZsOaGOARcQ842GIleWpqDt9XUWQpzHaRGr20GwvzzR9wl8Mf?=
 =?us-ascii?Q?hBLoTV+yf6IIW/DcgTCYgddWg1KkXpvoKggOGFxFwYJISAFkmES22EnBwBXt?=
 =?us-ascii?Q?lalInU0GOXQ982G9Eq5tlo9nHXsYH/7h/mI3mo5jhYuVeBiK1/BTp2s+nOHP?=
 =?us-ascii?Q?tWXbm/p5ZraTXrh6D6TLozfvV3RocQw+jm3iaG+fsZpu6B+RC4mnZMKFp+fp?=
 =?us-ascii?Q?9ErlUHWdpFg6nM3HjYWum+C74LTqfg+pvaVRGS1g26IKsDobhxrGaR7QlGYM?=
 =?us-ascii?Q?4eQuc8P3gclxOF7CudmJON+si8W77WUYi9Qhe5Ko2rVdV5N3EAGoqQaze4od?=
 =?us-ascii?Q?zd36e+U/MzjY075UfpZwS3auNwYGN2mYnFjNkWAqPhsZtI49/gZ4X1y1da5+?=
 =?us-ascii?Q?6pWrrpMWjjmIzYwMcWBho+jCeqyT0ikpGaWJKCyeRPXM0enhNnYjGC4skZrv?=
 =?us-ascii?Q?skvKAu3xLGtNKdaovPnSeGjckXWoLvRTa/qTZnGdKqm8V2iwKw/y7te11tjI?=
 =?us-ascii?Q?YlEuYhuzzHE8ewkbjIPz642zanqtCKEUw4IEEzP1t3dr8blfC9eAl68TN1OP?=
 =?us-ascii?Q?sBkoUUzuVuSrO2z99d/wz5EdKt1Ucb4rRUxm9NIF0JUiYwH1HNlHKxdtH6eX?=
 =?us-ascii?Q?vjfA2HPuF7unyApfr+E6qeK3Wx/pjLFZ2s4krPdPg2y2+CRUAcnY0nO5ukwO?=
 =?us-ascii?Q?Ke6L09rR6jdn7fDcroTdV2NHR7fedj3uH3fooPLbuEClsjuEOVxiYtMKAmtj?=
 =?us-ascii?Q?U0FVC4jEEEhQb/p+uqtf08b3fiNHvXSm3AWjDAb6ArnbgZb6zM2Y9VTf6aFz?=
 =?us-ascii?Q?dT3GXh05VR1RLQDvEGqW6nnpwE3YBe0A8+c8T8PTbraFx1fXTmY7e2pF5/oO?=
 =?us-ascii?Q?ht1tOdjh9qbtxlB+rGN7mKYwOadeENF/X8g2a4M2du7W1MNUxWEkhX1qe4kj?=
 =?us-ascii?Q?dc4jr9UPWL0Dhi7cY2LIk9Lb9V6CWvGN8E9jJfn3PSzcwHWKyvHVObs9G7xp?=
 =?us-ascii?Q?wqpbwZYJ7fnbY5OZNnW4fwF8tylhqUps15JaPYhZAHERoZTFMbt1F+7sxqmL?=
 =?us-ascii?Q?7ieVfEIRtJiuhcLQKVcynnIrImKFE8xH3mE+JmtJ2THkHLrNC4jpU7J/tZGn?=
 =?us-ascii?Q?ONtmcKC3DeieJELG1aK+fsitHxv6lPmV0LsIAs6AVDoeXeW7q2L0l6vQnYi3?=
 =?us-ascii?Q?VQ8pM6N5iOzVVeyisOoL95vGxgAiDxBb8WstHTA2j0FTPiYoS8u1Ut0d+dig?=
 =?us-ascii?Q?vlJ98Hvdyd5x7Yd/zs+mT5Hx91VpCC/EzY1ju+DEPBPivS1HDXNvIeBiyGDX?=
 =?us-ascii?Q?Tyc9Ohnv89xBPvg+WbeFEVRXsjwVjFZMa009WofB8iydIAM4zUuvzv7/nBUt?=
 =?us-ascii?Q?CpivEaYWuKUZ2BoD+a+cPLMq4yr1zCfBJ7ldkaxLzEGo7S/IN0g7WsOT452r?=
 =?us-ascii?Q?tyGyHYcDhyPMQY4eoFh1iprzeJOcxqmDg2N2GxtqWrJnkZ0I9vyWmTe877c4?=
 =?us-ascii?Q?EJ2pfeDMhHu75bkqUXdCGvtpbK9pMvNzZ3PxgByK4TFX3dSaOx4d0RyDQR6K?=
 =?us-ascii?Q?KyvyGPP95E75h/PtNqzCaHECzXScsFVZxlT2ypJLB2Q+kEtcwtCJbeIduKro?=
 =?us-ascii?Q?2vlfOu4hARNnu/jRrOVM5VBKOCvzsogWFBXAfxK3N+zZnTWS6Hh33QyCnSgR?=
 =?us-ascii?Q?X6CretR17C24INK7fUU09MlbkRmuRwBYVQ7KgOAw0fA3jKkaWkBp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd6d976-9734-4227-3823-08df08ccecc2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:33:54.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qao0TgJQ/EXUcw3CGita0k0C0ixZZ0v3a4UDPkjvyTwz/Cy7m6lqZZc74QXA6SIaycnZnI0aLiePAEmAN1HONcDZGm/iVpnm+fCIZIYl2jv8Dt5rpMOzeMIPCEwtJio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9404

On Tue, Sep 01, 2026 at 11:05:17AM +0200, Dario Binacchi wrote:
>The spread spectrum configuration is passed to the provider's
>set_spread_spectrum() callback without any validation, as clk-conf.c
>only skips all-zero triplets from "assigned-clock-sscs". An invalid
>device tree can hand providers a zero modulation frequency or a spread
>ratio above 100%, and each provider would have to add the same checks
>to protect e.g. divisions in its rate computations.
>
>Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>---
>
>(no changes since v1)
>
> drivers/clk/clk.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>index fef87167a60b..208caf60eeb5 100644
>--- a/drivers/clk/clk.c
>+++ b/drivers/clk/clk.c
>@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectr
> 	if (!hw)
> 		return 0;
> 
>+	switch (ss_conf->method) {
>+	case CLK_SPREAD_NO:
>+		break;
>+	case CLK_SPREAD_CENTER:
>+	case CLK_SPREAD_UP:
>+	case CLK_SPREAD_DOWN:
>+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
>+		    ss_conf->spread_bp > 10000)
>+			return -EINVAL;

I think sashiko comment is wrong.
In [1], we reached an agreement that spread "in permyriad, i.e. 0.01%".
So the input value must be the real value * 10000, saying 0.01% * 10000

[1] https://github.com/devicetree-org/dt-schema/pull/154

Regards
Peng

>+		break;
>+	default:
>+		return -EINVAL;
>+	}
>+
> 	core = hw->core;
> 
> 	clk_prepare_lock();
>-- 
>2.43.0
>
>
