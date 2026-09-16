Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDC3B71C1;
	Wed, 16 Sep 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575131; cv=fail; b=j3O0nMpH32paq93iH9uV+TWziHrXcc6RlQi5hts1mnNq+uTcNMaUfywp2v3ostKvyJ8YtCsmap++fqLg9Umvrqs773sudeshr63rVp+ocJnivJNhygWZlevFKvpnptVqgWAqJMmo5MEJBN1/gG+/6EAQaSNC3CT//Y73xSIwwuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575131; c=relaxed/simple;
	bh=jg/pzyTPl79+MMeWDBpnzJRqR1XwrDtvboCtGFWVvTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bLtGoZ45GSW1TBSHy1pt4DtoDretEX9f7e/E/WYHvt8cQL436hKk94gtrQlhPEWzeShzNzQ7sCFVlBU6oOSKPTwrnhmCKuPfO+oKJySYFJnLgLvTnsi/zHgivPnwzsodhUfm6PZC18CIkLqhZN9SYqGFXf3XavkCOBpHBg/dSrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wHKnTocl; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wHKnTocl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFghNSQGGekJwiOlDVN5vgMEfHTKnrGCMV9mQrt+eYvhXid4gE3VQHHSErknUVDpimzWcBC6bivLmUltaBRcRYtelK64C7FnQkZ/p+ZNnS2n7Tat+agRPpI7I+dceRAeZY5BldT3tHfbYKSkiYxELNPS2Aa2jb/VAkuv1XUrMS9j4xX6HSjdoLBR225FA0J2DcR5Ujx8cEpXCURhHmyyI+IfWbwz/HQ/+B1qzxSyeC/T5OsDGOlpcR1idw5vgSezZuafK0Z8bJxwK3a5EqQp1j27zvnPD3ucd7IchaZlE9/zX3j41VBz5SPa+NF8mQQbQ2g4wwRKO2Hm4tNN342/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg/pzyTPl79+MMeWDBpnzJRqR1XwrDtvboCtGFWVvTA=;
 b=R1rFxhk0xNL1Xv8nJTV90i7DWE8e1RWzCZn05+J+sQDL52oNfSL/UDMSvWzkuRV0FJuPSlJDSRmUMsXz7W1tCaeD4cVTIRP6v/Qgvrz++2Kt/9rfC7svG5TYMM6DafLstcuh7sfK48Qc+pWcQoLfW9UFBwZvpivz16D8aYhH/q0Rs3ko7BruQBqzLp+SeWqQpUIWaRB9OKQl4HWziJOsTlerb2RASBtWZ0kpdu9m0jtNzC8dpMEzIcDJF/4sRBaTaTyFqBesNsu3n/WSSWMCGJ9dBqJy1bsuAAvnqm61yiqe4YYtEYZk942xjrnKs+QSim+rELFn4Oj6cff9hVaIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jg/pzyTPl79+MMeWDBpnzJRqR1XwrDtvboCtGFWVvTA=;
 b=wHKnToclUJBh4Y2JcaeMxTPRC9N4MoGs3K+DT7nT0H4mSt1HbRJnaTtsqP44vKgyBN5e1VfURIPay2vroaikZ3HgL+2VbH//AmGQtI1nbOxMQ8Pg/ByPPW3rFPDLXQhYObxhVjHQB2oAveao4f74Kfz2KJAusheyTjOaoON1usXlSEnWTp3y9u6Xz4jwdmYaajqyp7qdnEfcjVYOOM1rD4LKHpgqZ+tXU3t3fNWRgXGUh1jEH8M3NooZ14/e/bVixTf7KydW34eVWi9rK/0bi+ykmVFwRNorRenQtwUYyoKm1G+IFOwqKdiB9Tyc59+jQBOgLJagMWsXVYLphJmlVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB166472.eurprd04.prod.outlook.com (2603:10a6:290:d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 16:12:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 16:12:04 +0000
