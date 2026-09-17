Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D64F7CB8;
	Thu, 17 Sep 2026 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662372; cv=fail; b=rAjPn3l1xxLNMBoO6b1psNlDJszwM3abwX5mspnpNDEgvpU3h8A21p4OxRMR1gXLK9JqqiJCxVXUkYdTmh4OBEfKjjzm55xlMljPNjoZfjwiuOECTR4tH8e4iPuwFTi6kT4JPJ861jlSbr4/GeSiOdEIbSvgCibpLPSsW3NBJfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662372; c=relaxed/simple;
	bh=tPd2UVQXPdOc6gHZF2nG0Ex2MAq2RguYsiVPpPYb3p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RgWZ4XcUMdHb69CHcG7y+rWMdJiBYn88NaeY80Kw5+j9mJ+a9D8DZ+XXZlY7U7RDAi/81290qq2Ar6zzCDVpFPjaey2Q6icX0SQ6Wgkcu8RZtC1/Jp5T14C7lepQT77Vd+n28YBWagjKHtyUMfHWdyWowVMhi7lWv3HTI+5ba4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rVqJ2L6N; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rVqJ2L6N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQGA2ML83Pm/3yi0F6WVpqI71F0HbxCRpSZYOQo6SgBACE+Qy3lMDa+kGrHv1L78cvFvaVr7K6Mk2xvEbrctDuBRlCmzAtxMIrH8pD+nbf6Lh+9JaRvhdc8RLsiHqeXBCC0mAnsd1p6lcs4qR/kPOZxB4ZwUDQWVt+U2YWXjShjzbX94gU7PURmb6qY8ZVSGJaymkRtiIrG9jSKq2kP3e0GFEF1IPogHE0rlAVvoVgW076tcj3EftK5jRRhB+F4yOoWfDLzk4PSNyustk61c6osqsq7cvBQetzrPMy0D///HQ876/yOwY6BTIERYEr/MbJUmCHDaBDN7UsrxBsdO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPd2UVQXPdOc6gHZF2nG0Ex2MAq2RguYsiVPpPYb3p8=;
 b=dN78ckQlQ2xs+7pxJr2vMa/UQrR4CUCk9pgQFzwcE54MzspbjgomurrL+b8Lh2yNeFO61CqhI5PxnalUgRTpRoZXRilL3ywm7hJykZkhfZMkW1fZb7SaRb17/rtBrd6joxbmeilBuox7l24JTprAH60jhsoWx573HrPHIxfAvD31Ii9Rza9WvtRh8bM4xsfJhViyjw22FObIEqsmJ3uJu3r9cDu7uDJaDs/RWqPeVRa/oogStWLLfd/Nj9TVTKfwQBsUBbyTLaIU8fKCHF96ojy/paMtUKgyGedY/NSl9ISXPNl9lxQp9p1+xTkFIP8Z/e3ZKzAneG3fqw5UO1wIXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPd2UVQXPdOc6gHZF2nG0Ex2MAq2RguYsiVPpPYb3p8=;
 b=rVqJ2L6NtEXGp+4pnbpmCxME21+45Y9zjMlMaTeywfZPvFI7DXs8BeYjfPqiZe4KiIPKQtffGexmMgo2VKNJ2WsDq58u55L5Y1ibaPtBgqKDNBeNEJvcHtPObzEd/otXfQ43Hg9vDa1qPHfaUSu0PkfAnMFrzuE+1bPxlkOh1pj/ENFdn64vblbbicF2bCVbkVgq15sC2iB6JFWpEah6p5d4HIP/Hti3WNr3hkANXgE3SlJVfq4GRXbCqsxGB1FlIOAON55y8t4AJE2fBr6N48RdZme7dbUIBYc3tT48A6n47FO1v58PHVrZaDpfe/eWrl1AQ65C7AlIBVDG397qtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10999.eurprd04.prod.outlook.com (2603:10a6:800:266::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 16:26:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 16:26:05 +0000
Date: Thu, 17 Sep 2026 11:25:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <aqwUky1jSMGbiXCf@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
 <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com>
 <20260917104233.00007a85@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917104233.00007a85@gmail.com>
X-ClientProxiedBy: CY5PR15CA0019.namprd15.prod.outlook.com
 (2603:10b6:930:14::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10999:EE_
X-MS-Office365-Filtering-Correlation-Id: 52db561b-2ee4-4175-2815-08df14d85ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|7416014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PG/jSEOGg3StMFh4HIkTdGU1HpXdsSJeDZvUEKB1edhcWvG70rb67Mkww8Nskoky3ih2aeL344T+OGZ6k2Kej9+KOK0KViPOR4i1xv4sWEFfkxVWmi4JWIOR19NVaZGU9AcopPDGlijEJR7IVJtMuBd8hC40NzhVXSLNMb5GV7bJulDaE0l2v7z2FgBTbyUGAm9muhhXTdRpDAdBbinFZVQ9QEtRfbn9SIZoSzqNgkDm6UAOB/QwQMJijBa+rKnxEq8CtyRoEiddE0Aafl2ECNWsDYeT8oJjkteDmKC3KfIWxPjAugTPyxXgVT/PFWUxKflpdjpIGT2uu5m1Q5QRhnja+eDEoqOKWLYWNdn5aL6e9vJzva3lq0rctUDxAsmCDhTRVe3eMFXQBOj6EU1rqOMWrI6XCi2ilKQEweFPOM3b5/UMyiFkmsweLKmXGWeieG3NZxe1aoSfo9A38z9sOzulC+O5MXSPPKYBH4NV/kcAVANzYoDXg9xt7GrCiu2+iZPHL54eUXHxsFvS9y6Q06v1IdUr5RN+eTwsfjPqU4LGVZOG3Buda0xsqI9vynGk3Ut5LwL82VTe4HPwsRyu+ahzGVmsNiE4/J/zNJG82ku7q648MEyOY8rDuJ6JfmJNJ8gbB6O8qI7e+HRVZ6wZsE8/HVJ0t48KCEXdnxKMxIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(7416014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RJvKLdVOWo4BXD4dLLziGPNMxafA7xUiEIasICN1AYTx760ivcJOYKM1R/Zu?=
 =?us-ascii?Q?kuToaGNJMjgTez+UwiHVJYlTOzS6D3ffHYIn+0dqNfL63EBh3DeMjqD/Vv6W?=
 =?us-ascii?Q?wocz0ne63Np1B4FMnRJCDrsReFwCUS8UCGUKmtKe6ZAZGasoM1kI3zwO85p3?=
 =?us-ascii?Q?wLpeEWqZ0GAoR55sO1fR2WOqIOzNqmsEDtjscQbZnDpXiufE413VNphe9Mbd?=
 =?us-ascii?Q?B/sodxeBgpWSef/BcslPlh6K2kxWjtlQHHjpJkJ7yfYfhw+A3bX84tnRuMJX?=
 =?us-ascii?Q?/esLqukQ/+Qf0AWIjfmSnvMg/5FZTsCvPGyZFYOjuKbJEpAMcGB5pSah3qYO?=
 =?us-ascii?Q?JODcnlKm210Kpkc7srBBOYEJ342pb6jjpeYbNoFsTNx6MUAMPU63wrfp6QEj?=
 =?us-ascii?Q?mGpLOyUhJqcYLlYFZsvccnCUr2Gt4JU1cYJVukWsNG3jlw5FraNVOs6aXFlp?=
 =?us-ascii?Q?xZcQ6iXesPdjKZVj0oyDJx7VOT/0eXAqkQzpADut8jHQx5OOyG4LTeOGlix8?=
 =?us-ascii?Q?+yg06Y5kcWKxjnN0vFryclspA0QIf2LAjm6kfQDbDsAnlVPWKmRyUzWceFaa?=
 =?us-ascii?Q?qvK8XwG37L5HziuXjAs7zX8ehFh8JtoWdiio0zr+rPaukgyvw3ICfGOrz7fq?=
 =?us-ascii?Q?qFurGlOHRWcagDagGjOHb/s14Oy+r3P2LyI/40hUv+5e4Sfdcw6vbSpY0Thd?=
 =?us-ascii?Q?ve87+p0+8P4t328lcfXBYRKf5uca6gCxhWmNoCDqLDUSoAYZBDcQC1qECNOk?=
 =?us-ascii?Q?DkI905M+7OqtmpSUtZDATWuUMz0JRLEoyjMSoTWrNwddUhTTCAEX18pR9VMQ?=
 =?us-ascii?Q?JqSuX+vzP5Ly7i5MruPw+i4B5/OPuvxuCM56RhplnIegJ15F5QcwruYqp4Uf?=
 =?us-ascii?Q?h7rr6HjhH8jXLXCFcbhVZfPf3KE6QNoglLAAaVtf/1619YvNpwLUZCsD5k09?=
 =?us-ascii?Q?VcS3IyDzie7AX1UNIbsaxQz+YTwEVS2OFpoTD+6QrPnNhEtgbS7dgVZ5Poe7?=
 =?us-ascii?Q?HfQZPId09oobCbz1AdLIwc6d1ad+oVV8LFA1YpONmyO4AE1/qySlIynBNpda?=
 =?us-ascii?Q?a9cxXMyLMkH3UVlOMeSDDW7IHOyLbsupsLtX857aYUtbH7Kgm11VXtHM+yQL?=
 =?us-ascii?Q?nHc+DhHEMXI+066QbgBnhkMMG1H9yx1dibB6MeoRTK0S4mUZNqnsiOLNMeAD?=
 =?us-ascii?Q?2nQXlELfqxs7XVZ2fdpL+JlqmlQ1ij58akvi9PTKTO1KxSaeBCg0S+lRTpHQ?=
 =?us-ascii?Q?gWt/kD1VFnRAxfRsLoLp4USwee2VDl4+A48LQhwZLf82QPWWB7hTg57f4Wx8?=
 =?us-ascii?Q?2NoBcDGo1tlJ1FyBqkESnNEYWu/JlDTATDSL3MKV4btXFwRxtgXOrGYk0wtU?=
 =?us-ascii?Q?y3+D7y4clGTl4DXhtl3zcQuNwTg/5QZf5nDpOpQwZRh2knw4qCXFUfsmq46o?=
 =?us-ascii?Q?rYZQ7kUDAGP0jF0BXQRqEUr8gNvLjrpSmeacO6ztclQ056DhA3rGH3SAVyWu?=
 =?us-ascii?Q?nKJ9BCMfoOyPsn0xJXZViF/wF1/oVOCH/WI6UoigeQzkU5ZelrXPXmIwwKHM?=
 =?us-ascii?Q?2fG+7bZaFSmbBM4g7qaZHvgTaSMqG/Zmop144i4jB6bVL2F01rA4nXJmsIte?=
 =?us-ascii?Q?ouS7DfKXNV+cOHUOB+q5EmtWwuM6eYy5yqk9OsWXpv7yNrJm0SHk+vYDiLPr?=
 =?us-ascii?Q?FTBdsM0RcOSZoVHXxdN8o9HAgimcJiN7JSHHrFsDV+xRHjvU2MxFTtTqh/8v?=
 =?us-ascii?Q?bmE03VcFdpSIA7WigXe33Xx5wGcCfJ4/CUEEL/ggAiTeRceWKLTF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52db561b-2ee4-4175-2815-08df14d85ede
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 16:26:05.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA7m5GbTPNlFk2HXFhVQfdju2XzzqvQYOnRlXv0wSiF5xnOBbzxPFJl1Sup/DurMZBHEl2fOtjlIDrFI6b8KTNb1v/RsPRFaImqmuonM2g1WLheZXaQy9ISIliX3PO0w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10999

On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> On Thu, 17 Sep 2026 10:24:29 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > On Wed, 16 Sep 2026 11:11:54 -0500
> > Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > the missing calls.
> > > >
> > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > resource leaks. [1][2]
> > > >
> > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > theoretical corner case of someone rebinding a different driver (which
> > > > will soon also taint the kernel).
> > > >
> > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > which is fine in itself.
> > >
> > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > include these pair functions.
> > >
> > > I get many similar patches since scan tools is more powerful now.
> >
> > I suppose that could work. One would still have to scrub the kernel of legacy
> > use/dont_use_autosuspend() calls though, so it could end up being a large
> > patchset.
> >
>
> On second thought, some drivers do tend to disable PM runtime system sleep
> etc. so it probably isn't as simple as adding the autosuspend stuff to
> enable/disable.

if runtime pm disable, does autosuspend still work? suppose it should be
disable also

Frank

>
> --
> Kind regards,
> Joshua Crofts
