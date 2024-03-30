Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19012004.outbound.protection.outlook.com [52.103.12.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE72C6B2;
	Sat, 30 Mar 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711812897; cv=fail; b=VBxBcBb8lTu0/8OTVLq215Aut6oi3H2D/AaX98e8FX3eQfaGWbnWJ6iPOYzZ1eIjfy0ldbLDYBTBsdJQ4r8eKEEg/vf5Y1XeCpOgCl0WVDI1LcwUaP7bzcPZwfFFz3ycBCErmQI1bVnm8KTDX7L70wNVzlWUOAHBxqscfYmvWxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711812897; c=relaxed/simple;
	bh=aHkcjhM0NmyWhkrTB/VVkbmkkwbzmkPKpFqFj5DwvFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WR7MBoQX0fhXfgU5MFRDK/LFUUVKGtp2aP8Q0wpurfMHN2tJO/Q5+ECcYIF/KEC6m1FlDaFcEWs1WCpgi7hR4kD/nCTZbokMC3vDwIB7OrdX8Gha4/AeCRgmf1Zn7E4Gm6M4ZUGTPf9JB3htObnG213IcFDGGAJkA4B9Hju2fo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=nUgQb5fV; arc=fail smtp.client-ip=52.103.12.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="nUgQb5fV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjpwL7za6tTcTNVcy27g3IYm/rBHRnk2wXyOY/DNckEMZwWyfdgEwac8o65tdxUEux/w2lZ4XEXnEJLyLwyrsVZP2IyirLYqlxN6a1oM2fLBhlVGqYwqVdiu2prBq81fgXa3KTC+OImMUYq7QglAHCKLd15EGpjyAh+w6xcyyLGYMqBt/uQdy0NUYV9dQPRBWtSmi7Y2HwbIvK6GMJHIork/NYI7xnFTWtVBT8UVSRxiVlYfeRpUk1LDdTdv98GC5CE87jt1wBSn3Vy2ngp3VcPYyP+bjVniPOf1Ce87zq4P6RqOg3Gh4UufJivUcbDvRP/KRslF+lSiNE6khPklAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3II3f+vXdd+9kOJ04zgY0eP/3l98Mdffb1qeJcSX6Xg=;
 b=RPnwD+aTMZBY0OTpOlKQ9QFxOasqUxQDugNKyHPLXIlyU6TLCNfHODTapn5A9OU4aRbzHjEAjQIvmbBSrmec4cxjYluRjy5GR8IRQElv5StGKxgVZkPQ/5edRCCyFi72T5AG/jBQt8x9dFZ5M6KBGNyPTj+IglTqqWFxFn7Q+DA6SFTzaP634H+opCXirsc+X2vMVcs4vfEXRMRfFaUrBRPf1lujDTPTDPS+NIcvTBoFlwET7CnmOaTdvG0OrGf8uib/DrIS/X0c4v0FSSxUzrSAtk7qQvNq9jVKXbcKNCkpATZVq5rSPC5ubdct5q2XNWmqEs4ckudcMzvqvVL1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3II3f+vXdd+9kOJ04zgY0eP/3l98Mdffb1qeJcSX6Xg=;
 b=nUgQb5fV8ulRcA+qhc6OQLoq/vrJEHiFp6b0t+xyDAIvv79bKd1Qq7wNgM7ZJj7nVqYJ0Z+tB9v8wxHIL/YP0LS9hLjB8rlCrK+44r3L54WHkVwNODc7yC5VMG5rj+VF1VsoDdAgFzELN7g3eKhPYFdWy7ZnQuJtAFHcECGXiA8bS8Gcyw4W/XG38JmfBAOGe/ydnzt4Z89814S/BuF2tWIkU9nCsQjUmMIpJjSxvrz4CEsEQ+6DK3KfHypfr1pwUHjvpEWTo3gEqx9DHKqQ46Z5ndHQt9NNSa995LGihTRL8TpnfhreJKZR4itmaDq9I+Z2nxDpVDfPjZmb2k1dWQ==
Received: from DM4PR05MB9229.namprd05.prod.outlook.com (2603:10b6:8:88::20) by
 DS0PR05MB9125.namprd05.prod.outlook.com (2603:10b6:8:ca::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.43; Sat, 30 Mar 2024 15:34:53 +0000
Received: from DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::148f:6016:501b:93f4]) by DM4PR05MB9229.namprd05.prod.outlook.com
 ([fe80::148f:6016:501b:93f4%3]) with mapi id 15.20.7409.031; Sat, 30 Mar 2024
 15:34:53 +0000