Date: Wed, 16 Sep 2026 11:11:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <aqq_ymTi1I951uQp@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
X-ClientProxiedBy: PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB166472:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c1a9b-40e9-4ad4-b736-08df140d3fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+bl5gTm5T7RaxfHwoMjh5uFCJoKlxmotHwWPz4KZ29kt44iNcKSW6XsNiFmjfUMcGpGHE+5GTA4laKw1Scq0JAu/cPLeoLAd81tJ6Pt/q6LB9xcEDLZXk/ODw9bfNtcE//5NINTTIwusuBAyLNSMizCyaw1Re18Ow+0PrjjAUv4hP0TNJveLth75YBhyrEbb3NogFmoHmeRI5aAh0GKTrnZfvsFF+K1+KaZrhmCeG7P3Fuh3Uy8HD8VebnOMjpPjNPiiGucIrMtb78GQgTAjzsQ8lYh5DttSfoVMYo9qqd5RNru1uYkw8az735/XN61Ny3BkuuaLv2SaB3j11tXzxFe8mMgdrDFciQxMYUTUm+aonSzvz+FiOSzJWlx3f1ee1Yuu6P+ZZgKJFeA3UfjjLrAqhj4lfYQVqeWGoIWU1cv1XhjnNq3ntZ3ydpfw/1L4/5EdLH64TxyNcqQlJIj/OUYi7iIWUCQoIuzulr9/Qu2JmtmYu257/RrNidnUadQoVCHPYbLQXdBOjHuVjv3G2CphQhh3hwuoCkHddGB3zDFF5K0mhDITJXZP4hK/As4OlDQaFOuv4rkh5DmuUZwFUi8LhMysdtyjkVL4HcT37BMg5ghdCYHxf8vKgfODFR0xHarMhqTUI5k+NQX0o9RP142Kw/s4S++AyYz8cyzCLhA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0m2E6CSQ8o+mBEzTJoH26QtPdFKqZoJDgb3lzoW6cvKSM5sGCNjHrbBr1esJ?=
 =?us-ascii?Q?lPsmg/pPewGGQmguS7MxPguLTH2NB6XEhYwJURAvDFZZUOk4X7o+TXCpRKbu?=
 =?us-ascii?Q?Vpv/UrAbTBf0j7UgCdL8y1wqKFDZ70LYZiIW1Z427cwuoumZhLdewvzQJDSo?=
 =?us-ascii?Q?ZeM8kV4YyaLwhw44qhUpomq8GwPp1+GAU2OhG5Fmv+Ig8ywjvAz3xUi5jivH?=
 =?us-ascii?Q?6u6dbxrIkAbKAVjc3WK6S9P5DFJHH6Zf/zsnJHhai3On9Hr+R7M7xqPLVoFr?=
 =?us-ascii?Q?s7rcizTPzb7LUyS6uv1hzkuzhsWbmfujDlONC2YEVqeIunoVkImWozfnlEEJ?=
 =?us-ascii?Q?GzmEqUbNqZJhhEOxAZMn7aTBuqQ0dTYCyS8cRo0peEoKLiKYOBdN2+V8Abzh?=
 =?us-ascii?Q?t+Z4F1TmCNVnobvczW96Wt12H75o258SWOk86W1hiN0vzyGnMPMHOzcG0NhK?=
 =?us-ascii?Q?QB3Dmo17904RSmnvhXTIg77F9KK1vENQI6oXb/pP2fkdyVIrQ3XPe4KBG4T1?=
 =?us-ascii?Q?Kheb3UK7xa8tpwqMIRhvtjLrWv8rikvUSdAgZGJBRzKeblLsjTAa8Hw7m8MC?=
 =?us-ascii?Q?lv/Ecr5QRqAdpKQZsfbodvS/bg7g8YItETX8Jnf0VpnirJpPCj0WVQwTSGfB?=
 =?us-ascii?Q?zvh2fuGmnGjfBevBsEkyqqxQ5VzLuyZaRS/4WyZR27t3Gvb/bPNElzl5UNjL?=
 =?us-ascii?Q?TAqsmNhZtvj6Hs2KO6bOXhKHBKaXR5NaUbVtTzAgG2zcCZsfNQqPvbs9d6tq?=
 =?us-ascii?Q?nLsNiFNJEHcoMat0zxCALvDgTDQgtX7eKrLJa/9RFQ/wf4/mmH378LUQUXAs?=
 =?us-ascii?Q?d/CGLkbcpPrF2pw6eX4BcS++DXRF2QvtSEDIh3PUC8O/jkNtWVOoP44wpvQh?=
 =?us-ascii?Q?rFDKKdDfyAQt3hFYsf81/5qT4Wvb8wB9h84JmMf2vRi3soi5mbG9KnWcUQr7?=
 =?us-ascii?Q?QosiDwyUz6vfy3haZ18R5qVzeW5GE0PxxSFzVX5aewiq0iVuepwP1gMSdHnd?=
 =?us-ascii?Q?bm7j3gmgj7tRyXdeYogMRlTqNrIQM79eOBvc0zHmHPN4dpv3YKKF+eSMD5qT?=
 =?us-ascii?Q?cKEsg+WvJsOW9dZjZRq/j2vyDOhVDj+Al92Q0kqmRoCLhExsvbfqR4VZIebk?=
 =?us-ascii?Q?kbehWzDjA/TIiPnZQbcOXqZ9Xg3dBxTt0JrMIExeFZLj3in4HhBNun+kRuHw?=
 =?us-ascii?Q?e+RIdQl8nwW0s3M/D/TQRO8VRO8dkaq7ts/byf3LJYkn9zXYCtkyTBnAMP/j?=
 =?us-ascii?Q?PptRkKUVqlzHazokTdK7Aez6ZcHa5vlPkhhpfDuZ0ihyvpboScKajgk2Kl+n?=
 =?us-ascii?Q?0qRiHbLizHycYbt3vP39URA8KUj5eiAl2qtnKowuHVvSjjf63kQRL4Yvzcej?=
 =?us-ascii?Q?lW/wO1lj+xTD3+WZdRFOowMa8sTUVRe6fePiU+yUFbkFnJX4FjmHH6NlPqXt?=
 =?us-ascii?Q?FlIPhQek9/Icu6gj0jabLLzWhN7q+Lx32n2qTQ0uy5RFdF7GA3f3XkVmqmSR?=
 =?us-ascii?Q?V/Qg86e+9Ykw7jHmL3MCQCt2hSqRjdnEPhoOJaBaFqt/lKHdsqrpjAVB9MHT?=
 =?us-ascii?Q?VM+3v6b/qZf6ojc8kLPByhrjer0eN0uiy8Pdp0s0SJ4Vyars5kfCTWN8X/Uz?=
 =?us-ascii?Q?cZXliKZdyfT5ye/fs2O0lIGsywXMpIGdfQx+uam3NFSKJQdJy/pu8tF2X/+W?=
 =?us-ascii?Q?0Qfm/eHLNZKHy8V58gNukluk0VxB/qgc/VVhn/wxsnym7Ig5qmYY594D0ZTq?=
 =?us-ascii?Q?zONAuDvSjWrjJxdMbkw1p0B2+kf+rQr7Qk3Uky2deswj7C9WZ+UG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c1a9b-40e9-4ad4-b736-08df140d3fb3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:12:04.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7ly/FCtWtauukEpiceuKX/YHDHjrCDJ0gg0USTVZ+IXtqZiq7AgT1LUaenKUHZwlhJU+J+10IfpEQuBvdax5nZS7CmwIVAK3ZclHLI8S4YGkOCNxXU0kq9ouG3e1XZs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB166472

On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > on teardown or error, causing potential resource leaks. This series adds
> > the missing calls.
>
> No, as I've explained repeatedly elsewhere, it does not cause any
> resource leaks. [1][2]
>
> The autosuspend setting leaks if you will, but that only matters in the
> theoretical corner case of someone rebinding a different driver (which
> will soon also taint the kernel).
>
> So don't exaggerate the impact, this is essentially just a cleanup,
> which is fine in itself.

Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
include these pair functions.

I get many similar patches since scan tools is more powerful now.

Frank

>
> Johan
>
> [1] https://lore.kernel.org/all/aqpd3viN1UoZBkgL@hovoldconsulting.com/
> [2] https://lore.kernel.org/linux-iio/aow51Nk-cet9qaUQ@hovoldconsulting.com/
>
