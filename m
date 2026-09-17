Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950523DB337;
	Thu, 17 Sep 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670189; cv=fail; b=HdUhFvBlEDfJ7yaBOLoC0HfIFl7lsxsUBReoEyecGQ1kSFdj3leZ5Xvgb7Kbvt0b9fBUz/5yWvREbJLlXsFNeAS9b8uzpIDksma2Yu++ctxEM8YWKgAdMm2P9yrhO77UF7dX8amOYVTP+sZSG5zo644M7hy1oMkpR0f/4bz37NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670189; c=relaxed/simple;
	bh=dG5hI+Cor1Em41kKpC9DR4Hn2/oROzRr0QAhmlT4EuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VFY4mQfJ8cQp4tdE9ZhmJBZznyhoyAf2cOINTq36D27cycqHYrsyMSByee+1x2skQOOhxpKkyocK3tcqucrQpvNSF7S9ygZ0mqiqakx9oZM8pspo25jICQ5YPXK/VWgNggWiL6c8Hx3GC5WMtzGilsBDHQ72PoDTEYwKlAouy6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M0LEWp4y; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M0LEWp4y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfiMNKonrZqn5kM/Hr3vMQg2LX6/89RtgF703xd1/Ov1B/cJDR8yXb7pNmJ5QOgk2cTeTEPNTK689HqXPVwJ+tmY5itk8m93dBuOM++1asflx69kgYgZVZhkHjvVKZ9z0EjwPlKqgxq0Z+rjK4S0bAQGON/XUFA6BDPDpYlp0yOnMZdviAmkAY14Nr0LiGuKXagI9Z/XBSh++z+EVF4pFJRhegt5CjtF9vwHMSGZlRsOFoVjpp6iOghkc3pNvA9J6g7KAEZ7w20/YRLh+mtvL/5fm6ww6QCzWv4hix0xIPMTeHoPZXj/W0ocH2mX/HCAgABvr2xBZOmeU+ITlh9Oxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG5hI+Cor1Em41kKpC9DR4Hn2/oROzRr0QAhmlT4EuM=;
 b=ODHnIPvUIN2/oEECwiB5Rk1EeHfod923axCg5v37xwj7zG358S5j3G2Aaq3r6mKSuP+fbBZT59pjhPYS7Xc+gCTzaPg5rYK5kGsmrRJfIj0JxqnUng54Qq+u6pqnLTZbEGd0/x+39nAiHOy85djnGdD5/39OJ/DxePnS9v5/Hv0EgO++dlRB5D9WEmmcyUEYiFV64YDsKqjKOZi4wwBlXTIG7rjpISnUbKZsF0Sm+l1+16MviFEVAyFpOdDyaurFwilQFZ1W8qLGPAXY+6sqouSxB2BEZeY10PQ8PRsQd7GCwddiAN9q3xEP3/VdZYX8MX2STcXx28G9DmHm8UWpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG5hI+Cor1Em41kKpC9DR4Hn2/oROzRr0QAhmlT4EuM=;
 b=M0LEWp4y5ZHbNAUhLqSMj1owi9D+uyOlRHnur5UIji0LzKjfNGonamC2V5txAmMRRW4kg2k4FCF8v5+L5UqpOLhnpSZgDqgaa41+oxAN+b7mHFmSyzckQNYKa/59KtcEcCRPNYW/orxx0MG6eHOdGjRZT/rxpDyQdMu7YwdUqZmauw4F8+gwbP+o2YT7Gh+Pzd5topx0Dfle5LUykfirx5l7kOKKsdj5RnRVrnD5mCJUfQKUoKox/s+dSYq1J8EAmW1zKUqyWnX2quI/4J3SEfJjPCbIgtBsHBiXT3Wf69fDxMoSCGtYhqqwT97SxZIIvk3fa3Pm/39ADpvLthiH7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9757.eurprd04.prod.outlook.com (2603:10a6:150:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:36:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:36:20 +0000
Date: Thu, 17 Sep 2026 13:36:11 -0500
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
Message-ID: <aqwzG_24bZSSQhTS@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
 <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com>
 <20260917104233.00007a85@gmail.com>
 <aqwUky1jSMGbiXCf@SMW015318>
 <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
X-ClientProxiedBy: PH7PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:510:339::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa89ea4-0141-46d3-841d-08df14ea9157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|23010399003|6133799003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YH+qob/40Kg4maheW/fd4EHb1M7iJDu6+k+RwCkRzQMFWLVfGlZEI12q3CGbCggmobHkVI6LKbgnkXigLXEmOkDTniRQacw2m5EQW7RY8yMb7YZVtQzf0NRhMgTJEAKjW1T9lCobZbF4yDLeX8CHkq9t+n4Emes7A4NPzIiL4B7xvKL1IPlisLDeQi2lQ2nh5anCUzHdm5UW4wH4tgT9PiYMTgNEcjbVKw1MhLPZErTOPZbA2ZD/IafHTFNQq3zUIW/bbFUzVBbItoVQXZZvnNusazRKzXT2YaoWfM0RQQduAjdVfoiBIWfAFJogpIOGnLvslWWvtNv4l0xQlSUVUyjBV5drZK1292jJ4WXHzmR3DYuVIISncQovbpKzxmSBPS69C6b0cx4fAhvPEk3jc5IjQtbHChOJrGKin/wg/Wko9/PkWwdE1wikS+0z0WeZKm5tLRHn7KMjhSuyCEiiStUWKp/zPWHl247ui6o0bq1ciko5YRfgaR6MwlZIC08s2W/jSKwXuBlhwDLQER36Dcq3rrAD4VDAN+MCn150zM0jY6F0QXHHsUn20P1UxYgtVDnBCVqnvKWwnK4eX5m2lVTORIICqogYDV+uLdblpcUhUwRxafzklWhTJ45hatmN1FU+jOUo6M5l09nuEV44VzQ0k85ILyBu5886D7OTH/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eJHNCR4ijJxIRqqXEYdvPoBht0v8HmLWfrJhJis8SlrpwmVQpYZ2cU0RP469?=
 =?us-ascii?Q?+prMy4cp8spHc/7fhSsg5I1JIM+T+eBboDur3Xpz8C/lWFPA0yLQxPyjwmV8?=
 =?us-ascii?Q?uvcW/4NN/wliw4m5zOBbWP89PwCBQpflb0QYgmR/4qPS1sJrFdSqndEqeOCt?=
 =?us-ascii?Q?A2cOeDU8juJwtpnM3nB5Vdfz93Ml12Faih0ZYSsREFa9NKp2cLoOXl15huAu?=
 =?us-ascii?Q?pGdoTH5mu9p9Kv9WIKeK/nFvQBlUgdFvDc9ZZn90JxG0lOy8chB0Fzkg/6Ya?=
 =?us-ascii?Q?tJ+5oAfKSLmstnp8DWfLb6eHRuRAgANpmWJwqgC3bTK5Bn6z1Cf66diVEwFm?=
 =?us-ascii?Q?p00oQyuh+6ebaapZHqhrS6w2SaVMbg2ZVdQeSOlkUyegiQi6HlgyAXBwnWi1?=
 =?us-ascii?Q?WeN8V1wbSDE0guBVX4/OResmQWbH4Xfn2PK+QEoQy/YNMNK86kmFyhyia5xF?=
 =?us-ascii?Q?tgacv6zhaqymQotvBz9VC2TfnHxvZpYGQpM0WJ2SC1VgKBOOb6ZV6at2QN1t?=
 =?us-ascii?Q?XgF1i0Nh75aMaO8ns9DuTnl4SmjsRMFcNOm5pjMblGReSg3yDorHfscjVebU?=
 =?us-ascii?Q?7CGmcH9WPbMo2+83c+ikKHNqolgGg/Fuhpnkqwpo343OLy86Jqgv/mDSbGRC?=
 =?us-ascii?Q?TGlcurs9GwT8EUF+zin1+9K68iVZJwYxEIWvJmbIkeVV5jOi9ivtU12YIzJr?=
 =?us-ascii?Q?2KD9XYp8UGeCDji/DdLM7FCj9IPYYxBj488+A68YMZM5gsv4/faCNQywmx9V?=
 =?us-ascii?Q?BmePktq9bHyeFYjzFkKkkP3ZBM+HCXTrOsKTIlcH2nDzBiIDAOe8IIpOpYcf?=
 =?us-ascii?Q?FIkc4zrAuufRXlxOX/XasNEixwfqE9+yegrhsryY+UT7VTmRutZl93vvnIBv?=
 =?us-ascii?Q?6G+vJm1tX7N1+BixwWqI31hvxDaK+aILqp550dNOTnAlSuqClOskCT2mfm0K?=
 =?us-ascii?Q?26NvCHzRto7t3usFGZwWZYvPQoO0CmpA8AB8Kzi8n2CcM1jg/t7K0xk9c+FY?=
 =?us-ascii?Q?7Y8+PbT1KKQ96d10vIqlPamsvTXeOomK5BolfX9P9h9dnpt119TsJVF4z3MQ?=
 =?us-ascii?Q?1Dn8hMSgBJWXgvQqqbhgvRjs3RSAKFhgIdJLwCiFntH3nSY8ATuf+Ak2WffQ?=
 =?us-ascii?Q?k98FFB4POLIT+6XwAXKzyGmKgeXxTVOzkAiIqqiplp+O0l3dnyRdHK07k9Bt?=
 =?us-ascii?Q?TH1BtSRk4tIgWfNEcJZzYooawzhvFyyRB6vZsICPukFgsIh6NHhkFMfYWdux?=
 =?us-ascii?Q?uae4A4/drD7rVuovdMrm2KLSob0OJfSK8ghMhvHfC9YnEBLQpHQr1u+Htr4c?=
 =?us-ascii?Q?WqMRKSGUy7S4hDs2Y6qrIUOH1o/4DUsiIZmelqYoG7D4VWgVoQUXR4fc8f5v?=
 =?us-ascii?Q?sqHi0TS4gmSQTj21ngqKaSDhfl5Nv5/9YIrl7qSd7LNjd3mI2MLuSzYkmYZX?=
 =?us-ascii?Q?JBsKiPtgaEcZfPY2monACp+GUFjwfQQkcDYapH4S5xzv7Kd/aDgKhWmLghT0?=
 =?us-ascii?Q?Uf9CcM+FQICd9oKLhU7nrEFy3KCOE0ouy0YK8VfkavUgZYpXjQZcMySY//4F?=
 =?us-ascii?Q?hSYwgVRozrlZYxJa+/pkDrv/hxtIQPREERRkozjl+biq1CYFu4VuUdFg7TcN?=
 =?us-ascii?Q?Ie4YyDa486U8ERc3WTT1ZOMgRMHRyoN1PBa4kVQ37jCGvdCeHiVLkdpUjmm4?=
 =?us-ascii?Q?DO9KxFL7V352v2fnxmB3X0IYei5JC0daP0IXyaK0ZO6d0GH3s05GGTyue0zK?=
 =?us-ascii?Q?O1DIF/hTiW0jMG/AbaoccsGZK5DvTAIcFU3+rV6kj7B61+vA83qT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa89ea4-0141-46d3-841d-08df14ea9157
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:36:20.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuvJzGNvIL9/y/fn2yZEfALm0jHv4oDssVfBiK6xE7zNR8Fck6frNiQXk2aGDuvXXk/nST3AZPINOKZhWi1gpwrKKN7nmMfq0omOeqw+emZQhYtMky0xr3xZzL/11cQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9757

On Thu, Sep 17, 2026 at 07:15:29PM +0200, Joshua Crofts wrote:
> On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> > > On Thu, 17 Sep 2026 10:24:29 +0200
> > > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > >
> > > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > > >
> > > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > > the missing calls.
> > > > > >
> > > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > > resource leaks. [1][2]
> > > > > >
> > > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > > will soon also taint the kernel).
> > > > > >
> > > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > > which is fine in itself.
> > > > >
> > > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > > include these pair functions.
> > > > >
> > > > > I get many similar patches since scan tools is more powerful now.
> > > >
> > > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > > patchset.
> > > >
> > >
> > > On second thought, some drivers do tend to disable PM runtime system sleep
> > > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > > enable/disable.
> >
> > if runtime pm disable, does autosuspend still work? suppose it should be
> > disable also
>
> If we add dont_use_autosuspend to disable then every time the system suspends
> and resumes we lose the autosuspend config, meaning it will never autosuspend
> again.
>
> I guess adding dont_use manually to the driver's remove() function is the only
> way (which according to my cocci script it's 195 drivers that should be patched)

Extend with exist pm_runtime_enable() and passdown delay value. if delay
value is 0, actually it is no autosuspend version.

and merge dont_use_autosuspend() into disable function. And actually
I don't understand why need two varible autosuspend_delay and use_autosuspend.

when autosuspend_delay 0, means take action immediately.

Frank

>
> --
> Kind regards,
> Joshua Crofts