Date: Sat, 30 Mar 2024 10:34:50 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, heiko@sntech.de, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove UART2 from RGB30
Message-ID:
 <DM4PR05MB9229E56DE3F587BD222E1402A5392@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20231018153357.343142-1-macroalpha82@gmail.com>
 <20231018153357.343142-4-macroalpha82@gmail.com>
 <7c7138f8-b0b7-46c3-b7b2-84e01467f368@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c7138f8-b0b7-46c3-b7b2-84e01467f368@pengutronix.de>
X-TMN: [QHqgOvd+5oEJ1Q3qlJv2Tel1reD6y0jz]
X-ClientProxiedBy: SA9P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::21) To DM4PR05MB9229.namprd05.prod.outlook.com
 (2603:10b6:8:88::20)
X-Microsoft-Original-Message-ID: <ZggxGkPVxnMSyVYb@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB9229:EE_|DS0PR05MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 69eb00d7-6565-46e4-5fcb-08dc50cef211
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RUFltxKZY1+dgrZoqZsuBP8au07JsAMIMlQ6z3o18JnpwAS0G7qq/iikTyGsmLfOQRHGe9DYgg5jdl4YT7n5lSXDi+7iHUspcOyyKKuQGlrfYQ0T4smAVfgb4cnio+Yg5e8L76681egWBSZGtm1ldMXiZzMFjm535yqnj0V7Eva93oMHBEU5XtwNZrQlu/88WdVdJ94mHtyK2PnXn8V4X7CqjbKMYSKcU0JIrk97fbCjSd7nhG30k1SDw4VCQfRYy9VTgDvYUU8nLTczIRuWagQgZD/iv6QISMjwD9c/fDFdCNr0aDgIlfkHqkUfD26Ams4CCmpXiV0YvZ5Y3uWvk/EF1qBtBCX6mAi7iXEdwR8ZoCJR3h8xVhKmI47BdyR6MwjbuqWpE0/fXKw3cRPoUfDJ0xc3dEUvN1r3HEflaVKiC2ty6LsYF8ewUqrGn5oMvd4fpSNETsTDT2cML/O13bIGy5aecLXR4aWgwCLmYh108gTWSkfLron+Iy19Ku06A1CVoRSa3xh2yxoTsiciqccCHYomFTa52tCinF8OjFdBp0jNK7zdjDMGwxzL+zPYdnGsBLzHaCNdy3HMp/BMpZiPZW59TY1qef0hfFImF5LrnZOVnuHnBjXH0pNKx6v5JhtitWi/cP0HnWG7wn4V9a/0+4tV6kSknHTkTonzdZY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dde1Jyglx5yuAmmC/K9xySuuzsAfkl2ThBWC/0E1Wzp2amdKVnak2ohQk7Gw?=
 =?us-ascii?Q?MOCkWnYK7DfS9iQCYZljNtWHc3W9VqlC1vbeXyILLBdiijUqWhtHuJy4NsOH?=
 =?us-ascii?Q?ZHvHjuWEnVI7pvcPikXy1MlPg48lDg2YDlN0YaevTa7mRerKsic/jruSrd4H?=
 =?us-ascii?Q?KsTWDzW8CATrVO+pSNIQ4nz4YY+VXhwNoNMKQEK7BMuvOx8RDBbruSl1klcq?=
 =?us-ascii?Q?mhfBbG7PlX6P1CncDC4UyG6lDNxdDDn5bTEmcIM87VV86t9Ig9GlfZLykdeQ?=
 =?us-ascii?Q?fXk0Ft/Hc9n8utGAqtTJMHtI0Zi474jLgBovzKQ/lzwJo/J4h+mB0JShg1Z/?=
 =?us-ascii?Q?DmLrBSxwCrcpvyNMa+mAImZHkTmAmXqfu+fhlVnJS3kQ26o2xu32bf32YBTD?=
 =?us-ascii?Q?X7O8IMygPtecKgKQ2vI+cGcs7nd5xJfIvJwO71Y9A3ky9KHDWVdlcwa2Odr8?=
 =?us-ascii?Q?GagEKuvBiAoMtGRdKFS/mjog/u6UdXTxmpsdPpMjDkOMHYBtarTcqd57pzqe?=
 =?us-ascii?Q?fJswGL1AcARqaJyblZcX4keHAq/w9dTNXsX7qjDgVbJRFKWaCR4N6znWAdKM?=
 =?us-ascii?Q?qKzC4gtna06pal2YtOQarOpRhCftuUaY+ZT0de3yQh8MYEk6tpxzC57bVQiz?=
 =?us-ascii?Q?gP7NNZ4HNQCcyxfu8mF8EmAYetxfoGIX6F8UAmV3w6+N4g7X7cOFrmHxQtUo?=
 =?us-ascii?Q?27kSyXZfxXmRaqNiRw7wzfljjM85061t9J0MxL/+1kjftUr4VV2i0AIMUVJ+?=
 =?us-ascii?Q?tziK4faUbc1WV5f7oRaT5nF8j6loD89Qqe7f4JMauKQn1gUJBB63gCO1Gakp?=
 =?us-ascii?Q?74f3UmIuNxHp3FeDrFRovoqzlIETUG7veM2XzgqlorteOOWYzXH6TtFJ2imF?=
 =?us-ascii?Q?lCeezVLApnk5tAI85uNzdrixu/h50SBwW/RAKnCevOayOmsygfh3rRIPgMkz?=
 =?us-ascii?Q?ERw5kmx2UJht1/oU7JIRl68XtaJUtaS6RHji7Axz+hlB4Zo5v4jqtjKerB8R?=
 =?us-ascii?Q?g1OEkJbxfy0IvQErbWlCuOi/VpkIpHZkcSov8u1315vrjWrig+vsgMNSeTu2?=
 =?us-ascii?Q?VxvDx4MQSW5ngNahaPFC1bw47si5shfQD2vVACh+KwNgk/R8sfjNV0hgvXew?=
 =?us-ascii?Q?qWW7LWmKJDzYdAOqLtGrJIlstf3oSXJYT8Zt5LFlGj8TR3GRODK0aKjr+CQF?=
 =?us-ascii?Q?0oJ7KSIEAKHw2l2SH8PF5mW2sqrljXC5x/poVsMPI1cRfAEtcmKUnYCD5sY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eb00d7-6565-46e4-5fcb-08dc50cef211
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB9229.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2024 15:34:53.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR05MB9125

