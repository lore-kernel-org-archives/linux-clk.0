Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF636923B;
	Fri, 11 Sep 2026 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139690; cv=fail; b=dYxCvGX5L4x0gMEialU6benMiozHhyvvCmddKiH78TnfUR+CtQ7b1F9xUZqa8R6Wnuj32Mr5CmsjdpzdesEL7Rx9/pOP14li6y662j1NOVJh3LuHY/wr64HpGvjluuP6kJZ7mgZF090cUEKwviJxHZvVrEOfRlmPA++rSxDv+2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139690; c=relaxed/simple;
	bh=Q+z5LgpvHG6CbOJmP1xMKkOjhaDHRYCmPGAp6O192k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jey2Hhr+osJBEHfwTHIB+2AgPhBmPX0yNz10XHap452vWhZR8UhBPWE88z3QfBEizSDZypzKJAcRkvDrhsqDle4DEXcNB9SVP1uaSYPn7KS7nv557CDowS6y44zGRCO31mGWRd8lDaHCbs3FOUe5sxDMR/4ZZAScScglbk/njE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HSdLkBXh; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HSdLkBXh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzMNxPwTqI+OEAC+xbNGyQcesEmvL1mMbpU1nWsgKElHJWxjEhe5T9HolEMsJCcyZ/D8yXSgNJ470Krg84YkR6Y51IYwhZlCRWUPWcScJn7fJjM3uL8ckDwZNrk8vm5TTgLj5ERZLGcvBHLvbS7ADTaHONVlza7UnAWTmAJHaJ7dCkWLQvqPWXdo8N61YvR1g8UNwVWiIDW1CV1vf0T9HK7KQTDG48RBiqmxN6w8ad8pOiMeMjHrAFhG7QVNsz9IEfy1LGD4WIYeKKFXT8ZkiPCDPiwtPZcSvuG1ul9HG1zSRYVrv92PmNMV+1Izi6PhkcT+ZnVtIKFx30J0GbwzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+z5LgpvHG6CbOJmP1xMKkOjhaDHRYCmPGAp6O192k4=;
 b=nISaQ7jaeTMaSTn+MaIfJTJBwyghdSH0EtmUfGMe0GWLDlM9TtZTus/KYv+Z6xX1cxCH1Uf6Cxt/FUjcb2EZxp+0B+XJElOAeoUP1IAolC9mrbyx+Qd89R4lXoqapVjqXalj5itTNy4n+BtDoOCQIQOzGkyk62mvHndbFObT20WE6zmmmCn5NhgVseFq8q3HqKgiZUWDHjP/XKd+HISn1qKKSeNvkO1Qzjfoa2kMA4cEQ1D0toL7CLRLbGe180cRf1B7GMONoHXqTtvIYU5A8dxFcotqg0eYacVmG/2U/xGhNr+LMtTKw8Q0yFoAvdTI+n5171h6UzPTnpbpo5BHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+z5LgpvHG6CbOJmP1xMKkOjhaDHRYCmPGAp6O192k4=;
 b=HSdLkBXhBOh9linb6cEk5m9qvFoi5+6UynfPqoExl8cYSenHrojCx4c3ZzZBXkgiRbFzJ9yMonnj5HpOhPzTpo8Ahl+xuUhkj+AzGpYqcKrKFwyRJIRScrxAyzSautwW4Uj1i9wkC9AcR8RRaiax6xXdU+glmTQ0nFI7/LYvzfVKlONYlap/y0nEjSkOaxwgyuMLmu6KQyBL+nvy49yo+Eu+T/oCKQFG7rIaPHP+f1/OXXfGFOjwwqZlgzQZIdd/+pI9FYP6fOr3LXeVptT5Z6QT1a06u6rMbAx1zoqYB2H8mucV0SFUiQY3gfXI82gOcYj9hVXXeU37sH97VMmdPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11705.eurprd04.prod.outlook.com (2603:10a6:102:50a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:14:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:14:44 +0000
Date: Fri, 11 Sep 2026 10:14:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frieder Schrempf <frieder@fris.de>, Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Message-ID: <aqQa2jM7PSOdkOcJ@SMW015318>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
 <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
 <ZR6PR04MB37577605914AF62FE1F29B5ADB88BE2@ZR6PR04MB375776.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR6PR04MB37577605914AF62FE1F29B5ADB88BE2@ZR6PR04MB375776.eurprd04.prod.outlook.com>
X-ClientProxiedBy: CY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:930:17::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11705:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f3edd7-5897-439d-82fd-08df1017693d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|23010399003|10067099003|4143699003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n2BopTN+uwShzrvT/4Oj5RZ2fJdNKr7AFqxTZyKtGHGVXIQTBnFnfvHRsblSmg/WB8ohNoEQrrngpNtgnqf/hZwcaxXFtBtg9pnfDSd6Uxko0ewRfx/0WkJ3BSd+DBFWNkj6PGFcX3/i81o9+z5CstVjgI04VZYXIdcjjnplk7UhQ7+e8PY9Ngf4zW/BTIRRW59n71Gc+lbtcQv6Mmr2j7esKpPrncsYw8EXdOY6MNxxqYCA6XtDBcYtaUpTaIx5Hl5lxkyuWdP1v6tz94G2TdLrH3EIbXcTh7GFA1bcPLDSUH7inAUKlR45EwP9day5we+YYFMubJTWjpHEijj/27wpyChzBnCYM7qtdidispfzsm+HNQ6NTY1gjuJNeCjSQ7rkGaEikls5zVEtM0tMIS6P4ytkjKRGBo7ki/wOdm2P8mrlB/cA7ynary9o5mrjsF2eCpiW9MChoH25EpG8XARJlavNfigxk7BsIn8dllHRQ6Ridd1TfMdAeO0jBlJg7X3r9/aQp5JL4it9XO8PQ+gkT+wgKfCOMBdK09MltnQu3ZlSc9OxOaFKoQUswrIWBZm1pJgBnhJxT3RTgmVIUYNtgqXH7HGNI1Gm/5k+ErH3lFXASdu69ZjWOy+O41XFqKfbRI6ievZMSkzhe0rP96fegtlktqKdfSEBtgi6u0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M97WaMCufOs6U3n7Xi/UI7bpW4L3QyJM2k929qs86OQiQR2blmA40lPqzDct?=
 =?us-ascii?Q?KJ3hMCuyU4iPDEJn604KpdKWgApJ3wz5o4PjQvMQ7BYE2kcaIIitmQvGit3H?=
 =?us-ascii?Q?g8/jB1fAkQzUawGmlCfVe6B1QxPgmPnUC1XELPREZnlZZbsX6yOjGhsDUBDm?=
 =?us-ascii?Q?P/4ijG6hODxEzPiqHRjFgvNerrWWsAFrxizomtTHpVNR4GclaFcHtqABKNal?=
 =?us-ascii?Q?V233TfSDp8aEbr3TZlaofK4xvpwQ7PZQ61tE4gz31WOZSF0cwgCjuiwQktQm?=
 =?us-ascii?Q?6H/Xp2wYre7IjjTYdF8zylCyMn0whrRX/Z85/5mUqpx4aMXsDNge40Qcb0ti?=
 =?us-ascii?Q?4ngic1YP0chPuNa5wL7gPKWNfL4fiidfYkTf9LMVflOT2+QE9tw0lruUb/Ef?=
 =?us-ascii?Q?QI39TTVyuSZ30D3feBV5kIxHHIxwyi4JMRUTr4z3m2fouKiRDmls2QeaAwt8?=
 =?us-ascii?Q?yt0fC2VRvVeAclFrC3jaCwzEjap85i09+ApHOur7sWm/l2SQLx06n6HMXuYv?=
 =?us-ascii?Q?Uf69J8ZXygy1E5S44d+2RC5mEJlaZ94mxvpHWQffVXUdJgFx3Xs3KVk57EDk?=
 =?us-ascii?Q?+4DVSqSQmg4o7gEwuTQT5vjAp4eFAE9+t3kE6g6uAqnk0vGM4hwFE+03O0iw?=
 =?us-ascii?Q?XDFb7iPNntVMA41hq2+3/INNsnyrg47lPQe0qlmUP4oTnH+wzUnj/+BaoPr3?=
 =?us-ascii?Q?WL6ofuWA0h0Lxi/waM6u14pIIhWKUS9Ke6/EobD+ztKxymgY3RxyPRxZVL4O?=
 =?us-ascii?Q?T8EsfJ84OCf9aD7X1X5/hbjb/VwMbsAFa+YCgodx+e0YDe2aprxXcYc9QLvB?=
 =?us-ascii?Q?K2T1nn6a42MOwzJ+kCJtD2b+snqGW2Pj2f6IKQTZE0Fwx4oeH/tV09YSldQl?=
 =?us-ascii?Q?O44+z1+Z92+RS1xENtW1YWMw1mC4XYXn9atEHWqPlfcKJqMFFEF2NWeivrFz?=
 =?us-ascii?Q?y2BsMenzN8dScdkEZ7vNGYov3nSpZ25cZpf8f4q+W8pR5OSXH6RIXc7jLpOr?=
 =?us-ascii?Q?TtP2Fjm8DonRaKzohtyFOW7dBZRobPgZdulv57m/u5J9InmAIw6csBS5zEio?=
 =?us-ascii?Q?1LJworVTf1OeDmShsjqC3AkC68X+OsyO+KAjNgl9hAE2lcL4zPXslyawAoPf?=
 =?us-ascii?Q?iFuM9xwAOQFT8L6TZyA6TigyGzg3UPMpEeJT25s378LCJFJze4046522Svfu?=
 =?us-ascii?Q?fJvppma53QFRwf+JOBGLjbcCrx2SG9w/U4o/JKkNDwW45sUeFVry9ILHExgQ?=
 =?us-ascii?Q?svB848uirh59c+5q8noUk3+QhDl3US0cdiAubLu4KlFRZuLQ55Q3thUSqBRs?=
 =?us-ascii?Q?JMM+ypFmOUJ7hjU1nnLZ9JNvAT44ujnDhsd3IvWyycvNeL7xWxK+1X4CSKlU?=
 =?us-ascii?Q?gZlzFxSHo4XcZzO32Gtk+15uqw0fzUAp5oRwH9S05Euj+p5wyCaCKPNFBI+w?=
 =?us-ascii?Q?STFyFAB8GY16wrh3L7W4deCKo4u/THNTofVloHpugQwAL33BjMTl4eXRl4c5?=
 =?us-ascii?Q?bEGRUmXy7Sx707Y1pXjeTbI5J8C2KcXMEo5rOvduF4WaCzKZuvjki/MG9X/O?=
 =?us-ascii?Q?lNIp1paMnhFj5bd39cdeVywJ2Vm6q2dNDwgaZljpoWBwroF7790Ir4n1KfLJ?=
 =?us-ascii?Q?YJiw0lsjBraCml7+yKlxx0PAwolkah75qSipDChgkwZNPtGQq3BmYWluxjnn?=
 =?us-ascii?Q?/2agNcMyPZhL6+aEkAnNhNEKHENBZsigoOuB/43RoWO3v5zeqmdCrwtpbfiu?=
 =?us-ascii?Q?NeL8uC6zgQJp9I2VJ5tr81kMrkFA1txsW9gPrN3uOLsTJDMdGmWa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f3edd7-5897-439d-82fd-08df1017693d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:14:44.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFRzBN5U+QNB6yIdOGpBSkOlb7Yt1GdxiyJhKXj/INSpYSo8umF0lScHkgofNLZNc4PtBFI3BYPSZr6/BOzhUK0WcJYzPxiA2lyxsH31+6Qe+9ikZLeaHIvo6V47rMfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11705

On Fri, Sep 11, 2026 at 02:02:06AM +0000, Peng Fan (OSS) wrote:
> > Subject: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
> >
> > From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
> >
> > Add the 350 MHz frequency support that can be used for display with
> > pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
> > i.MX93. It is also usable for parallel output.
> >
> > Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> NXP Confidential

Please avoid use "NXP Confidential", this is public mail list. Anyone
can see it.

Frank
