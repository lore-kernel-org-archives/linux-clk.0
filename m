Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FB24AA030;
	Fri, 18 Sep 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742593; cv=fail; b=e4Zdx+9N/4wchvfbOyr661f0UWWL8r1KhEv8+UvCPOz28DZ2cIkZlg4yauUgVGb83/t3gIpdZwimAK2SXRHn8gVGJ48d1epjHDaWBsCdYAPwfwif/d6y+isujLXgpF+Z4Ge+CdiGID+kyntjKIAr8btcGRLbBik9vJSLPFG/DN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742593; c=relaxed/simple;
	bh=S5+S21k1uWsfsG6FqAhtOSiCrwD/Oj7wqTaFFBHJPO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C9IEkO/qVjfgw41jbaWM0ivbsbluN2TdP2n8I2Q6p0YJ0HbBD5pEt1GvkWznEpvZahIZwisB5LNWkBu+bXkJz9+e/e0PM5/pmIdRIUwDuUfrvt4KlsRiKmM0BOZXyuzVEUWJ072/vofrgctXxNKw0YwX3k22OlcHEN5a6pKtg5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NVtwigzB; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NVtwigzB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKJM0p7ILtXHctNzyDh2BXI5DMeGK4X2mbUOvGOaCXzrHqlLVwtpJVSkxz9esi4unLGWiITiJVB/DULCdyYa8J/iwwV9egeJSNaLBVdBps+TNORc6itnHl+84AG0lABNwT8GLsXG4zv53gNX7VsGtSvYWdYS8+PJr+p/hd4WkVjn99ES7rePTyYfhaZvDhlw+d/glEZHUVF6JiK0RY6+bXfHAA1reeCwqbaNuPvZBqg2xU04Y3AfC0rHi/fCBjLWWZklDoa9Wiin89OclQKrtJsbfI72kzIb9IWaV7biRrH/EcNZZT0ou4BhvtuXcWTS67es+1g5fFBE3n3/1gHb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5+S21k1uWsfsG6FqAhtOSiCrwD/Oj7wqTaFFBHJPO8=;
 b=gFup/Z1PKh1t4IgsuoRv3e62m9kr2HEJHXCpxfj2fCIKMSbzH70bQpbMu4Dt7Qra8aRYK9M9f/8jpxYLDXThX382NB17xQBvMHEoko1IfJ8C9wuOs9aMSdqRo4Pugl/FmpJQiuQeIhzL0zu6re4z+I5O0A8lFthvIGqSUJlcH2bfP9AAs1Tgs2PNVW+OKSHr5ER9fE4HBOMFFqL/nVaK/2kW3OKwn4iPFsFTNxOptBskcY5p8v3NN5Y/VO50catV5Z+T5pFSZGQLC552YCsaehQhIKEB1UaR5zKda57BP2cSixVhJgRYdqEzTjmZBRekjMHlvXLA4hqOjHZLhsiVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5+S21k1uWsfsG6FqAhtOSiCrwD/Oj7wqTaFFBHJPO8=;
 b=NVtwigzBfde7qL7e49z2AJnkDsib+p4rY/Yd7hRQy7gcgiP595qzVa7GDNVebuSw0U2prkuMeE9/0XuLLkOGUmmZ45HsSz85HLpjzoYxuo73Ki/mVNEAyC7akHwSqB9PB6bQkHWo/qyo/2XkXRsTy/ADHvJm9mZr4TFpZAh4o0Emk5zDySFpLfAeIybhthIdIvTqjVxYmRr37WAqy1k9tj30qZ+/P6BlUuH8JZ9YrXELFzu+KYlH3axcZn7fjJxh07rGSnbx7u/PxaCLdICExqdCuErf1ZKZCIPHiH+xALk43M/6/IYILz24Yl2q16CuHff/NfzugpDStgm7Akg81A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7796.eurprd04.prod.outlook.com (2603:10a6:20b:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:43:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:43:09 +0000
Date: Fri, 18 Sep 2026 09:42:59 -0500
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
Message-ID: <aq1N863eJpD_ZrLU@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
 <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com>
 <20260917104233.00007a85@gmail.com>
 <aqwUky1jSMGbiXCf@SMW015318>
 <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
 <aqwzG_24bZSSQhTS@SMW015318>
 <20260918092533.00004dcc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918092533.00004dcc@gmail.com>
X-ClientProxiedBy: CY5PR15CA0124.namprd15.prod.outlook.com
 (2603:10b6:930:68::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: bcffe56a-2723-41cf-7537-08df15932813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|23010399003|376014|1800799024|56012099006|4143699003|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gs23HfPtrW5MNw2q3kmhBlvBr3x+D/xaUyex/sxhVXz3FsRCR4T99ER2pJiiR1sbi2OaJJV4ORbo6jKRUgzeCHtBNJpwy41OZMR5bBj/O4BXpi792NMLQIR4FpufcDCdJMbYXj9aV33DmO3j0KNKXmIY+51D40lhuvKEBlkSr6+8dm+b4qh40kxJF3dGgaNmQMKNIw9crduACKDZkaeW8zC6kUYQ/QyOG0EdX79AKcpSNdANrqn/evZd/kACpeHfYyycpUdEeoajGRaEdoDKXylpqQQIDQsxh3K8FX9RC/QXktRdEwUWaTjeL/+A5FQnHLzSjSHLdrfPJZF5iJ6KKRDjqbYKjCpS18BPsOwbuiW3v225qpr7K8Gq/aN/3XxFpFBJY+PaQedM4Mzvy6O3F8ZSfZQcg9dJeQwnw3LCOysPFxNbZ51IDYv4CkWA3FtW+7A0yK2cI0hjQ6glwiByVgPkNipxBOHut2e59hBINvJhwzukt7w3DTOPAk4nwxM0S7cQ9QhPvpgxR1mh2wPlD0MnYa8UfPM8hDkGtIUv86kM5v7+HI0VHfzIGGtytRuIEOkbM+w/X+4lIizMt22/htf9AK+JUGmuPaBkm2FTp7x/xdMI2dts9+Ut7rAYX9xj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xcbJ0XFejIf7KllTwt9dPvX0dTmoxDRgRP0V3WXjt76xcV0NNzBs0zH73J6X?=
 =?us-ascii?Q?0UJeQatyvZqtsD1fcFweLfmEW3WoWS66qqDPXSzLbOqaMQkVZ/ZiGKlYCZFZ?=
 =?us-ascii?Q?zvFxYvtggE1ZpCxkjIUhhTaq2vXYHEtX6u2/WXGq0pv+MwI8JJXfIAxpBiLI?=
 =?us-ascii?Q?bDr8UPh4z5drJQsZ4kRw4f/zdvbx9CCUy4NtBvmv4+JETBK25ltMPSSSzQjl?=
 =?us-ascii?Q?/IfdRvcrW/rDFbotrM8zVBSRDehnUciYdfy1686Hzl4nPFnmeufkQtuJZAtO?=
 =?us-ascii?Q?lMGXHLsuWezw8RdDJzhGV2Oxl8Ssz3rO9Tqcj0huOkdmzy1ArF+eYGBeUiJN?=
 =?us-ascii?Q?SYFURy54qZTrFEhwiBlDIaXNz6gYzduLIqO/YT5lr5+j+kYsmMvI/bsQjQbk?=
 =?us-ascii?Q?Iw9EYq8E/xi+sqPuUKmslh+g4Yilv5gNMQxZYEK6Nuh6HzYfIQD6HSKQEgUX?=
 =?us-ascii?Q?5YPEzFjG/FnufXOd4RA2/tv3ofd2jgpxmIoEc4dYofik8+rJlElRAagIQsgc?=
 =?us-ascii?Q?EsrSp5VW9aOLo3lwqmblqTGx6Td7goGaZaZ2OgBFdF2/I/jO1x3iESHGj+pJ?=
 =?us-ascii?Q?W1vuJ7kFFrACTHXe2/ou8Orjm6G7Q4NSbRzxiHcnDoEarhhV3UA+eR6nnAlL?=
 =?us-ascii?Q?/ezg8S1tOdQX01AOAi62WaUXf8P/rhGfcAzG+Agtg1CzvqOKNoYLas692Owi?=
 =?us-ascii?Q?1K4nnYqXihTGopsrtJEhdbt5sLH2Lrp4UI4Iz3Xu4jz12oXzA8zZ9n2HHrVs?=
 =?us-ascii?Q?gNkoUWQkr18IAj9K3GKdPuINKqWuxALZUtPzU/cRtv+sTYKSZ8RaDl+V5WI2?=
 =?us-ascii?Q?8mmWVwp25uObXgA5KDtaAsgftcfT43HAVd+XNEK1PWI+jy63Adf/iT/9h7J6?=
 =?us-ascii?Q?5Znq+Xm1kfXsvtLnazabq3kPDTuwbctcZR0C4i3+hzd0z7KclHZF4KsuE2uh?=
 =?us-ascii?Q?QOEuLKiNQoNAGOXRf0VesyQOsJ4Kpe2prj/iRjZrwaVyGBXVTyOay0ogWxU/?=
 =?us-ascii?Q?zLZIEzqIBkhp6uX9jTlk3RGtED/ncGgWNcBF9MJRM182JVIvC3bWyoiGWBJL?=
 =?us-ascii?Q?1XL9oe0cx97+vU1plIC6vX1wDns8g7c5lQ16B6N26OjJhB0BZ/hret9dHd/r?=
 =?us-ascii?Q?LQT1Iw7Cu/VppnnWRb8EWLlD6fszSObgcz00MTsuz2vmkIw7KgX8ouVT8aFQ?=
 =?us-ascii?Q?Q5b6ea2VT/nT7I0rrCvL+UDYJLHE1sU0heIRq1qy3bNkWUDkCeNOnR5/elUX?=
 =?us-ascii?Q?4bIyPcg62fUUEpXzrKi0cuyzmCrxytWyyJtdnaa/fiWTQ3XgvW1GqR0s80lv?=
 =?us-ascii?Q?XmpNd0KneGbxy50kh/sVwiDLkCxWXlfH94mnFwZbuKnUXOkhEy7Kpm3ZKZEs?=
 =?us-ascii?Q?qCmyfGqWsqszuZQEuySkcTHs9VAbDBifVP7YgWbdBx9vw0P/KLOxR9G7DRso?=
 =?us-ascii?Q?aXRuIGURB0H3NAhv1PNWy3Qro3zj78WGwodsLJLYAHplkDeOvLtGJZJcC3CR?=
 =?us-ascii?Q?J6Uqz4/S31v9LXz7RWvYVse4Q10+dmpAS3ygbUy+Py8hXgBjV68LeVRPZp9L?=
 =?us-ascii?Q?UVW9gnoeRo76HXRDL+r/9Yn27YoB9nudS7Vw5yFsodu7JQ1JMggRHy60brIS?=
 =?us-ascii?Q?ewItiL5sBH6u1IlJeGr7ucm2mjTNVCa+/oxMBxNv04kOb20Luz4aYyySLbUu?=
 =?us-ascii?Q?RHFTCsV8lgQn/sdyS53Q6x0UjoiudAGLEE1TpktLw98cPQT5hcUqk7ncAGVK?=
 =?us-ascii?Q?wZ8yQr6apCItmG4eqn8o1XlhcCx4Q3RmFsifufx0pd1E75dRRuQJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcffe56a-2723-41cf-7537-08df15932813
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:43:08.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUCB46l8z1hA+ZQKXhGf+r1skqZpYkbxKa/40YJcL5ESdAfeStSRJPpPzzwI979WocEmEea5RTJcnwfyaTmDkRj2DdHvjC4TBDkkvrw1AFpHkYHwcPSeV/vZ35BTb4vE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7796

On Fri, Sep 18, 2026 at 09:25:33AM +0200, Joshua Crofts wrote:
> On Thu, 17 Sep 2026 13:36:11 -0500
> Frank Li <Frank.li@oss.nxp.com> wrote:
>
> > On Thu, Sep 17, 2026 at 07:15:29PM +0200, Joshua Crofts wrote:
> > > On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:
> > > >
> > > > On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> > > > > On Thu, 17 Sep 2026 10:24:29 +0200
> > > > > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > > > >
> > > > > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > > > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > > > > >
> > > > > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > > > > the missing calls.
> > > > > > > >
> > > > > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > > > > resource leaks. [1][2]
> > > > > > > >
> > > > > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > > > > will soon also taint the kernel).
> > > > > > > >
> > > > > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > > > > which is fine in itself.
> > > > > > >
> > > > > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > > > > include these pair functions.
> > > > > > >
> > > > > > > I get many similar patches since scan tools is more powerful now.
> > > > > >
> > > > > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > > > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > > > > patchset.
> > > > > >
> > > > >
> > > > > On second thought, some drivers do tend to disable PM runtime system sleep
> > > > > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > > > > enable/disable.
> > > >
> > > > if runtime pm disable, does autosuspend still work? suppose it should be
> > > > disable also
> > >
> > > If we add dont_use_autosuspend to disable then every time the system suspends
> > > and resumes we lose the autosuspend config, meaning it will never autosuspend
> > > again.
> > >
> > > I guess adding dont_use manually to the driver's remove() function is the only
> > > way (which according to my cocci script it's 195 drivers that should be patched)
> >
> > Extend with exist pm_runtime_enable() and passdown delay value. if delay
> > value is 0, actually it is no autosuspend version.
> >
> > and merge dont_use_autosuspend() into disable function. And actually
> > I don't understand why need two varible autosuspend_delay and use_autosuspend.
> >
> > when autosuspend_delay 0, means take action immediately.
>
> Actually, what about putting dont_use_autosuspend() in pm_runtime_reinit()?
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/base/power/runtime.c#L1865
>
> driver core calls this in device_unbind_cleanup(), meaning driver core would
> just handle it.

Yes, much better.

Frank
>
> --
> Kind regards,
> Joshua Crofts