On Sat, Mar 30, 2024 at 02:13:05PM +0100, Ahmad Fatoum wrote:
> Hello Chris,
> 
> On 18.10.23 17:33, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Powkiddy RGB30 has no onboard UART header, so remove the reference
> > to it in the device tree. This was left on by mistake in the initial
> > commit.
> 
> Do you know if the UART is perhaps available over testpoints?

There is not one as best I can tell on either the RGB30 or RK2023. The
Powkiddy X55 does have UART, however. I was able to exploit the fact
that the RGB30 is extremely similar to all of the Anbernic devices
(such as the RG353 series) for the purposes of low-level development.
Once I got a network connection I performed the rest of development
over SSH, but prior to that I just developed on a different device.

Thank you,
Chris.

> 
> If yes, having a DT-overlay upstream enabling it along with documentation could be useful.
> If not, how do you do low-level debugging on the RBG30 in absence of the serial console?
> 
> Thanks,
> Ahmad 
> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
> > index 3ebc21608213..1ead3c5c24b3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
> > @@ -64,6 +64,10 @@ simple-audio-card,cpu {
> >  
> >  /delete-node/ &adc_keys;
> >  
> > +&chosen {
> > +	/delete-property/ stdout-path;
> > +};
> > +
> >  &cru {
> >  	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
> >  			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
> > @@ -149,4 +153,9 @@ rk817_charger: charger {
> >  	};
> >  };
> >  
> > +/* There is no UART header visible on the board for this device. */
> > +&uart2 {
> > +	status = "disabled";
> > +};
> > +
> >  /delete-node/ &vibrator;
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
