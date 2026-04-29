Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D633B1B3;
	Wed, 29 Apr 2026 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777428667; cv=fail; b=eeWJmOClRjBHsHNx4yIRd6MRkE28m5wySP245UO28jPzIqdaICgeg1OvqqQq4RBJX85Z8Az2gwyq1CKuXYekQTDceGd+zBQWbETwWBBZ6M4wpMHPRhqqqm8PNImsU7hEy5qm/dbqUn2QdXahJnwmsZ5dUI8oHYxu+oTvc48kN24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777428667; c=relaxed/simple;
	bh=6GAmvG+2IhLBvb6d+bT2FsJ8/T0izydU0bvPvRfiLfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UOwnf+Mh1gxu/H8r5ps6KMrkzM5UN1QSJH0BAYypL2MglmDPRlaOLySsN7jcLz2oOzlKXCW77trQR9HeMIuhsIz/77TWeQTZV4tcNM2os2y5c1qWX4ulWhf9VmqiP3MbA07y5FYMpkpNdOYHHTu2joWgIGbLye4x3vJZ6RN9tbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g85LOsOd; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g85LOsOd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWny9JdHRmPRTqpoaczclxhh/7cKOuyHHsA1uZD2qCUhLUBOinqU2sySzeIUyp7/F6YJZ3a+jKptVmZ9QjFXTWuqRMhiVRjJ0s/e9z9wmcwdDAwwnULFKiAVWBbXglUkEC2r5JRM2E3iNMGfdPOPEmst4P9Ll/ktksT8SwIXdith/CpCH4r57es33iP6+R496m+lyYvSP4MmirK+DBLYWsnUiw6e4PjjYWl+Mqirf8jLntb0Gb/44kf7xwL0WnvSSwPemSv8SOTdKnx933CwGJoOvYUBaH5J93f3vGh7t9ml8MYGpZa9fQJ+jZG5TvW5esjVYwnlvrBtQOdfPnYDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GAmvG+2IhLBvb6d+bT2FsJ8/T0izydU0bvPvRfiLfk=;
 b=kGgsTkOpLXYg8T/cTJY16vQM4mW/je0Z1OwHXpVCnlMgnVUE2oC+5ZU1fiSRhtVJoLPYqqJHWZRvnp6YmoIulWGwsIph78jWS2aZXoZOySCimV2s3ejjErQ8o94ZOnES3nHWPeD5jjgtmxgNe2X2CYmnVCD70KO0xRuYHSt9YStufvokwAjX3hC1TosMUOg6F/+5iFZIGq0JenqQZYb2enLT3Z3hR+JumHzcdQPGnTeHHwWDO0gDI7IdpkY+3QmswzhSeJt/BxpfXoJnd6yb5AiZajbZ6sO8I/tWjxVzdnPNBK7IlB4tbZtbabbEhRsCUTDCTs+JbQRs+HXvT57YyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GAmvG+2IhLBvb6d+bT2FsJ8/T0izydU0bvPvRfiLfk=;
 b=g85LOsOdCPJ/N5Oe7bqRfBCIMZQ9SqNfzxGEmObPG+EzZi3yIbK65zrjWtWKHinfcrLRVl+/IDovxKC04fU8bmt6M/n7M7wMYFJYyqQJGpTRFfKd8cM0hphGec+GzUBzUyrgUdJcHsG2W9qH3G/d3L29sarQ1Z3tCPl74iaefrtLHyCGN0Xinhz+v4pW7aummKNRdJC0iYhbYyRnCvJ9inDjBtkPd92C9PKExt6JhLEQ+E12+sSK4PMNQI5tCYWXtT0Th8IJSmZmZ8fMekcdUOJtKKFvnLZ/howJfiYe9X8pzRwJXGz3BNreL4vSj5+E/jh9x2za2oV2x+jMsJDYUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11158.eurprd04.prod.outlook.com (2603:10a6:10:5c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 02:11:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 02:11:02 +0000
Date: Wed, 29 Apr 2026 10:13:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-clk@vger.kernel.org, imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Message-ID: <afFl1qBLK/5MTwan@shlinux89>
References: <20260417082910.489995-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417082910.489995-1-hongxing.zhu@nxp.com>
X-ClientProxiedBy: MA5PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 235cc537-b890-4346-a9c8-08dea594902c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h8fpGrgco2j3Ym1vc+42uXK6QwHv0f10+nPeEQLjw1U5d/PNHuW5j/PX6ors1n5v1+3e09hxy7cUc96/x+4qmfQe1lInFyAlySuRD0h6zDW+35PfE0fe+SMQp0yHcDi/oJEdx0V3TknKOGljwYQb7o9VKSYfWww8PJEvbw5NlyhW+w2GpKWE1hKgirvDPRBjKCFzKZKknQCWY9+ZmZ7UnEHOFI21R1GfbOzDD0QfFFrfyFEoFB9aq1acS2u7cTwvw4Idc8psRIGMVDkwx/qQSNCkZpJr/vgXvSceTsndD7ZOWxPQvhEUHjKY0j3d5oaM3uJlMVX0796psdnCBSE1gkg2SYx4apYyM5i5WHhhJENxDij6C11ljvn9L5PLs+DGyuQVfMrWhvjchZcyai6C+sP7+FhPB8915hnGk1MU/0fUay6EU0xY1l1iKnXCjWprIMMRTRXw96OZi2cXVhmPg7CRAsi5N1TC+6RuYgFTZvC1PEze/4fF6TaFC5rnBNf1zFwBlu63LwHk5TLp7N6wbAY563q26Ltqq0lQPfgIM83tgKPTUb47bkGbbtqLcjbBtPVP9xXeqfNX7xjV4uPw+M20BF37NF1cZTOjOdMPpxoiDB6JcRSStld4hL4kebTXlXSQxCHPddwQ56LJmt2c/2plxeinDp7tkDd03kFcaY5ZPRcBG0kK1XGS3uyQ56Z9OuGYQIjAXca0O46nfZv7/JuHgl7c+GviIztCO475djGRfk+9Y9YQ92k6crMVlmplsRP/ootlqjTDbASbcw7wHy3HcY/V2Idjcr/P+2x8pgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?csPCm4V3jZOiwdFCdGWi74YeO8cmvLHYrdLULpQB/QoULE6xYbF7G7kHjny2?=
 =?us-ascii?Q?L/TR3tPAx1Uzd2vMMdqsKP6k+cXKUReiimg861fNmQEDow1dCTeQ7+ZWwcV3?=
 =?us-ascii?Q?4KceAVo30EyBrDVkR9eCNHAIxWcdPTlywngi8uzqqNo7hwgmAIgDc01TWAyY?=
 =?us-ascii?Q?w2ujSWhO++7yDL8IR+bftbD1LJmD2JNqVkkJtDG5wYBoUV6mVP6vsaavC2Xr?=
 =?us-ascii?Q?q1S/oknrplk4KZGYui4GE0JvjVTsq6OJlr1bfb143fGBXE1kpsy5VKCSL7h3?=
 =?us-ascii?Q?+1mRuDcTKWSiaFtmv2ZI5lXfZOBhDC99wrDLsbjgRuloGPYHdntkaILtQett?=
 =?us-ascii?Q?wJP/zJoBIfH2EzfD5KnOjA8bWZ9AklmsbqmT43z6Ji6/EPRepFoJfMPDmWTG?=
 =?us-ascii?Q?I53BSES6x7JtonDsrmuO77djMHUofX+vlP4D8pg8ISM/oNZuxd4Nh2p2DOkx?=
 =?us-ascii?Q?vqLgzrFbMHyXHvk3nmmaG25VYTspmnA0McUIthduIGib/VnO5HwbyjEsKY7Z?=
 =?us-ascii?Q?XKKDNr6QhkU/N1YtdXmURRU6G/BTtLuVXfo2yn+w/q++EHxxt41D2igBxcwZ?=
 =?us-ascii?Q?C+9lZmCfMqRAZ3aAtBMvNZ4UJbrLf6hmI9zb5bAwsJnwDRp9F5l0f8EVJaI0?=
 =?us-ascii?Q?pI0sRM9MY6u/08IiVY7z+rThmXPjEUk/2XKMnoKyvOuU7HmLeJ2upI2qPCvP?=
 =?us-ascii?Q?INPyz+O1UDrXC9NqcNf78YgNqoFighZNTXW/OPYf0kPUhliwGZkafLUKL8P/?=
 =?us-ascii?Q?vlvb13b4gyry/+Frp6ZN0xlTv9Y4mXSZXiV448+HGwP9gElWgTytBdYOc5Ze?=
 =?us-ascii?Q?VoiscX6sYavPGcqpq8LhTEkgsRwInPWJwovolFegbKwJ5tuRFAEtPJ7o9W1L?=
 =?us-ascii?Q?FUUJaJD2gxinRj6FQxDcZysbuXjm27IjA72i1hu5I9eoB2/ewl2frPzsFvIW?=
 =?us-ascii?Q?obmFHprUH3zvtHjg1nMx7kukZdThSnKENn836KI0tXitLnKrn4jz0Yhp9FFk?=
 =?us-ascii?Q?1ETdDMi27tUjadSi2kiMZ+fc0oXdXdGjYsTE0NdLFeqXiwbowWEnNi1b6EcG?=
 =?us-ascii?Q?3u30M78bW5e9rsAw4nlx7uPSKEk1v7qje8mVStKLAJouUnAC0krlem+l0E8K?=
 =?us-ascii?Q?LW23gTpeJD4Zc3zHjgYnJ66YINHceY7RC0klDEqhbGVf9r2qZeQuadb86MlZ?=
 =?us-ascii?Q?uP3EmCdOcqvaWMI+Lui//fKjQw8ZMRuZ82qlABHxqlVG5t7NWGhXI2MlmwhE?=
 =?us-ascii?Q?M6oqaONsEaWz+kwsWhPXSJNVopm27txu4kvvNNzsieSo0qyCojxK79VEO9nR?=
 =?us-ascii?Q?GU6esObxkq6VOEe+oWX7RMsvCT2GSaYd3BptAwBXg/bcOg2zf/Pma9lhca3n?=
 =?us-ascii?Q?DCoJ7vMhUE1TqUWUDxkgTuiwVyzCQAiTTbuClTuvufVeza02UgfSdnZlCHNS?=
 =?us-ascii?Q?z+rECSF/TJcCo+hUzqCeT0ewNmWcttMve4RPFIwfIWWtXyBhTl6/vGzlPfx4?=
 =?us-ascii?Q?o8kDx/aeV4Gq+NE7MrthAaU6tyce5Jvbe35jq59VtzF9qoF143hS3OJEKx32?=
 =?us-ascii?Q?Js/9WtO6JR80i1dRRljv1llHro+0MOA5bg07Bnr4Lld/w4NckWwY6j9TelMs?=
 =?us-ascii?Q?nWNuKOGq43QFSVVmtDM/e2ufr+N32ZKhBEFbgFNt63FCni9tGjgk1PLDVIBx?=
 =?us-ascii?Q?XjdiJyYIkXjYO+N0Ti2AxcN4+QLztGU2n7TaJCLRIeb7QRF4i3hRQhOXwAA3?=
 =?us-ascii?Q?Xapq9Qg4kA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235cc537-b890-4346-a9c8-08dea594902c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 02:11:02.8591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWH8RnHWDGmxcyiIxEXkN8cjlAOoA/bdziEyjYsNJIN91eyMo73v96R7Z9NdIO2dtiocdh0hE33O3ZUXZl/ZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11158

On Fri, Apr 17, 2026 at 04:29:10PM +0800, Richard Zhu wrote:
>When the internal PLL is used as the PCIe reference clock source on i.MX95,
>a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
>testing with the Lfast IO analyzer.
>
>Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
>the transmitter current reference to meet the PCIe specification timing
>requirements.
>
>Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
