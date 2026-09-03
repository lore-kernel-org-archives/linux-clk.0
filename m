Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6E4F054C;
	Thu,  3 Sep 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454487; cv=fail; b=Cd6Neh9X4WhCYgi+6Qr6SEdmvFTQOPZr6N/Sk83/KQ96ViSNO/BBs9xOIbKNO+M//H3MAhMExdt3NSPs+5LQaqr8UzJ8ehogh6a+ZXoFcJ4+gCon1ZHljynESNK7etjndIRNvh9mJlH1W99FeAu1gnskvQQtPBJGXb1Gq7LzHnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454487; c=relaxed/simple;
	bh=qxGFKtIwqexIyanabnkAvaMG13BpEdCZDONgyI9oWR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cbZxpWtW9fZF/74D5F0b2/H7Yl/fFm3kXhTTvap6H72CBvnhQhNHrcuy6L/JlURSCYYwLJY8WFKOxgFqlvcEY313OF2ITNmdwtux3RpuHvcn3M6TfTVArBs16CUOaJGsbRxma2hHmcYt1hCbAj5ksdMac9QLAeDMS13tqmaQE2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t0fa7f6s; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t0fa7f6s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD79NWkdCvvzIbU9R/KQUefFdKE2KgdghcKlsrNIUracpR0frQC8+GcRMgr4SVPnbnj+I4SuYxmW5qUtqsoSU+wGlEAquoP+CisGJlJVTyc5UnyL99k8ddqbGNadltNcJIFm/fs0w9WAxzR8sMsKkfV54Hsr4ZYegi7VPvd/G0we8nRzyxkrE0vpTqf4i/t4FE896jjjab3PheL1xLk/AoVKnStQcm+Ux9s5QDdaA4xJPXZPHcnAcAlgEIJ8weDMnUXdN/VqL0TOWGxeJoBfChLFQqmw25RVttXieIKa3qUu6IE2z57YpGbu45U0/FwAOqacfLg6PTgrZQCjJ0YP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPmhGFVhzsX/eNvethW0/UVQcKFKSMvaxttR0hcC59I=;
 b=YJlW8VKv56xDSFpCYgvaXlJkxSoacyp6JH87S86aiCisKNZejUUDhjBj7MYxsecKDOpMScb5PPCJOOrq3xnHp7H0+m01rq0iFH4NWp6EJQ58eNpytv9GRuNBfhsE+7Z+ozGhr3jGF1sqOVc6mJc6QturQ00CrdSpb0zT933rANCmLeFGXVxHcxAVHtHLXurQ0lZpodRLZq5HOYZ9psvvOA7o/RylTnQT2lZhyt7bWkx1CzKHZu8d5TWL8XWxw6zVIyfVPfPmlcwuYVDrN/WBbTt54g4bMw3ob3xhdXWtqQKiFQiEbjeOQHvX8oc40mjZW0S4iTjyvafeusiZWSJImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPmhGFVhzsX/eNvethW0/UVQcKFKSMvaxttR0hcC59I=;
 b=t0fa7f6s8PeIE7ri9OHLjRa+cLcpG1YPC0qWpj15U+jJoN2BqPnd/qg8KsEJR0gG98Ou7SwDhMKCByc/P+TRw7v3vZKa2fDXL3JDW2uG60SmRJkXGNt0aupLnytbkbCVcMNiwZRX2pR4W7nw5+KHJfQosSlQPq/0CGPX3k0J2PRgf3XLVlQMHAL85OR7gz2KAz7DTV+Cp8rZ9sedToYswrqsdi7LzF/gvdfRxUknI0j8z2GJvtMb9sVJ4YGxl3fjE6tkOOctfqISlrPqaHPCqftimom1Ohdc2rTMavhF9OrfGMZKqEx6pMs8mtLfpigQwMXUhuNOdJUvtQhuDq1Kgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11915.eurprd04.prod.outlook.com (2603:10a6:20b:701::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:54:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:54:40 +0000
Date: Thu, 3 Sep 2026 11:54:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: imx5: add assigned-clock*
 properties
Message-ID: <apmmRsFTqSIxvfi3@SMW015318>
References: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
 <20260902-wonderful-tangible-warthog-d927f3@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-wonderful-tangible-warthog-d927f3@quoll>
X-ClientProxiedBy: CY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:930:10::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11915:EE_
X-MS-Office365-Filtering-Correlation-Id: c3efac39-6f9e-403f-8105-08df09dc0b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|7416014|1800799024|366016|4143699003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	59of2igAhTmM3lxsRJtUGPIyKbj7Qb1KB34GnoMaX2yqsLmD4XbzIzddL5wuDlz/oWyDEeKQwDvt1yitZqlo02EKljEFjPRZeSH5+IJ6lzcAQl9r7LsrMXjuL7VHxyI5izHJstiB10Q9FyudgnpJeJYJ+FR7izGjcn6Dzk77d7AFt0/G16v7TPXmPZv/miIkyD132CZd9Vv3vjonkUgvSPidC7YOHpLZXguK1Qx2Oz6ztpyX2rNbRQYH7TNfm+oSglv58KC4fcuNrtBKCQqjpcSv0I7OvGm2rPalw6Vik/fx+zKLvpaWH9wH3omWv62vbwpBIdE/bouv+ScQesVIa24s8gu5xa5UQuCeeSFdsIvwtWe9TrX9TyeRWLfc8z+GHUHCKlzDnZ1yfq4EaBqkHWMVzUBQzkZ2mH7phUDEUsrB7KhwveeVJa3SG9tolkGRCLplGz2gE1XsTYfBu0NADXalO8afQCCQrN0EUJ8ao585Pa+em9uzYx0WExhbQyTl5ZnWtRR1WeSwN8VNkUQe8b5cF0+E3kzgPzXPtAay/2qqGzbhprmFzh2fiVaM8Tu3JV/WGy5cdV3Yny6lUDmM/iV/WWbj3lIC4h6xuX5xI/yWw4QWbqz+ewqgs0AIP9gq/tnUanF9BNT3LhRMXIjxq4GWN7DjQD7RCgAeOT/cKf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(7416014)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vpp+ynTLjV5y9Yh/xXqkWBcuPl8K1bt06W6XqaDH233BbIMbuVZStcNlSCGW?=
 =?us-ascii?Q?8TE0z65LoD/93FkF4fviHlaifGE01q2mUkjzgiaG5JDAVrGjzzp6KQZ0IXaT?=
 =?us-ascii?Q?JIVwGuawHRioHJA3kUHkyGquwK30APxBl3LrEv3ai7JZlPk8Y7i0jjxDYc+0?=
 =?us-ascii?Q?W16M6pjWUNC4iTIi6flhRQGDQyAXn9t/OJ2khkx3fiBq/30ATXO/1s6uMyi5?=
 =?us-ascii?Q?HnwSAsiJt29F5viUlFR3R+qg6RaHwbnQ4LObGbeVuS90wHL2Qj0Hin1bDt0E?=
 =?us-ascii?Q?ZJ+D1auaG89A8Uuy5fzC6UBauQPLULY48nIQalQiJkOpq5pXxPhXVEBGOQ/5?=
 =?us-ascii?Q?VPdHkOcRqhkHs/M1bOdZJQBZD2qJAGCZfW4ZhcFOf/BcLKfPHC7QbWRpD1kH?=
 =?us-ascii?Q?WWbazoysgbyQcjSbGZ8AmW/nHSbMr88ljX8w25TAbHi8w1YbrWhci+suQgJd?=
 =?us-ascii?Q?Gq5ookAcC6LhM4JoO0BNe/ZLl65UPbzhA5euPvne5QNnACRVFjDqZF7xwfFQ?=
 =?us-ascii?Q?Gkpyg05Z9e+kmy7uKARm/HybpJgq2BB5fPaCT5joEZ6sFODraJWc56ORKyAd?=
 =?us-ascii?Q?LxsxAGZ/mVt65Gt54ETF7wGHdzO4Ym0kIWwhsVeKibYrFFsF++vQ13FOyz2V?=
 =?us-ascii?Q?d9Q1RxUqdZZJrnWaqmHh4DHwAVsq36es36PXdabImvod+0bZYBH/fK+Npxce?=
 =?us-ascii?Q?hqkE4Tq4qr93v4k3hl+fPuMtx04dCUzZeJx7WyDPeGF1OVphSCpDEwaQS2PD?=
 =?us-ascii?Q?aQN3rfJ9YT0+tMPjg/rd0rPr582LDqlOQwLA7sL92ijiy0B1LPJKldeECYhN?=
 =?us-ascii?Q?xTKeRudeeSNjMhKbwtYyWWg08zaeNovtJGfv1/ss/iVbrD6/h8W1X4650Ktj?=
 =?us-ascii?Q?PpTJ7GlKePq+t08iKt1WYMYhxVxZn1tA3P8uQ0DhjNVWsyowPKaDQ0mI5+oG?=
 =?us-ascii?Q?VJUviCtkxHo66jlev9E3DTQn4ark7DtMXP/upv07trB6sSQrHWGQfwjzrhv5?=
 =?us-ascii?Q?tLh/TceQS9zQdKS4lC+J6dJOIWj1OQ9KRwMjZ2kYO4QEWcKoG3yO26E8HU63?=
 =?us-ascii?Q?mEqU6/BvPCWem8snEw/IplxZ2LeQOTFtt5H0OI+ATR8vvujkef/GGogAHFYH?=
 =?us-ascii?Q?zf/0NNKVJiUTtfntiokNqzrO2tL35sPGLT4SR1ZgpyoPn4o31IXvFx7a6keh?=
 =?us-ascii?Q?6hycH0PtbNlatwOaZBBsR5OIpdzyqOzSNhLDpRfFKd9AL1KvPh+9rohZnjjp?=
 =?us-ascii?Q?TnhmIScUsY5/3se+mv5UnWfwr+UKyP+Ut97301V8utpQKajwgZi1NjZf2hVb?=
 =?us-ascii?Q?impFRdPo/NfHBUJnuqSBKqfRWEjv82686wAT74oG6jXe6dRIzKPg6/6CC6Pv?=
 =?us-ascii?Q?qiKP062ujgCV12hawzoyx0Q83BoJObRSFAcAmBjoa99Vq2DV03z3c3LQyX5c?=
 =?us-ascii?Q?r7UAeMby8rnK8DjeQOy0752Zh8APSD4k8jYCLglrwEN0IvN9Sr8A6Gp1D9tv?=
 =?us-ascii?Q?vtKLz9XqzpkIb87ZNNZ3QkKwVh97/iowrov0jmm98Xyw/iylOvOmq8f0on+l?=
 =?us-ascii?Q?qE9LYmb/sOVKCiqYQsTJ4+ycJsbg0+kCBRSTcUNr2+Hxd5FUKymLuVNYTc7c?=
 =?us-ascii?Q?tIb803yfVkce/4+IQKWemYTNtao858pogSZEgRQ2+qQYQzu8f9mVrIz/AX0Q?=
 =?us-ascii?Q?NRLYpoHxItfdlA+cBpVZvqEIhAZHIQ3dcNfhgwhFhJFwAPHw2N/cTxOVjFvC?=
 =?us-ascii?Q?K+OQXYNaL08ezqmBdAirTm9xar9y+rQGoOkiQxTgspix2lQrSHtj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3efac39-6f9e-403f-8105-08df09dc0b95
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:54:40.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOAChDn9gm7vUJT5WMnBA+8XKD30snEhCJBpAJb1o9QdvxuI4m/Ny+na2Z8lZCVAMSZOd9z7CVfd/lpVsdRCR+u0TO+daPg+h/U9iFGJjUXDFHB2S2yFYC/k5loItsAf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11915

On Wed, Sep 02, 2026 at 08:14:46AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 03:37:19PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > The i.MX5 CCM is a pure clock provider with no 'clocks' consumer
> > property in its binding. The dtschema framework only merges the
> > clocks.yaml meta-schema properties (which include assigned-clocks,
> > assigned-clock-parents, and assigned-clock-rates) into a binding
> > when the binding itself declares 'clocks:'.
> >
> > For example, imx53-m53menlo.dts configures the CKO1 output clock
> > by setting assigned-clocks on the &clks node:
> >
> >   &clks {
> >     assigned-clocks = <&clks IMX5_CLK_CKO1_SEL>, ...;
> >     assigned-clock-parents = <&clks IMX5_CLK_AHB>;
> >     assigned-clock-rates = <133333334>, <33333334>, <33333334>;
> >   };
> >
> > Without explicit declarations this triggers a dtbs_check error:
> >   arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: ccm@53fd4000 (fsl,imx53-ccm): 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
> >
> > Assisted-by: Claude:claude-sonnet-4.6
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Then the DTS is wrong. If this device does not have a parent clock
> input, then assigning clock parents is wrong because it is either
> contradictory (you said no parents) or misplaced (clock consumer should
> set it).

Make sense, CLKO may just use for debug to measure one of internal clock.

The boards is too old, not sure if it is really used for some periphal.

Frank

>
> Best regards,
> Krzysztof
>
